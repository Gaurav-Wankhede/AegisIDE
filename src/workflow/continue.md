---
description: Session recovery with CLI pipeline + Constitutional Awareness
---

# /continue — Session Recovery with Constitutional Enforcement

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

## 1. Query Router & Restore via MCP

```bash
# Error handling
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ CONTINUE: Session recovery" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')

# Restore state via MCP
session=$(@mcp:json-jq query '.session' from "${memory_bank}activeContext.json")
queue=$(@mcp:json-jq query '.priority_queue' from "${memory_bank}scratchpad.json")
rl_score=$(@mcp:json-jq query '.total_rl_score' from "${memory_bank}progress.json")

queue_length=$(@mcp:json-jq query '.priority_queue | length' from "${memory_bank}scratchpad.json")
echo "→ STATE: RL=$rl_score, Queue=$queue_length" >&2
```

## 2. Validate & Resume (CLI Transparency)

```bash
# Query memory bank files via MCP (data files, not .schema.json)
memory_bank_files=$(@mcp:json-jq query '.memory_bank_files[]' from 'context-router.json')

# Validate all 8 data files exist
for f in $memory_bank_files; do
  if [[ -f "${memory_bank}${f}" ]]; then
    echo "✓ $f" >&2
  else
    echo "❌ $f MISSING" >&2
  fi
done

# Update session (atomic WRITE - jq | sponge)
echo "→ UPDATE: Session resumed" >&2
jq '.session.status = "resumed" | .session.timestamp = "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"' \
  "${memory_bank}activeContext.json" | sponge "${memory_bank}activeContext.json"

# Recovery reward (atomic WRITE - jq | sponge)
jq '.transactions = [{"workflow": "continue", "rl_reward": 5}] + .transactions | .total_rl_score += 5' \
  "${memory_bank}progress.json" | sponge "${memory_bank}progress.json"

# Commit recovery
@mcp:git add -A
@mcp:git commit -m "continue: Session restored - RL: $rl_score"

echo "✓ CONTINUE COMPLETE" >&2
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
  echo "→ ARTICLE $article: Loaded" >&2
  glow "${constitution}/02-preliminary/article-${article}.md"
done

echo "" >&2
echo "✅ Constitutional framework activated" >&2
echo "→ TIP: Run '/next' to resume operations" >&2
echo "" >&2
exit 0
```

---
**Lines**: ~72 | **CLI**: Parallel jq + sponge + glow (constitutionally compliant)
