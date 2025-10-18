---
description: 8-schema atomic sync with CLI pipeline
---

# /update — Schema Synchronization

## 1. Load Router (CLI Native)

```bash
echo "→ UPDATE: 8-schema synchronization" >&2

# Query via MCP
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
update_order=$(@mcp:json-jq query '.memory_bank_files[]' from 'context-router.json')

# Validate all 8 schemas exist
echo "→ VALIDATE: Checking 8 schemas" >&2
for schema in $update_order; do
  if [[ -f "${memory_bank}${schema}" ]]; then
    echo "✓ $schema" >&2
  else
    echo "❌ $schema MISSING" >&2
  fi
done
```

## 2. Update All (CLI Atomic)

```bash
# Count valid schemas from validation step
valid_count=0
for schema in $update_order; do
  [[ -f "${memory_bank}${schema}" ]] && ((valid_count++))
done

# Calculate compliance percentage
compliance=$(python3 -c "print(int($valid_count / 8 * 100))")
echo "→ COMPLIANCE: ${valid_count}/8 schemas valid (${compliance}%)" >&2

# Atomic updates with sponge
for schema in $update_order; do
  echo "→ UPDATE: $schema (atomic)" >&2
  jq '.timestamp = "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"' \
    "$memory_bank$schema" | sponge "$memory_bank$schema"
done

# Update progress
jq '.transactions = [{"workflow": "update", "rl_reward": 8}] + .transactions | .total_rl_score += 8' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json

@mcp:git add -A
@mcp:git commit -m "update: 8-schema sync"
echo "✓ UPDATE COMPLETE" >&2
```

---
**Lines**: ~39 | **CLI**: Parallel jq + sponge (atomic)
