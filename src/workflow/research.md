---
description: Intelligence dossier with terminal jq
---

# /research — Intelligence Gathering

## 1. Load Router & READ Task (Terminal jq)

```bash
# READ router config
memory_bank=$(jq -r '.system_paths.memory_bank' context-router.json)

# READ task (jq terminal - FASTEST)
task_title=$(jq -r '.priority_queue[0].title' "$memory_bank"scratchpad.json)
```

## 2. Research Chain

1. `@mcp:context7` → Official docs (resolve-library-id first)
2. `@mcp:exa` → Research papers, cutting-edge techniques
3. `@mcp:fetch` → Benchmarks, pricing (free-tier priority)
4. `@mcp:memory` → Retrieve historical patterns
5. `@mcp:sequential-thinking` → Structure analysis

## 3. Analysis & UPDATE (Terminal jq)

```bash
# Compute metrics
performance=$(python3 -c "print(calculate_metrics())")
cost=$(python3 -c "print(estimate_costs())")

# UPDATE systemPatterns.json with jq terminal (NOT @mcp:filesystem)
jq --argjson dossier '{
  "executive_summary": "...",
  "benchmarks": '$performance',
  "resource_footprint": '$cost'
}' '.patterns = [$dossier] + .patterns | .patterns |= .[:100]' \
  "$memory_bank"systemPatterns.json > temp.json && mv temp.json "$memory_bank"systemPatterns.json

# UPDATE progress.json
jq '.transactions = [{"workflow": "research", "rl_reward": 10}] + .transactions | .total_rl_score += 10' \
  "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json

git commit -m "research: $task_title assessment"
```

**RL**: +10 complete | -15 unverified

---
**Lines**: ~53 | **Pattern**: READ with jq, UPDATE with jq terminal
