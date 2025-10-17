---
description: RL-tracked knowledge graph health audit
---

# /memory-status — Knowledge Graph Audit

## RL-Driven Graph Health

**Purpose**: Audit `memory.json` at `{IDE}/aegiside/memory-bank/`
**RL Reward**: +5 for healthy graph
**RL Penalty**: -10 if integrity issues found
**Top-Append**: Prepend audit results to relevant schemas

## MCP Chain (Graph Integrity)

1. `@mcp:filesystem` → Read `{IDE}/aegiside/memory-bank/memory.json`
2. `@mcp:memory` → Retrieve metadata (entities, relations, observations)
3. `@mcp:math` → Compute health metrics:
   - Entity density
   - Orphaned nodes count
   - Growth delta
   - Compliance score (≥80%)
4. `@mcp:time` → Timestamp audit start
5. IF issues → `@mcp:sequential-thinking` → Plan remediation
6. `@mcp:filesystem` → Validate against `{IDE}/aegiside/schemas/memory.schema.json`
7. IF schema drift → `@mcp:context7` → Fetch ontology updates
8. `@mcp:git` → Commit if repairs made
9. `@mcp:memory` → Store audit summary

## Actions & RL Logging

1. **Audit Results**: Prepend to `activeContext.json`[0]:
   ```json
   {"event": "graph_audit", "health_score": 95,
    "entities": X, "orphaned": 0, "rl_reward": 5, "timestamp": "..."}
   ```
2. **RL Scoring** (Single Source):
   - Healthy (≥90%) → `progress.json[0]`: +5 RL, update `total_rl_score`
   - Issues found → `progress.json[0]`: -10 RL penalty
   - Issue details → `mistakes.json[0]`: penalty transaction with remediation plan
3. **Remediation**: IF needed → Prepend tasks to `scratchpad.json`[0]

## Exit & Auto-Chain

- **Metrics** (Single Source RL):
  - `progress.json[0]` transaction: +5 RL, update `total_rl_score`
  ```json
  {"tx_id": "...", "timestamp": "@mcp:time",
   "category": "graph_audit", "reward": 5,
   "description": "Graph health: 95%, entities: X"}
  ```
- **Commit**: `@mcp:git` → "memory-status: graph health 95%"
- **Auto-Chain**: Resume `/next` or trigger `/fix` if issues

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/memory-status.md`
