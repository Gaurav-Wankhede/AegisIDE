---
description: System status with terminal jq READ
---

# /status — System Status Report

## 1. Load Router & READ (Terminal jq)

```bash
# READ router (jq terminal)
memory_bank=$(jq -r '.system_paths.memory_bank' context-router.json)
rl_config=$(jq '.rl_calculation' context-router.json)
schema_files=$(jq -r '.schema_files[]' context-router.json)

# READ 8 schemas (parallel queries - FASTEST)
for schema in $schema_files; do
  (jq '.timestamp' "$memory_bank$schema") &
done
wait
```

## 2. Compute Scores (Python)

```bash
# Calculate with Python
constitutional_compliance=$(python3 -c "print(validation_pass / total_checks * 100)")
consensus_readiness=$(python3 -c "print(calculate_readiness())")
roadmap_alignment=$(python3 -c "print(milestone_completion / total * 100)")
task_velocity=$(jq '[.transactions[] | select(.timestamp > "'$(date -d '1 hour ago' -I)'")]' "$memory_bank"progress.json | jq length)
```

## 3. Report & Remediate

```bash
# IF thresholds missed
if [[ $constitutional_compliance -lt 80 ]]; then
  @mcp:sequential-thinking plan_remediation
  @mcp:context7 fetch_guidance
fi

# UPDATE with jq terminal (NOT @mcp:filesystem)
jq '.transactions = [{
  "workflow": "status",
  "rl_reward": 5,
  "compliance": '$constitutional_compliance',
  "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
}] + .transactions' "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json

git commit -m "status: compliance $constitutional_compliance%"
```

**Thresholds**: ≥80% framework, ≥95% consensus, ≥95% roadmap

---
**Lines**: ~46 | **READ**: @mcp:json-jq or jq, **UPDATE**: jq only
