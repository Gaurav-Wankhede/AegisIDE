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
# Sanitize inputs and calculate safely
density=$(python3 -c "e=$entities if '$entities'!='null' else 0; r=$relations if '$relations'!='null' else 0; denom=(e+r) if (e+r)>0 else 1; print(e/denom)")
compliance=$(python3 -c "e=$entities if '$entities'!='null' and $entities!='0' else 1; o=$orphaned if '$orphaned'!='null' else 0; print(int((1 - o / e) * 100))")

echo "→ HEALTH: $compliance% (threshold: ≥80%)" >&2
```

## 3. Update & Remediate (CLI Atomic)

```bash
# Update progress and increment RL total
jq --argjson health ${compliance:-0} \
  '.transactions = [{
    "workflow": "memory-status",
    "rl_reward": 5,
    "health": $health
  }] + .transactions | .total_rl_score += 5' "$memory_bank"progress.json | sponge "$memory_bank"progress.json

echo "✓ AUDIT COMPLETE" >&2
```

---
**Lines**: ~37 | **CLI**: Direct jq + python + sponge
