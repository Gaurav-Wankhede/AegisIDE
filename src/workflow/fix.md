---
description: MCP error learning with HALT-FIX-VALIDATE loop
location: {IDE}/workflow/fix.md
---

# /fix — Zero-Tolerance Remediation

## RL-Enforced Error Resolution

**Purpose**: HALT-FIX-VALIDATE loop until 100% clean
**RL Reward**: +15 when resolved
**RL Penalty**: -30 for validation failure (escalates -50 on 3rd occurrence)
**MCP Error Learning**: Auto-log patterns to prevent recurrence

## MCP Chain (Error Learning)

1. **HALT**: -30 RL penalty → Prepend to `mistakes.json`[0]
2. `@mcp:context7` → Fetch official remediation docs instantly
3. `@mcp:filesystem` → Inspect failing files
4. IF complex → `@mcp:sequential-thinking` → Decompose root cause
5. IF unknown → `@mcp:fetch` → Pull upstream advisories
6. `@mcp:filesystem` → Apply atomic fix
7. `@mcp:git` → Stage fix for audit trail
8. `/validate` → Re-run validation
9. IF still fails → Loop (track retry count)
10. IF success → +15 RL reward → Prepend to `progress.json`[0]
11. `@mcp:memory` → Store error pattern + prevention rule
12. `@mcp:time` → Timestamp resolution

**MCP Error Learning Protocol**:
```json
{"error_type": "validation_failure",
 "prevention_rule": "Always validate against schema before save",
 "retry_count": X, "rl_penalty": -30, "timestamp": "..."}
```

## Actions & Pattern Learning

1. **HALT-FIX-VALIDATE Loop**: Continue until 100% clean
2. **Root Cause**: Prepend to `mistakes.json`[0]:
   ```json
   {"error_type": "...", "root_cause": "...",
    "fix_applied": "...", "retry_count": X,
    "rl_penalty": -30, "timestamp": "..."}
   ```
3. **Prevention Pattern**: Prepend to `systemPatterns.json`[0]:
   ```json
   {"pattern_id": "error_prevention_X",
    "prevention_rule": "...", "success_rate": 1.0,
    "confidence_score": 0.9, "reuse_count": 0}
   ```
4. **Third Occurrence Escalation**:
   - Same error 3rd time → -50 RL (total penalty)
   - Load `{IDE}/aegiside/rules/constitution/04-fundamental-duties/article-15.md`
   - Trigger `/oversight-checks-and-balances` for pattern review

## Exit & Auto-Resume

- **Success Metrics**: Prepend to `progress.json`[0]:
  ```json
  {"workflow": "fix", "rl_reward": 15,
   "time_to_fix_ms": X, "attempts": Y, "timestamp": "@mcp:time"}
  ```
- **RL Scoring (PPO+GAE)**

- **GAE Calculation**: Compute advantage for error resolution
- **Success**: +10 RL → `progress.json`[0]
  ```json
  {"workflow": "fix", "rl_reward": 10,
   "error_resolved": "...", "prevention_rule_added": true,
   "gae_advantage": 0.88, "kl_divergence": 0.004,
   "value_branch": "validation", "timestamp": "@mcp:time"}
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
