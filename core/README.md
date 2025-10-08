# Core Universal Framework (v2.8.5)

This folder contains the **universal constitutional framework** that serves as the foundation for all platform-specific adaptations.

## Latest Updates (v2.8.5)
- **8-Schema System**: Upgraded to 8-schema memory-bank structure with memory.json as 8th essential schema for persistent cross-session knowledge storage.
- **Knowledge Graph**: Added memory.json schema with entities, relations, and observations structure for AegisKG knowledge graph integration.
- **Helper Schemas**: Added comprehensive helper system in `core/schemas/helpers/` with `tool-usage-patterns.json`, `common-mistakes.json`, and `error-recovery.json`.
- **Constitutional Integration**: All 16 articles fully interlinked with markdown references for cohesive navigation.
- **Workflow Interlinking**: All 10 workflow files now reference relevant constitutional articles.
- **Architecture Consistency**: Removed SQLite references, aligned all documentation with JSON-only architecture.

## Structure

```
core/
├── constitution/ (16 articles - Universal governance)
│   ├── article-I.md (Tri-branch governance)
│   ├── article-II.md (Decision-making)
│   ├── article-III.md (Workflow)
│   ├── article-IV.md (Principles)
│   ├── article-V.md (Communication)
│   ├── article-VI.md (Amendments)
│   ├── article-VII.md (Autonomous authority)
│   ├── article-VIII.md (Terminal safety)
│   ├── article-IX.md (Security)
│   ├── article-X.md (MCP integration)
│   ├── article-XI.md (Compliance)
│   ├── article-XII.md (30-hour operation)
│   ├── article-XIII.md (Judicial debugging)
│   └── article-XIV.md (Blueprint & Autonomous Development)
├── schemas/ (8 essential JSON schemas + helpers)
│   ├── activeContext.schema.json
│   ├── scratchpad.schema.json
│   ├── mistakes.schema.json
│   ├── systemPatterns.schema.json
│   ├── progress.schema.json
│   ├── roadmap.schema.json
│   ├── kanban.schema.json
│   └── memory.schema.json
│   └── helpers/
│       ├── tool-usage-patterns.json
│       ├── common-mistakes.json
│       └── error-recovery.json
├── visualize/ (Real-time dashboard)
│   ├── dashboard.html (Single-file HTML dashboard)
│   ├── README.md (Complete feature documentation)
│   └── USAGE.md (Quick start guide)
└── README.md (this file)
```

**Note**: Memory-bank files are NOT provided as templates. They are **autonomously generated** when you run `/init` based on your project requirements.

## Constitution Files

All 16 constitutional articles follow the **12KB optimal limit** for cross-platform compatibility.

### Current Sizes (Post v2.8.4)

| Article | Size | Status | Recent Changes |
|---------|------|--------|-----------------|
| Article I | ~2.5KB | Optimal | Tri-branch governance |
| Article II | ~2.7KB | Optimal | Decision-making |
| Article III | **4.3KB** | **Optimized** | **Workflow foundation** |
| Article III-A | **4.5KB** | **Optimized** | **Implementation protocols** |
| Article IV | ~3.3KB | Optimal | Quality standards |
| Article V | ~4.5KB | Optimal | Team communication |
| Article VI | ~2.5KB | Optimal | Amendments |
| Article VII | ~1.5KB | Optimal | Autonomous authority |
| Article VIII | ~3.2KB | Optimal | Terminal safety |
| Article IX | ~1.5KB | Optimal | Security |
| Article X | ~3.1KB | Optimal | MCP integration |
| Article XI | ~1.2KB | Optimal | Compliance |
| Article XII | ~5.1KB | Optimal | 30-hour operation |
| Article XIII | ~3.8KB | Optimal | Judicial debugging |
| Article XIV | ~6.8KB | Optimal | Blueprint development |
| **Total** | **~58KB** | **Production Ready** | **8-schema optimized** |

## Platform Adaptations

Each platform adapts this core framework based on their file size limits:

### Multi-File Platforms (Use Full Structure)
- **Windsurf**: Copies all 13 articles to `.windsurf/rules/constitution/`
- **JetBrains**: Converts to XML in `.idea/` folder
- **Roo Code**: Splits into JSON mode configurations

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
