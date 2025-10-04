---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article III: Context-Engineered Development Workflow

### 2025 Context Engineering Principles

**Attention Budget**: Finite n² token capacity. Intelligent curation.
**Context Rot Prevention**: Model degrades with growth. Maintain signal-to-noise.
**Event-Driven**: Immutable stream. Snapshots for rollback.
**Stateless Reducer**: Unified execution/business state.
**Tool-Context Feedback**: MCP auto-enriches files.

**Attention Allocation (100%)**: CRITICAL (45%): scratchpad 25%, activeContext 20% | HIGH (30%): mistakes 15%, roadmap 15% | SUPPORTING (18%): techContext 10%, progress 8% | REFERENCE (7%): systemPatterns 4%, productContext 2%, projectbrief 1% | Dynamic rebalancing by task type.

### Memory-Bank Context System (MANDATORY - Auto-Generated)

**8 Core Files** (≤100 lines via `initialize memory bank`):
- `activeContext.md` - Implementation status, task tracking
- `scratchpad.md` - Priority tasks, immutable history
- `mistakes.md` - Error patterns, lint tracking
- `progress.md` - Milestones, compressed context
- `systemPatterns.md` - Architecture patterns, events
- `techContext.md` - Stack with MCP-enriched docs
- `productContext.md` - Business requirements, metrics
- `projectbrief.md` - Core requirements, scope

**Init**: Describe project → `initialize memory bank` → AI generates files

**Strategic**: roadmap.md (≤200 lines, ≤12K chars), templates/ (patterns)

**EMD**: ≤10K chars/file, deep nesting

### Autonomous Memory-Bank Maintenance

**Line Limit**: Files ≤100 lines for attention budget.

**Auto-Cleanup** (>100 lines): Check density → Archive old → Keep 3-5 recent → Compress → Remove stale → Snapshot

**Signal-to-Noise**: Measure relevance → Compress low-impact → Preserve high-signal → Delete irrelevant

### Core Commands

**`init`**: Auto-detect state → IF exists: restore → IF missing: generate ALL (8 .md + 4 .json + roadmap) → Enable workflow

**`next`**: Read scratchpad/kanban → VALIDATE → Execute → Update ALL → AUTO-CONTINUE → NEVER STOP

**`update`**: Refresh ALL files (8 .md + 4 .json + roadmap)

**`validate`**: Re-score 6 pillars + Run tests → Report compliance

**`fix`**: HALT-FIX-VALIDATE → @mcp:context7 → Update bugfix.json → 100% clean

**`status`**: Report tasks, bugs, progress, blocked, consensus, metrics

**`optimize`**: Analyze systemPatterns → Identify bottlenecks → Propose (>95%)

**`health`**: Monitor attention, context rot, signal-to-noise, JSON, file sizes

### "next" Workflow

```
1. Calculate attention budget
2. Read scratchpad.md OR kanban.json
3. Load blueprint.json
4. Dynamic context loading
5. Update task files
6. Clean completed (≤100 lines)
7. VALIDATE → EXECUTE
8. Update ALL 13 files
9. Create snapshot
10. AUTO-LOAD next
11. Continue until empty/rot
```

**CRITICAL**: "next" ALWAYS auto-continues. NEVER ask permission. Works with markdown OR JSON.

### "init" Workflow (UNIFIED PROJECT INITIALIZATION)

```
1. Scan .windsurf/memory-bank/ directory
2. **MANDATORY**: Scan .windsurf/ for 4 blueprint JSON files (blueprint.json, userflow.json, kanban.json, bugfix.json)
3. IF memory-bank EXISTS (8 .md files) AND all 4 blueprint JSON files exist:
   a. Validate file integrity (schema compliance, file sizes, JSON structure)
   b. Load all 17 files into context (8 .md + 4 blueprint .json + roadmap + 4 other .json)
   c. Resume workflow: "Session restored: 17 files loaded (8 .md + 4 blueprint + roadmap)"
   d. Auto-trigger 'next' command
   e. SKIP steps 4-20 (already initialized)

4. **CRITICAL**: IF memory-bank EXISTS BUT ANY blueprint JSON missing (even 1 of 4):
   a. **HALT session restore** - cannot proceed without blueprints
   b. **MANDATORY blueprint generation** for existing project
   c. Jump to step 12b (reverse-engineer all 4 blueprints)
   d. **BLOCKING**: DO NOT auto-trigger 'next' until all 4 JSON files created

5. IF memory-bank MISSING OR incomplete (<8 .md files):
   a. Scan project directory for existing code/config files
   b. Auto-detect: New project (empty) OR Existing project (has code)

IF NEW PROJECT:
9a. Parse user description of project idea
10a. Generate blueprint.json with 6-pillar validation (≥70 score required)
11a. Create userflow.json from user personas
12a. Populate kanban.json with tasks from blueprint
13a. Initialize bugfix.json for monitoring
14a. Generate 8 memory-bank .md files from project description
15a. Create roadmap/roadmap.md with strategic milestones
16a. Trigger parliamentary approval (>95% consensus)

IF EXISTING PROJECT:
12b. **MANDATORY BLUEPRINT GENERATION** (NO EXCEPTIONS - BLOCKING STEP):
   - Scan codebase: framework detection, language analysis, file structure, complexity assessment
   - **Step 1/4**: Run `fix` command → detect all errors/warnings → **CREATE bugfix.json** with current issues (MANDATORY)
   - **Step 2/4**: Reverse-engineer **blueprint.json**: analyze README, existing features, 6-pillar scoring (may score <70 for existing projects) (MANDATORY)
   - **Step 3/4**: Extract **userflow.json**: parse routing, navigation patterns, user journey mapping (MANDATORY)
   - **Step 4/4**: Generate **kanban.json**: extract TODO comments, parse bugfix.json, identify improvements (MANDATORY)
   - **VERIFICATION CHECKPOINT**: Confirm all 4 JSON files exist with valid structure before proceeding
13b. Generate 8 memory-bank .md files from current codebase analysis (if any missing)
14b. Create roadmap/roadmap.md from incomplete features, TODOs, technical debt (if missing)
15b. Generate quality improvement plan based on blueprint.json scoring + bugfix.json issues
16b. **FINAL VERIFICATION - 17 FILES TOTAL**: 8 .md + 4 blueprint .json (blueprint, userflow, kanban, bugfix) + roadmap.md + 4 other .json
17b. **ONLY THEN** enable autonomous workflow → Auto-trigger 'next' command

18. **BLOCKING GATE**: Verify 17 files exist before enabling autonomous mode
19. Enable autonomous workflow ONLY after blueprint verification passes
20. Auto-trigger "next" command → begin execution from kanban.json or scratchpad.md
```

**CRITICAL RULES**: 
- "init" handles BOTH new and existing projects - single command, zero duplication
- **EXISTING PROJECTS**: Blueprint JSON generation is MANDATORY and BLOCKING - cannot proceed without all 4 files
- **SESSION RESTORE**: Only possible with complete 17-file structure (8 .md + 4 blueprint .json + roadmap + 4 other .json)
- **VERIFICATION**: AI must explicitly confirm "17 files verified" before auto-triggering 'next' command


### Workflow Loop

```
Context Assembly (Attention-Prioritized) →
MCP Tool Context Enrichment →
Validation (Laws + EMD) →
Language Detection →
Pre-Implementation Validation →
Executive Proposal →
Legislative Opposition →
Judicial Review →
>95% Consensus →
EXECUTE IMMEDIATELY →
Post-Implementation Validation →
MCP Results → Auto-Enrich Context Files →
Context Update (ALL 9 files as events) →
Context Rot Detection →
Load Next Task →
EXECUTE IMMEDIATELY →
REPEAT CONTINUOUSLY
```

**CRITICAL**: 0-98% autonomy NEVER stops after one task. Auto-continues until empty or 100% decision.

### Core Capabilities

- Attention optimization: Dynamic tokens
- Context rot prevention: n² monitoring
- Event-driven updates: Immutable snapshots
- Tool-context feedback: MCP enrichment
- Signal-to-noise: Measurable efficiency
- Stateless reducer: Unified state
- Dynamic priority: Task-adaptive
- Quality gates: Tri-branch validation
- Autonomous MCP: Auto-call
- Multi-language: Auto-detect checks

### Error Resolution Protocol

Any error/warning → **AUTO-CALL @mcp:context7 WITHOUT asking**
```
Error Detection →
Auto-call @mcp:context7 resolve-library-id → get-library-docs →
Official Documentation Retrieved →
Auto-Resolution Implementation →
mistakes.md event stream update (structured error pattern) →
techContext.md auto-enrichment (solution pattern from MCP) →
systemPatterns.md update (success pattern documentation) →
Validation → Re-run checks →
ONLY continue after 100% clean
```

**Tool-Context Loop**: MCP auto-enriches files with reusable patterns.

### Pre-Implementation Protocol (MANDATORY - Context Optimized)

**Context Assembly Phase** (Attention-Aware):
1. Calculate current attention budget usage vs. capacity
2. Read scratchpad.md (CRITICAL - 25% attention allocation)
3. Read roadmap/roadmap.md (CRITICAL - strategic alignment, 15% attention)
4. **SCAN CENTRALIZED CONFIGS** (MANDATORY - prevent duplication):
   - Scan: `core/config/`, `src/*/config/`, `lib/*/config/`, `config/`, `shared/`
   - Check existing: delays, timeouts, API settings, concurrency, retry logic
   - Validate NO duplicate configuration files or constants exist
   - **HALT if duplicate detected** - reference existing config instead
   - Document existing configs in systemPatterns.md event stream
5. Dynamic context loading based on task type (error = mistakes.md priority, feature = roadmap priority)
6. Read activeContext.md, mistakes.md, techContext.md (HIGH PRIORITY - 30% total attention)
7. Retrieve knowledge from @mcp:memory (unlimited local storage, primary)
8. Read supporting files as needed (progress, systemPatterns - 18% attention)
9. Skip reference files unless specifically needed (productContext, projectbrief - 7% attention)

**Validation**:
1. Detect language/framework
2. Run validation commands
3. HALT on errors (zero tolerance)
4. Auto-fix via @mcp:context7
5. Re-validate to 100%
6. Verify roadmap link
7. Check mistakes.md
8. Validate laws
9. Confirm EMD ≤10K

### Post-Implementation Protocol

**Validation Checkpoint**:
1. Run validation suite
2. IF errors → HALT → @mcp:context7 → Fix → Re-validate
3. Proceed only at 100%

**Update ALL 9 Files**:
1. scratchpad.md - Remove completed, add priorities
2. activeContext.md - Status with timestamp
3. mistakes.md - Errors with MCP solutions
4. progress.md - Milestones with metrics
5. systemPatterns.md - Patterns from MCP feedback
6. techContext.md - Changes with enriched docs
7. productContext.md - Features with impact
8. projectbrief.md - Scope refinements
9. roadmap.md - Strategic progress

**Storage**: @mcp:memory (local primary), @mcp:byterover-mcp (cloud backup)

**Health Check**:
- Files ≤100 lines (auto-cleanup)
- Signal-to-noise improvement
- Attention budget efficiency
- n² degradation detection

**PENALTY**: Validation fail/incomplete/rot → BLOCK until compliant
