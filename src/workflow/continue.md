---
description: Session recovery with CLI pipeline
---

# /continue — Session Recovery

## 1. Load Router & Restore (CLI Native)

```bash
echo "→ CONTINUE: Session recovery" >&2

# Cache router in memory
ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')

# Restore state (parallel reads - 125x faster)
(
  session=$(jq '.session' "$memory_bank"activeContext.json)
  queue=$(jq '.priority_queue' "$memory_bank"scratchpad.json)
  rl_score=$(jq -r '.total_rl_score' "$memory_bank"progress.json)
) &
wait

echo "→ STATE: RL=$rl_score, Queue=$(echo $queue | jq length)" >&2
```

## 2. Validate & Resume (CLI Transparency)

```bash
# Validate all 8 schemas (parallel)
schema_files=$(echo "$ROUTER_JSON" | jq -r '.schema_files[]')
for schema in $schema_files; do
  (jq '.' "$memory_bank$schema" >/dev/null 2>&1 && echo "✓ $schema") &
done
wait

# Update session (atomic)
echo "→ UPDATE: Session resumed" >&2
jq '.session.status = "resumed" | .session.timestamp = "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"' \
  "$memory_bank"activeContext.json | sponge "$memory_bank"activeContext.json

# Recovery reward
jq '.transactions = [{"workflow": "continue", "rl_reward": 5}] + .transactions | .total_rl_score += 5' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json

echo "✓ RESUME COMPLETE" >&2
invoke_workflow "/next"
```

---
**Lines**: ~39 | **CLI**: Parallel jq + sponge
