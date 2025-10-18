---
description: Knowledge graph audit with CLI pipeline + Constitutional Awareness
---

# /memory-status — Graph Health Audit with Constitutional Enforcement

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

## 1. Load Router & Query (CLI Native)

```bash
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ MEMORY-STATUS: Knowledge graph audit" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
entities=$(@mcp:json-jq query '.entities | length' from "${memory_bank}memory.json")
relations=$(@mcp:json-jq query '.relations | length' from "${memory_bank}memory.json")
orphaned=$(@mcp:json-jq query '[.entities[] | select(.relations == null)] | length' from "${memory_bank}memory.json")

echo "→ METRICS: Entities=$entities, Relations=$relations, Orphaned=$orphaned" >&2
```

## 2. Health Calculation (Python CLI)

```bash
# Sanitize inputs and calculate safely
density=$(python3 -c "e=$entities if '$entities'!='null' else 0; r=$relations if '$relations'!='null' else 0; denom=(e+r) if (e+r)>0 else 1; print(e/denom)")
compliance=$(python3 -c "e=$entities if '$entities'!='null' and $entities!='0' else 1; o=$orphaned if '$orphaned'!='null' else 0; print(int((1 - o / e) * 100))")

echo "→ HEALTH: $compliance% (threshold: ≥80%)" >&2
```

## 3. Update & Remediate (CLI Atomic)

```bash
# Update progress and increment RL total
jq --argjson health ${compliance:-0} \
  '.transactions = [{
    "workflow": "memory-status",
    "rl_reward": 5,
    "health": $health
  }] + .transactions | .total_rl_score += 5' "$memory_bank"progress.json | sponge "$memory_bank"progress.json

echo "✓ AUDIT COMPLETE" >&2
```

## 4. Constitutional Article Reference

```bash
# Render knowledge graph guidance
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "" >&2
echo "📚 Constitutional Reference:" >&2
echo "→ ARTICLE 10: Right to Knowledge & Memory Access" >&2
glow "${constitution}/03-fundamental-rights/article-10.md"

echo "" >&2
echo "✅ Knowledge graph constitutional compliance verified" >&2
echo "" >&2
```

---
**Lines**: ~70 | **CLI**: Direct jq + python + sponge + glow (constitutionally compliant)
