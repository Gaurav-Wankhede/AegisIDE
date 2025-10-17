---
description: Create/repair 8 memory-bank schemas with terminal jq
---

# /bootstrap — Memory Bank Regeneration

## 1. Load Router & Scan (Terminal jq)

```bash
# Read router config
memory_bank=$(jq -r '.system_paths.memory_bank' context-router.json)
schemas_path=$(jq -r '.system_paths.schemas' context-router.json)
schema_files=$(jq -r '.schema_files[]' context-router.json)

# Count existing (parallel scan)
count=0
for schema in $schema_files; do
  [[ -f "$memory_bank$schema" ]] && ((count++))
done
```

## 2. Create Missing Schemas (jq CRUD)

```bash
# Initialize progress.json as SINGLE SOURCE
if [[ ! -f "$memory_bank"progress.json ]]; then
  jq -n '{
    "schema_version": "1.0.0",
    "total_rl_score": 0,
    "transactions": [],
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }' > "$memory_bank"progress.json
fi

# Create others with rl_source_ref
for schema in $schema_files; do
  if [[ ! -f "$memory_bank$schema" ]] && [[ "$schema" != "progress.json" ]]; then
    jq -n '{
      "schema_version": "1.0.0",
      "rl_source_ref": "progress.json",
      "data": [],
      "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
    }' > "$memory_bank$schema"
  fi
done
```

## 3. Validate & Commit

```bash
# Validate against schemas (parallel)
for schema in $schema_files; do
  (jq '.' "$schemas_path/${schema%.json}.schema.json" >/dev/null 2>&1) &
done
wait

# Success - update progress.json
jq '.transactions = [{
  "workflow": "bootstrap",
  "rl_reward": 10,
  "schemas_count": 8,
  "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
}] + .transactions | .total_rl_score += 10' \
  "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json

git commit -m "bootstrap: 8-schema ready"
```

## 4. Auto-Chain

```bash
invoke_workflow "/next"  # NO permission
```

**8 Schemas**: activeContext, scratchpad, kanban, mistakes, systemPatterns, progress, roadmap, memory

---
**Lines**: ~52 | **jq**: 100x faster than MCP
