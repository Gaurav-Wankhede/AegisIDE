---
description: RL-tracked comprehensive system status report
location: {IDE}/workflow/status.md
---

# /status — System Status Report

## RL-Driven Status Reporting

**Purpose**: Real-time health snapshot with compliance scores
**RL Reward**: +5 for comprehensive report
**Constitutional Thresholds**: Framework ≥80%, Consensus ≥95%, Roadmap ≥95%
**Auto-Remediation**: Trigger `/fix` if thresholds missed

## MCP Chain (Comprehensive Audit)

1. `@mcp:filesystem` → Read 8 schemas from `{IDE}/aegiside/memory-bank/`
2. `@mcp:math` → Compute scores:
   - Constitutional compliance (≥80%)
   - Consensus readiness (≥95%)
   - Roadmap alignment (≥95%)
   - Task velocity (tasks/hour)
   - Error rate (errors/100 tasks)
   - RL score trend (last 10 tasks)
3. `@mcp:time` → Timestamp audit + measure data freshness
4. IF thresholds missed → `@mcp:sequential-thinking` → Plan remediation
5. IF anomalies → `@mcp:context7` → Fetch guidance
6. `@mcp:filesystem` → Validate schemas
7. `@mcp:memory` → Store metrics in knowledge graph
8. `@mcp:git` → Commit "status: [compliance%] - [date]"

## Actions & RL Logging

1. **Status Report**: Prepend to `activeContext.json`[0]:
   ```json
   {"event": "status_report", "compliance_score": 95,
    "consensus_score": 98, "roadmap_alignment": 96,
    "task_velocity": 12, "error_rate": 2,
    "rl_score_trend": "+15", "rl_reward": 5, "timestamp": "..."}
   ```
2. **Blockers**: Log in `scratchpad.json`[0] if tasks blocked
3. **Metrics**: Prepend to `progress.json`[0] with velocity + RL trends
4. **RL Scoring & Computation**: 
- Calculate: Policy entropy for exploration tracking
- Compute: Value estimates across all branches
- Store: +5 RL status check → `progress.json` with current rl_computation state[0]

## Exit & Auto-Chain

- **Success Metrics**: Prepend to `progress.json`[0]:
  ```json
  {"workflow": "status", "rl_reward": 5,
   "compliance_score": 95, "timestamp": "@mcp:time"}
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
