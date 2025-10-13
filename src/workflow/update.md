---
description: RL-tracked 8-schema synchronization with top-append
location: {IDE}/workflow/update.md
---

# /update — Manual Memory-Bank Sync

## RL-Driven Schema Sync

**Purpose**: Atomic update of all 8 schemas at `{IDE}/aegiside/memory-bank/`
**RL Reward**: +8 for successful sync (1 per schema)
**RL Penalty**: -20 if validation fails
**Top-Append**: Maintain latest-first order in all arrays

## MCP Chain (8-Schema Atomic Sync)

1. `@mcp:filesystem` → Read all 8 schemas from `{IDE}/aegiside/memory-bank/`
2. `@mcp:math` → Compute:
   - File sizes (each ≤10KB)
   - Compliance score (≥80%)
   - Array integrity (top-append order verified)
3. IF issues found → `@mcp:sequential-thinking` → Plan remediation
4. `@mcp:filesystem` → Apply updates:
   - Ensure arrays prepend new entries at [0]
   - Trim arrays if >100 entries (keep latest 100)
   - Update timestamps
5. `@mcp:filesystem` → Validate against `{IDE}/aegiside/schemas/*.schema.json`
6. `@mcp:memory` → Store update event in knowledge graph
7. `@mcp:time` → Timestamp sync operation
8. `@mcp:git` → Commit "update: 8-schema sync"

**8-Schema Checklist** (all top-append verified):
1. `activeContext.json` → RL tracking + session state
2. `scratchpad.json` → Tasks array (newest [0])
3. `kanban.json` → Column structure
4. `mistakes.json` → RL penalties (newest [0])
5. `systemPatterns.json` → Patterns (newest [0])
6. `progress.json` → RL rewards (newest [0])
7. `roadmap.json` → Milestones
8. `memory.json` → Knowledge graph

## Actions & RL Logging

1. **Sync Summary**: Prepend to `activeContext.json`[0]:
   ```json
   {"event": "schema_sync", "schemas_updated": 8,
    "compliance_score": 100, "rl_reward": 8, "timestamp": "..."}
   ```
2. **RL Scoring**:
   - All valid → +8 RL → Prepend to `progress.json`[0]
   - Validation fails → -20 RL → Prepend to `mistakes.json`[0]
3. **Queue Issues**: IF problems → Prepend to `scratchpad.json`[0]
4. **Selective Article Loading**:
   - Schema issues → `04-fundamental-duties/article-14.md`
   - Validation fails → `08-judiciary/article-36.md`

## Exit & Auto-Resume

- **Success Metrics**: Prepend to `progress.json`[0]:
  ```json
  {"workflow": "update", "rl_reward": 8,
   "schemas_synced": 8, "timestamp": "@mcp:time"}
  ```
- **RL Scoring (PPO+GAE)**

- **GAE Calculation**: Compute advantage for schema update task
- **Success**: +5 RL → `progress.json`[0]
  ```json
  {"workflow": "update", "rl_reward": 5,
   "schemas_updated": 8, "checksum_verified": true,
   "gae_advantage": 0.92, "kl_divergence": 0.002,
   "exploit_ratio": 0.7, "timestamp": "@mcp:time"}
  ```
- **Commit**: `@mcp:git` → "update: 8-schema atomic sync complete"
- **IMMEDIATE CHAIN**: Execute `/next` (NO asking)
- **Top-Append Verified**: All schemas maintain latest-first order

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/update.md`
