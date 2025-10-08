description: Continuous autonomous execution loop.
---

# /next – Continuous Task Execution

Canonical loop (mirrored under `.windsurf/workflow/next.md`) that keeps 0–98% autonomy running: read tasks, execute, validate, update memory bank, repeat until the backlog is clear.
Drain `scratchpad.json` and `kanban.json` continuously while enforcing constitutional rules and real-time schema updates.

## Constitutional Authority
- Article II – Autonomous decision making
- Article III / III-A – Context workflow + 8-schema updates

### Phase 1: Task Discovery & Prioritization
```bash
@mcp:filesystem → Read scratchpad.json (PARALLEL)
@mcp:filesystem → Read kanban.json (PARALLEL)
@mcp:time → Stamp discovery time in activeContext.json
@mcp:math → Rank tasks (P0>P1>P2>P3, todo/in_progress, dependencies clear)
@mcp:sequential-thinking → Build execution plan or recover mid-task state
```

### Phase 2: Context Assembly for Execution (8-Schema System)
```bash
# Create AegisKG snapshot via @mcp:git
@mcp:git → Stage memory-bank updates and commit "next: update 8-core schemas"
@mcp:time → Record update completion timestamp
```

### Phase 6 – 8-Schema Update (Mandatory, Blocking)
```bash
# Update ALL 8 essential schemas IMMEDIATELY after task completion:
# BLOCKS next task until complete 8-schema cycle finished

1. @mcp:filesystem → Update scratchpad.json:
2. @mcp:filesystem → Update activeContext.json:
3. @mcp:filesystem → Update kanban.json:
4. @mcp:filesystem → Update mistakes.json:
5. @mcp:filesystem → Update systemPatterns.json:
6. @mcp:filesystem → Update progress.json:
7. @mcp:filesystem → Update roadmap.json:
8. @mcp:filesystem → Update memory.json:
Validate ≤10KB each, then `@mcp:git` commit "next: update 8-core schemas" and log completion via `@mcp:time`

## 8-Schema Update Protocol
```bash
# Real-Time (EVERY task - MANDATORY):
All 8 essential schemas updated per Article III-A:
1. scratchpad.json – Remove completed tasks, refresh MCP validation state
2. activeContext.json – Update execution snapshot + `@mcp:time`
3. kanban.json – Move cards across columns
4. mistakes.json – Record patterns + `@mcp:time`
5. systemPatterns.json – Store architecture/implementation successes
6. progress.json – Refresh milestones, velocity metrics
7. roadmap.json – Confirm strategic alignment / dependencies
8. memory.json – Persist knowledge graph deltas (`@mcp:memory`)
Validate ≤10KB each, then `@mcp:git` commit "next: update 8-core schemas" and log completion via `@mcp:time`
- AegisKG knowledge graph integration

## Constitutional Compliance
```bash
# Tri-branch validation (when applicable):
Executive → Proposes implementation
Legislative → Challenges quality/approach
Judicial → Validates constitutional compliance

# Consensus requirement:
- 0-98% autonomy: Execute immediately
- 99% autonomy: Document + Execute
- 100% autonomy: Consult user

# Zero tolerance enforcement:
- NO errors/warnings before next task
- HALT-FIX-VALIDATE loop mandatory
- Constitutional violation = immediate correction
```

## Success Criteria
- ✅ Task completed with 100% validation pass
- ✅ All 8 essential schemas updated (≤10KB each)
- ✅ AegisKG knowledge patterns and cross-project intelligence stored via @mcp:memory
- ✅ Schema compliance verified against `.windsurf/memory-bank/schemas/`
 
- ✅ Ready for next task (continuous autonomous execution)

## Error Handling
```bash
IF validation fails:
  → INSTANT @mcp:context7 activation
  → Auto-fix using official docs
  → Re-validate until 100% clean
  → Update mistakes.json with pattern
  → ONLY THEN continue

IF attention budget exceeded:
  → Auto-compress low-signal content
  → Preserve critical patterns
  → Rebalance attention allocation
  → Continue execution

IF MCP failure:
  → Enable fallback protocols
  → Use native alternatives
  → Continue with reduced capability
  → Report MCP status
```

## Performance Metrics
```bash
# Track execution efficiency:
@mcp:math → Calculate:
- Tasks completed per session
- Average time per task
- Validation success rate
- Attention budget efficiency
- Context rot indicators

# Report periodically to progress.json
```

## Next Steps
Continuously loop through phases 2-8 until all pending tasks completed, maintaining 98% autonomous execution without interruption.
