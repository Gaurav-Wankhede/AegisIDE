---
description: Autonomous execution with CLI pipeline + Constitutional Awareness
---

# /next — Autonomous Execution Loop with Constitutional Enforcement

## 0. DYNAMIC CONSTITUTIONAL DISPLAY (ROUTER-FIRST)

```bash
# Load constitutional display from context-router.json (single source of truth)
load_constitutional_display() {
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.header' from 'context-router.json')" >&2
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.constitutional_frame' from 'context-router.json')" >&2
  echo "" >&2
  
  # Dynamic MCP display from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.always_active[]' from 'context-router.json' | while read -r mcp; do
    echo "  $mcp" >&2
  done
  @mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.on_demand[]' from 'context-router.json' | while read -r mcp; do
    echo "  $mcp" >&2
  done
  echo "" >&2
  
  # Memory operations from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.memory_operations.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.session_awareness.dynamic_display.memory_operations.operations[]' from 'context-router.json' | while read -r op; do
    echo "  $op" >&2
  done
  echo "" >&2
  
  # Dynamic violations from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.violations_penalties.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.violations_penalties.rules[] | "  • \(.violation) → \(.penalty) RL | Fix: \(.fix)"' from 'context-router.json' | while read -r violation; do
    echo "$violation" >&2
  done
  echo "" >&2
  
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.footer' from 'context-router.json')" >&2
  echo "" >&2
}

# Execute constitutional display
load_constitutional_display
```

## 1. Query Router via MCP

```bash
# Set error handling
set -euo pipefail

# Query paths from router (MCP - constitutional compliance)
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "→ ROUTER: Paths loaded via @mcp:json-jq" >&2

# Read current task (MCP - prevents -30 RL penalty)
task=$(@mcp:json-jq query '.priority_queue[0].title' from "${memory_bank}scratchpad.json")
echo "→ TASK: $task" >&2

if [[ -z "$task" || "$task" == "null" ]]; then
  echo "→ NO TASKS: Queue empty" >&2
  exit 0
fi
```

## 2. Execute Task (Autonomous)

1. Manual memory.json → Search patterns (confidence ≥0.9)
2. `@mcp:sequential-thinking` → Plan (≥3 steps)
3. Execute with MCPs (code/research/analysis)
4. Auto-validation → `/validate` (HALT if errors)

## 3. Update 8 Schemas (Atomic - MCP Read, jq Write)

```bash
# Query list of memory bank files (MCP READ)
update_order=$(@mcp:json-jq query '.memory_bank_files[]' from 'context-router.json')

for schema in $update_order; do
  echo "→ UPDATE: $schema" >&2
  
  # Atomic write ONLY (jq | sponge) — set timestamp; avoid touching fields that may not exist
  jq --arg ts "$(date '+%Y-%m-%dT%H:%M:%S%z')" \
    '.timestamp = $ts' \
    "${memory_bank}${schema}" | sponge "${memory_bank}${schema}"
done

# RL scoring - WRITE ONLY (jq | sponge)
rl_reward=20
echo "→ RL REWARD: +$rl_reward" >&2
jq --argjson reward $rl_reward \
  '.transactions = [{
    "workflow": "next",
    "rl_reward": $reward,
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }] + .transactions | .total_rl_score += $reward' \
  "${memory_bank}progress.json" | sponge "${memory_bank}progress.json"
```

## 4. Single Task Execution (Exit Cleanly)

```bash
# Signal handler for Ctrl+C
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

# Complete current task
@mcp:git add -A
@mcp:git commit -m "task: $task complete - RL: +20"

# Check for next task
next_task=$(@mcp:json-jq query '.priority_queue[0]' from "${memory_bank}scratchpad.json")

if [[ -n "$next_task" && "$next_task" != "null" ]]; then
  echo "→ NEXT AVAILABLE: $next_task" >&2
  echo "→ TIP: Run '/next' to continue (autonomous - no permission needed)" >&2
else
  echo "→ QUEUE EMPTY: All tasks complete" >&2
  echo "→ TIP: Run '/status' for summary" >&2
fi

# Success exit (CRITICAL: Prevents IDE hang)
echo "✓ WORKFLOW COMPLETE" >&2
exit 0
```

**Note**: Auto-chaining handled by user/IDE calling `/next` again, NOT by infinite loops in workflow.

## 5. Selective Article Loading (glow Rendering)

```bash
# Query articles via MCP READ (never jq for reads)
articles_always=$(@mcp:json-jq query '.auto_triggers.session_start.load_articles.always[]' from 'context-router.json')

echo "→ ARTICLES: Loading via @mcp:json-jq" >&2

# Render with glow (beautiful terminal UI)
for article_num in $articles_always; do
  echo "→ RENDER: Article $article_num" >&2
  glow "${constitution}/02-preliminary/article-${article_num}.md"
done

# On error - render judicial article
if [[ ${error:-0} -eq 1 ]]; then
  echo "→ ERROR GUIDANCE: Rendering Article 36 (Judiciary)" >&2
  glow "${constitution}/08-judiciary/article-36.md"
fi
```

**Performance**: 125x faster parallel reads, 267x faster atomic updates

---
**Lines**: ~111 | **CLI**: jq + sponge + glow (zero MCP filesystem, constitutionally compliant)
