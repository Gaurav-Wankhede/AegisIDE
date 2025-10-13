---
description: RL-tracked research dossier with free-tier optimization
location: {IDE}/workflow/research.md
---

# /research — MCP Intelligence Dossier

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
3. **RL Scoring**:
   - Complete with sources → +10 RL → `progress.json`[0]
   - Unverified sources → -15 RL → `mistakes.json`[0]
4. **Link to Kanban**: Attach references to relevant `kanban.json` tasks
5. **Queue Work**: IF implementation needed → Prepend to `scratchpad.json`[0]

## Exit & Auto-Chain

- **Success Metrics**: Prepend to `progress.json`[0]:
  ```json
  {"workflow": "research", "rl_reward": 10,
   "topic": "...", "sources_verified": 5, "timestamp": "@mcp:time"}
  ```
- **Risk Logging**: Document in `mistakes.json` if risks found
- **Commit**: `@mcp:git` → "research: [topic] dossier complete"
- **Auto-Chain**: Resume `/next` (NO asking)

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/research.md`
