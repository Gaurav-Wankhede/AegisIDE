---
description: RL-tracked tri-branch parliamentary review
---

# /oversight-checks-and-balances — Parliamentary Review

## RL-Driven Democratic Governance

**Purpose**: Tri-branch approval for major decisions
**RL Reward**: +25 if consensus ≥95%
**RL Penalty**: -20 if consensus fails (<95%)
**Required**: Constitutional citations, MCP trails, memory-bank updates

## MCP Chain (Democratic Process)

1. `@mcp:filesystem` → Read proposal from `systemPatterns.json`
2. `@mcp:context7` → Load relevant constitutional articles (selective)
3. IF precedents needed → `@mcp:fetch` → Gather external advisories
4. `@mcp:memory` → Retrieve historical decisions
5. `@mcp:sequential-thinking` → Orchestrate debate:
   - Government (PM): Present proposal
   - Opposition (Shadow Cabinet): Challenge evidence
   - Judiciary (Chief Justice): Constitutional review
6. `@mcp:math` → Calculate weighted consensus:
   - Technical expertise weight: 30%
   - Strategic alignment weight: 40%
   - Quality assurance weight: 30%
   - Required: ≥95% for approval
7. `@mcp:time` → Timestamp all stages
8. `@mcp:git` → Commit debate artifacts

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
