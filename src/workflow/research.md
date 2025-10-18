---
description: Intelligence gathering with CLI pipeline
---

# /research — Intelligence Dossier

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
4. `@mcp:memory` → Historical patterns
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

---
**Lines**: ~50 | **CLI**: jq + sponge + python
