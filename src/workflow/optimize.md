---
description: Performance optimization with CLI pipeline
---

# /optimize — Performance Upgrade

## 1. Router & Baseline (CLI Native)

```bash
echo "→ OPTIMIZE: Performance benchmarking" >&2

ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')

# Capture baseline
baseline=$(python3 -c "import time; print(time.time())")
echo "→ BASELINE: $baseline" >&2
```

## 2. Benchmark & Optimize (MCP + CLI)

1. `@mcp:context7` → Best practices
2. `@mcp:fetch` → Benchmarks (free-tier)
3. `@mcp:memory` → Historical patterns
4. Apply changes (≤80 lines EMD)
5. CLI pipeline for measurement

## 3. Decision (CLI Atomic)

```bash
# Calculate improvement
improvement=$(python3 -c "print(($new_time - $baseline) / $baseline * 100)")

if (( $(echo "$improvement < 0" | bc -l) )); then
  # Regression - HALT
  echo "→ REGRESSION: $improvement% (penalty: -25)" >&2
  jq '.transactions = [{"workflow": "optimize", "rl_penalty": -25}] + .transactions | .total_rl_score += -25' \
    "$memory_bank"progress.json | sponge "$memory_bank"progress.json
  git revert HEAD
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
  git commit -m "optimize: ${improvement}% improvement"
fi

echo "✓ OPTIMIZATION COMPLETE" >&2
```

---
**Lines**: ~45 | **CLI**: Python + jq + sponge
