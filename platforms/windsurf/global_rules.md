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

**Tier 1: Core Execution Set (EVERY task)**
- `activeContext.json` → Real-time execution state with session management
- `scratchpad.json` → Immediate priorities with MCP validation state
- `kanban.json` → Workflow orchestration, parliamentary approvals, WIP limits

**Tier 2: Insight Loop (Iteration boundary or substantial change)**
- `mistakes.json` → Error patterns with Context7 source prioritization
- `systemPatterns.json` → Architecture patterns with AegisKG networks
- `progress.json` → Development milestones with constitutional metrics

**Tier 3: Strategic Alignment (Scheduled / milestone)**
- `roadmap.json` → Strategic planning with SQLite session alignment
- `roadmap/roadmap.md` → Human-readable strategy and client directives

**Schema Validation**:
- Core schema definitions located at `.windsurf/memory-bank/schemas/`
- Active schemas: `activeContext.schema.json`, `scratchpad.schema.json`, `mistakes.schema.json`, `systemPatterns.schema.json`, `progress.schema.json`, `roadmap.schema.json`, `kanban.schema.json`
- Validation delivers 2.6x faster JSON parsing with structured data integrity and 65% memory optimization with AegisKG integration

**Attention Efficiency**: Core schema set + workflow schema replaces legacy 17-file model, reducing per-task update surface while preserving governance fidelity

## PROJECT STRUCTURE (RELATIVE PATHS)

### Memory-Bank Files (Core Schema Set):

**Core Execution Files (update EVERY task)**
```
.windsurf/memory-bank/activeContext.json   # Current execution state and MCP activation trail
.windsurf/memory-bank/scratchpad.json      # Immediate task queue + parliamentary metadata
.windsurf/memory-bank/kanban.json          # Column workflow, approvals, WIP disciplines
```

**Insight & Strategy Files (update per iteration / milestone)**
```
.windsurf/memory-bank/mistakes.json        # Error intelligence and Context7 sourcing
.windsurf/memory-bank/systemPatterns.json  # Architecture patterns + AegisKG bindings
.windsurf/memory-bank/progress.json        # Milestones, velocity, constitutional metrics
.windsurf/memory-bank/roadmap.json         # Strategic milestones + priority rebalancing
.windsurf/memory-bank/roadmap/roadmap.md   # Human-readable strategic narrative
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

### JSON Schemas (Current Set)
```
.windsurf/memory-bank/schemas/activeContext.schema.json
.windsurf/memory-bank/schemas/scratchpad.schema.json
.windsurf/memory-bank/schemas/mistakes.schema.json
.windsurf/memory-bank/schemas/systemPatterns.schema.json
.windsurf/memory-bank/schemas/progress.schema.json
.windsurf/memory-bank/schemas/roadmap.schema.json
.windsurf/memory-bank/schemas/kanban.schema.json
.windsurf/memory-bank/schemas/README.md
```

### Laws (Project-Specific):
```
.windsurf/rules/laws/*.md (varies by project - language/framework/platform specific)
```

## CONSTITUTIONAL ARTICLE REFERENCE MATRIX

**Article I**: Tripartite Governance → Executive/Legislative/Judicial branches with MCP integration
**Article II**: Autonomous Decision Making → 0-98% auto-execute, MCP-based consensus scoring
**Article III**: 7-Schema Context Management → optimized JSON structure with AegisKG integration
**Article III-A**: Implementation Protocols → MCP integration with 7-schema real-time updates
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
EVERY task → HALT → @mcp:filesystem update ALL 7 essential schemas → Schema validate →
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

### Security Automation (BLOCKING)
```
# Secrets Scanning
gitleaks detect --no-git --redact || gitleaks detect

# SBOM Generation (CycloneDX)
syft dir:. -o cyclonedx-json > sbom.json || syft . -o cyclonedx-json > sbom.json

# Vulnerability Scan (fail on High/Critical)
grype sbom:sbom.json --fail-on High || trivy fs --exit-code 1 --severity HIGH,CRITICAL .

# Policy as Code (optional)
conftest test config/ policies/ || true
```

## CORE COMMANDS (BRIEF)

**`/init`**: Auto-detect → Restore OR generate 7 essential schemas (bootstrap memory-bank) → Enable workflow (Article III)
**`/next`**: Read scratchpad/kanban → Execute → Update ALL 7 essential → Auto-continue (Article III)
**`/update`**: @mcp:filesystem refresh 7 essential schemas (+ automation if present) → Schema validate (Article III-A)
**`/validate`**: Run language-specific checks → HALT on errors (Article XIII)
**`/fix`**: @mcp:context7 → Auto-fix loop → Update bugfix.json (Article XIII)

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
