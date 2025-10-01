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

## 🚀 **Primary Autonomous Commands (Universal)**
- **`what next`** — Read scratchpad.md → identify next task → execute immediately → update files → continue to next task [ALL MODELS]
- **`implement next task`** — Execute current scratchpad task → update all files → auto-load next task → continue execution [ALL MODELS]  

## 🔄 **Auto-Chain Workflow (Never Stops)**
**EVERY TASK COMPLETION AUTOMATICALLY TRIGGERS**:
1. **Auto-update scratchpad.md** — Remove completed task, add next priority task
2. **Auto-update roadmap.md** — Mark milestone progress, recalculate priorities
3. **Auto-update memory-bank files** — Refresh activeContext, progress, mistakes
4. **Auto-execute next task** — NO command needed, continue autonomously

**AUTONOMOUS WORKFLOW**:
```
Task Complete → Update Files → Load Next Task → Execute → Repeat
```

## 💾 **Memory Bank Management (Auto-Updated)**
- **`initialize memory bank`** — Auto-generate 8 core files + roadmap + templates → rules integration [NEW SESSIONS]
- **`update memory bank`** — AUTOMATIC after every task - refresh all memory files (no manual trigger needed)
- **`clean memory bank`** — AUTOMATIC after every iteration - remove completed tasks, prevent context pollution

## ⚡ **Quality Assurance (Auto-Triggered)**
- **Always-Check Commands** — Auto-execute before any implementation: `cargo check`, `pnpm typecheck`, `npm run lint`, `pytest`, `go test`
- **Error Resolution** — Auto-fix compilation failures, resolve linting issues, optimize performance automatically
- **EMD Compliance** — Files ≤80 lines, auto-split when approaching limit, deep nested structure enforcement

## 🔧 **Fallback Commands (New Sessions)**
**When starting fresh sessions, use these to restore automation**:
- **`initialize memory bank`** — Set up complete project structure with 8 core files + roadmap + templates
- **`scan existing project`** — Analyze current codebase, create missing memory-bank files, establish automation
- **`restore autonomous workflow`** — Re-enable task chaining, auto-updates, continuous execution for existing projects

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

### **Task Completion Checklist**
- [ ] Task implemented and tested
- [ ] scratchpad.md updated (completed task removed, next task highlighted)
- [ ] roadmap.md updated (milestone progress marked)
- [ ] memory-bank files updated (activeContext, progress, mistakes)
- [ ] Next task identified and execution started
- [ ] Quality checks passed (linting, compilation, tests)

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
