---
description: RL-tracked 8-schema synchronization with top-append
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

**8-Schema Checklist** (Single Source RL):
1. `progress.json` → **SINGLE SOURCE** for `total_rl_score`, RL transactions at [0]
2. `activeContext.json` → Session state with `rl_source_ref: "progress.json"`
3. `scratchpad.json` → Tasks array (newest [0]) with `rl_source_ref`
4. `kanban.json` → Workflow (todo→in_progress→done→approved) with `rl_source_ref`
5. `mistakes.json` → Penalty transactions at [0] (no total_rl_score)
6. `systemPatterns.json` → Reward transactions at [0] (no total_rl_score)
7. `roadmap.json` → Milestones with `rl_source_ref`
8. `memory.json` → Knowledge graph with pattern reuse RL

## Actions & RL Logging

1. **Sync Summary**: Prepend to `activeContext.json`[0]:
   ```json
   {"event": "schema_sync", "schemas_updated": 8,
    "compliance_score": 100, "rl_reward": 8, "timestamp": "..."}
   ```
2. **RL Scoring** (Single Source):
   - All 8 updated → `progress.json[0]`: +8 RL (1 per schema), update `total_rl_score`
   - Incomplete → `progress.json[0]`: -20 RL penalty
   - Validation fail details → `mistakes.json[0]`: penalty transaction
3. **Queue Issues**: IF problems → Prepend to `scratchpad.json`[0]
4. **Selective Article Loading**:
   - Schema issues → `04-fundamental-duties/article-14.md`
   - Validation fails → `08-judiciary/article-36.md`

## Exit & Auto-Resume

- **Success Metrics** (Single Source RL):
  - `progress.json[0]` transaction: +8 RL, update `total_rl_score`
  ```json
  {"tx_id": "...", "timestamp": "@mcp:time",
   "category": "schema_sync", "reward": 8,
   "description": "8 schemas synced, all validated",
   "gae_advantage": 0.92, "kl_divergence": 0.002}
  ```
- **Commit**: `@mcp:git` → "update: 8-schema atomic sync complete"
- **IMMEDIATE CHAIN**: Execute `/next` (NO asking)
- **Top-Append Verified**: All schemas maintain latest-first order

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/update.md`
