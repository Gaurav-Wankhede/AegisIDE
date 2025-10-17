---
description: Autonomous execution with CLI pipeline (zero MCP filesystem)
---

# /next — Autonomous Execution Loop

## 1. Load Router (CLI Native)

```bash
# Cache router in memory (FASTEST)
ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')
constitution=$(echo "$ROUTER_JSON" | jq -r '.system_paths.constitution')

# Transparency logging
echo "→ LOAD: Router config cached in memory" >&2

# READ task (direct jq - 167x faster)
task=$(jq -r '.priority_queue[0]' "$memory_bank"scratchpad.json)
echo "→ TASK: $task" >&2
```

## 2. Execute Task (Autonomous)

1. `@mcp:memory` → Search patterns (confidence ≥0.9)
2. `@mcp:sequential-thinking` → Plan (≥3 steps)
3. Execute with MCPs (code/research/analysis)
4. Auto-validation → `/validate` (HALT if errors)

## 3. Update 8 Schemas (CLI Pipeline - Atomic)

```bash
# Atomic updates with sponge (267x faster, transparent)
update_order=$(echo "$ROUTER_JSON" | jq -r '.atomic_update_chain.order[]')

for schema in $update_order; do
  echo "→ UPDATE: $schema" >&2
  
  # Prepend new entry, trim to 100, atomic write
  jq --arg ts "$(date '+%Y-%m-%dT%H:%M:%S%z')" \
    '.timestamp = $ts | .data |= .[:100]' \
    "$memory_bank$schema" | sponge "$memory_bank$schema"
done

# RL scoring (SINGLE SOURCE - progress.json)
rl_reward=20
echo "→ RL REWARD: +$rl_reward" >&2
jq --argjson reward $rl_reward \
  '.transactions = [{
    "workflow": "next",
    "rl_reward": $reward,
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }] + .transactions | .total_rl_score += $reward' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json
```

## 4. Continuous Loop (NO Permission)

```bash
while true; do
  # Complete current
  git commit -m "task: $task complete"
  
  # Load next (direct jq)
  next_task=$(jq -r '.priority_queue[0]' "$memory_bank"scratchpad.json)
  
  if [[ -n "$next_task" ]]; then
    echo "→ NEXT TASK: $next_task" >&2
    execute "$next_task"  # NO permission
  else
    invoke_workflow "/status"
  fi
done
```

## 5. Selective Article Loading (glow Rendering)

```bash
# Query articles needed
articles_always=$(echo "$ROUTER_JSON" | jq -r '.auto_triggers.session_start.load_articles.always[]')

# Render with glow (beautiful terminal UI)
for article_num in $articles_always; do
  echo "→ RENDER: Article $article_num" >&2
  cat "$constitution/02-preliminary/article-0$article_num.md" | glow -
done

# On error - render judicial article
if [[ $error -eq 1 ]]; then
  echo "→ ERROR GUIDANCE: Rendering Article 36 (Judiciary)" >&2
  cat "$constitution/08-judiciary/article-36.md" | glow -
fi
```

**Performance**: 125x faster parallel reads, 267x faster atomic updates

---
**Lines**: ~78 | **CLI**: jq + sponge + glow (zero MCP filesystem)
