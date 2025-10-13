---
description: RL-driven immediate recovery after interruption
---

# /continue — Immediate Recovery

## RL Recovery Protocol (0-99% Auto-Execute)

**Purpose**: Restore context from `{IDE}/aegiside/memory-bank/` and resume execution
**RL Reward**: +5 for successful recovery
**RL Penalty**: -10 if context restoration fails
**CRITICAL**: Auto-chain to `/next` immediately (NO asking)

## MCP Chain (Autonomous)

1. `@mcp:memory` → Restore latest snapshot from knowledge graph
2. `@mcp:filesystem` → Read `scratchpad.json`[0] (top entry) + `activeContext.json`
3. `@mcp:math` → Calculate downtime duration + readiness score
4. `@mcp:time` → Timestamp resume moment
5. IF mid-task interruption → `@mcp:sequential-thinking` → Reconstruct execution plan
6. IF errors detected → `@mcp:context7` → Fetch validation guidance
7. `@mcp:git` → Verify clean working tree

**Context Restoration** (Top-Append Strategy):
- Read `scratchpad.json`[0] → Latest task at array top
- Read `activeContext.json` → Last execution state
- Read `mistakes.json`[0] → Recent errors if any
- Read `progress.json`[0] → Latest RL score

## Actions & RL Logging

1. **Restore State**: Prepend recovery event to `activeContext.json`[0]:
   ```json
   {"event": "continue_recovery", "downtime_seconds": X,
    "pending_tasks": Y, "rl_reward": 5, "timestamp": "..."}
   ```
2. **Capture Blockers**: Update `scratchpad.json` (maintain top-append order)
3. **RL Scoring & Computation**:
   - Compute: TD_error for recovery value, GAE_adv for continuation
   - Successful recovery → +5 RL → Prepend to `progress.json` with rl_computation
   - Context corruption → -10 RL → Prepend to `mistakes.json`
4. **Selective Article Loading**:
   - If blockers exist → Load `{IDE}/aegiside/rules/constitution/04-fundamental-duties/article-14.md`
   - If errors → Load `{IDE}/aegiside/rules/constitution/08-judiciary/article-36.md`

## Exit & Auto-Chain

- **Metrics**: Prepend to `progress.json` (top-append):
  ```json
  {"workflow": "continue", "rl_reward": 5, 
   "recovery_time_ms": X, "timestamp": "@mcp:time"}
  ```
- **Schema Validation**: If discrepancies → Queue `/update` in `scratchpad.json`
- **Commit**: `@mcp:git` → "continue: context restored"
- **IMMEDIATE CHAIN**: Execute `/next` (NO pause, NO asking)
- **Asking Permission Penalty**: -20 RL → `mistakes.json`

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/continue.md`
