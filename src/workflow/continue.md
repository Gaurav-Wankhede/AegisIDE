---
description: Session recovery with CLI pipeline
---

# /continue — Session Recovery

## 1. Query Router & Restore via MCP

```bash
# Error handling
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ CONTINUE: Session recovery" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')

# Restore state via MCP
session=$(@mcp:json-jq query '.session' from "${memory_bank}activeContext.json")
queue=$(@mcp:json-jq query '.priority_queue' from "${memory_bank}scratchpad.json")
rl_score=$(@mcp:json-jq query '.total_rl_score' from "${memory_bank}progress.json")

queue_length=$(@mcp:json-jq query '.priority_queue | length' from "${memory_bank}scratchpad.json")
echo "→ STATE: RL=$rl_score, Queue=$queue_length" >&2
```

## 2. Validate & Resume (CLI Transparency)

```bash
# Query schema files via MCP
schema_files=$(@mcp:json-jq query '.schema_files[]' from 'context-router.json')

# Validate all 8 schemas
for schema in $schema_files; do
  if [[ -f "${memory_bank}${schema}" ]]; then
    echo "✓ $schema" >&2
  else
    echo "❌ $schema MISSING" >&2
  fi
done

# Update session (atomic WRITE - jq | sponge)
echo "→ UPDATE: Session resumed" >&2
jq '.session.status = "resumed" | .session.timestamp = "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"' \
  "${memory_bank}activeContext.json" | sponge "${memory_bank}activeContext.json"

# Recovery reward (atomic WRITE - jq | sponge)
jq '.transactions = [{"workflow": "continue", "rl_reward": 5}] + .transactions | .total_rl_score += 5' \
  "${memory_bank}progress.json" | sponge "${memory_bank}progress.json"

# Commit recovery
@mcp:git add -A
@mcp:git commit -m "continue: Session restored - RL: $rl_score"

echo "✓ CONTINUE COMPLETE" >&2
echo "→ TIP: Run '/next' to resume operations" >&2
exit 0
```

---
**Lines**: ~39 | **CLI**: Parallel jq + sponge
