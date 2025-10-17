---
description: RL-tracked comprehensive system status report
---

# /status — System Status Report

## RL-Driven Status Reporting

**Purpose**: Real-time health snapshot with compliance scores
**RL Reward**: +5 for comprehensive report
**Constitutional Thresholds**: Framework ≥80%, Consensus ≥95%, Roadmap ≥95%
**Auto-Remediation**: Trigger `/fix` if thresholds missed

## MCP Chain (Query Router First)

1. **Load Router Config**:
   ```python
   ROUTER = @mcp:json-jq query '$' from 'context-router.json'
   memory_bank = ROUTER['system_paths']['memory_bank']
   rl_config = ROUTER['rl_calculation']
   schema_files = ROUTER['schema_files']
   ```
2. `@mcp:json-jq` → Query 8 schemas from `memory_bank` (specific fields only)
3. **Manual Function**: Python `eval()` → Compute scores:
   - Constitutional compliance (≥80%)
   - Consensus readiness (≥95%)
   - Roadmap alignment (≥95%)
   - Task velocity (tasks/hour)
   - Error rate (errors/100 tasks)
   - RL score trend (last 10 tasks)
4. **Manual Function**: Terminal `date '+%Y-%m-%dT%H:%M:%S%z'` → Timestamp audit + measure data freshness
5. IF thresholds missed → `@mcp:sequential-thinking` → Plan remediation
6. IF anomalies → `@mcp:context7` → Fetch guidance
7. `@mcp:filesystem` → Validate schemas from router paths
8. `@mcp:memory` → Store metrics in knowledge graph
9. `@mcp:git` → Commit "status: [compliance%] - [date]"

## Actions & RL Logging

1. **Status Report**: Prepend to `activeContext.json`[0]:
   ```json
   {"event": "status_report", "compliance_score": 95,
    "consensus_score": 98, "roadmap_alignment": 96,
    "task_velocity": 12, "error_rate": 2,
    "rl_score_trend": "+15", "rl_reward": 5, "timestamp": "..."}
   ```
2. **Blockers**: Log in `scratchpad.json`[0] if tasks blocked
3. **Metrics** (Single Source):
   - `progress.json[0]` transaction: +5 RL, update `total_rl_score`
   - Include velocity + RL trends in description
   - Value estimates across all branches in transaction

## Exit & Auto-Chain

- **Success Metrics** (Single Source RL):
  - `progress.json[0]` transaction: +5 RL, update `total_rl_score`
  ```json
  {"tx_id": "...", "timestamp": "@mcp:time",
   "category": "status_check", "reward": 5,
   "description": "Compliance: 95%, Velocity: 12 tasks/hr"}
  ```
- **Risks**: Document in `mistakes.json` if found
- **Commit**: `@mcp:git` → "status: 95% compliance"
- **Auto-Remediation**:
  - IF compliance <80% → Trigger `/fix`
  - IF velocity declining → Trigger `/optimize`
  - IF schemas out-of-sync → Trigger `/update`
  - ELSE → Resume `/next`

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/status.md`
