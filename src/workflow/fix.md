---
description: MCP error learning with HALT-FIX-VALIDATE loop
---

# /fix — Zero-Tolerance Remediation

## RL-Enforced Error Resolution

**Purpose**: HALT-FIX-VALIDATE loop until 100% clean
**RL Reward**: +15 when resolved
**RL Penalty**: -30 for validation failure (escalates -50 on 3rd occurrence)
**MCP Error Learning**: Auto-log patterns to prevent recurrence

## MCP Chain (Query Router First)

1. **Load Router Config**:
   ```python
   ROUTER = @mcp:json-jq query '$' from 'context-router.json'
   memory_bank = ROUTER['system_paths']['memory_bank']
   rl_config = ROUTER['rl_calculation']
   penalty = rl_config['penalties']['validation_failure']  # -30
   ```
2. **HALT**: Update `progress.json` via `@mcp:filesystem` → Apply penalty, recalc total_rl_score
3. `@mcp:filesystem` → Prepend `mistakes.json` with error details + penalty
4. `@mcp:context7` → Fetch official remediation docs instantly
5. `@mcp:filesystem` → Inspect failing files
6. IF complex → `@mcp:sequential-thinking` → Decompose root cause
7. IF unknown → `@mcp:fetch` → Pull upstream advisories
8. `@mcp:filesystem` → Apply atomic fix (≤80 lines per EMD from router)
9. `@mcp:git` → Stage fix for audit trail
10. `/validate` → Re-run validation
11. IF still fails → Loop (track retry count in mistakes.json)
12. IF success → `@mcp:filesystem` update `progress.json` → +15 RL reward from `rl_config['rewards']['validation_passed']`
13. `@mcp:memory` → Store error pattern + prevention rule
14. **Manual Function**: Terminal `date '+%Y-%m-%dT%H:%M:%S%z'` → Timestamp resolution

**MCP Error Learning Protocol**:
```json
{"error_type": "validation_failure",
 "prevention_rule": "Always validate against schema before save",
 "retry_count": X, "rl_penalty": -30, "timestamp": "..."}
```

## Actions & Pattern Learning

1. **HALT-FIX-VALIDATE Loop**: Continue until 100% clean
2. **Root Cause** (mistakes.json[0] - penalty transaction):
   ```json
   {"error_type": "...", "root_cause": "...",
    "fix_applied": "...", "retry_count": X,
    "timestamp": "..."}
   ```
   Note: RL penalty recorded in progress.json[0], not here
3. **Prevention Pattern** (systemPatterns.json[0] - reward transaction):
   ```json
   {"pattern_id": "error_prevention_X",
    "prevention_rule": "...", "success_rate": 1.0,
    "confidence_score": 0.9, "reuse_count": 0}
   ```
   Note: RL reward recorded in progress.json[0] upon reuse
4. **Third Occurrence Escalation**:
   - Same error 3rd time → -50 RL (total penalty)
   - Load `{IDE}/aegiside/rules/constitution/04-fundamental-duties/article-15.md`
   - Trigger `/oversight-checks-and-balances` for pattern review

## Exit & Auto-Resume

- **Success Metrics** (Single Source RL):
  - `progress.json[0]` transaction: +15 RL reward, update `total_rl_score`
  ```json
  {"tx_id": "...", "timestamp": "@mcp:time",
   "category": "error_resolution", "reward": 15,
   "description": "Fixed [error_type] in [attempts] attempts",
   "gae_advantage": 0.88, "kl_divergence": 0.004}
  ```
- **Selective Article Loading**:
  - Quality issue → `03-fundamental-rights/article-05.md`
  - Schema issue → `04-fundamental-duties/article-14.md`
  - Validation → `08-judiciary/article-36.md`
- **Commit**: `@mcp:git` → "fix: resolved [error_type]"
- **IMMEDIATE CHAIN**: Execute `/continue` → `/next` (NO asking)
- **Update activeContext.json**: Prepend fix completion at array[0]

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/fix.md`
