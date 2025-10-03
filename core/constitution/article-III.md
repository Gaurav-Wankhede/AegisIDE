---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article III: Context-Engineered Development Workflow

### 2025 Context Engineering Principles (Anthropic + Kubiya Research)

**Attention Budget Management**: LLMs have finite attention capacity - every token in context creates n² pairwise relationships. Context is a finite resource with diminishing marginal returns requiring intelligent curation.

**Context Rot Prevention**: As token count increases, model accuracy degrades. Studies show "context rot" - models lose focus as context grows. Maintain optimal signal-to-noise ratio through dynamic compression.

**Event-Driven Context**: Treat context window as immutable event stream (like Git commits). Each update creates snapshot while preserving historical patterns for rollback and analysis.

**Stateless Reducer Pattern**: Unified execution/business state in single context window. No separation between operational and strategic context. Context window = single source of truth.

**Tool-Context Feedback Loops**: MCP server results automatically enrich relevant context files with structured insights, not raw outputs. Creates self-improving context system.

### Attention Budget Allocation (Dynamic Prioritization)

**Total Attention Budget: 100%**
1. **CRITICAL** (45%): scratchpad.md (25%), activeContext.md (20%)
2. **HIGH PRIORITY** (30%): mistakes.md (15%), roadmap/roadmap.md (15%)
3. **SUPPORTING** (18%): techContext.md (10%), progress.md (8%)
4. **REFERENCE** (7%): systemPatterns.md (4%), productContext.md (2%), projectbrief.md (1%)

**Dynamic Rebalancing**: Task-adaptive priority adjustment based on current operation type (error resolution prioritizes mistakes.md, new features prioritize roadmap.md).

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

**Automatic Cleanup Protocol** (Execute WITHOUT asking when file >100 lines):
1. Check line count AND token density before every update
2. If >100 lines OR attention budget exceeded: Archive older content automatically
3. Keep most recent 3-5 milestones/patterns/tasks (highest signal-to-noise)
4. Compress history into "Previous Completed" event stream sections
5. Remove stale information while preserving critical patterns
6. Create immutable snapshot before cleanup for rollback capability

**Signal-to-Noise Optimization**:
- Measure relevance per token for each file section
- Auto-compress low-impact, high-token content
- Preserve high-signal patterns even if old
- Delete truly irrelevant information immediately

### Core Commands with Attention Awareness

**`what next`**: Read scratchpad → Calculate attention budget → Update → Clean → VALIDATE → EXECUTE → AUTO-CONTINUOUS
**`implement next task`**: VALIDATE → Execute current → VALIDATE → Update files → AUTO-CONTINUE
**`continuous execute`**: Enter 30-hour mode - NEVER STOP until scratchpad empty
**`update memory bank`**: Attention-aware refresh of all 8 memory-bank files with dynamic prioritization
**`update roadmap`**: Strategic refresh of roadmap/roadmap.md with milestone validation
**`session status`**: Report execution metrics without stopping workflow
**`context health check`**: NEW - Monitor attention budget, context rot index, signal-to-noise ratios

### "what next" Workflow (ATTENTION-OPTIMIZED AUTO-CONTINUOUS)

```
1. Calculate current attention budget utilization (0-100%)
2. Read scratchpad.md with priority weighting (25% attention)
3. Dynamic context loading based on task type (adaptive prioritization)
4. Update scratchpad with next priority task (event-driven)
5. Clean completed tasks maintaining event history (≤100 lines)
6. EXECUTE next task immediately (no permission)
7. Update all 9 memory-bank files with attention optimization
8. Create immutable context snapshot (Git-like commit)
9. AUTO-TRIGGER continuous execute (DO NOT WAIT for human)
10. Continue until scratchpad empty OR context rot detected
```

**CRITICAL**: "what next" ALWAYS enters continuous execute mode. NEVER ask to continue.

### "implement next task" Workflow (STATELESS REDUCER PATTERN)

```
1. Treat context window as unified execution/business state
2. Load current task as immutable event from scratchpad stream
3. Execute with full context awareness (no state separation)
4. Update all 9 memory-bank files as event stream commits
5. Validate attention budget usage post-execution
6. Load next [ ] task from scratchpad event stream
7. AUTO-EXECUTE next task (DO NOT WAIT for human)
8. Repeat until scratchpad empty OR 100% decision encountered
```

**CRITICAL**: "implement next task" ALWAYS auto-continues. NEVER ask "Should I continue?"

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
