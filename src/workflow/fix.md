---
description: HALT-FIX-VALIDATE with CLI transparency
---

# /fix — Remediation Loop

## 1. Query Router & HALT via MCP

```bash
# Error handling
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ FIX: Zero-tolerance remediation" >&2

# Query via MCP (constitutional compliance)
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
penalty=$(@mcp:json-jq query '.rl_calculation.penalties.validation_failure' from 'context-router.json')

echo "→ ROUTER: Loaded via @mcp:json-jq" >&2

# HALT - atomic penalty
echo "→ PENALTY: $penalty RL" >&2
jq --argjson penalty $penalty \
  '.transactions = [{"workflow": "fix", "rl_penalty": $penalty}] + .transactions | .total_rl_score += $penalty' \
  "${memory_bank}progress.json" | sponge "${memory_bank}progress.json"
```

## 2. Fix Loop (Transparent)

1. `@mcp:context7` → Fetch remediation docs
2. `@mcp:sequential-thinking` → Plan fix
3. Apply fix (≤80 lines EMD)
4. `/validate` → Re-run (loop until clean)

## 3. Success & Commit via MCP

```bash
# Success - reward
echo "→ SUCCESS: Fix validated (+15 RL)" >&2
jq '.transactions = [{"workflow": "fix", "rl_reward": 15}] + .transactions | .total_rl_score += 15' \
  "${memory_bank}progress.json" | sponge "${memory_bank}progress.json"

# Store prevention pattern
jq --arg rule "Run /validate before commit" \
  '.patterns = [{"prevention_rule": $rule}] + .patterns | .patterns |= .[:100]' \
  "${memory_bank}systemPatterns.json" | sponge "${memory_bank}systemPatterns.json"

# Commit fix via MCP
@mcp:git add -A
@mcp:git commit -m "fix: Remediation complete - RL: +15"

echo "✓ FIX COMPLETE" >&2
echo "→ TIP: Run '/continue' or '/next' to proceed" >&2
exit 0
```

---
**Lines**: ~40 | **CLI**: jq + sponge (atomic)
