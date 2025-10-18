---
description: Knowledge graph audit with CLI pipeline
---

# /memory-status — Graph Health Audit

## 1. Load Router & Query (CLI Native)

```bash
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ MEMORY-STATUS: Knowledge graph audit" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
entities=$(@mcp:json-jq query '.entities | length' from "${memory_bank}memory.json")
relations=$(@mcp:json-jq query '.relations | length' from "${memory_bank}memory.json")
orphaned=$(@mcp:json-jq query '[.entities[] | select(.relations == null)] | length' from "${memory_bank}memory.json")

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
