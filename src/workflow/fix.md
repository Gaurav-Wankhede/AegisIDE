---
description: HALT-FIX-VALIDATE with CLI transparency
---

# /fix — Remediation Loop

## 1. Load Router & HALT (CLI Native)

```bash
echo "→ FIX: Zero-tolerance remediation" >&2

ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')
penalty=$(echo "$ROUTER_JSON" | jq -r '.rl_calculation.penalties.validation_failure')

# HALT - atomic penalty
echo "→ PENALTY: $penalty RL" >&2
jq --argjson penalty $penalty \
  '.transactions = [{"workflow": "fix", "rl_penalty": $penalty}] + .transactions | .total_rl_score += $penalty' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json
```

## 2. Fix Loop (Transparent)

1. `@mcp:context7` → Fetch remediation docs
2. `@mcp:sequential-thinking` → Plan fix
3. Apply fix (≤80 lines EMD)
4. `/validate` → Re-run (loop until clean)

## 3. Success & Chain (CLI Pipeline)

```bash
# Success - reward
echo "→ SUCCESS: Fix validated (+15 RL)" >&2
jq '.transactions = [{"workflow": "fix", "rl_reward": 15}] + .transactions | .total_rl_score += 15' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json

# Store prevention pattern
jq --arg rule "Run /validate before commit" \
  '.patterns = [{"prevention_rule": $rule}] + .patterns | .patterns |= .[:100]' \
  "$memory_bank"systemPatterns.json | sponge "$memory_bank"systemPatterns.json

echo "✓ FIX COMPLETE" >&2
invoke_workflow "/continue"
```

---
**Lines**: ~40 | **CLI**: jq + sponge (atomic)
