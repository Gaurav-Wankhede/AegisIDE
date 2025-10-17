---
description: RL-tracked tri-branch parliamentary review
---

# /oversight-checks-and-balances — Parliamentary Review

## RL-Driven Democratic Governance

**Purpose**: Tri-branch approval for major decisions
**RL Reward**: +25 if consensus ≥95%
**RL Penalty**: -20 if consensus fails (<95%)
**Required**: Constitutional citations, MCP trails, memory-bank updates

## MCP Chain (Query Router First)

1. **Load Router Config**:
   ```python
   ROUTER = @mcp:json-jq query '$' from 'context-router.json'
   memory_bank = ROUTER['system_paths']['memory_bank']
   constitution = ROUTER['system_paths']['constitution']
   rl_config = ROUTER['rl_calculation']
   consensus_formula = rl_config['formula_patterns']['consensus']
   ```
2. `@mcp:json-jq` → Query proposal from `systemPatterns.json` at `memory_bank`
3. `@mcp:context7` → Load relevant constitutional articles from `constitution` (selective)
4. IF precedents needed → `@mcp:fetch` → Gather external advisories
5. `@mcp:memory` → Retrieve historical decisions
6. `@mcp:sequential-thinking` → Orchestrate debate:
   - Government (PM): Present proposal
   - Opposition (Shadow Cabinet): Challenge evidence
   - Judiciary (Chief Justice): Constitutional review
7. **Manual Function**: Python `eval()` → Calculate weighted consensus using `consensus_formula`:
   - Executive weight: 30%
   - Administrative weight: 30%
   - Opposition weight: 30%
   - Judicial weight: 10%
   - Required: ≥95% for approval
8. **Manual Function**: Terminal `date '+%Y-%m-%dT%H:%M:%S%z'` → Timestamp all stages
9. `@mcp:git` → Commit debate artifacts

## Actions & RL Logging

1. **Debate Record**: Prepend to `activeContext.json`[0]:
   ```json
   {"event": "parliamentary_review", "proposal_id": "...",
    "consensus_score": 96, "ruling": "approved",
    "rl_reward": 25, "timestamp": "..."}
   ```
2. **Consensus RL Scoring** (Single Source):
   - ≥95% consensus → `progress.json[0]`: +25 RL, update `total_rl_score`
   - <95% failed → `progress.json[0]`: -20 RL penalty
   - Failure details → `mistakes.json[0]`: penalty transaction with remediation
3. **IF Rejected**: Queue remediation in `scratchpad.json`[0]
4. **Store Verdict**: `@mcp:memory` → Knowledge graph

## Exit & Auto-Chain

- **Success Metrics** (Single Source RL):
  - `progress.json[0]` transaction: +25 RL, update `total_rl_score`
  ```json
  {"tx_id": "...", "timestamp": "@mcp:time",
   "category": "parliamentary_review", "reward": 25,
   "description": "Consensus: 96%, proposal approved"}
  ```
- **Debate Patterns**: Store in `systemPatterns.json` for future reference
- **Commit**: `@mcp:git` → "oversight: [ruling] with [consensus%]"
- **Auto-Chain**:
  - IF approved → Resume `/next`
  - IF rejected → Trigger `/fix` with remediation

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/oversight-checks-and-balances.md`
