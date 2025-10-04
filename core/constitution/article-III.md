---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article III: Context-Engineered Development Workflow

### 2025 Context Engineering Principles

**Attention Budget**: Finite n² token capacity. Intelligent curation required.
**Context Rot Prevention**: Model degrades as context grows. Maintain signal-to-noise via compression.
**Event-Driven Context**: Immutable stream (Git-like). Snapshots for rollback.
**Stateless Reducer**: Unified execution/business state. Single source of truth.
**Tool-Context Feedback**: MCP auto-enriches files with structured insights.

**Attention Allocation (100%)**: CRITICAL (45%): scratchpad 25%, activeContext 20% | HIGH (30%): mistakes 15%, roadmap 15% | SUPPORTING (18%): techContext 10%, progress 8% | REFERENCE (7%): systemPatterns 4%, productContext 2%, projectbrief 1% | Dynamic rebalancing by task type.

### Memory-Bank Context System (MANDATORY - Auto-Generated)

**8 Core Files** (≤100 lines, via `initialize memory bank`):
- `activeContext.md` - Implementation status, task tracking
- `scratchpad.md` - Priority tasks, immutable history
- `mistakes.md` - Error patterns, lint tracking
- `progress.md` - Milestones, compressed context
- `systemPatterns.md` - Architecture patterns, events
- `techContext.md` - Stack with MCP-enriched docs
- `productContext.md` - Business requirements, metrics
- `projectbrief.md` - Core requirements, scope

**Initialization**: Describe project → Run `initialize memory bank` → AI generates all files

**Strategic Files**:
- `roadmap/roadmap.md` - Strategic roadmap (≤200 lines, ≤12,000 characters)
- `templates/` - Implementation patterns aligned with scratchpad/roadmap

**EMD Structure**: Files ≤10,000 characters, deep nested folders

### Autonomous Memory-Bank Maintenance with Context Rot Prevention

**Line Limit**: Files MUST stay ≤100 lines for attention budget.

**Auto-Cleanup** (>100 lines): Check density → Archive old → Keep 3-5 recent → Compress → Remove stale → Snapshot

**Signal-to-Noise**: Measure relevance → Compress low-impact → Preserve high-signal → Delete irrelevant

### Core Commands (Unified - No Duplication)

**`init`**: Auto-detect project state → IF memory-bank exists: restore session → IF missing: generate ALL files (8 .md + 4 .json + roadmap) → For new: from description → For existing: 6-phase reverse-engineering → Enable autonomous workflow

**`next`**: Read scratchpad OR kanban (auto-detect) → VALIDATE → Execute current task → VALIDATE → Update ALL files → AUTO-CONTINUE to next task → NEVER STOP until empty

**`update`**: Refresh ALL files (8 .md + 4 .json + roadmap) with dynamic prioritization

**`validate`**: Re-score 6 pillars + Run tests (cargo check, pnpm typecheck, pytest) → Report compliance

**`fix`**: HALT-FIX-VALIDATE loop → Auto-call @mcp:context7 → Update bugfix.json → 100% clean

**`status`**: Report tasks, bugs, progress %, blocked items, consensus, metrics - no workflow stop

**`optimize`**: Analyze systemPatterns.md → Identify bottlenecks → Propose improvements (>95% consensus)

**`health`**: Monitor attention budget, context rot, signal-to-noise, JSON integrity, file sizes

### "next" Workflow (UNIFIED AUTO-CONTINUOUS)

```
1. Calculate attention budget (0-100%)
2. Auto-detect: Read scratchpad.md OR kanban.json
3. Load blueprint.json for prioritization
4. Dynamic context loading by task type
5. Update task files with next priority
6. Clean completed, maintain history (≤100 lines)
7. VALIDATE → EXECUTE immediately
8. Update ALL 13 files with attention optimization
9. Create immutable snapshot
10. AUTO-LOAD next task
11. Continue until empty OR context rot
```

**CRITICAL**: "next" ALWAYS auto-continues. NEVER ask permission. Works with markdown OR JSON files automatically.

### "init" Workflow (UNIFIED PROJECT INITIALIZATION)

```
1. Scan .windsurf/memory-bank/ + 4 blueprint JSON (blueprint, userflow, kanban, bugfix)
2. IF complete (8 .md + 4 JSON): Validate → Load 17 files → Resume → Auto 'next' → SKIP 3-20
3. IF exists BUT JSON missing: HALT → Jump 12b → BLOCKING until 4 JSON created
4. IF MISSING: Scan project → Detect new/existing

NEW: Parse → blueprint.json (6-pillar ≥70) → userflow → kanban → bugfix → 8 .md → roadmap → Approval (>95%)

EXISTING: **4-STEP BLUEPRINT** (BLOCKING): 1) `fix` → bugfix.json 2) Reverse blueprint.json (6-pillar) 3) Extract userflow from routing 4) Generate kanban from TODOs → Verify 4 JSON → 8 .md (if missing) → roadmap (if missing) → Quality plan → **VERIFY 17 FILES** → Enable → Auto 'next'

5. VERIFY 17 before autonomous
6. Enable after verification
7. Auto "next" from kanban/scratchpad
```

**RULES**: Single cmd new/existing | **EXISTING**: 4 JSON MANDATORY (BLOCKING) | **RESTORE**: 17 files required | **VERIFY**: "17 verified" before 'next'


### Workflow Loop with MCP Integration (CONTINUOUS 30+ HOURS)

```
Context Assembly → MCP Enrichment → Validation (Laws/EMD) → Language Detection → Pre-Implementation → Proposal → Opposition → Judicial Review → >95% Consensus → EXECUTE → Post-Validation → MCP Auto-Enrich → Update 9 Files → Context Rot Check → Load Next → EXECUTE → REPEAT
```

**CRITICAL**: 0-98% autonomy NEVER stops after one task. Auto-continues until empty or 100% decision.

### Core Capabilities with 2025 Context Engineering

- **Attention Optimization**: Dynamic token allocation by task relevance
- **Context Rot Prevention**: n² monitoring with auto-compression
- **Event-Driven Updates**: Immutable snapshots preserving history
- **Tool-Context Feedback**: MCP auto-enriches files with insights
- **Signal-to-Noise**: Measurable efficiency with optimization
- **Stateless Reducer**: Unified state in single context
- **Dynamic Priority**: Task-adaptive assembly for optimal attention
- **Quality Gates**: Tri-branch validation at every stage
- **Autonomous MCP**: Auto-call @mcp without prompting
- **Multi-Language**: Auto-detect and run framework checks

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

**Tool-Context Loop**: MCP auto-enriches files with reusable patterns for future reference.

### Pre-Implementation Protocol (MANDATORY - Context Optimized)

**Context Assembly**:
1. Calculate attention budget
2. Read scratchpad (25%), roadmap (15%)
3. **SCAN CONFIGS**: core/config/, src/*/config/, lib/*/config/ - HALT if duplicate
4. Dynamic load: error→mistakes, feature→roadmap
5. Read activeContext, mistakes, techContext (30%)
6. @mcp:memory knowledge
7. Supporting (progress, systemPatterns - 18%)
8. Skip reference (7%)

**Validation**: 1) Detect language 2) Run commands 3) HALT on errors 4) Auto-fix @mcp:context7 5) Re-validate 100% 6) Verify roadmap 7) Check mistakes.md 8) Validate laws 9) Confirm EMD ≤10K

### Post-Implementation Protocol (MANDATORY - Event-Driven)

**Validation**: 1) Run suite 2) Errors → HALT → @mcp:context7 → Fix 3) Proceed at 100%

**Update 9 Files**: scratchpad (completed), activeContext (status), mistakes (errors+solutions), progress (milestones), systemPatterns (patterns), techContext (changes), productContext (features), projectbrief (scope), roadmap (strategy)

**Storage**: @mcp:memory (local), @mcp:byterover-mcp (cloud)

**Health**: Files ≤100 lines | Signal-to-noise | Attention budget | n² degradation

**PENALTY**: Fail/incomplete/rot → BLOCK until compliant
