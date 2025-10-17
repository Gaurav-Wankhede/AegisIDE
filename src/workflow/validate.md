---
description: Zero-tolerance validation with RL penalties
---

# /validate — Constitutional Compliance Validation

## RL-Enforced Zero-Tolerance

**Purpose**: HALT on any error/warning until 100% clean
**RL Reward**: +15 for passing validation
**RL Penalty**: -30 for failures (triggers `/fix` loop)
**Multi-Language**: Auto-detect project type and run appropriate checks

## MCP Chain (Query Router First)

1. **Load Router Config**:
   ```python
   ROUTER = @mcp:json-jq query '$' from 'context-router.json'
   memory_bank = ROUTER['system_paths']['memory_bank']
   schemas = ROUTER['system_paths']['schemas']
   schema_files = ROUTER['schema_files']  # List of 8 schemas
   rl_config = ROUTER['rl_calculation']
   detection = ROUTER['auto_triggers']['session_start']['detection_logic']
   ```
2. `@mcp:json-jq` → Read 8 schemas from `memory_bank` (query specific fields only)
3. **Auto-Detect Language** (from router detection_logic):
   - IF exists('package.json') → JS/TS: `pnpm typecheck`, `npm run lint`
   - IF exists('Cargo.toml') → Rust: `cargo check`, `cargo clippy`
   - IF exists('requirements.txt') → Python: `python -m py_compile`, `pytest --collect-only`
   - IF exists('go.mod') → Go: `go build`, `go vet`
4. **Execute Validation** (SafeToAutoRun=true):
   - Run language-specific checks
   - IF error/warning → HALT + penalty from `rl_config['penalties']['validation_failure']`
5. `@mcp:filesystem` → Validate schemas against files from `schemas` path
6. IF fails → `@mcp:context7` → Fetch remediation docs
7. **Manual Function**: Python `eval()` → Compute compliance scores (≥80% required)
8. `@mcp:memory` → Verify knowledge graph integrity
9. IF thresholds missed → `@mcp:sequential-thinking` → Plan remediation
10. **Manual Function**: Terminal `date '+%Y-%m-%dT%H:%M:%S%z'` → Timestamp validation
11. `@mcp:git` → Commit if clean: "validate: 100% compliance"

## Actions & RL Logging

## RL Scoring (PPO+GAE)

- **GAE Calculation**: Compute advantage for validation success
1. **IF Pass** (Single Source RL):
   - +15 RL → `progress.json[0]` transaction, update `total_rl_score`
   - Prepend to `activeContext.json[0]`: `{"event": "validation_complete", "status": "pass", "compliance_score": 100}`
   - Move task to kanban 'done' (awaits Opposition + Chief Justice approval)
2. **IF Fail** (Single Source RL):
   - -30 RL → `progress.json[0]` transaction with penalty
   - Prepend to `mistakes.json[0]`: penalty transaction with prevention rule
   - Queue remediation in `scratchpad.json[0]`
   - Trigger `/fix` workflow immediately
3. **RL Computation** (PPO+GAE):
   ```json
   {"workflow": "validate", "reward": 15,
    "gae_advantage": 0.95, "kl_divergence": 0.001,
    "value_branch": "validation", "timestamp": "@mcp:time"}
   ```
4. **Selective Article Loading**:
   - Validation fail → Load `{IDE}/aegiside/rules/constitution/08-judiciary/article-36.md`
   - Quality issue → Load `03-fundamental-rights/article-05.md`

## Exit & HALT-FIX Loop

- **IF Pass**: 
  - `progress.json[0]` transaction: +15 RL, update `total_rl_score`
  - `@mcp:git` → Commit "validate: clean"
  - kanban: task→done (awaits Art 29 Opposition + Art 32 Chief Justice)
  - Resume `/next` immediately (NO permission)
- **IF Fail**:
  - HALT all operations (Art 5,15)
  - `progress.json[0]`: -30 RL penalty
  - `mistakes.json[0]`: prevention rule
  - Trigger `/fix` workflow
  - Loop until 100% clean
  - NO asking permission
- **Top-Append**: All logs prepend to array[0] for latest-first access

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/validate.md`
