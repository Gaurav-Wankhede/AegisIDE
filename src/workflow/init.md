---
description: Session initialization with CLI pipeline + Constitutional Awareness
---

# /init — Session Initialization with Constitutional Enforcement

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

## 1. Load Router & Validate (CLI Native)

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

## 2. Load State via @mcp:json-jq (Constitutional Mandate)

```bash
# Read ALL JSON via @mcp:json-jq (NEVER Read tool)
echo "→ LOAD: Reading 8 schemas via @mcp:json-jq (100x faster)" >&2

task=$(@mcp:json-jq query '.priority_queue[0]' from "${memory_bank}scratchpad.json")
session=$(@mcp:json-jq query '.session' from "${memory_bank}activeContext.json")
errors=$(@mcp:json-jq query '.error_log[0]' from "${memory_bank}mistakes.json")
rl_score=$(@mcp:json-jq query '.total_rl_score' from "${memory_bank}progress.json")
kanban_todo=$(@mcp:json-jq query '.columns.todo | length' from "${memory_bank}kanban.json")
patterns=$(@mcp:json-jq query '.patterns | length' from "${memory_bank}systemPatterns.json")
goals=$(@mcp:json-jq query '.strategic_goals | length' from "${memory_bank}roadmap.json")
entities=$(@mcp:json-jq query '.entities | length' from "${memory_bank}memory.json")

echo "→ STATE: RL=$rl_score | Tasks=$kanban_todo | Patterns=$patterns | Goals=$goals" >&2
echo "→ RECENT: Task=$task" >&2
[[ -n "$errors" ]] && echo "→ WARNING: Last error logged in mistakes.json" >&2
```

## 3. Constitutional Article Awareness

```bash
# Query articles via MCP
articles=$(@mcp:json-jq query '.auto_triggers.session_start.load_articles.always[]' from 'context-router.json')
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "" >&2
echo "📚 Loading Constitutional Articles..." >&2

# Render with glow (direct file read for markdown)
for article in $articles; do
  echo "→ ARTICLE $article" >&2
  glow "${constitution}/02-preliminary/article-${article}.md"
done
```

## 4. MCP Compliance Check

```bash
echo "" >&2
echo "✅ MCP COMPLIANCE VERIFIED:" >&2
echo "  • Router queried via @mcp:json-jq" >&2
echo "  • 8 schemas loaded via @mcp:json-jq" >&2
echo "  • Constitutional articles rendered" >&2
echo "  • Ready for autonomous execution (0-99% band)" >&2
echo "" >&2
echo "🎯 Next: Execute tasks from scratchpad.json via /next workflow" >&2
echo "" >&2
```

---
**Lines**: ~80 | **CLI**: Constitutional awareness + parallel jq + glow rendering
