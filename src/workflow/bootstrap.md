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
2. `@mcp:math` → Count files, compute completion % (reward if 100%)
3. `@mcp:context7` → Fetch schema contracts for missing files
4. `@mcp:filesystem` → Create missing files with minimal valid JSON:
   ```json
   {"schema_version": "1.0.0", "last_updated": "@mcp:time", ...}
   ```
5. `@mcp:filesystem` → Validate each against `{IDE}/aegiside/schemas/*.schema.json`
6. `@mcp:git` → Commit with message "bootstrap: regenerated [X] schemas"
7. `@mcp:memory` → Log regeneration event to knowledge graph
8. `@mcp:time` → Timestamp all operations

**Required Schemas**:
1. `activeContext.json` — Must include `rl_reward_tracking` field
2. `scratchpad.json` — Array structure (top-append ready)
3. `kanban.json` — Columns: todo, in_progress, done
4. `mistakes.json` — Must include `rl_penalty_ledger` field
5. `systemPatterns.json` — Pattern storage with success_rate
6. `progress.json` — RL rewards ledger
7. `roadmap.json` — Strategic planning
8. `memory.json` — Knowledge graph entities/relations

## Actions & RL Logging

1. **Create Missing Files**: Generate under `{IDE}/aegiside/memory-bank/` ONLY
2. **Validate**: Each file against `{IDE}/aegiside/schemas/*.schema.json` → HALT if fails
3. **RL Logging**:
   - Success → +10 RL → Prepend to `progress.json`
   - Validation fail → -15 RL → Prepend to `mistakes.json` + trigger `/fix`
4. **RL Scoring & Computation**:
   - Initialize: All value branches to 0, set reference policy
   - Formula: V(bootstrap) = r_bootstrap + γ×E[V(future_tasks)]
   - Store: +50 RL workspace creation → `progress.json`[0] with rl_computation baseline
   - Validation fail → -15 RL → Prepend to `mistakes.json` + trigger `/fix`
5. **Update activeContext.json**: Prepend regeneration event at array[0]:
   ```json
   {"event": "bootstrap_complete", "schemas_created": ["..."], 
    "rl_reward": 10, "timestamp": "..."}
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
