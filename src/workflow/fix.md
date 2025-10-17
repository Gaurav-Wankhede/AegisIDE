---
description: HALT-FIX-VALIDATE with terminal jq
---

# /fix — Zero-Tolerance Remediation

## 1. Load Router & Apply Penalty (Terminal jq)

```bash
# Cache router
ROUTER=$(jq '.' context-router.json)
memory_bank=$(echo "$ROUTER" | jq -r '.system_paths.memory_bank')
penalty=$(echo "$ROUTER" | jq -r '.rl_calculation.penalties.validation_failure')  # -30

# HALT - atomic penalty update
jq '.transactions = [{"workflow": "fix", "rl_penalty": '$penalty'}] + .transactions | .total_rl_score += '$penalty' \
  "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json

# Prepend mistakes.json
jq '.error_log = [{"error": "validation_failure", "timestamp": "'$(date -I)'"}] + .error_log | .error_log |= .[:100]' \
  "$memory_bank"mistakes.json > temp.json && mv temp.json "$memory_bank"mistakes.json
```

## 2. Fix Loop

1. `@mcp:context7` → Fetch remediation docs
2. `@mcp:sequential-thinking` → Plan fix (≥3 steps)
3. `@mcp:filesystem` → Apply fix (≤80 lines EMD)
4. `/validate` → Re-run (jq tracks retry count)
5. Loop until clean

## 3. Success & Chain (Terminal jq)

```bash
# Success - reward
reward=15
jq '.transactions = [{"workflow": "fix", "rl_reward": '$reward'}] + .transactions | .total_rl_score += '$reward' \
  "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json

# Store prevention pattern
jq --arg rule "Run /validate before commit" \
  '.patterns += [{"prevention_rule": $rule}]' \
  "$memory_bank"systemPatterns.json > temp.json && mv temp.json "$memory_bank"systemPatterns.json

invoke_workflow "/continue"
```

**RL**: +15 success | -30 fail

---
**Lines**: ~43 | **jq**: Atomic updates
