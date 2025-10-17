---
description: Zero-tolerance validation with terminal jq
---

# /validate — Compliance Validation

## 1. Load Router & Detect (Terminal jq)

```bash
# Read router config once
ROUTER=$(jq '.' context-router.json)
memory_bank=$(echo "$ROUTER" | jq -r '.system_paths.memory_bank')
schemas_path=$(echo "$ROUTER" | jq -r '.system_paths.schemas')
penalty=$(echo "$ROUTER" | jq -r '.rl_calculation.penalties.validation_failure')  # -30

# Detect project language (parallel checks)
[[ -f "package.json" ]] && lang="js"
[[ -f "Cargo.toml" ]] && lang="rust"
[[ -f "requirements.txt" ]] && lang="python"
[[ -f "go.mod" ]] && lang="go"
```

## 2. Multi-Language Validation

```bash
case $lang in
  js)   pnpm typecheck && npm run lint ;;
  rust) cargo check && cargo clippy ;;
  python) python -m py_compile **/*.py && pytest --collect-only ;;
  go)   go build && go vet ;;
esac
```

## 3. HALT-FIX-VALIDATE Loop (jq Update)

```bash
if [[ $? -ne 0 ]]; then
  # HALT - apply penalty with jq
  jq --argjson tx '{
    "workflow": "validate",
    "rl_penalty": '$penalty',
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }' '.transactions = [$tx] + .transactions | .total_rl_score += '$penalty' \
    "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
  
  # Prepend to mistakes.json
  jq --argjson error '{
    "error_type": "validation_failure",
    "prevention_rule": "Run /validate before commit",
    "rl_penalty": '$penalty'
  }' '.error_log = [$error] + .error_log' \
    "$memory_bank"mistakes.json > temp.json && mv temp.json "$memory_bank"mistakes.json
  
  invoke_workflow "/fix"
else
  # Success - reward with jq
  reward=15
  jq '.transactions = [{
    "workflow": "validate",
    "rl_reward": '$reward',
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }] + .transactions | .total_rl_score += '$reward' \
    "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
  
  # Move to kanban 'done' (awaits Opposition + Chief Justice)
  jq '.columns.done += [.columns.in_progress[0]] | .columns.in_progress |= .[1:]' \
    "$memory_bank"kanban.json > temp.json && mv temp.json "$memory_bank"kanban.json
fi
```

## 4. Schema Validation (Parallel jq)

```bash
# Validate all 8 schemas in parallel
for schema in activeContext scratchpad kanban mistakes systemPatterns progress roadmap memory; do
  (jq '.' "$memory_bank$schema.json" >/dev/null 2>&1) &
done
wait

git commit -m "validate: 100% compliance"
```

**RL**: +15 pass | -30 fail (triggers /fix)

---
**Lines**: ~59 | **jq**: Parallel + atomic updates
