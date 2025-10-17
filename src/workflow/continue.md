---
description: Session recovery with terminal jq
---

# /continue — Session Recovery

## 1. Load Router & Check Integrity (Terminal jq)

```bash
# Read router once (cache in memory)
ROUTER=$(jq '.' context-router.json)
memory_bank=$(echo "$ROUTER" | jq -r '.system_paths.memory_bank')

# Restore state (parallel reads - FASTEST)
session=$(jq '.session' "$memory_bank"activeContext.json) &
queue=$(jq '.priority_queue' "$memory_bank"scratchpad.json) &
wait
```

## 2. Validate & Calculate Checkpoint

```bash
# Check all 8 schemas integrity (parallel)
for schema in activeContext scratchpad kanban mistakes systemPatterns progress roadmap memory; do
  (jq '.' "$memory_bank$schema.json" >/dev/null 2>&1) &
done
wait

# Calculate resume position
checkpoint=$(python3 -c "print(len($queue))")
```

## 3. Reconstruct & Resume

1. `@mcp:memory` → Restore knowledge graph
2. `@mcp:git` → Verify clean tree
3. Resume from checkpoint (NO re-execution)

## 4. Update & Auto-Chain (Terminal jq)

```bash
# Update activeContext with jq
jq '.session.status = "resumed" | .session.timestamp = "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"' \
  "$memory_bank"activeContext.json > temp.json && mv temp.json "$memory_bank"activeContext.json

# Add recovery reward
jq '.transactions = [{"workflow": "continue", "rl_reward": 5}] + .transactions | .total_rl_score += 5' \
  "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json

# Immediate chain (NO permission)
invoke_workflow "/next"
```

**RL**: +5 recovery | -10 fail

---
**Lines**: ~49 | **jq**: Parallel integrity checks
