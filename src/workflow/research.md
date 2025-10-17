---
description: RL-tracked research dossier with free-tier optimization
---

# /research — MCP Intelligence Dossier

## PRE-FLIGHT (Load Summaries Only)
```python
# Load brief summaries, NOT full content
next_task_title = @mcp:filesystem read scratchpad.json[0].title
last_10_summaries = @mcp:filesystem read activeContext.json[0].task_history[-10:]
activeContext[0].operation_counter += 1
# Total: ~500 tokens vs 5000+ tokens
```

## RL-Driven Research

**Purpose**: Gather official docs + benchmarks for decision-making
**RL Reward**: +10 for complete dossier with benchmarks
**RL Penalty**: -15 if sources unverified
**Free-Tier Focus**: Prioritize low-cost, lightweight solutions

## MCP Chain (Intelligence Gathering)

1. `@mcp:context7` → Fetch official documentation for topic (resolve-library-id first)
2. `@mcp:exa` → Latest research papers, cutting-edge techniques (get_code_context_exa)
3. `@mcp:fetch` → Gather benchmarks, pricing (free-tier priority)
4. `@mcp:memory` → Retrieve historical research patterns
5. `@mcp:sequential-thinking` → Structure analysis, synthesize findings
6. `@mcp:math` → Compute:
   - Performance curves
   - Cost projections (free-tier focus)
   - ROI estimates
7. `@mcp:filesystem` → Write dossier to `systemPatterns.json` with:
   - Executive summary
   - Benchmarks (before/after)
   - Resource footprint
   - Security assessment
   - MCP evidence trail
8. `@mcp:time` → Timestamp research completion
9. `@mcp:filesystem` → Validate schemas
10. `@mcp:git` → Commit "research: [topic] assessment"
11. `@mcp:memory` → Store findings in knowledge graph

## Actions & RL Logging

1. **Research Summary**: Prepend to `activeContext.json`[0]:
   ```json
   {"event": "research_complete", "topic": "...",
    "recommendation": "...", "cost_tier": "free",
    "performance_score": 85, "rl_reward": 10, "timestamp": "..."}
   ```
2. **Dossier Storage**: Prepend to `systemPatterns.json`[0] with full analysis
3. **RL Scoring** (Single Source - STRICT Solution Required):
   - **Research alone** → `progress.json[0]`: +2 RL (minimal acknowledgment)
   - **Research + partial** → `progress.json[0]`: +5 RL
   - **Research + complete solution** → `progress.json[0]`: +20-50 RL (TARGET)
   - **Research without implementation** → `progress.json[0]`: -10 RL (bogus workflow)
   - Unverified sources → `mistakes.json[0]` penalty transaction + `progress.json[0]`: -15 RL
   - **Note**: Only `progress.json` updates `total_rl_score`
4. **Link to Kanban**: Attach references to relevant `kanban.json` tasks
5. **MANDATORY: Implement Solution**:
   - Research MUST lead to actual implementation
   - Create task in `scratchpad.json`[0] AND execute immediately
   - No stopping at research phase (bogus workflow)
   - Solution implementation = where real RL rewards come from

## Exit & Auto-Chain

- **Success Metrics** (Single Source RL):
  - `progress.json[0]` transaction: reward based on implementation
  ```json
  {"tx_id": "...", "timestamp": "@mcp:time",
   "category": "research_and_implementation",
   "reward": 20-50, "description": "Researched [topic] + implemented solution"}
  ```
- **Risk Logging**: Document in `mistakes.json` if risks found
- **Commit**: `@mcp:git` → "research: [topic] dossier complete"
- **Auto-Chain**: Resume `/next` (NO asking)

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/research.md`
