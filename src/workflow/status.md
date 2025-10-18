---
description: System status with CLI pipeline
---

# /status — Status Report

## 1. Load Router & Query (CLI Native)

```bash
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ STATUS: System health audit" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
task_count=$(@mcp:json-jq query '.priority_queue | length' from "${memory_bank}scratchpad.json")
rl_score=$(@mcp:json-jq query '.total_rl_score' from "${memory_bank}progress.json")
error_count=$(@mcp:json-jq query '.error_log | length' from "${memory_bank}mistakes.json")

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
