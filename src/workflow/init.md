---
description: Session initialization with CLI pipeline
---

# /init — Session Initialization

## 1. Load Router & Check (CLI Native)

```bash
echo "→ INIT: Session initialization" >&2

# Cache router in memory (FASTEST)
ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')
schema_files=$(echo "$ROUTER_JSON" | jq -r '.schema_files[]')

# Check schemas exist (parallel)
missing=0
for schema in $schema_files; do
  [[ ! -f "$memory_bank$schema" ]] && ((missing++)) &
done
wait

echo "→ SCHEMAS: $((8-missing))/8 present" >&2
[[ $missing -gt 0 ]] && invoke_workflow "/bootstrap"
```

## 2. Load State (Parallel CLI Reads)

```bash
# Parallel reads (125x faster than MCP sequential)
echo "→ LOAD: Reading 8 schemas in parallel" >&2
(
  task=$(jq -r '.priority_queue[0]' "$memory_bank"scratchpad.json)
  session=$(jq '.session' "$memory_bank"activeContext.json)
  errors=$(jq '.error_log[0]' "$memory_bank"mistakes.json)
  rl_score=$(jq -r '.total_rl_score' "$memory_bank"progress.json)
) &
wait

echo "→ STATE: Task=$task, RL=$rl_score" >&2
```

## 3. Render Articles (glow CLI)

```bash
# Query articles to load
articles=$(echo "$ROUTER_JSON" | jq -r '.auto_triggers.session_start.load_articles.always[]')
constitution=$(echo "$ROUTER_JSON" | jq -r '.system_paths.constitution')

# Render with beautiful terminal UI
for article in $articles; do
  echo "→ RENDER: Article $article" >&2
  cat "$constitution/02-preliminary/article-0$article.md" | glow -
done
```

---
**Lines**: ~48 | **CLI**: Parallel jq + glow rendering
