---
description: System status report with compliance scores
---

# /status — System Status Report

## 1. Load Router & Scan

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']
rl_config = ROUTER['rl_calculation']
schema_files = ROUTER['schema_files']

# Query 8 schemas (specific fields only)
for schema in schema_files:
    @mcp:json-jq query metadata from f"{memory_bank}{schema}"
```

## 2. Compute Scores

```python
# Python eval() calculations
constitutional_compliance = validation_pass / total_checks  # ≥80%
consensus_readiness = calculate_readiness()  # ≥95%
roadmap_alignment = milestone_completion / total_milestones  # ≥95%
task_velocity = tasks_per_hour
error_rate = errors / 100_tasks
rl_trend = last_10_tasks_avg
```

## 3. Report & Remediate

1. Terminal `date` → Timestamp audit
2. IF thresholds missed → `@mcp:sequential-thinking` → Plan remediation
3. IF anomalies → `@mcp:context7` → Fetch guidance
4. `@mcp:filesystem` → Validate schemas
5. `@mcp:memory` → Store metrics
6. `@mcp:git` → Commit "status: [compliance%] - [date]"

**Thresholds**: Framework ≥80%, Consensus ≥95%, Roadmap ≥95%

**RL**: +5 comprehensive report

---
**Lines**: ~50 | **Auto-remediation**: If thresholds missed
