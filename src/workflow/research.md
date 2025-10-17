---
description: Intelligence gathering with CLI pipeline
---

# /research — Intelligence Dossier

## 1. Load Router & Task (CLI Native)

```bash
echo "→ RESEARCH: Intelligence gathering" >&2

ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')

# Read task (direct jq)
task_title=$(jq -r '.priority_queue[0].title' "$memory_bank"scratchpad.json)
echo "→ TASK: $task_title" >&2
```

## 2. Research Chain (MCP + CLI)

1. `@mcp:context7` → Official docs
2. `@mcp:exa` → Research papers
3. `@mcp:fetch` → Benchmarks (free-tier)
4. `@mcp:memory` → Historical patterns
5. CLI pipeline for rendering

## 3. Analysis & Update (CLI Atomic)

```bash
# Compute metrics
performance=$(python3 -c "print(calculate_metrics())")
cost=$(python3 -c "print(estimate_costs())")

# Update systemPatterns (atomic with sponge)
echo "→ UPDATE: Research dossier to systemPatterns.json" >&2
jq --arg summary "..." --arg perf "$performance" \
  '.patterns = [{
    "executive_summary": $summary,
    "benchmarks": $perf,
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }] + .patterns | .patterns |= .[:100]' \
  "$memory_bank"systemPatterns.json | sponge "$memory_bank"systemPatterns.json

# Update progress (atomic)
jq '.transactions = [{"workflow": "research", "rl_reward": 10}] + .transactions | .total_rl_score += 10' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json

git commit -m "research: $task_title assessment"
echo "✓ RESEARCH COMPLETE" >&2
```

---
**Lines**: ~50 | **CLI**: jq + sponge + python
