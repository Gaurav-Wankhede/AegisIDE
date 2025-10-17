---
description: HALT-FIX-VALIDATE loop until clean
---

# /fix — Zero-Tolerance Remediation

## 1. Load Router & Apply Penalty

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']
rl_config = ROUTER['rl_calculation']
penalty = rl_config['penalties']['validation_failure']  # -30
```

## 2. Fix Loop

1. **HALT** → Update progress.json with penalty
2. `@mcp:filesystem` → Prepend mistakes.json
3. `@mcp:context7` → Fetch remediation docs
4. `@mcp:sequential-thinking` → Plan fix (≥3 steps)
5. `@mcp:filesystem` → Apply fix (≤80 lines per EMD)
6. `/validate` → Re-run validation
7. IF still fails → Loop (track retry in mistakes.json)
8. IF success → +15 RL reward

## 3. Store Pattern & Chain

```python
# Learn from error
@mcp:memory store prevention_rule

# Timestamp
terminal: date '+%Y-%m-%dT%H:%M:%S%z'

# Auto-chain
invoke_workflow("/continue")  # Then /next
```

**RL**: +15 success | -30 fail (escalates -50 on 3rd)

---
**Lines**: ~45 | **Loop**: Until clean
