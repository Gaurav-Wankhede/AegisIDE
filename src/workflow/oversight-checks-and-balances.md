---
description: Tri-branch parliamentary review
---

# /oversight-checks-and-balances — Parliamentary Review

## 1. Load Router & Proposal

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']
constitution = ROUTER['system_paths']['constitution']
consensus_formula = ROUTER['rl_calculation']['formula_patterns']['consensus']

# Query proposal
proposal = @mcp:json-jq query '$' from f"{memory_bank}systemPatterns.json"
```

## 2. Structured Debate

1. `@mcp:context7` → Load relevant constitutional articles (selective)
2. `@mcp:fetch` → Gather precedents if needed
3. `@mcp:memory` → Retrieve historical decisions
4. `@mcp:sequential-thinking` → Orchestrate debate:
   - Government (PM): Present proposal
   - Opposition (Shadow): Challenge evidence
   - Judiciary (Chief Justice): Constitutional review

## 3. Consensus Calculation

```python
# Python eval() using consensus_formula
consensus = (exec*0.3) + (admin*0.3) + (opp*0.3) + (jud*0.1)

if consensus >= 0.95:
    approved → +25 RL
else:
    rejected → -20 RL → queue remediation
```

## 4. Store & Commit

1. Terminal `date` → Timestamp stages
2. `@mcp:git` → Commit debate artifacts
3. `@mcp:memory` → Store verdict

**RL**: +25 consensus ≥95% | -20 fail

---
**Lines**: ~55 | **Required**: ≥95% approval
