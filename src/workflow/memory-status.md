---
description: Knowledge graph audit with terminal jq
---

# /memory-status — Graph Audit

## 1. Load Router & Query (Terminal jq)

```bash
# Cache router
ROUTER=$(jq '.' context-router.json)
memory_bank=$(echo "$ROUTER" | jq -r '.system_paths.memory_bank')

# Query metadata (FASTEST)
entities=$(jq -r '.entities | length' "$memory_bank"memory.json)
relations=$(jq -r '.relations | length' "$memory_bank"memory.json)
orphaned=$(jq '[.entities[] | select(.relations == null)] | length' "$memory_bank"memory.json)
```

## 2. Health Metrics (Python)

```bash
# Calculate with Python
entity_density=$(python3 -c "print($entities / ($entities + $relations))")
compliance=$(python3 -c "print(int((1 - $orphaned / $entities) * 100))")
```

## 3. Audit & Remediate

```bash
# IF issues (compliance < 80%)
if [[ $compliance -lt 80 ]]; then
  @mcp:sequential-thinking plan_remediation
  @mcp:context7 fetch_ontology_updates
fi

# Validate against schema
jq '.' "$memory_bank/schemas/memory.schema.json" >/dev/null 2>&1

# Update with jq
jq '.transactions = [{"audit": "complete", "health": '$compliance'}] + .transactions' \
  "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
```

**RL**: +5 healthy | -10 issues

---
**Lines**: ~37 | **jq**: Direct field queries
