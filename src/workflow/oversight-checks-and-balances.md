---
description: Parliamentary review with terminal jq
---

# /oversight-checks-and-balances — Parliamentary Review

## 1. Load Router & READ Proposal (Terminal jq)

```bash
# READ router config (jq terminal)
memory_bank=$(jq -r '.system_paths.memory_bank' context-router.json)
constitution=$(jq -r '.system_paths.constitution' context-router.json)
consensus_formula=$(jq -r '.rl_calculation.formula_patterns.consensus' context-router.json)

# READ proposal (jq terminal - FASTEST)
proposal=$(jq '.' "$memory_bank"systemPatterns.json)
```

## 2. Structured Debate

1. `@mcp:context7` → Load relevant articles (selective)
2. `@mcp:fetch` → Gather precedents if needed
3. `@mcp:memory` → Retrieve historical decisions
4. `@mcp:sequential-thinking` → Orchestrate debate (Government, Opposition, Judiciary)

## 3. Consensus Calculation & UPDATE (Terminal jq)

```bash
# Calculate with Python
consensus=$(python3 -c "exec_weight=0.3; admin_weight=0.3; opp_weight=0.3; jud_weight=0.1; print((exec*exec_weight) + (admin*admin_weight) + (opp*opp_weight) + (jud*jud_weight))")

# UPDATE based on consensus (jq terminal ONLY)
if (( $(echo "$consensus >= 0.95" | bc -l) )); then
  # Approved - UPDATE progress.json
  jq '.transactions = [{"workflow": "oversight", "rl_reward": 25, "consensus": '$consensus'}] + .transactions | .total_rl_score += 25' \
    "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
else
  # Rejected - UPDATE with penalty
  jq '.transactions = [{"workflow": "oversight", "rl_penalty": -20}] + .transactions | .total_rl_score += -20' \
    "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
  
  # Queue remediation in scratchpad
  jq --arg proposal "$proposal" '.priority_queue = [{"title": "Remediate: " + $proposal}] + .priority_queue' \
    "$memory_bank"scratchpad.json > temp.json && mv temp.json "$memory_bank"scratchpad.json
fi

git commit -m "oversight: consensus $consensus"
@mcp:memory store_verdict
```

**RL**: +25 consensus ≥95% | -20 fail

---
**Lines**: ~50 | **Pattern**: READ jq, UPDATE jq terminal
