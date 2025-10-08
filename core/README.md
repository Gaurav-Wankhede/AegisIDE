# 🏗️ AegisIDE Core Framework

> **The brain behind autonomous AI development** - Universal framework for all platforms

## 🎯 What's In This Folder?

This is the **core framework** that powers AegisIDE across all 8 platforms. Think of it as:
- 📜 **Constitution** - The rules AI follows (17 articles)
- 🧠 **Memory System** - How AI remembers (8 JSON schemas)  
- ⚙️ **Workflows** - What commands do (12 workflows)
- 📐 **Laws** - Language-specific rules (37 files)
- 📊 **Visualize** - Real-time dashboard (3 files)

**Important**: You don't need to understand everything here to use AegisIDE. This is reference material for advanced users and contributors.

---

## 📦 What's New in v2.8.5

✨ **8-Schema Memory System** - Added `memory.json` for persistent cross-session knowledge  
🧠 **Knowledge Graph** - AI now remembers patterns across all your projects  
🛡️ **Helper Schemas** - Built-in error prevention and recovery patterns  
🔗 **Better Integration** - All 16 constitutional articles now interlink seamlessly  
⚡ **Pure JSON** - 2.6x faster than markdown, zero parsing ambiguity

---

## Structure

```
core/
├── constitution/ (17 articles - Universal governance)
│   ├── article-I.md (Indian Constitutional Governance)
│   ├── article-II.md (Autonomous Decision Making)
│   ├── article-III.md (Context-Engineered Development)
│   ├── article-III-A.md (Implementation Protocols & MCP)
│   ├── article-IV.md (Fundamental Principles)
│   ├── article-V.md (Communication Protocols)
│   ├── article-VI.md (Constitutional Amendments)
│   ├── article-VII.md (IAS-Led Autonomous Operations)
│   ├── article-VIII.md (Terminal Safety & Commands)
│   ├── article-IX.md (Security & Access Control)
│   ├── article-X.md (Integration & Interoperability)
│   ├── article-XI.md (IAS-Led Compliance)
│   ├── article-XII.md (Continuous Operations)
│   ├── article-XIII.md (Judicial Validation & Debugging)
│   ├── article-XIV.md (Blueprint & Autonomous Development)
│   ├── article-XV.md (Tool Governance & Error Prevention)
│   └── article-XVI.md (Knowledge Graph Governance)
├── laws/ (37 language-specific law files)
│   ├── python.md, rust.md, typescript.md, javascript.md
│   ├── nextjs.md, react.md, angular.md, vue.md, svelte.md
│   ├── java.md, go.md, csharp.md, kotlin.md, swift.md
│   ├── ruby.md, php.md, nodejs-express.md, fastapi.md
│   ├── docker.md, databases.md, cloud-devops.md
│   └── ... (and 17 more specialized frameworks)
├── schemas/ (8 essential JSON schemas + helpers)
│   ├── activeContext.schema.json (5KB)
│   ├── scratchpad.schema.json (3.5KB)
│   ├── kanban.schema.json (4KB)
│   ├── mistakes.schema.json (5KB)
│   ├── systemPatterns.schema.json (7.5KB)
│   ├── progress.schema.json (5KB)
│   ├── roadmap.schema.json (4KB)
│   ├── memory.schema.json (5.5KB)
│   └── helpers/ (3 helper schemas)
│       ├── tool-usage-patterns.json
│       ├── common-mistakes.json
│       └── error-recovery.json
├── workflow/ (12 workflow specifications)
│   ├── init.md (Initialize memory bank)
│   ├── next.md (Execute next task)
│   ├── validate.md (Multi-language validation)
│   ├── fix.md (Error resolution)
│   ├── update.md (Context refresh)
│   ├── status.md (Progress report)
│   ├── optimize.md (Performance analysis)
│   ├── oversight-checks-and-balances.md (Democratic review)
│   ├── bootstrap.md, continue.md, research.md
│   └── memory-status.md
├── visualize/ (Real-time dashboard - 3 files)
│   ├── dashboard.html (11KB single-file dashboard)
│   ├── README.md (Feature documentation)
│   └── USAGE.md (Quick start guide)
└── README.md (this file)
```

**Note**: Memory-bank files are NOT provided as templates. They are **autonomously generated** when you run `/init` based on your project requirements.

## 📊 Framework Statistics

### Constitution (17 Articles - ~70KB Total)

| Article | Size | Purpose |
|---------|------|--------|
| Article I | 6.0KB | Indian Constitutional Governance |
| Article II | 6.5KB | Autonomous Decision Making |
| Article III | 3.7KB | Context-Engineered Development |
| Article III-A | 4.8KB | Implementation Protocols & MCP |
| Article IV | 4.0KB | Fundamental Principles |
| Article V | 5.4KB | Communication Protocols |
| Article VI | 3.9KB | Constitutional Amendments |
| Article VII | 3.8KB | IAS-Led Autonomous Operations |
| Article VIII | 4.0KB | Terminal Safety & Commands |
| Article IX | 3.9KB | Security & Access Control |
| Article X | 3.7KB | Integration & Interoperability |
| Article XI | 3.9KB | IAS-Led Compliance Governance |
| Article XII | 3.5KB | Continuous Operations |
| Article XIII | 3.7KB | Judicial Validation & Debugging |
| Article XIV | 4.1KB | Blueprint & Autonomous Development |
| Article XV | 4.1KB | Tool Governance & Error Prevention |
| Article XVI | 3.6KB | Knowledge Graph Governance |

### Laws (37 Files - ~370KB Total)

Language-specific development laws covering:
- **Core Languages**: Python, Rust, TypeScript, JavaScript, Go, Java, C#, PHP, Ruby, Swift, Kotlin
- **Frameworks**: Next.js, React, Angular, Vue, Svelte, FastAPI, Flask, Django, Spring, Laravel
- **Infrastructure**: Docker, Cloud/DevOps, Databases, SQL/ORM
- **Specialized**: Testing, Mobile, Graphics/Game Dev, Web Scraping, Real-time/WebSockets

### Schemas (8 Essential + 3 Helpers - ~50KB Total)

JSON schema definitions ensuring data integrity and 2.6x faster AI processing.

### Workflows (12 Commands - ~60KB Total)

Canonical specifications for all autonomous operations.

## Platform Adaptations

Each platform adapts this core framework based on their file size limits:

### Multi-File Platforms (Use Full Structure)
- **Windsurf**: Copies all 17 articles to `.windsurf/rules/constitution/`
- **JetBrains**: Converts 17 articles to XML in `.idea/` folder
- **Roo Code**: Splits 17 articles into JSON mode configurations

### Single-File Platforms (Condensed Version)
- **Cline**: Condenses to single `.clinerules` file (~10KB)
- **Cursor**: Condenses to `project-rules.md` (~11KB)
- **Continue.dev**: Condenses to `.continuerc.json` (~12KB)
- **Aider**: Condenses to `.aider.conf.yml` (~12KB)

## Memory Bank Auto-Initialization

**Memory-bank files are NOT static templates.** They are autonomously generated based on your project context.

### Initialization Process

1. **User provides project context**: Describe your project requirements, features, tech stack
2. **User runs command**: `/init`
3. **AI autonomously generates**: 8 essential memory-bank JSON files based on your project context
4. **Continuous updates**: Files are autonomously updated throughout project lifecycle

### Auto-Generated Files (8 Essential JSON Schemas)

1. **scratchpad.json** - Immediate priorities with MCP validation state (30% attention)
2. **activeContext.json** - Real-time execution state with session management (25% attention)
3. **mistakes.json** - Error patterns with Context7 source prioritization (20% attention)
4. **systemPatterns.json** - Architecture patterns with AegisKG networks (10% attention)
5. **progress.json** - Development milestones with constitutional metrics (10% attention)
6. **roadmap.json** - Strategic planning with strategic alignment (5% attention)
7. **kanban.json** - Task workflow and governance signals (columns, status, consensus)
8. **memory.json** - Knowledge graph for persistent cross-session memory

**Performance Features**:
- 2.6x faster JSON parsing (≤10KB per file)
- 65% memory optimization with structured data
- AegisKG local knowledge graph integration

## Workflows (Supported)

- `/init` — Initialize/repair memory bank and schemas
- `/next` — Execute next tasks with governance gate and tiered updates
- `/validate` — Run Ajv + linkage validator (+ language checks when present)
- `/fix` — HALT–FIX–VALIDATE protocol with Context7 docs
- `/update` — Refresh Tier‑2/3 context (roadmap, dashboards)
- `/status` — Summarize tasks, bugs, metrics, consensus
- `/optimize` — Propose improvements with AegisKG context
- `/oversight-checks-and-balances` — Democratic challenge and consensus

### Example Workflow

```bash
# Step 1: Describe your project in chat
"I want to build a job scraper with Python, Selenium, and Streamlit. 
Features: LinkedIn scraping, skill matching, database storage."

# Step 2: Initialize memory bank
/init

# Step 3: AI autonomously creates 7 essential schemas based on your description
# - scratchpad.json: Initial tasks with MCP validation
# - activeContext.json: Current execution state
# - mistakes.json: Error patterns with Context7 prioritization
# - systemPatterns.json: Architecture patterns with AegisKG
# - progress.json: Milestones with constitutional metrics
# - roadmap.json: Strategic planning with SQLite alignment
# - kanban.json: Task workflow and governance signals

# Step 4: Start development - files auto-update
/next
```

**No manual file creation needed** - The framework understands your project and generates appropriate structure.

## Core Principles (Universal)

1. **Framework Supremacy**: Constitution + Laws + Memory-Bank as SUPREME LAW
2. **Autonomous Execution**: 0-98% autonomy = EXECUTE IMMEDIATELY
3. **Tri-Branch Governance**: Executive/Legislative/Judicial branches
4. **Session Continuity**: Auto-resume from checkpoints
5. **MCP Integration**: 9 servers for real-time operations
6. **Terminal Safety**: Cross-platform command validation
7. **EMD Compliance**: ≤80 lines per code file, ≤100 lines per memory-bank file

## Usage

### For Platform Developers

When creating a new platform adaptation:

1. **Multi-File Platforms**: Copy entire `constitution/` folder
2. **Single-File Platforms**: Condense articles into platform-specific format
3. **Always Include**: Autonomous startup, Session continuity, Memory bank structure, MCP integration
4. **Respect Limits**: Keep within platform's optimal character limit (see PLATFORM_COMPARISON.md)

### For Users

**First-Time Setup**:
1. Install your preferred IDE/platform (Windsurf, Cline, Cursor, etc.)
2. Copy platform-specific files to your project
3. Describe your project to the AI
4. Run `/init`
5. AI autonomously generates 8 essential JSON schemas with AegisKG integration
6. Start development with `/next` (continuous autonomous execution)

**Key Points**:
- Memory-bank is **auto-generated**, not copied from templates
- AI understands your project requirements and creates tailored files
- Files update autonomously throughout project lifecycle

## Maintainer

**Gaurav Wankhede**
- Portfolio: https://gaurav-wankhede.vercel.app
- GitHub: https://github.com/Gaurav-Wankhede
- Repository: https://github.com/Gaurav-Wankhede/AegisIDE

## License

MIT License - See LICENSE.md in project root
