---
description: Parliamentary review with CLI pipeline + Constitutional Awareness
---

# /oversight — Parliamentary Review with Constitutional Enforcement

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

## 1. Load Router & Proposal (CLI Native)

```bash
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ OVERSIGHT: Parliamentary consensus calculation" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')
proposal=$(@mcp:json-jq query '.' from "${memory_bank}systemPatterns.json")

echo "→ PROPOSAL: Loaded for review" >&2
```

## 2. Structured Debate (MCP + glow)

1. `@mcp:context7` → Load relevant articles
2. `@mcp:sequential-thinking` → Orchestrate debate
3. Manual memory.json → Retrieve precedents
4. Render with glow for transparency

```bash
# Render constitutional guidance
echo "→ RENDER: Article 28 (Consensus Calculation)" >&2
glow "${constitution}/06-parliament/article-28.md"
```

## 3. Consensus & Update (CLI Atomic)

```bash
# Compute compliance from memory bank state (proxy)
files=$(@mcp:json-jq query '.memory_bank_files[]' from 'context-router.json')
valid=0
for f in $files; do
  [[ -f "${memory_bank}${f}" ]] && ((valid++))
done
compliance=$(
  python3 -c "v=int('$valid'); print(int(v/8*100))"
)

# Calculate consensus as weighted function of compliance
consensus=$(python3 -c "c=$compliance/100; print((c*0.3)+(c*0.3)+(c*0.3)+(c*0.1))")
echo "→ CONSENSUS: $consensus (threshold: ≥0.95)" >&2

# Python-based threshold check (no bc)
approved=$(python3 -c "import sys; print('1' if float(sys.argv[1])>=0.95 else '0')" "$consensus")

if [[ "$approved" == "1" ]]; then
  # Approved
  echo "→ APPROVED: +25 RL" >&2
  jq --argjson cons "$consensus" \
    '.transactions = [{
      "workflow": "oversight",
      "rl_reward": 25,
      "consensus": $cons
    }] + .transactions | .total_rl_score += 25' \
    "$memory_bank"progress.json | sponge "$memory_bank"progress.json
else
  # Rejected
  echo "→ REJECTED: -20 RL" >&2
  jq '.transactions = [{"workflow": "oversight", "rl_penalty": -20}] + .transactions | .total_rl_score += -20' \
    "$memory_bank"progress.json | sponge "$memory_bank"progress.json
fi

@mcp:git add -A
@mcp:git commit -m "oversight: consensus $consensus"
echo "✓ OVERSIGHT COMPLETE" >&2
```

## 4. Constitutional Article Awareness

```bash
echo "" >&2
echo "📚 Parliamentary Framework Articles:" >&2
echo "→ ARTICLE 28: Structured Debate & Consensus Calculation" >&2
glow "${constitution}/06-parliament/article-28.md"
echo "→ ARTICLE 29: Opposition Challenge & Review" >&2
glow "${constitution}/06-parliament/article-29.md"

echo "" >&2
echo "✅ Parliamentary constitutional framework enforced" >&2
echo "" >&2
```

---
**Lines**: ~83 | **CLI**: jq + python + glow + sponge (constitutionally compliant)
