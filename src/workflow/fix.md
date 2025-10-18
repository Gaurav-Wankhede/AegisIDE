---
description: HALT-FIX-VALIDATE with CLI transparency + Constitutional Awareness
---

# /fix — Remediation Loop with Constitutional Enforcement

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

## 1. Query Router & HALT via MCP

```bash
# Error handling
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ FIX: Zero-tolerance remediation" >&2

# Query via MCP (constitutional compliance)
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
penalty=$(@mcp:json-jq query '.rl_calculation.penalties.validation_failure' from 'context-router.json')

echo "→ ROUTER: Loaded via @mcp:json-jq" >&2

# HALT - atomic penalty
echo "→ PENALTY: $penalty RL" >&2
jq --argjson penalty $penalty \
  '.transactions = [{"workflow": "fix", "rl_penalty": $penalty}] + .transactions | .total_rl_score += $penalty' \
  "${memory_bank}progress.json" | sponge "${memory_bank}progress.json"
```

## 2. Fix Loop (Transparent)

1. `@mcp:context7` → Fetch remediation docs
2. `@mcp:sequential-thinking` → Plan fix
3. Apply fix (≤80 lines EMD)
4. `/validate` → Re-run (loop until clean)

## 3. Success & Commit via MCP

```bash
# Success - reward
echo "→ SUCCESS: Fix validated (+15 RL)" >&2
jq '.transactions = [{"workflow": "fix", "rl_reward": 15}] + .transactions | .total_rl_score += 15' \
  "${memory_bank}progress.json" | sponge "${memory_bank}progress.json"

# Store prevention pattern
jq --arg rule "Run /validate before commit" \
  '.patterns = [{"prevention_rule": $rule}] + .patterns | .patterns |= .[:100]' \
  "${memory_bank}systemPatterns.json" | sponge "${memory_bank}systemPatterns.json"

# Commit fix via MCP
@mcp:git add -A
@mcp:git commit -m "fix: Remediation complete - RL: +15"

echo "✓ FIX COMPLETE" >&2
```

## 4. Constitutional Article Guidance

```bash
# Render judicial guidance
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "" >&2
echo "📚 Constitutional Guidance for Error Resolution:" >&2
echo "→ ARTICLE 5: Right to Quality & Zero-Tolerance Validation" >&2
glow "${constitution}/03-fundamental-rights/article-5.md"

echo "" >&2
echo "✅ Constitutional framework enforced" >&2
echo "→ TIP: Run '/continue' or '/next' to proceed" >&2
echo "" >&2
exit 0
```

---
**Lines**: ~73 | **CLI**: jq + sponge + glow (atomic, constitutionally compliant)
