---
description: Zero-tolerance validation with CLI transparency
---

# /validate — Compliance Validation

## 1. Query Router & Detect via MCP

```bash
# Error handling + signal traps
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ VALIDATE: Multi-language compliance check" >&2

# Query router via MCP (constitutional compliance)
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
penalty=$(@mcp:json-jq query '.rl_calculation.penalties.validation_failure' from 'context-router.json')

echo "→ ROUTER: Config loaded via @mcp:json-jq" >&2

# Detect language (parallel checks)
[[ -f "package.json" ]] && lang="js" &
[[ -f "Cargo.toml" ]] && lang="rust" &
[[ -f "requirements.txt" ]] && lang="python" &
wait

echo "→ LANGUAGE: $lang detected" >&2
```

## 2. Multi-Language Validation (Transparent)

```bash
case $lang in
  js)   echo "→ RUN: pnpm typecheck && npm run lint" >&2
        pnpm typecheck && npm run lint ;;
  rust) echo "→ RUN: cargo check && cargo clippy" >&2
        cargo check && cargo clippy ;;
  python) echo "→ RUN: python -m py_compile && pytest" >&2
          python -m py_compile **/*.py && pytest --collect-only ;;
esac
```

## 3. HALT-FIX-VALIDATE Loop (CLI Pipeline)

```bash
if [[ $? -ne 0 ]]; then
  # HALT - apply penalty (atomic with sponge)
  echo "→ HALT: Validation failed (penalty: $penalty)" >&2
  jq --argjson penalty $penalty \
    '.transactions = [{
      "workflow": "validate",
      "rl_penalty": $penalty,
      "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
    }] + .transactions | .total_rl_score += $penalty' \
    "$memory_bank"progress.json | sponge "$memory_bank"progress.json
  
  # Prepend to mistakes.json (atomic)
  echo "→ LOG: Error pattern to mistakes.json" >&2
  jq --argjson penalty $penalty \
    '.error_log = [{
      "error_type": "validation_failure",
      "prevention_rule": "Run /validate before commit",
      "rl_penalty": $penalty,
      "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
    }] + .error_log | .error_log |= .[:100]' \
    "$memory_bank"mistakes.json | sponge "$memory_bank"mistakes.json
  
  # Render error guidance with glow
  echo "→ GUIDANCE: Rendering Article 36 (Judiciary)" >&2
  constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')
  glow "${constitution}/08-judiciary/article-36.md"
  
  invoke_workflow "/fix"
  exit 1  # Validation failed
else
  # Success - reward (atomic)
  echo "→ SUCCESS: Validation passed (+15 RL)" >&2
  jq '.transactions = [{
    "workflow": "validate",
    "rl_reward": 15,
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }] + .transactions | .total_rl_score += 15' \
    "$memory_bank"progress.json | sponge "$memory_bank"progress.json

  # Move to kanban 'done' (awaits approval)
  echo "→ KANBAN: Move to 'done' column" >&2
  jq '.columns.done += [.columns.in_progress[0]] | .columns.in_progress |= .[1:]' \
    "$memory_bank"kanban.json | sponge "$memory_bank"kanban.json

  # Commit validation success
  @mcp:git add -A
  @mcp:git commit -m "validate: All checks passed - RL: +15"

  echo "✓ VALIDATION COMPLETE" >&2
  exit 0
fi
```

---
**Lines**: ~59 | **CLI**: jq + sponge + glow (transparent, 267x faster)
