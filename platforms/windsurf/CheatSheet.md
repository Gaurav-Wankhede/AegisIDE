# Command Cheat Sheet — Project Rules Reference (2025 Universal)

**USAGE**: Place this file in your project's `.windsurf/rules/CheatSheet.md` for AI agent quick reference.
**IDE Setup**: Global rules go in **Windsurf Settings** (not in project files).
**Purpose**: Universal commands for **autonomous task chaining** across Claude, OpenAI O3, GPT-4, and all AI models.

## 📁 **Proper File Structure**
```
Project/
├── .windsurf/
│   ├── rules/
│   │   ├── constitution/        # Constitutional articles
│   │   ├── laws/               # Language-specific rules
│   │   └── CheatSheet.md       # THIS FILE - Quick command reference
│   └── memory-bank/            # Auto-managed project memory
└── IDE Settings/               # Global rules in Windsurf Settings (NOT in project)
```

## 🚀 **Primary Autonomous Commands (Context-Engineered)**
- **`init`** — Initialize OR restore project → Detects existing 17 files → **IF .md files found: AUTO-TRIGGER migrate-to-json** [ALL MODELS]
- **`migrate-to-json`** — **FORCE MD→JSON** migration for legacy projects → Load schemas from `.windsurf/memory-bank/schemas/` → Backup to `backup_md/` → Convert ALL → DELETE .md files → Verify 17 JSON files [LEGACY PROJECTS]
- **`next`** — Execute next task → Auto-continues forever → Updates everything → NEVER STOPS until tasks empty [ALL MODELS]
- **`update`** — Refresh ALL 17 files (16 JSON + roadmap.md) → Attention optimization → Schema validation → Context health [ALL MODELS]

## 🔄 **Session Resume (Existing Projects - ZERO MANUAL INPUT)**
**When you open an existing project in new session**:
```
1. AI auto-scans: .windsurf/memory-bank/ (17 files: 16 JSON + roadmap.md)
2. IF found → Auto-loads ALL files with schema validation
3. AI says: "Session restored. 17 files loaded (16 JSON + roadmap.md)"
4. Just type: next (or AI auto-triggers it)
5. Workflow resumes from exactly where you left off
```

**What AI reads automatically**:
- scratchpad.json OR kanban.json (pending tasks - JSON format)
- activeContext.json (last session state - JSON format)
- blueprint.json (project requirements - 6-pillar validation)
- bugfix.json (known issues - auto-detection)
- All 12 other JSON files (progress, mistakes, systemPatterns, techContext, productContext, projectbrief, userflow, deployment, monitoring, dependencies, roadmap)
- roadmap.md (human-readable strategic overview)

**You DON'T need to**:
- ❌ Describe the project again
- ❌ Explain what you were working on
- ❌ Manually load any files
- ✅ Just type: `next`

## 🔄 **Auto-Chain Workflow (Blueprint-Integrated)**
**EVERY TASK COMPLETION AUTOMATICALLY TRIGGERS**:
1. **Auto-update scratchpad.json + kanban.json** — Remove completed task, update task status (todo→in_progress→done→approved)
2. **Auto-update roadmap.json + roadmap.md** — Mark milestone progress, recalculate priorities, update blueprint scores
3. **Auto-update ALL 17 files** — Refresh all 16 JSON files (activeContext, progress, mistakes, systemPatterns, techContext, productContext, projectbrief, kanban, blueprint, userflow, bugfix, deployment, monitoring, dependencies, roadmap) + roadmap.md
4. **Auto-update metrics** — Update userflow.json completion %, bugfix.json bug stats, kanban.json consensus rates
5. **Auto-bug detection** — Scan for P0-P3 bugs, update bugfix.json, trigger auto-fix if needed
6. **Auto-execute next task** — NO command needed, continue autonomously

**BLUEPRINT-AWARE WORKFLOW**:
```
Task Complete → Validate → Update Scratchpad + JSON Files → Bug Scan → Load Next Task → Execute → Repeat
```

## 💾 **Validation & Health Commands**
- **`validate`** — Blueprint 6-pillar scoring + Language-specific tests (cargo check, pnpm typecheck, pytest, etc.) → Report compliance
- **`fix`** — HALT-FIX-VALIDATE loop → Auto-call @mcp:context7 → Update bugfix.json → Repeat until 100% clean
- **`health`** — Monitor attention budget (0-100%), context rot index, file size compliance, JSON integrity
- **`status`** — Complete report: tasks by status, bugs, progress %, blocked items, consensus rate, metrics

## ⚡ **Quality Assurance (Auto-Triggered)**
- **`fix issues`** — HALT-FIX-VALIDATE loop for errors + warnings → framework-specific commands (cargo check, pnpm typecheck, pytest, go test)
- **Always-Check Commands** — Auto-execute before any implementation: `cargo check`, `pnpm typecheck`, `npm run lint`, `pytest`, `go test`
- **Error Resolution** — Auto-fix compilation failures, resolve linting issues, optimize performance automatically
- **EMD Compliance** — Files ≤80 lines, auto-split when approaching limit, deep nested structure enforcement

## 🎯 **Complete Command Reference (8 Total)**

**Setup**:
- **`init`** — Works for BOTH new and existing projects → Auto-generates everything

**Execution**:
- **`next`** — Primary execution command → Auto-continues forever → Handles markdown AND JSON
- **`update`** — Refresh all files → Keeps everything synchronized

**Quality**:
- **`validate`** — Check everything (blueprint + code + tests)
- **`fix`** — Auto-fix all errors and warnings
- **`health`** — System health monitoring

**Optimization**:
- **`optimize`** — Improve architecture and patterns
- **`status`** — Complete progress report

### 📋 **Blueprint Features (Built into Commands)**
**6-Pillar Validation** (auto-runs with `init` and `validate`):
1. Problem Definition (clarity, target audience, pain quantification)
2. Solution Feasibility (viability, resources, tech stack, EMD compatibility)
3. Market Validation (size, competition, timing, demand)
4. Technical Feasibility (complexity, stack maturity, timeline)
5. Scalability Assessment (growth potential, infrastructure, performance)
6. Monetization Strategy (revenue model, pricing, CAC, sustainability)

**Minimum Score**: ≥70/100 overall (no pillar <50) for parliamentary approval

## 🚨 **Emergency & Error Recovery**
- **MCP Failures** — Auto-switch to native operations, continue tasks without interruption
- **"invalid_argument"** — Instant native fallback, retry MCP after 300s, zero task interruption  
- **"internal error"** — Switch backup MCP, log pattern, continue current operation
- **System Failures** — Native IDE operations, command-line git, manual file operations with guided workflow

## 🗺️ **Roadmap Management (Auto-Updated)**  
- **`update roadmap`** — AUTOMATIC milestone tracking, priority recalculation, progress marking
- **`check roadmap health`** — Calculate alignment score (0-100%), identify conflicts, assess business value

## 🌐 **Language-Specific Commands**
- **Rust**: `cargo check`, `cargo clippy`, `cargo fmt --check`
- **JavaScript/TypeScript**: `pnpm typecheck`, `npm run lint`, `next build --dry-run`
- **Python**: `pytest`, `black --check`, `mypy`
- **Go**: `go build`, `go test`, `go vet`

---

## 📋 **Universal Execution Protocol (ALL AI MODELS)**

### **MANDATORY BEHAVIOR**
1. **Read scratchpad.json** at start of every interaction (25% attention allocation)
2. **Execute task** from scratchpad without asking permission (0-98% autonomy)  
3. **Update ALL 17 files** automatically after task completion (16 JSON + roadmap.md)
4. **Load next task** from updated scratchpad.json or kanban.json
5. **Continue execution** until scratchpad.json is empty
6. **NEVER STOP** after completing just one task (constitutional mandate)

### **Task Completion Checklist (Blueprint-Integrated)**
- [ ] Task implemented and tested with language-specific validation
- [ ] scratchpad.json + kanban.json updated (completed task removed/status updated, next task highlighted)
- [ ] roadmap.json + roadmap.md updated (milestone progress marked, blueprint scores refreshed)
- [ ] ALL 17 files updated:
  - 8 core context JSON: activeContext, scratchpad, mistakes, progress, systemPatterns, techContext, productContext, projectbrief
  - 8 automation JSON: roadmap, kanban, blueprint, userflow, bugfix, deployment, monitoring, dependencies
  - 1 human-readable: roadmap.md
- [ ] Bug detection scan completed → bugfix.json updated if issues found
- [ ] Next task identified from kanban.json OR scratchpad.json and execution started automatically
- [ ] Quality checks passed (linting, compilation, tests) → validation recorded in systemPatterns.json
- [ ] MCP knowledge storage: Patterns stored in @mcp:memory (primary) + @mcp:byterover-mcp (backup)

### **Automation Levels**
- **0-97**: Execute immediately, no confirmation needed
- **98-99**: Document decision, then execute automatically  
- **100**: Human consultation required

### **Emergency Fallback**
If MCPs fail, use native IDE operations and continue task execution

### **New Session Setup** 
For fresh sessions without existing memory-bank:
1. `initialize memory bank` — Create complete project structure
2. `scan existing project` — Analyze codebase, establish automation
3. `restore autonomous workflow` — Enable continuous task execution

---

## 🔧 **Setup Instructions**

### **Step 1: IDE Configuration**
- **Windsurf Settings**: Add `global_rules.md` content to IDE settings (Custom Instructions)
- **Activation Mode**: Set to "Always On" or "Model Decision" for automatic activation
- **Scope**: IDE-wide rules apply to all projects

### **Step 2: Project Configuration** 
- **Copy this CheatSheet.md** to: `YourProject/.windsurf/rules/CheatSheet.md`
- **Constitutional files** go in: `YourProject/.windsurf/rules/constitution/`
- **Language rules** go in: `YourProject/.windsurf/rules/laws/`

### **Step 3: Memory Bank Initialization**
When starting fresh projects:
1. Use `initialize memory bank` command
2. AI will auto-create `.windsurf/memory-bank/` structure
3. Autonomous workflow activates immediately

---

## 🧠 Memory Bank & Strategic Management (MCP-Integrated)
- **`initialize memory bank`**: Generate 17 files (16 JSON + roadmap.md) with schema validation
- **`update memory bank`**: **MCP-BASED** updates via @mcp:filesystem → mcp3_write_file → All 17 files
- **`clean memory bank`**: Auto-archive via @mcp:filesystem → Prevent context pollution
- **`check memory status`**: EMD compliance via @mcp:filesystem → mcp3_get_file_info
- **`enforce EMD compliance`**: Auto-shrink via @mcp:filesystem operations

## 📁 MCP-Based JSON Operations (Real-Time)
- **`mcp3_read_text_file`**: Read current JSON state from memory-bank
- **`mcp3_write_file`**: Atomic JSON writes with validation
- **`mcp3_edit_file`**: Line-based JSON edits for precision updates
- **`mcp3_get_file_info`**: Verify file size (≤10KB) and integrity
- **Storage**: @mcp:memory (unlimited local) + @mcp:byterover-mcp (cloud backup)

**Core Principle**: AI agents read this CheatSheet from project rules for quick command reference while global behavior is governed by IDE settings.
