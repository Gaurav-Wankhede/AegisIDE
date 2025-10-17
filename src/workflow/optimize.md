---
description: RL-driven performance optimization with benchmarking
---

# /optimize — Performance Upgrade Loop

## RL-Driven Optimization

**Purpose**: Identify and apply performance improvements
**RL Reward**: +20 for successful optimization with measurable gains
**RL Penalty**: -25 if regression detected
**Benchmarking**: Mandatory before/after metrics

## MCP Chain (Query Router First)

1. **Load Router Config**:
   ```python
   ROUTER = @mcp:json-jq query '$' from 'context-router.json'
   rl_config = ROUTER['rl_calculation']
   penalty = rl_config['penalties']['validation_failure']  # -25
   reward = rl_config['rewards']['high_quality_code']  # +10 (or custom +20)
   ```
2. `@mcp:context7` → Fetch optimization best practices
3. `@mcp:fetch` → Gather industry benchmarks (free-tier focus)
4. `@mcp:memory` → Load historical patterns from knowledge graph
5. **Manual Function**: Python `eval()` → Capture baseline metrics:
   - Latency (ms)
   - Throughput (ops/sec)
   - Resource usage (CPU/memory)
6. `@mcp:sequential-thinking` → Plan optimization steps
7. `@mcp:filesystem` → Apply changes (files ≤80 lines, ≤10KB per EMD from router)
8. **Manual Function**: Terminal `date '+%Y-%m-%dT%H:%M:%S%z'` → Timestamp pre/post runs
9. **Run Benchmarks** (SafeToAutoRun=true)
10. **Manual Function**: Python `eval()` → Compare results
11. IF regression → HALT + penalty from router + rollback
12. IF improvement → reward from router
13. `@mcp:filesystem` → Validate schemas from router paths
14. `@mcp:git` → Commit "optimize: [improvement%]"
15. `@mcp:memory` → Store optimization pattern

## Actions & Pattern Learning

1. **Optimization Pattern**: Prepend to `systemPatterns.json`[0]:
   ```json
   {"pattern_id": "optimize_X", "type": "performance",
    "before_metrics": {"latency_ms": 100},
    "after_metrics": {"latency_ms": 60},
    "improvement_pct": 40, "rl_reward": 20,
    "confidence_score": 0.95, "reuse_count": 0}
   ```
2. **RL Scoring** (Single Source):
   - Improvement ≥20% → `progress.json[0]`: +20 RL, update `total_rl_score`
   - Regression → `progress.json[0]`: -25 RL penalty + rollback
   - Regression details → `mistakes.json[0]`: penalty transaction
   ```json
   {"tx_id": "...", "timestamp": "@mcp:time",
    "category": "optimization", "reward": 20,
    "description": "40% performance gain in [metric]",
    "gae_advantage": 0.82, "kl_divergence": 0.005}
   ```
3. **Update Roadmap**: Link to impacted milestones in `roadmap.json`

## Exit & Auto-Chain

- **Success Metrics** (Single Source RL):
  - `progress.json[0]` transaction: +20 RL, update `total_rl_score`
  ```json
  {"tx_id": "...", "timestamp": "@mcp:time",
   "category": "optimization", "reward": 20,
   "description": "40% improvement via [optimization]"}
  ```
- **Update activeContext.json**: Prepend optimization event at [0]
- **Commit**: `@mcp:git` → "optimize: 40% performance gain"
- **Auto-Chain**: Resume `/next` (NO asking)
- **Follow-up**: Queue additional passes in `scratchpad.json` if needed

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/optimize.md`
