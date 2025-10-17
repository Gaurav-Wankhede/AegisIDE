---
description: Parliamentary review with CLI pipeline
---

# /oversight — Parliamentary Review

## 1. Load Router & Proposal (CLI Native)

```bash
echo "→ OVERSIGHT: Parliamentary consensus calculation" >&2

ROUTER_JSON=$(cat context-router.json)
memory_bank=$(echo "$ROUTER_JSON" | jq -r '.system_paths.memory_bank')
constitution=$(echo "$ROUTER_JSON" | jq -r '.system_paths.constitution')

# Read proposal (direct jq)
proposal=$(jq '.' "$memory_bank"systemPatterns.json)
echo "→ PROPOSAL: Loaded for review" >&2
```

## 2. Structured Debate (MCP + glow)

1. `@mcp:context7` → Load relevant articles
2. `@mcp:sequential-thinking` → Orchestrate debate
3. `@mcp:memory` → Retrieve precedents
4. Render with glow for transparency

```bash
# Render constitutional guidance
echo "→ RENDER: Article 28 (Consensus Calculation)" >&2
cat "$constitution/06-parliament/article-28.md" | glow -
```

## 3. Consensus & Update (CLI Atomic)

```bash
# Calculate consensus (Python)
consensus=$(python3 -c "print((exec*0.3) + (admin*0.3) + (opp*0.3) + (jud*0.1))")
echo "→ CONSENSUS: $consensus (threshold: ≥0.95)" >&2

if (( $(echo "$consensus >= 0.95" | bc -l) )); then
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

git commit -m "oversight: consensus $consensus"
echo "✓ OVERSIGHT COMPLETE" >&2
```

---
**Lines**: ~50 | **CLI**: jq + python + glow + sponge
