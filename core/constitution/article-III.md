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

**16 Core JSON Files**:

**Core Context (8)**: activeContext, scratchpad, mistakes, progress, systemPatterns, techContext, productContext, projectbrief

**Automation (8)**: roadmap, kanban, blueprint, userflow, bugfix, deployment, monitoring, dependencies

**Human Readability**:
- `roadmap.md` - ONLY human-readable strategic overview
- Auto-generated views (optional): `.windsurf/memory-bank/views/*.md`

**Init**: Describe project → `initialize memory bank` → AI generates all JSON files

**Data Structure**: JSON with schema validation from `.windsurf/memory-bank/schemas/`, ≤10KB/file
**Performance**: 2.6x faster parsing, 40% faster AI processing

### Autonomous Memory-Bank Maintenance

**Size Limit**: JSON files ≤10KB for optimal parsing.

**Auto-Cleanup** (>10KB): Archive old → Keep recent → Compress → Remove stale → Snapshot

**Signal-to-Noise**: Compress low-impact → Preserve high-signal → Delete irrelevant

**Schema Validation**: Auto on read/write using `.windsurf/memory-bank/schemas/*.schema.json` → Data integrity → Zero ambiguity → Immediate error detection

### Core Commands

**`init`**: Auto-detect state → IF exists: restore → **IF .md found: TRIGGER migrate-to-json** → IF missing: generate ALL 17 files (16 JSON + roadmap.md) → Enable workflow

**`migrate-to-json`**: **FORCE MD→JSON** → Load schemas from `.windsurf/memory-bank/schemas/` → Backup .md to `backup_md/` → Convert ALL → DELETE originals → Log in mistakes.json → Verify 17 files

**`next`**: Read scratchpad.json/kanban.json → VALIDATE → Execute → Update ALL → AUTO-CONTINUE → NEVER STOP

**`update`**: Refresh ALL files (16 .json + roadmap.md)

**`validate`**: Re-score 6 pillars + Run tests → Report compliance

**`fix`**: HALT-FIX-VALIDATE → @mcp:context7 → Update bugfix.json → 100% clean

**`status`**: Report tasks, bugs, progress, blocked, consensus, metrics

**`optimize`**: Analyze systemPatterns → Identify bottlenecks → Propose (>95%)

**`health`**: Monitor attention, context rot, signal-to-noise, JSON, file sizes

### "next" Workflow

```
1. Calculate attention budget
2. Read scratchpad.json OR kanban.json (auto-detect)
3. Load blueprint.json if exists
4. Dynamic context loading (JSON parsing)
5. Update task files (JSON updates)
6. Clean completed (≤10KB files)
7. VALIDATE → EXECUTE
8. Update ALL 17 files (16 .json + roadmap.md)
9. Create snapshot
10. AUTO-LOAD next
11. Continue until empty/rot
```

**CRITICAL**: "next" ALWAYS auto-continues. NEVER ask permission. JSON-first with schema validation.

### "init" Workflow (UNIFIED PROJECT INITIALIZATION)

```
1. Scan .windsurf/memory-bank/ directory
2. **LOAD SCHEMAS**: Load ALL schemas from `.windsurf/memory-bank/schemas/*.schema.json` (17 schemas total)
3. **MANDATORY**: Scan .windsurf/ for 4 blueprint JSON files (blueprint.json, userflow.json, kanban.json, bugfix.json)
4. IF memory-bank EXISTS (16 .json files) AND roadmap.md exists:
   a. Validate JSON schema compliance using loaded schemas from `.windsurf/memory-bank/schemas/`
   b. Load all 17 files into context (16 .json + roadmap.md)
   c. Resume workflow: "Session restored: 17 files loaded (16 JSON + roadmap.md)"
   d. Auto-trigger 'next' command
   e. SKIP steps 5-21 (already initialized)

5. **CRITICAL**: IF memory-bank EXISTS BUT ANY JSON file missing:
   a. **HALT session restore** - cannot proceed without complete structure
   b. **MANDATORY regeneration** of missing JSON files using schemas from `.windsurf/memory-bank/schemas/`
   c. Jump to blueprint generation step
   d. **BLOCKING**: DO NOT auto-trigger 'next' until all 16 JSON files created

6. IF memory-bank MISSING OR incomplete (<16 .json files):
   a. Scan project directory for existing code/config files
   b. Auto-detect: New project (empty) OR Existing project (has code)

IF NEW PROJECT:
9a. Parse user description of project idea
10a. Generate blueprint.json with 6-pillar validation (≥70 score required)
11a. Create userflow.json from user personas
12a. Populate kanban.json with tasks from blueprint
13a. Initialize bugfix.json for monitoring
14a. Generate 8 core context JSON files from project description
15a. Generate 4 automation JSON files (deployment, monitoring, dependencies, roadmap)
15b. Create roadmap.md (human-readable strategic overview)
16a. Trigger parliamentary approval (>95% consensus)

IF EXISTING PROJECT:
12b. **CHECK FOR MARKDOWN FILES** (AUTOMATIC MIGRATION - BLOCKING):
   - Scan `.windsurf/memory-bank/` for ANY `.md` files
   - **IF FOUND**: **HALT AND MIGRATE - NO EXCEPTIONS**:
     a. **STOP** session restore immediately
     b. Display: "Legacy MD format detected. Migrating to JSON..."
     c. Create backup: `.windsurf/memory-bank/backup_md/` with timestamp
     d. Load schemas from `.windsurf/memory-bank/schemas/*.schema.json`
     e. Convert EACH .md → .json: scratchpad.md→scratchpad.json, activeContext.md→activeContext.json, etc.
     f. Validate each JSON against schema
     g. **DELETE** original .md files after successful validation
     h. Log in mistakes.json: "MD→JSON migration completed - 17 files verified"
     i. Resume init workflow from step 4 (session restore with JSON)
   - **IF NOT FOUND**: Skip to blueprint generation

13b. **MANDATORY BLUEPRINT GENERATION** (NO EXCEPTIONS - BLOCKING STEP):
   - Scan codebase: framework detection, language analysis, file structure, complexity assessment
   - **Step 1/4**: Run `fix` command → detect all errors/warnings → **CREATE bugfix.json** with current issues (MANDATORY)
   - **Step 2/4**: Reverse-engineer **blueprint.json**: analyze README, existing features, 6-pillar scoring (may score <70 for existing projects) (MANDATORY)
   - **Step 3/4**: Extract **userflow.json**: parse routing, navigation patterns, user journey mapping (MANDATORY)
   - **Step 4/4**: Generate **kanban.json**: extract TODO comments, parse bugfix.json, identify improvements (MANDATORY)
   - **VERIFICATION CHECKPOINT**: Confirm all 4 JSON files exist with valid structure before proceeding

14b. Generate 8 core context JSON files from current codebase analysis (if any missing)
15b. Generate 4 automation JSON files (deployment, monitoring, dependencies, roadmap.json)
15c. Create roadmap.md from incomplete features, TODOs, technical debt (if missing)
16b. Generate quality improvement plan based on blueprint.json scoring + bugfix.json issues
17b. **FINAL VERIFICATION - 17 FILES TOTAL**: 16 .json (8 core + 8 automation/strategy) + roadmap.md
18b. **ONLY THEN** enable autonomous workflow → Auto-trigger 'next' command

18. **BLOCKING GATE**: Verify 17 files exist before enabling autonomous mode
19. Enable autonomous workflow ONLY after blueprint verification passes
20. Auto-trigger "next" command → begin execution from kanban.json or scratchpad.json
```

**CRITICAL RULES**: 
- "init" handles BOTH new and existing projects - single command, zero duplication
- **SCHEMA LOCATION**: ALWAYS use `.windsurf/memory-bank/schemas/*.schema.json` - NO OTHER LOCATIONS
- **EXISTING PROJECTS**: JSON generation is MANDATORY and BLOCKING - cannot proceed without all 16 files
- **SESSION RESTORE**: Only possible with complete 17-file structure (16 .json + roadmap.md)
- **VERIFICATION**: AI must explicitly confirm "17 files verified (16 JSON + roadmap.md)" before auto-triggering 'next' command
- **SCHEMA VALIDATION**: All JSON files validated against schemas in `.windsurf/memory-bank/schemas/` ONLY


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
Context Update (ALL 17 files: 16 JSON + roadmap.md) →
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
mistakes.json event stream update (structured error pattern) →
techContext.json auto-enrichment (solution pattern from MCP) →
systemPatterns.json update (success pattern documentation) →
Validation → Re-run checks →
ONLY continue after 100% clean
```

**Tool-Context Loop**: MCP auto-enriches files with reusable patterns.

### Constitutional Integration

**Implementation Details**: See **Article III-A** for complete Pre-Implementation and Post-Implementation protocols including:
- Context Assembly Phase with attention budget management
- MCP-Based JSON Update procedures
- Validation checkpoints and error handling
- Real-time context enrichment via MCP tools
- Schema validation and health monitoring

**Authority**: Article III establishes workflow foundation. Article III-A governs detailed execution protocols.

**Compliance**: Both articles operate under unified constitutional authority with >95% consensus requirements.
