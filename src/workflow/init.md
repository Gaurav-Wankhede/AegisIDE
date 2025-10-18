---
description: Session initialization with CLI pipeline
---

# /init — Session Initialization

## 1. Load Router & Check (CLI Native)

```bash
echo "→ INIT: Session initialization" >&2

# Query via MCP (constitutional compliance)
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
memory_bank_files=$(@mcp:json-jq query '.memory_bank_files[]' from 'context-router.json')

# Check schemas exist (parallel)
missing=0
for f in $memory_bank_files; do
  [[ ! -f "$memory_bank$f" ]] && ((missing++)) &
done
wait

echo "→ SCHEMAS: $((8-missing))/8 present" >&2
[[ $missing -gt 0 ]] && invoke_workflow "/bootstrap"
```

## 2. Load State (Parallel CLI Reads)

```bash
# Read via MCP
echo "→ LOAD: Reading 8 schemas via @mcp:json-jq" >&2
task=$(@mcp:json-jq query '.priority_queue[0]' from "${memory_bank}scratchpad.json")
session=$(@mcp:json-jq query '.session' from "${memory_bank}activeContext.json")
errors=$(@mcp:json-jq query '.error_log[0]' from "${memory_bank}mistakes.json")
rl_score=$(@mcp:json-jq query '.total_rl_score' from "${memory_bank}progress.json")

echo "→ STATE: Task=$task, RL=$rl_score" >&2
```

## 3. Render Articles (glow CLI)

```bash
# Query articles via MCP
articles=$(@mcp:json-jq query '.auto_triggers.session_start.load_articles.always[]' from 'context-router.json')
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

# Render with glow (direct file read)
for article in $articles; do
  echo "→ RENDER: Article $article" >&2
  glow "${constitution}/02-preliminary/article-${article}.md"
done
```

---
**Lines**: ~48 | **CLI**: Parallel jq + glow rendering
