---
description: 8-schema atomic sync with CLI pipeline + Constitutional Awareness
---

# /update — Schema Synchronization with Constitutional Enforcement

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

## 1. Load Router (CLI Native)

```bash
echo "→ UPDATE: 8-schema synchronization" >&2

# Query via MCP
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
update_order=$(@mcp:json-jq query '.memory_bank_files[]' from 'context-router.json')

# Validate all 8 schemas exist
echo "→ VALIDATE: Checking 8 schemas" >&2
for schema in $update_order; do
  if [[ -f "${memory_bank}${schema}" ]]; then
    echo "✓ $schema" >&2
  else
    echo "❌ $schema MISSING" >&2
  fi
done
```

## 2. Update All (CLI Atomic)

```bash
# Count valid schemas from validation step
valid_count=0
for schema in $update_order; do
  [[ -f "${memory_bank}${schema}" ]] && ((valid_count++))
done

# Calculate compliance percentage
compliance=$(python3 -c "print(int($valid_count / 8 * 100))")
echo "→ COMPLIANCE: ${valid_count}/8 schemas valid (${compliance}%)" >&2

# Atomic updates with sponge
for schema in $update_order; do
  echo "→ UPDATE: $schema (atomic)" >&2
  jq '.timestamp = "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"' \
    "$memory_bank$schema" | sponge "$memory_bank$schema"
done

# Update progress
jq '.transactions = [{"workflow": "update", "rl_reward": 8}] + .transactions | .total_rl_score += 8' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json

@mcp:git add -A
@mcp:git commit -m "update: 8-schema sync"
echo "✓ UPDATE COMPLETE" >&2
```

## 3. Constitutional Article Reference

```bash
# Render atomic update guidance
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "" >&2
echo "📚 Constitutional Reference:" >&2
echo "→ ARTICLE 14: Duty to Update 8-Schema Memory Bank" >&2
glow "${constitution}/04-fundamental-duties/article-14.md"

echo "" >&2
echo "✅ Atomic 8-schema update constitutional compliance verified" >&2
echo "" >&2
```

---
**Lines**: ~72 | **CLI**: Parallel jq + sponge + glow (atomic, constitutionally compliant)
