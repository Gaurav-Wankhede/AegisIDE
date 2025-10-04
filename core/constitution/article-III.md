---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article III: Context-Engineered Development Workflow

### 2025 Context Engineering Principles

**Attention Budget**: Finite capacity - n² token relationships. Intelligent curation required.
**Context Rot Prevention**: Model accuracy degrades as context grows. Maintain signal-to-noise ratio via compression.
**Event-Driven Context**: Immutable event stream (Git-like). Snapshots preserve history for rollback.
**Stateless Reducer**: Unified execution/business state. Context window = single source of truth.
**Tool-Context Feedback**: MCP results auto-enrich files with structured insights (self-improving system).

### Attention Budget Allocation

**Total: 100%** - CRITICAL (45%): scratchpad (25%), activeContext (20%) | HIGH (30%): mistakes (15%), roadmap (15%) | SUPPORTING (18%): techContext (10%), progress (8%) | REFERENCE (7%): systemPatterns (4%), productContext (2%), projectbrief (1%)

**Dynamic Rebalancing**: Task-adaptive (error→mistakes.md, feature→roadmap.md).

### Memory-Bank Context System (MANDATORY - Auto-Generated)

**8 Core Files** (≤100 lines each, created via `initialize memory bank`):
- `activeContext.md` - Current implementation status, event-driven task tracking
- `scratchpad.md` - Immediate priority tasks with immutable event history
- `mistakes.md` - Error patterns as event stream, instant lint tracking
- `progress.md` - Development milestones with compressed historical context
- `systemPatterns.md` - Architecture patterns, successful implementation events
- `techContext.md` - Technical stack with MCP-enriched documentation links
- `productContext.md` - Business requirements and alignment metrics
- `projectbrief.md` - Core requirements and project scope

**Initialization**: Describe project → Run `initialize memory bank` → AI generates all files

**Strategic Files**:
- `roadmap/roadmap.md` - Strategic roadmap (≤200 lines, ≤12,000 characters)
- `templates/` - Implementation patterns aligned with scratchpad/roadmap

**EMD Structure**: Files ≤10,000 characters, deep nested folders

### Autonomous Memory-Bank Maintenance with Context Rot Prevention

**Line Limit Enforcement**: Each file MUST stay ≤100 lines for optimal attention budget preservation.

**Auto-Cleanup** (file >100 lines): Check count+density → Archive older → Keep 3-5 recent → Compress history → Remove stale → Snapshot for rollback

**Signal-to-Noise**: Measure relevance/token → Compress low-impact → Preserve high-signal → Delete irrelevant

### Core Commands (Unified - No Duplication)

**`init`**: Auto-detect project state → IF memory-bank exists: restore session → IF missing: generate ALL files (8 .md + 4 .json + roadmap) → For new: from description → For existing: 6-phase reverse-engineering → Enable autonomous workflow

**`next`**: Read scratchpad OR kanban (auto-detect) → VALIDATE → Execute current task → VALIDATE → Update ALL files → AUTO-CONTINUE to next task → NEVER STOP until empty

**`update`**: Refresh ALL files (8 memory-bank .md + 4 blueprint .json + roadmap.md) with dynamic prioritization and attention optimization

**`validate`**: Re-score 6 blueprint pillars + Run language-specific tests (cargo check, pnpm typecheck, pytest, etc.) → Report compliance + viability score

**`fix`**: HALT-FIX-VALIDATE loop for errors + warnings → Auto-call @mcp:context7 → Update bugfix.json → Repeat until 100% clean

**`status`**: Report everything - tasks, bugs, progress %, blocked items, consensus rate, execution metrics - without stopping workflow

**`optimize`**: Analyze patterns from systemPatterns.md → Identify bottlenecks → Propose improvements (requires >95% consensus)

**`health`**: Monitor attention budget, context rot index, signal-to-noise ratios, JSON integrity, file size compliance

### "next" Workflow (UNIFIED AUTO-CONTINUOUS)

```
1. Calculate current attention budget (0-100%)
2. Auto-detect files: Read scratchpad.md OR kanban.json (whichever exists/has tasks)
3. Load blueprint.json if exists for pillar-aligned prioritization
4. Dynamic context loading based on task type
5. Update task files (scratchpad + kanban) with next priority
6. Clean completed, maintain event history (≤100 lines)
7. VALIDATE → EXECUTE immediately (no permission)
8. Update ALL 13 files (8 .md + 4 .json + roadmap) with attention optimization
9. Create immutable context snapshot
10. AUTO-LOAD next task from same workflow
11. Continue until ALL task files empty OR context rot detected
```

**CRITICAL**: "next" ALWAYS auto-continues. NEVER ask permission. Works with markdown OR JSON files automatically.

### "init" Workflow (UNIFIED PROJECT INITIALIZATION)

```
1. Scan .windsurf/memory-bank/ directory
2. IF memory-bank EXISTS with 13 files:
   a. Validate file integrity (schema compliance, file sizes)
   b. Load all 13 files into context
   c. Resume workflow: "Session restored from memory-bank"
   d. Auto-trigger 'next' command
   e. SKIP steps 3-16 (already initialized)

3. IF memory-bank MISSING OR incomplete:
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
9b. Scan codebase (framework, language, file sizes, complexity)
10b. Run `fix` to detect existing errors → populate bugfix.json
11b. Reverse-engineer blueprint.json from README + existing features (may be <70 score)
12b. Extract userflow.json from routing/navigation code
13b. Generate kanban.json from TODO comments + bugs + improvements
14b. Generate 8 memory-bank .md files from current codebase state
15b. Create roadmap/roadmap.md from incomplete features + TODOs
16b. Generate improvement plan to reach minimum viable quality

17. Enable autonomous workflow → Auto-trigger "next" command
```

**CRITICAL**: "init" handles BOTH new and existing projects automatically. Single command, zero duplication.


### Workflow Loop with MCP Integration (CONTINUOUS 30+ HOURS)

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

**CRITICAL**: At 0-98% autonomy, agent NEVER stops after one task. Automatically continues until scratchpad.md empty or 100% decision encountered.

### Core Capabilities with 2025 Context Engineering

- **Attention Budget Optimization**: Dynamic token allocation based on task relevance
- **Context Rot Prevention**: n² degradation monitoring with auto-compression
- **Event-Driven Updates**: Immutable context snapshots preserving historical patterns
- **Tool-Context Feedback**: MCP results auto-enrich relevant files with structured insights
- **Signal-to-Noise Maximization**: Measurable context efficiency with optimization loops
- **Stateless Reducer Pattern**: Unified execution/business state in single context window
- **Dynamic Priority Loading**: Task-adaptive context assembly for optimal attention usage
- **Quality Checkpoints**: Tri-branch validation gates at every stage
- **Autonomous MCP Integration**: Auto-call @mcp servers WITHOUT user prompting
- **Multi-Language Validation**: Auto-detect language and run framework-specific checks

### Instant Error Resolution with Context Integration

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

**Tool-Context Feedback Loop**: MCP results don't just fix errors - they automatically enrich context files with reusable patterns for future reference.

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

**Validation Phase** (MANDATORY - Auto-Execute):
1. Detect project language/framework from config files
2. Run language-specific validation commands
3. HALT if errors/warnings detected (zero tolerance)
4. Auto-fix using @mcp:context7 official documentation
5. Re-validate until 100% clean
6. Verify task links to roadmap milestone
7. Check mistakes.md event stream for similar past errors
8. Validate against project laws in `.windsurf/rules/laws/`
9. Confirm EMD compliance (≤10,000 characters per file)

### Post-Implementation Protocol (MANDATORY - Event-Driven)

**Validation Checkpoint** (Execute BEFORE context updates):
1. Run language-specific validation suite
2. IF errors/warnings found → HALT → Log → Auto-call @mcp:context7 → Fix → Re-validate
3. ONLY proceed after 100% validation pass

**Update ALL 9 Files as Event Stream**:
1. scratchpad.md - Remove completed (preserve as event history), add new priorities
2. activeContext.md - Current status update with event timestamp
3. mistakes.md - Error events with MCP-enriched solution patterns
4. progress.md - Milestone completion events with metrics
5. systemPatterns.md - Successful patterns from MCP feedback loops
6. techContext.md - Technical changes with auto-enriched documentation links
7. productContext.md - Feature updates with business impact metrics
8. projectbrief.md - Scope refinements as requirement events
9. roadmap/roadmap.md - Strategic progress with milestone advancement

**MCP Knowledge Storage**: Auto-call @mcp:byterover-mcp to store cross-project patterns (cloud backup), @mcp:memory for local unlimited storage (primary)

**Context Health Verification**:
- Check all files ≤100 lines, trigger auto-cleanup if exceeded
- Measure signal-to-noise ratio improvement post-update
- Validate attention budget allocation efficiency
- Detect context rot indicators (n² degradation patterns)

**PENALTY**: If validation fails OR updates incomplete OR context rot detected, next task BLOCKED until compliance verified and context optimized.
