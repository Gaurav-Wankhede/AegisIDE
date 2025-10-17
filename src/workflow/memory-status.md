---
description: RL-tracked knowledge graph health audit
---

# /memory-status — Knowledge Graph Audit

## RL-Driven Graph Health

**Purpose**: Audit `memory.json` (query path from router)
**RL Reward**: +5 for healthy graph (from router rl_calculation)
**RL Penalty**: -10 if integrity issues found (from router)
**Top-Append**: Prepend audit results to relevant schemas

## MCP Chain (Query Router First)

1. **Load Router Config**:
   ```python
   ROUTER = @mcp:json-jq query '$' from 'context-router.json'
   memory_bank = ROUTER['system_paths']['memory_bank']
   schemas_path = ROUTER['system_paths']['schemas']
   rl_config = ROUTER['rl_calculation']
   ```
2. `@mcp:json-jq` → Query metadata from `memory.json` at `memory_bank`
3. `@mcp:memory` → Retrieve full metadata (entities, relations, observations)
4. **Manual Function**: Python `eval()` → Compute health metrics:
   - Entity density
   - Orphaned nodes count
   - Growth delta
   - Compliance score (≥80%)
5. **Manual Function**: Terminal `date '+%Y-%m-%dT%H:%M:%S%z'` → Timestamp audit start
6. IF issues → `@mcp:sequential-thinking` → Plan remediation
7. `@mcp:filesystem` → Validate against schema from `schemas_path`
8. IF schema drift → `@mcp:context7` → Fetch ontology updates
9. `@mcp:git` → Commit if repairs made
10. `@mcp:memory` → Store audit summary

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
