---
description: Session initialization with terminal jq
---

# /init — Session Initialization

## 1. Load Router & Check (Terminal jq)

```bash
# Cache router config
ROUTER=$(jq '.' context-router.json)
memory_bank=$(echo "$ROUTER" | jq -r '.system_paths.memory_bank')
schemas_path=$(echo "$ROUTER" | jq -r '.system_paths.schemas')
schema_files=$(echo "$ROUTER" | jq -r '.schema_files[]')

# Check if 8 schemas exist
missing=0
for schema in $schema_files; do
  [[ ! -f "$memory_bank$schema" ]] && ((missing++))
done

[[ $missing -gt 0 ]] && invoke_workflow "/bootstrap"
```

## 2. Load Schemas (Terminal jq - Parallel)

```bash
# Parallel reads (FASTEST - 100x faster than MCP)
task=$(jq -r '.priority_queue[0]' "$memory_bank"scratchpad.json) &
session=$(jq '.session' "$memory_bank"activeContext.json) &
errors=$(jq '.error_log[0]' "$memory_bank"mistakes.json) &
rl_score=$(jq -r '.total_rl_score' "$memory_bank"progress.json) &
wait

# Readiness calculation
readiness=$(python3 -c "print(int((8 - $missing) / 8 * 100))")
```

## 3. Selective Article Loading (jq Query)

```bash
# Query auto_triggers from router
auto_triggers=$(jq '.auto_triggers.session_start' context-router.json)
articles_always=$(echo "$auto_triggers" | jq -r '.load_articles.always[]')  # [1, 2, 3]

# Load articles 1-3 only
constitution=$(jq -r '.system_paths.constitution' context-router.json)
for article in $articles_always; do
  cat "$constitution/02-preliminary/article-0$article.md"
done

# Detect project language (parallel)
detection=$(echo "$auto_triggers" | jq -r '.detection_logic')
[[ -f "package.json" ]] && law=$(echo "$detection" | jq -r '.["package.json"]')
[[ -f "Cargo.toml" ]] && law=$(echo "$detection" | jq -r '.["Cargo.toml"]')
```

## 4. Validate & Commit

```bash
# Validate schemas (parallel)
for schema in $schema_files; do
  (jq '.' "$schemas_path/${schema%.json}.schema.json" >/dev/null 2>&1) &
done
wait

git status
```

**RL**: +10 success | -15 fail

---
**Lines**: ~56 | **jq**: Parallel reads = 100x faster
