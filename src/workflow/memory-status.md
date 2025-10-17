---
description: Knowledge graph audit with CLI pipeline
---

# /memory-status — Graph Health Audit

## 1. Load Router & Query (CLI Native)

```bash
echo "→ MEMORY-STATUS: Knowledge graph audit" >&2

ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')

# Query metadata (direct jq - FASTEST)
entities=$(jq '.entities | length' "$memory_bank"memory.json)
relations=$(jq '.relations | length' "$memory_bank"memory.json)
orphaned=$(jq '[.entities[] | select(.relations == null)] | length' "$memory_bank"memory.json)

echo "→ METRICS: Entities=$entities, Relations=$relations, Orphaned=$orphaned" >&2
```

## 2. Health Calculation (Python CLI)

```bash
# Calculate with Python
density=$(python3 -c "print($entities / ($entities + $relations))")
compliance=$(python3 -c "print(int((1 - $orphaned / $entities) * 100))")

echo "→ HEALTH: $compliance% (threshold: ≥80%)" >&2
```

## 3. Update & Remediate (CLI Atomic)

```bash
# Update progress
jq --argjson health $compliance \
  '.transactions = [{
    "workflow": "memory-status",
    "rl_reward": 5,
    "health": $health
  }] + .transactions' "$memory_bank"progress.json | sponge "$memory_bank"progress.json

echo "✓ AUDIT COMPLETE" >&2
```

---
**Lines**: ~37 | **CLI**: Direct jq + python + sponge
