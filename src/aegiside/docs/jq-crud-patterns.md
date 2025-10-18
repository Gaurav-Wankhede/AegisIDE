# Terminal jq CRUD Patterns for Memory Bank

## Why Terminal jq > @mcp:filesystem for JSON

**Performance**: 10-100x faster than MCP filesystem calls
**Parallelization**: Multiple jq processes can run simultaneously
**Stream Processing**: Real-time updates without loading entire files
**Atomic Operations**: Use temp files + mv for safe updates

---

## CRUD Operations with Terminal jq

### 1. CREATE (New JSON Objects)

```bash
# Create new JSON object from scratch
jq -n '{
  "schema_version": "1.0.0",
  "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'",
  "data": []
}' > "$memory_bank"newfile.json

# Add to existing array (prepend at [0])
jq --arg new_item "$data" '.array = [$new_item] + .array' file.json > temp.json && mv temp.json file.json
```

### 2. READ (Query Specific Fields)

```bash
# Read entire file
jq '.' file.json

# Query specific field (FASTEST - no full parse)
task=$(jq -r '.priority_queue[0]' scratchpad.json)

# Query nested paths
memory_bank=$(jq -r '.system_paths.memory_bank' context-router.json)

# Query array elements
articles=$(jq -r '.load_articles.always[]' context-router.json)

# Conditional queries
errors=$(jq '.error_log[] | select(.severity == "critical")' mistakes.json)
```

### 3. UPDATE (Modify Existing Data)

```bash
# Update specific field
jq '.status |= "completed"' file.json > temp.json && mv temp.json file.json

# Update based on current value
jq '.total_rl_score |= . + 20' progress.json > temp.json && mv temp.json progress.json

# Prepend to array (top-append strategy)
jq --argjson new_entry "$json_data" '.transactions = [$new_entry] + .transactions' \
   progress.json > temp.json && mv temp.json progress.json

# Trim array to max 100 entries
jq '.array |= .[:100]' file.json > temp.json && mv temp.json file.json

# Update multiple fields atomically
jq '.status = "done" | .timestamp = "'$(date -I)'" | .rl_score += 10' \
   activeContext.json > temp.json && mv temp.json activeContext.json
```

### 4. DELETE (Remove Keys/Elements)

```bash
# Delete specific key
jq 'del(.secret_key)' file.json > temp.json && mv temp.json file.json

# Delete array element by index
jq 'del(.array[0])' file.json > temp.json && mv temp.json file.json

# Delete by condition
jq 'del(.tasks[] | select(.status == "obsolete"))' scratchpad.json > temp.json && mv temp.json scratchpad.json
```

---

## Memory Bank Patterns (8 Schemas)

### Progress.json (SINGLE SOURCE for RL)

```bash
# Add RL transaction (prepend)
jq --argjson tx '{
  "workflow": "next",
  "rl_reward": 20,
  "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
}' '.transactions = [$tx] + .transactions | .total_rl_score += 20' \
   progress.json > temp.json && mv temp.json progress.json

# Read total RL score (FASTEST)
total_rl=$(jq -r '.total_rl_score' progress.json)
```

### Scratchpad.json (Task Queue)

```bash
# Get top task (FASTEST)
task=$(jq -r '.priority_queue[0]' scratchpad.json)

# Remove completed task
jq '.priority_queue |= .[1:]' scratchpad.json > temp.json && mv temp.json scratchpad.json

# Add new task (prepend)
jq --argjson task "$new_task" '.priority_queue = [$task] + .priority_queue' \
   scratchpad.json > temp.json && mv temp.json scratchpad.json
```

### ActiveContext.json (Session State)

```bash
# Update session state
jq '.session.status = "active" | .session.last_updated = "'$(date -I)'"' \
   activeContext.json > temp.json && mv temp.json activeContext.json

# Read specific session field (FASTEST)
autonomy=$(jq -r '.session.autonomy_level' activeContext.json)
```

### Mistakes.json (Error Patterns)

```bash
# Prepend error with prevention rule
jq --argjson error '{
  "error_type": "validation_failure",
  "prevention_rule": "Always run /validate before commit",
  "rl_penalty": -30,
  "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
}' '.error_log = [$error] + .error_log | .error_log |= .[:100]' \
   mistakes.json > temp.json && mv temp.json mistakes.json
```

---

## Parallel Processing (FASTEST)

```bash
# Read multiple schemas simultaneously
(
  jq -r '.priority_queue[0]' "$memory_bank"scratchpad.json &
  jq -r '.total_rl_score' "$memory_bank"progress.json &
  jq -r '.session' "$memory_bank"activeContext.json &
  wait
)

# Update multiple schemas atomically in parallel
for schema in activeContext.json scratchpad.json progress.json; do
  (
    jq '.timestamp = "'$(date -I)'"' "$memory_bank$schema" > temp_$schema
    mv temp_$schema "$memory_bank$schema"
  ) &
done
wait
```

---

## Router Config Queries (FASTEST)

```bash
# Load entire router once
ROUTER=$(jq '.' context-router.json)

# Query multiple paths from cached ROUTER
memory_bank=$(echo "$ROUTER" | jq -r '.system_paths.memory_bank')
constitution=$(echo "$ROUTER" | jq -r '.system_paths.constitution')
rl_rewards=$(echo "$ROUTER" | jq '.rl_calculation.rewards')
schema_files=$(echo "$ROUTER" | jq -r '.schema_files[]')
```

---

## Safety Pattern (Atomic Updates)

```bash
# ALWAYS use temp file + mv for atomicity
update_json() {
  local file=$1
  local query=$2
  jq "$query" "$file" > "${file}.tmp" && mv "${file}.tmp" "$file"
}

# Usage
update_json "progress.json" '.total_rl_score += 10'
```

---

## Performance Comparison

| Operation | @mcp:filesystem | Terminal jq | Speedup |
|-----------|----------------|-------------|---------|
| Read field | ~500ms | ~5ms | 100x |
| Update field | ~800ms | ~10ms | 80x |
| Parallel reads | Sequential | Simultaneous | N/A |
| Array prepend | ~1000ms | ~15ms | 67x |

**Conclusion**: Terminal jq is 50-100x faster and enables true parallel processing
