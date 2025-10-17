---
description: Ensure 8 mandatory schemas exist with RL tracking
---

# /bootstrap — Memory Bank Regeneration

## RL-Driven Regeneration (Auto-Execute)

**Purpose**: Create/repair 8 essential schemas at `{IDE}/aegiside/memory-bank/`
**RL Reward**: +10 for successful regeneration
**RL Penalty**: -15 if schema validation fails

## MCP Chain (Autonomous Selection)

**Step-by-Step**:
1. `@mcp:filesystem` → Scan `{IDE}/aegiside/memory-bank/` for 8 required schemas
2. **UPDATE user_feedback**: `{current_action: "Scanning memory bank", progress_step: "Step 1 of 8", status: "working"}`
3. `@mcp:math` → Count files, compute completion % (reward if 100%)
3. `@mcp:context7` → Fetch schema contracts for missing files
4. `@mcp:filesystem` → Create missing files with minimal valid JSON:
   ```json
   {"schema_version": "1.0.0", "last_updated": "@mcp:time", ...}
   ```
5. `@mcp:filesystem` → Validate each against `{IDE}/aegiside/schemas/*.schema.json`
6. `@mcp:git` → Commit with message "bootstrap: regenerated [X] schemas"
7. `@mcp:memory` → Log regeneration event to knowledge graph
8. `@mcp:time` → Timestamp all operations

**Required Schemas** (Single Source RL Architecture):
1. `activeContext.json` — Session state with `rl_source_ref: "progress.json"`
2. `scratchpad.json` — Task queue (top-append) with `rl_source_ref`
3. `kanban.json` — Workflow columns: todo, in_progress, done, approved
4. `mistakes.json` — Error patterns with penalty transactions
5. `systemPatterns.json` — Architecture patterns with reward transactions
6. `progress.json` — **SINGLE SOURCE OF TRUTH** for `total_rl_score`
7. `roadmap.json` — Strategic planning with milestone RL
8. `memory.json` — Knowledge graph with pattern reuse RL

## Actions & RL Logging

1. **Create Missing Files**: Generate under `{IDE}/aegiside/memory-bank/` ONLY
2. **Validate**: Each file against `{IDE}/aegiside/schemas/*.schema.json` → HALT if fails
3. **RL Architecture Setup** (Single Source):
   - Initialize `progress.json` with `metrics.total_rl_score: 0`
   - All other schemas get `metrics.rl_source_ref: "progress.json"`
   - Set `value_network_branches` with initial weights
   - Create `reference_policy` baseline for KL divergence
4. **RL Logging**:
   - Success → +10 RL → `progress.json[0]` transaction
   - Validation fail → -15 RL → `mistakes.json[0]` + trigger `/fix`
5. **Update activeContext.json**: Prepend event at [0]:
   ```json
   {"event": "bootstrap_complete", "schemas_created": 8,
    "rl_architecture": "single_source", "timestamp": "..."}
   ```

## Exit & Chain

- **Selective Article Loading**: If errors → Load `{IDE}/aegiside/rules/constitution/08-judiciary/article-36.md`
- **Success Metrics**: Prepend to `progress.json` (top-append):
  ```json
  {"workflow": "bootstrap", "rl_reward": 10, "schemas_count": 8, 
   "timestamp": "@mcp:time"}
  ```
- **Failure Handling**: Prepend to `mistakes.json` + trigger `/fix` workflow
- **Commit**: `@mcp:git` → "bootstrap: 8-schema memory bank ready"
- **Auto-Chain**: Immediately execute `/next` (NO asking permission)

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/bootstrap.md`
