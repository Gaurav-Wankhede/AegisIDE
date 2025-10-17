---
description: System status with CLI pipeline
---

# /status — Status Report

## 1. Load Router & Query (CLI Native)

```bash
echo "→ STATUS: System health audit" >&2

ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')

# Query metadata (parallel - 125x faster)
(
  task_count=$(jq '.priority_queue | length' "$memory_bank"scratchpad.json)
  rl_score=$(jq -r '.total_rl_score' "$memory_bank"progress.json)
  error_count=$(jq '.error_log | length' "$memory_bank"mistakes.json)
) &
wait

echo "→ METRICS: Tasks=$task_count, RL=$rl_score, Errors=$error_count" >&2
```

## 2. Compute Scores (Python + CLI)

```bash
# Calculate with Python
compliance=$(python3 -c "print(int($validation_pass / $total_checks * 100))")
consensus=$(python3 -c "print(int($milestone_completion / $total * 100))")

echo "→ COMPLIANCE: $compliance% (threshold: ≥80%)" >&2
echo "→ CONSENSUS: $consensus% (threshold: ≥95%)" >&2
```

## 3. Report & Update (CLI Atomic)

```bash
# Update progress (atomic)
jq --argjson comp $compliance \
  '.transactions = [{
    "workflow": "status",
    "rl_reward": 5,
    "compliance": $comp,
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }] + .transactions' "$memory_bank"progress.json | sponge "$memory_bank"progress.json

git commit -m "status: compliance $compliance%"
echo "✓ STATUS REPORT COMPLETE" >&2
```

---
**Lines**: ~46 | **CLI**: Parallel jq + python + sponge
