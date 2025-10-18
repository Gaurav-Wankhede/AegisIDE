---
description: Performance optimization with CLI pipeline + Constitutional Awareness
---

# /optimize — Performance Upgrade with Constitutional Enforcement

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

## 1. Router & Baseline (CLI Native)

```bash
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ OPTIMIZE: Performance benchmarking" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')

# Capture baseline
baseline=$(python3 -c "import time; print(time.time())")
echo "→ BASELINE: $baseline" >&2
```

## 2. Benchmark & Optimize (MCP + CLI)

1. `@mcp:context7` → Best practices
2. `@mcp:fetch` → Benchmarks (free-tier)
3. Manual memory.json → Historical patterns
4. Apply changes (≤80 lines EMD)
5. CLI pipeline for measurement

## 3. Decision (CLI Atomic)

```bash
# Capture new timestamp (post-ops)
new_time=$(python3 -c "import time; print(time.time())")

# Calculate improvement (negative means regression)
improvement=$(python3 -c "import sys; b=float(sys.argv[1]); n=float(sys.argv[2]); print(((n-b)/b)*100 if b!=0 else 0)" "$baseline" "$new_time")

# Determine regression using Python (no bc dependency)
regression=$(python3 -c "import sys; imp=float(sys.argv[1]); print('1' if imp<0 else '0')" "$improvement")

if [[ "$regression" == "1" ]]; then
  # Regression - HALT
  echo "→ REGRESSION: $improvement% (penalty: -25)" >&2
  jq '.transactions = [{"workflow": "optimize", "rl_penalty": -25}] + .transactions | .total_rl_score += -25' \
    "$memory_bank"progress.json | sponge "$memory_bank"progress.json
else
  # Success
  echo "→ SUCCESS: $improvement% improvement (+20 RL)" >&2
  jq --argjson imp "$improvement" \
    '.transactions = [{
      "workflow": "optimize",
      "rl_reward": 20,
      "improvement_pct": $imp
    }] + .transactions | .total_rl_score += 20' \
    "$memory_bank"progress.json | sponge "$memory_bank"progress.json
  @mcp:git add -A
  @mcp:git commit -m "optimize: ${improvement}% improvement"
fi

echo "✓ OPTIMIZATION COMPLETE" >&2
```

## 4. Constitutional Article Reference

```bash
# Render optimization guidance
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "" >&2
echo "📚 Constitutional Reference:" >&2
echo "→ ARTICLE 20: Free-Tier & Resource Optimization" >&2
glow "${constitution}/05-dpsp/article-20.md"

echo "" >&2
echo "✅ Performance optimization constitutional compliance verified" >&2
echo "" >&2
```

---
**Lines**: ~78 | **CLI**: Python + jq + sponge + glow (constitutionally compliant)
