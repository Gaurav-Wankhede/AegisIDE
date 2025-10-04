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

## 🚀 **Primary Commands (Unified - Easy to Type)**
- **`init`** — Initialize OR restore project → Auto-detects existing memory-bank → Resumes session OR generates 13 files [ALL MODELS]
- **`next`** — Execute next task → Auto-continues forever → Updates everything → NEVER STOPS until tasks empty [ALL MODELS]
- **`update`** — Refresh ALL 13 files (8 .md + 4 .json + roadmap) → Attention optimization → Context health [ALL MODELS]

## 🔄 **Session Resume (Existing Projects - ZERO MANUAL INPUT)**
**When you open an existing project in new session**:
```
1. AI auto-scans: .windsurf/memory-bank/ (13 files)
2. IF found → Auto-loads ALL files into context
3. AI says: "Session restored. Ready to continue."
4. Just type: next (or AI auto-triggers it)
5. Workflow resumes from exactly where you left off
```

**What AI reads automatically**:
- scratchpad.md OR kanban.json (pending tasks)
- activeContext.md (last session state)
- blueprint.json (project requirements)
- bugfix.json (known issues)
- All 8 other memory-bank files

**You DON'T need to**:
- ❌ Describe the project again
- ❌ Explain what you were working on
- ❌ Manually load any files
- ✅ Just type: `next`

## 🔄 **Auto-Chain Workflow (Blueprint-Integrated)**
**EVERY TASK COMPLETION AUTOMATICALLY TRIGGERS**:
1. **Auto-update scratchpad.md + kanban.json** — Remove completed task, update task status (todo→in_progress→done→approved)
2. **Auto-update roadmap.md + blueprint.json** — Mark milestone progress, recalculate priorities, update blueprint scores
3. **Auto-update memory-bank files** — Refresh activeContext, progress, mistakes (all 8 files)
4. **Auto-update JSON files** — Update userflow.json completion %, bugfix.json bug stats, kanban.json metrics
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
1. **Read scratchpad.md** at start of every interaction
2. **Execute task** from scratchpad without asking permission  
3. **Update files** automatically after task completion
4. **Load next task** from updated scratchpad
5. **Continue execution** until scratchpad is empty
6. **NEVER STOP** after completing just one task

### **Task Completion Checklist (Blueprint-Integrated)**
- [ ] Task implemented and tested
- [ ] scratchpad.md + kanban.json updated (completed task removed/status updated, next task highlighted)
- [ ] roadmap.md + blueprint.json updated (milestone progress marked, blueprint scores refreshed)
- [ ] memory-bank files updated (all 8: activeContext, progress, mistakes, systemPatterns, techContext, productContext, projectbrief, roadmap)
- [ ] JSON files updated (userflow completion %, bugfix bug stats, kanban metrics)
- [ ] Bug detection scan completed → bugfix.json updated if issues found
- [ ] Next task identified from kanban.json OR scratchpad.md and execution started
- [ ] Quality checks passed (linting, compilation, tests) → validation recorded in kanban task

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

**Core Principle**: AI agents read this CheatSheet from project rules for quick command reference while global behavior is governed by IDE settings.
