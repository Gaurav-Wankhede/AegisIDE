---
description: Continuously execute tasks from scratchpad.json and kanban.json with real-time updates and parallel execution
---

# /next - Continuous Autonomous Task Execution

## Purpose
Read scratchpad.json and kanban.json in parallel, execute implementation tasks, and update status in real-time while maintaining constitutional compliance.

## Constitutional Authority
- **Article II**: Autonomous Decision Making - 0-98% autonomy execution
- **Article III**: Context-Engineered Development Workflow - Continuous task chaining
- **Article III-A**: Implementation Protocols - Real-time updates (Tier 1)

## Workflow Sequence

### Preflight Awareness (MANDATORY)
```bash
# Constitutional awareness:
@mcp:filesystem → Read .windsurf/rules/constitution/article-I.md … article-XIV.md

# JSON schema awareness (bootstrap if missing):
@mcp:filesystem → Ensure .windsurf/memory-bank/ exists
for FILE in [activeContext.json, scratchpad.json, kanban.json, systemPatterns.json, mistakes.json, roadmap.json] do
  IF missing → create minimal JSON {}
  → validate against .windsurf/memory-bank/schemas/* corresponding schema
done

# MCP awareness:
Verify presence/health of: context7, fetch, filesystem, git, memory, byterover-mcp, sequential-thinking, time, math
```

### Phase 1: Parallel Task Discovery
```bash
# Read both task sources simultaneously:
@mcp:filesystem → Read scratchpad.json (PARALLEL)
@mcp:filesystem → Read kanban.json (PARALLEL)

# Merge and prioritize tasks:
- Priority: P0 (blocking) → P1 (critical) → P2 (major) → P3 (minor)
- Status filter: todo, in_progress (exclude done, approved)
- Dependency resolution: Check prerequisites completed
```

### Phase 2: Context Assembly for Execution (7-Schema System)
```bash
# Dynamic context loading with attention allocation:
@mcp:math → Calculate attention budget usage
@mcp:filesystem → Read scratchpad.json (30% attention - CORE)
@mcp:filesystem → Read activeContext.json (25% attention - CORE)
@mcp:filesystem → Read kanban.json (15% attention - HIGH)
@mcp:filesystem → Read mistakes.json (15% attention - HIGH)
@mcp:filesystem → Read systemPatterns.json (7% attention - REFERENCE)
@mcp:filesystem → Read progress.json (5% attention - SUPPORTING)
@mcp:filesystem → Read roadmap.json (3% attention - STRATEGIC)
@mcp:memory → Retrieve AegisKG patterns for task type

# Task-specific prioritization:
# If error resolution: mistakes.json priority with Context7 source prioritization
# If new feature: roadmap.json + systemPatterns.json with AegisKG patterns
# If optimization: progress.json + systemPatterns.json analysis
```

### Phase 3: Pre-Implementation Validation
```bash
# MANDATORY checks before execution:
1. Detect project language/framework
2. Run language-specific validation:
   - Rust: cargo check
   - TypeScript: pnpm typecheck
   - Python: basedpyright .
   - Go: go build ./...
   (See Article XIII for complete matrix)

3. HALT if errors/warnings detected:
   → @mcp:context7 INSTANT activation
   → Auto-fix using official docs
   → Re-validate until 100% clean

4. Verify roadmap alignment
5. Check anti-duplication (scan centralized configs)
```

### Phase 4: Executive Implementation
```bash
# Execute task with full MCP integration:
@mcp:sequential-thinking → Break complex tasks into steps
@mcp:filesystem → Implement code changes
@mcp:git → Track changes with version control

# During implementation:
- Monitor attention budget (prevent n² degradation)
- Maintain EMD compliance (≤80 lines per file)
- Apply ZUV principle (all variables used meaningfully)
- Follow project-specific laws
```

### Phase 5: 7-Schema Real-Time Updates (MANDATORY - BLOCKING)
```bash
# Update ALL 7 essential schemas IMMEDIATELY after task completion:
# BLOCKS next task until complete 7-schema cycle finished

1. @mcp:filesystem → Update scratchpad.json:
   - Remove completed task
   - Add next priority tasks
   - Update MCP validation state

2. @mcp:filesystem → Update activeContext.json:
   - Real-time execution state with session management
   - Recent changes summary

3. @mcp:filesystem → Update mistakes.json:
   - Error patterns with Context7 source prioritization
   - Predictive analytics for prevention
   - Anti-hallucination metrics

4. @mcp:filesystem → Update systemPatterns.json:
   - Architecture patterns with AegisKG networks
   - MCP-enriched documentation links
   - Success pattern storage

5. @mcp:filesystem → Update progress.json:
   - Development milestones with constitutional metrics
   - AegisKG progress correlation
   - Performance tracking

6. @mcp:filesystem → Update roadmap.json:
   - Strategic planning alignment
   - Milestone dependencies
   - Client requirements validation

# Verify schema compliance for all 7 files (≤10KB each)
# Create AegisKG snapshot via @mcp:git
```

### Phase 6: Post-Implementation Validation
```bash
# MANDATORY validation before proceeding:
1. Run full validation suite
2. IF errors → HALT:
   → @mcp:context7 → Official docs
   → Fix immediately
   → Re-validate to 100%
3. ONLY continue after clean validation
```

### Phase 7: Knowledge Storage (MANDATORY)
```bash
# Store patterns for future use:
@mcp:byterover-mcp → Store implementation patterns
@mcp:memory → Update local knowledge graph

# Document successful approaches:
- Update systemPatterns.json (background)
- Record lessons learned
```

### Phase 8: Auto-Continue Loop
```bash
# NEVER STOP after one task (0-98% autonomy):
IF scratchpad.json has pending tasks:
  → Load next task
  → REPEAT from Phase 2
  → Continue until scratchpad empty

IF kanban.json has todo items:
  → Load next item
  → REPEAT from Phase 2
  → Continue autonomous execution

IF no pending tasks:
  → Report completion summary
  → Monitor for new tasks
  → Maintain session readiness
```

## Parallel Execution Optimization
```bash
# Read operations (safe to parallelize):
@mcp:filesystem → Read scratchpad.json & kanban.json (PARALLEL)
@mcp:filesystem → Read multiple context files (PARALLEL)
@mcp:memory + @mcp:byterover-mcp → Pattern retrieval (PARALLEL)

# Write operations (MUST be sequential):
@mcp:filesystem → Update scratchpad.json
  ↓
@mcp:filesystem → Update kanban.json
  ↓
@mcp:filesystem → Update activeContext.json
  ↓
Validate all updates complete before next task
```

## 7-Schema Update Protocol (59% Optimized)
```bash
# Real-Time (EVERY task - MANDATORY):
All 7 essential schemas updated per Article III-A:
1. scratchpad.json → Task priorities with MCP validation
2. activeContext.json → Execution state with session management
3. kanban.json → Task workflow and parliamentary approval
4. mistakes.json → Error patterns with Context7 prioritization
5. systemPatterns.json → Architecture with AegisKG networks
6. progress.json → Milestones with constitutional metrics
7. roadmap.json → Strategic planning alignment

# Performance Benefits:
- 2.6x faster JSON parsing
- 65% memory optimization
- AegisKG knowledge graph integration
```

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
- ✅ All 7 essential schemas updated (≤10KB each)
- ✅ AegisKG knowledge patterns stored via @mcp:memory
- ✅ Cross-project intelligence via @mcp:byterover-mcp
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
