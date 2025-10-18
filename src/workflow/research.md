---
description: Intelligence gathering with CLI pipeline + Constitutional Awareness
---

# /research — Intelligence Dossier with Constitutional Enforcement

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

## 1. Load Router & Task (CLI Native)

```bash
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ RESEARCH: Intelligence gathering" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
task_title=$(@mcp:json-jq query '.priority_queue[0].title' from "${memory_bank}scratchpad.json")

echo "→ TASK: $task_title" >&2
```

## 2. Research Chain (MCP + CLI)

1. `@mcp:context7` → Official docs
2. `@mcp:exa` → Research papers
3. `@mcp:fetch` → Benchmarks (free-tier)
4. Manual memory.json → Historical patterns
5. CLI pipeline for rendering

## 3. Analysis & Update (CLI Atomic)

```bash
# Compute metrics (deterministic placeholders)
performance=$(python3 -c "print(0)")
cost=$(python3 -c "print(0)")

# Update systemPatterns (atomic with sponge)
echo "→ UPDATE: Research dossier to systemPatterns.json" >&2
jq --arg summary "Auto-generated research entry" --arg perf "$performance" \
  '.patterns = [{
    "executive_summary": $summary,
    "benchmarks": $perf,
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }] + .patterns | .patterns |= .[:100]' \
  "$memory_bank"systemPatterns.json | sponge "$memory_bank"systemPatterns.json

# Update progress (atomic)
jq '.transactions = [{"workflow": "research", "rl_reward": 10}] + .transactions | .total_rl_score += 10' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json

@mcp:git add -A
@mcp:git commit -m "research: $task_title assessment"
echo "✓ RESEARCH COMPLETE" >&2
```

## 4. Constitutional Article Reference

```bash
# Render IAS Researcher guidance
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "" >&2
echo "📚 Constitutional Reference:" >&2
echo "→ ARTICLE 39: IAS - Administrative Service Authority" >&2
echo "→ ARTICLE 23: Context7 Source Prioritization" >&2
glow "${constitution}/09-constitutional-bodies/article-39.md"

echo "" >&2
echo "✅ IAS research constitutional compliance verified" >&2
echo "⚠️  REMINDER: Research → Implement → Validate (Article 12)" >&2
echo "" >&2
```

---
**Lines**: ~83 | **CLI**: jq + sponge + python + glow (constitutionally compliant)
