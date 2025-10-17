---
description: Performance optimization with benchmarking
---

# /optimize — Performance Upgrade

## 1. Load Router & Baseline

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
rl_config = ROUTER['rl_calculation']
penalty = rl_config['penalties']['validation_failure']  # -25
```

## 2. Benchmark & Optimize

1. `@mcp:context7` → Fetch optimization best practices
2. `@mcp:fetch` → Gather benchmarks (free-tier)
3. `@mcp:memory` → Load historical patterns
4. Python `eval()` → Capture baseline metrics (latency, throughput, CPU/memory)
5. `@mcp:sequential-thinking` → Plan optimization
6. `@mcp:filesystem` → Apply changes (≤80 lines per EMD)
7. **Run Benchmarks** (SafeToAutoRun=true)
8. Python `eval()` → Compare results

## 3. Decision

```python
if regression:
    HALT + penalty + rollback
elif improvement:
    +20 RL reward
    @mcp:filesystem validate schemas
    @mcp:git commit "optimize: [improvement%]"
    @mcp:memory store pattern
```

**RL**: +20 improvement | -25 regression

---
**Lines**: ~45 | **Mandatory**: Before/after metrics
