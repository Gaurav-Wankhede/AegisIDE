---
description: RL-driven performance optimization with benchmarking
---

# /optimize — Performance Upgrade Loop

## RL-Driven Optimization

**Purpose**: Identify and apply performance improvements
**RL Reward**: +20 for successful optimization with measurable gains
**RL Penalty**: -25 if regression detected
**Benchmarking**: Mandatory before/after metrics

## MCP Chain (Benchmark-Driven)

1. `@mcp:context7` → Fetch optimization best practices
2. `@mcp:fetch` → Gather industry benchmarks (free-tier focus)
3. `@mcp:memory` → Load historical patterns from knowledge graph
4. `@mcp:math` → Capture baseline metrics:
   - Latency (ms)
   - Throughput (ops/sec)
   - Resource usage (CPU/memory)
5. `@mcp:sequential-thinking` → Plan optimization steps
6. `@mcp:filesystem` → Apply changes (files ≤80 lines, ≤10KB)
7. `@mcp:time` → Timestamp pre/post runs
8. **Run Benchmarks** (SafeToAutoRun=true)
9. `@mcp:math` → Compare results
10. IF regression → HALT + -25 RL penalty + rollback
11. IF improvement → +20 RL reward
12. `@mcp:filesystem` → Validate schemas
13. `@mcp:git` → Commit "optimize: [improvement%]"
14. `@mcp:memory` → Store optimization pattern

## Actions & Pattern Learning

1. **Optimization Pattern**: Prepend to `systemPatterns.json`[0]:
   ```json
   {"pattern_id": "optimize_X", "type": "performance",
    "before_metrics": {"latency_ms": 100},
    "after_metrics": {"latency_ms": 60},
    "improvement_pct": 40, "rl_reward": 20,
    "confidence_score": 0.95, "reuse_count": 0}
   ```
2. **RL Scoring & Computation**:
   - Calculate: TD_error for optimization value, GAE for multi-step improvements
   - Update: V(performance_branch) via Bellman backup
   - Optimization → +15 RL → `progress.json` with rl_computation
   - Performance gain → bonus +10 RL
   - Improvement ≥20% → +20 RL → Prepend to `progress.json`[0]
   - Regression → -25 RL → Prepend to `mistakes.json`[0] + rollback
   - **GAE Calculation**: Compute advantage for optimization success
   - **Success**: +10 RL → `progress.json`[0]
     ```json
     {"workflow": "optimize", "rl_reward": 10,
      "optimization_applied": "...", "performance_gain": "+X%",
      "gae_advantage": 0.82, "kl_divergence": 0.005,
      "value_branch": "innovation", "timestamp": "@mcp:time"}
     ```
3. **Update Roadmap**: Link to impacted milestones in `roadmap.json`

## Exit & Auto-Chain

- **Success Metrics**: Prepend to `progress.json`[0]:
  ```json
  {"workflow": "optimize", "rl_reward": 20,
   "improvement_pct": 40, "timestamp": "@mcp:time"}
  ```
- **Update activeContext.json**: Prepend optimization event at [0]
- **Commit**: `@mcp:git` → "optimize: 40% performance gain"
- **Auto-Chain**: Resume `/next` (NO asking)
- **Follow-up**: Queue additional passes in `scratchpad.json` if needed

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/optimize.md`
