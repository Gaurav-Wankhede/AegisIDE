---
description: Zero-tolerance validation with RL penalties
---

# /validate — Constitutional Compliance Validation

## RL-Enforced Zero-Tolerance

**Purpose**: HALT on any error/warning until 100% clean
**RL Reward**: +15 for passing validation
**RL Penalty**: -30 for failures (triggers `/fix` loop)
**Multi-Language**: Auto-detect project type and run appropriate checks

## MCP Chain (Multi-Language Auto-Detection)

1. `@mcp:filesystem` → Read 8 schemas from `{IDE}/aegiside/memory-bank/`
2. **Auto-Detect Language** (manifest-based):
   - `package.json` → JS/TS: `pnpm typecheck`, `npm run lint`
   - `Cargo.toml` → Rust: `cargo check`, `cargo clippy`
   - `requirements.txt` → Python: `python -m py_compile`, `pytest --collect-only`
   - `go.mod` → Go: `go build`, `go vet`
3. **Execute Validation** (SafeToAutoRun=true):
   - Run language-specific checks
   - IF error/warning → HALT + -30 RL penalty
4. `@mcp:filesystem` → Validate schemas against `{IDE}/aegiside/schemas/*.schema.json`
5. IF fails → `@mcp:context7` → Fetch remediation docs
6. `@mcp:math` → Compute compliance scores (≥80% required)
7. `@mcp:memory` → Verify knowledge graph integrity
8. IF thresholds missed → `@mcp:sequential-thinking` → Plan remediation
9. `@mcp:time` → Timestamp validation
10. `@mcp:git` → Commit if clean: "validate: 100% compliance"

## Actions & RL Logging

## RL Scoring (PPO+GAE)

- **GAE Calculation**: Compute advantage for validation success
- **RL Scoring & Computation**:
  - Calculate: TD_error for validation value, update V(validation_branch)
  - Pass → +15 RL → `progress.json` with rl_computation {td_error, value_updated}
  - Fail → -30 RL → `mistakes.json` with prevention rule
  ```json
  {"workflow": "validate", "rl_reward": 15,
   "validation_passed": true, "issues_found": 0,
   "gae_advantage": 0.95, "kl_divergence": 0.001,
   "value_branch": "validation", "timestamp": "@mcp:time"}
  ```
1. **Validation Results**: Prepend to `activeContext.json`[0]:
   ```json
   {"event": "validation_complete", "status": "pass",
    "compliance_score": 100, "rl_reward": 15, "timestamp": "..."}
   ```
2. **IF Pass**: +15 RL → Prepend to `progress.json`[0]
3. **IF Fail**: 
   - -30 RL → Prepend to `mistakes.json`[0]
   - Queue remediation in `scratchpad.json`[0]
   - Trigger `/fix` workflow immediately
4. **Selective Article Loading**:
   - Validation fail → Load `{IDE}/aegiside/rules/constitution/08-judiciary/article-36.md`
   - Quality issue → Load `03-fundamental-rights/article-05.md`

## Exit & HALT-FIX Loop

- **IF Pass**: 
  - Prepend success to `progress.json`
  - `@mcp:git` → Commit "validate: clean"
  - Move task to kanban 'done' (awaits Opposition + Chief Justice approval for 'approved')
  - Resume `/next` immediately
- **IF Fail**:
  - HALT all operations
  - Trigger `/fix` workflow
  - Loop until 100% clean
  - NO asking permission
- **Top-Append**: All logs prepend to array[0] for latest-first access

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/validate.md`
