---
description: Performance optimization with terminal jq
---

# /optimize — Performance Upgrade

## 1. Router & Baseline (Terminal jq)

```bash
ROUTER=$(jq '.' context-router.json)
memory_bank=$(echo "$ROUTER" | jq -r '.system_paths.memory_bank')
penalty=$(echo "$ROUTER" | jq -r '.rl_calculation.penalties.validation_failure')  # -25

# Capture baseline
baseline=$(python3 -c "import time; print(time.time())")
```

## 2. Benchmark & Optimize

1. `@mcp:context7` → Best practices
2. `@mcp:fetch` → Benchmarks (free-tier)
3. `@mcp:memory` → Historical patterns
4. Apply changes (≤80 lines EMD)
5. Run benchmarks
6. Python → Compare results

## 3. Decision (Terminal jq)

```bash
if [[ $regression -eq 1 ]]; then
  # HALT + penalty
  jq '.transactions = [{"workflow": "optimize", "rl_penalty": '$penalty'}] + .transactions | .total_rl_score += '$penalty' \
    "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
  git revert HEAD
else
  # Success + reward
  jq '.transactions = [{"workflow": "optimize", "rl_reward": 20, "improvement_pct": '$improvement'}] + .transactions | .total_rl_score += 20' \
    "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
  git commit -m "optimize: ${improvement}% improvement"
fi
```

**RL**: +20 improvement | -25 regression

---
**Lines**: ~41 | **jq**: Atomic decision
