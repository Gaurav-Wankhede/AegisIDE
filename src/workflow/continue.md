---
description: RL-driven immediate recovery after interruption
---

# /continue — Immediate Recovery

## RL-Driven Recovery (Auto-Execute with User Notification)

**UX Gap 7 Fix**: Session resume now includes user-friendly status update

**Purpose**: Restore context from memory bank (query path from router) and resume execution
**RL Reward**: +5 for successful recovery (from router rl_calculation)
**RL Penalty**: -10 if context restoration fails (from router)
**CRITICAL**: Auto-chain to `/next` immediately (NO asking)

## MCP Chain (Query Router First)

1. **Load Router Config**:
   ```python
   ROUTER = @mcp:json-jq query '$' from 'context-router.json'
   memory_bank = ROUTER['system_paths']['memory_bank']
   schema_files = ROUTER['schema_files']
   rl_config = ROUTER['rl_calculation']
   ```
2. `@mcp:json-jq` → Query `$.session` from `activeContext.json` for last known state
3. `@mcp:filesystem` → Validate 8-schema integrity (checksums match?)
4. **Manual Function**: Python `eval()` → Calculate recovery checkpoint position
4. **NOTIFY USER** (UX Gap 7):
   ```
   Session resumed after interruption
   
   Previous state:
   - Working on: {task from scratchpad[0]}
   - Completed: {workflow progress percentage}
   - Next step: {next_action from activeContext}
   
   Continue where I left off? [Y/n]
   (Timeout: 30 seconds → auto-continue)
   ```
5. `@mcp:memory` → Reconstruct session knowledge graph
6. `@mcp:json-jq` → Query `$.priority_queue` from `scratchpad.json`
7. `@mcp:git` → Verify working tree clean (no uncommitted changes)
8. **Manual Function**: Terminal `date '+%Y-%m-%dT%H:%M:%S%z'` → Timestamp recovery event
9. `@mcp:filesystem` → Update `activeContext.user_feedback` with "Resumed from checkpoint"
10. Resume workflow from interruption point (NO re-execution of completed steps)

## MCP Chain (Original)

1. `@mcp:memory` → Restore latest snapshot from knowledge graph
2. `@mcp:filesystem` → Read `scratchpad.json`[0] (top entry) + `activeContext.json`
3. `@mcp:math` → Calculate downtime duration + readiness score
4. `@mcp:time` → Timestamp resume moment
5. IF mid-task interruption → `@mcp:sequential-thinking` → Reconstruct execution plan
6. IF errors detected → `@mcp:context7` → Fetch validation guidance
7. `@mcp:git` → Verify clean working tree

**Context Restoration** (Top-Append Strategy):
- Read `progress.json` → SINGLE SOURCE for `total_rl_score`
- Read `scratchpad.json`[0] → Latest task at array top
- Read `activeContext.json` → Verify `rl_source_ref: "progress.json"`
- Read `mistakes.json`[0] → Recent errors if any

## Actions & RL Logging

1. **Restore State**: Prepend recovery event to `activeContext.json`[0]:
   ```json
   {"event": "continue_recovery", "downtime_seconds": X,
    "pending_tasks": Y, "rl_reward": 5, "timestamp": "..."}
   ```
2. **Capture Blockers**: Update `scratchpad.json` (maintain top-append order)
3. **RL Scoring** (Single Source):
   - Successful recovery → `progress.json[0]` transaction: +5 RL, update `total_rl_score`
   - Context corruption → `progress.json[0]` penalty: -10 RL, update `total_rl_score`
   - Error details → `mistakes.json[0]` (penalty transaction only)
4. **Selective Article Loading**:
   - If blockers exist → Load `{IDE}/aegiside/rules/constitution/04-fundamental-duties/article-14.md`
   - If errors → Load `{IDE}/aegiside/rules/constitution/08-judiciary/article-36.md`

## Exit & Auto-Chain

- **Metrics** (Single Source RL):
  - `progress.json[0]` transaction: +5 RL, update `total_rl_score`
  ```json
  {"tx_id": "...", "timestamp": "@mcp:time",
   "category": "recovery", "reward": 5,
   "description": "Context restored in [X]ms"}
  ```
- **Schema Validation**: If discrepancies → Queue `/update` in `scratchpad.json`
- **Commit**: `@mcp:git` → "continue: context restored"
- **IMMEDIATE CHAIN**: Execute `/next` (NO pause, NO asking)
- **Asking Permission Penalty**: -20 RL → `mistakes.json`

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/continue.md`
