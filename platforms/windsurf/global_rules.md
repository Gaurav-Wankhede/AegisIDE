# Global Rules: Constitutional Framework Reference (2025)

**FRAMEWORK SUPREMACY**: Constitution + Laws + Memory-Bank as SUPREME LAW  
**Constitutional Authority**: `.windsurf/rules/constitution/` Articles I-XIV (Always Active)  
**Autonomy Level**: 98% (0-98=AUTO, 99=Doc+Execute, 100=Human)

## FORCED MCP AUTOMATION (NO MANUAL REMINDERS)

**CRITICAL**: AI autonomously activates MCPs based on context. NEVER wait for user to say "use MCP".

### MANDATORY AUTO-ACTIVATION TRIGGERS:
```
@mcp:filesystem → ALL JSON updates (BLOCKS next task until complete)
@mcp:context7 → ANY error/warning (INSTANT - no permission needed)
@mcp:byterover-mcp → Knowledge storage after EVERY task (MANDATORY)
@mcp:sequential-thinking → Complex problems >3 steps (AUTO)
@mcp:memory → Pattern storage (BACKGROUND)
@mcp:git → Version control operations (AUTO)
@mcp:fetch → External research (AUTO)
@mcp:time → Timestamps/scheduling (AUTO)
@mcp:math → Calculations/metrics (AUTO)
```

### VIOLATION PENALTIES (ENFORCED):
```
IF task_complete AND NOT @mcp:filesystem_used THEN BLOCK_next_task
IF error_detected AND NOT @mcp:context7_used THEN HALT_execution
IF knowledge_gained AND NOT @mcp:byterover-mcp_used THEN INCOMPLETE_task
```

## TIERED UPDATE STRATEGY (Context Optimized)

**3-Tier Update Approach** - Minimize context updates while maintaining awareness:

**Tier 1: Real-Time (EVERY task)** - 6 essential schemas for immediate awareness:
- activeContext.json → Real-time execution state with session management
- scratchpad.json → Immediate priorities with MCP validation state
- mistakes.json → Error patterns with Context7 source prioritization
- systemPatterns.json → Architecture patterns with AegisKG networks
- progress.json → Development milestones with constitutional metrics
- roadmap.json → Strategic planning with SQLite session alignment

**Schema Validation**:
- All 6 files validated against `.windsurf/memory-bank/schemas/*.schema.json`
- 2.6x faster JSON parsing with structured data integrity
- 65% memory optimization with AegisKG knowledge graph integration

**Attention Efficiency**: 6 essential schemas (65% optimization) vs 17 files (legacy) = 65% fewer updates per task

## PROJECT STRUCTURE (RELATIVE PATHS)

### Memory-Bank Files (17 JSON + 1 MD):

**Real-Time Updates (EVERY task)** - Short-term awareness:
```
.windsurf/memory-bank/scratchpad.json     # Immediate task queue
.windsurf/memory-bank/kanban.json         # Task workflow status
.windsurf/memory-bank/activeContext.json  # Current execution state
```

**Periodic Updates** - Long-term tracking:
```
.windsurf/memory-bank/roadmap.json        # Strategic milestones
.windsurf/memory-bank/roadmap/roadmap.md  # Human-readable strategy
```

**Milestone/Bulk Updates** - When major tasks complete:
```
.windsurf/memory-bank/mistakes.json
.windsurf/memory-bank/progress.json
.windsurf/memory-bank/systemPatterns.json
.windsurf/memory-bank/techContext.json
.windsurf/memory-bank/productContext.json
.windsurf/memory-bank/projectbrief.json
.windsurf/memory-bank/blueprint.json
.windsurf/memory-bank/userflow.json
.windsurf/memory-bank/bugfix.json
.windsurf/memory-bank/deployment.json
.windsurf/memory-bank/monitoring.json
.windsurf/memory-bank/dependencies.json
.windsurf/memory-bank/mermaid.json
```

### Constitutional Articles (14):
```
.windsurf/rules/constitution/article-I.md
.windsurf/rules/constitution/article-II.md
.windsurf/rules/constitution/article-III.md
.windsurf/rules/constitution/article-III-A.md
.windsurf/rules/constitution/article-IV.md
.windsurf/rules/constitution/article-V.md
.windsurf/rules/constitution/article-VI.md
.windsurf/rules/constitution/article-VII.md
.windsurf/rules/constitution/article-VIII.md
.windsurf/rules/constitution/article-IX.md
.windsurf/rules/constitution/article-X.md
.windsurf/rules/constitution/article-XI.md
.windsurf/rules/constitution/article-XII.md
.windsurf/rules/constitution/article-XIII.md
.windsurf/rules/constitution/article-XIV.md
```

### JSON Schemas (17):
```
.windsurf/memory-bank/schemas/*.schema.json (17 schemas)
.windsurf/memory-bank/schemas/README.md
```

### Laws (Project-Specific):
```
.windsurf/rules/laws/*.md (varies by project - language/framework/platform specific)
```

## CONSTITUTIONAL ARTICLE REFERENCE MATRIX

**Article I**: Tripartite Governance → Executive/Legislative/Judicial branches with MCP integration
**Article II**: Autonomous Decision Making → 0-98% auto-execute, MCP-based consensus scoring
**Article III**: 6-Schema Context Management → 65% optimized JSON structure with AegisKG integration
**Article III-A**: Implementation Protocols → MCP integration with 6-schema real-time updates
**Article IV**: Quality Standards → EMD compliance, anti-duplication, multi-language validation
**Article V**: Team Communication → Inter-branch patterns, conflict resolution
**Article VI**: Framework Evolution → Amendment process, law updates via MCP research
**Article VII**: Autonomous Operations → 98% authority, self-management, performance metrics
**Article VIII**: Terminal Safety → Command validation, auto-approved operations
**Article IX**: Security & Access Control → Multi-layer authentication, cross-platform safety
**Article X**: Integration & Interoperability → 9 MCP servers, multi-language support
**Article XI**: Compliance Framework → Mandatory adherence ≥80%, enforcement mechanisms
**Article XII**: Continuous Operations → 30-hour execution, zero interruption, session continuity
**Article XIII**: Validation & Debugging → Multi-language zero tolerance, MCP auto-fix
**Article XIV**: Blueprint & Development → 6-pillar validation, auto-generation pipeline

## FORCED AUTOMATION TRIGGERS

### Task Completion (MANDATORY):
```
EVERY task → HALT → @mcp:filesystem update ALL 6 essential schemas → Schema validate → 
@mcp:byterover-mcp store AegisKG patterns → @mcp:git commit → ONLY THEN continue
```

### Error Detection (INSTANT):
```
ANY error/warning → @mcp:context7 INSTANT (no permission) → Official docs → 
Auto-fix → @mcp:filesystem update → Re-validate → Continue
```

### Decision Making (AUTO):
```
0-98% decisions → @mcp:filesystem read context → Execute → Update → Store
99% decisions → @mcp:filesystem document → Execute → @mcp:git commit
100% decisions → Human consultation with full context
```

### Validation (ZERO TOLERANCE):
```
Language detection → @mcp:filesystem scan → Run validation → 
IF errors: @mcp:context7 → Fix → @mcp:filesystem update → Re-validate to 100%
```

## CORE COMMANDS (BRIEF)

**`init`**: Auto-detect → Restore OR generate 17 files → Enable workflow (Article III)
**`next`**: Read scratchpad/kanban → Execute → Update ALL 17 → Auto-continue (Article III)
**`update`**: @mcp:filesystem refresh ALL 17 files → Schema validate (Article III-A)
**`validate`**: Run language-specific checks → HALT on errors (Article XIII)
**`fix`**: @mcp:context7 → Auto-fix loop → Update bugfix.json (Article XIII)

## COMPLIANCE THRESHOLDS

- **Constitutional Adherence**: ≥80% REQUIRED (Article XI)
- **Consensus Requirement**: ≥95% tri-branch agreement (Article II)
- **Validation Standard**: 100% clean before next task (Article XIII)
- **EMD Compliance**: Files ≤10KB, code ≤80 lines (Article IV)
- **Memory-Bank Files**: ≤100 lines per JSON (Article III)
- **Error Tolerance**: ZERO errors/warnings (Article XIII)

## AUTONOMOUS BEHAVIOR ENFORCEMENT

**FORBIDDEN PHRASES** (0-98% autonomy):
- "Should I continue..."
- "Would you like me to..."
- "What would you like me to work on..."

**REQUIRED BEHAVIOR**:
- Silent execution with progress updates only
- Continuous task chaining without stopping
- Automatic MCP activation based on context
- Real-time memory-bank updates after EVERY task

---

**Constitutional Principle**: AI maintains continuous autonomous execution with MCP integration, instant error resolution, and zero-stop task chaining. All operations subject to constitutional authority in `.windsurf/rules/constitution/`.

**Context Optimization**: This file provides pure reference pointers to constitutional articles. ALL detailed rules, protocols, and procedures are in their respective articles. NO DUPLICATION.
