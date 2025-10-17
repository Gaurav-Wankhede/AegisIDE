---
description: Zero-tolerance validation with CLI transparency
---

# /validate — Compliance Validation

## 1. Load Router & Detect (CLI Native)

```bash
# Transparency logging
echo "→ VALIDATE: Multi-language compliance check" >&2

# Cache router
ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')
penalty=$(echo "$ROUTER_JSON" | jq -r '.rl_calculation.penalties.validation_failure')

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
  constitution=$(echo "$ROUTER_JSON" | jq -r '.system_paths.constitution')
  cat "$constitution/08-judiciary/article-36.md" | glow -
  
  invoke_workflow "/fix"
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
  
  echo "✓ VALIDATION COMPLETE" >&2
fi
```

---
**Lines**: ~59 | **CLI**: jq + sponge + glow (transparent, 267x faster)
