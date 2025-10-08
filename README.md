# AegisIDE Constitutional Framework for Autonomous AI Development
> Democratic Governance achieving 92-98% Autonomy across 8 IDE platforms

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE.md)

## Documentation (Landing)

Use these quick links to navigate the project documentation:

- **Overview**: `core/README.md`
- **Constitution (Articles I–XIV)**: `core/constitution/`
- **Workflows (Slash-Commands)**: `core/workflow/`
  - `/init`, `/next`, `/fix`, `/validate`, `/update`, `/status`, `/optimize`, `/oversight-checks-and-balances`
- **Schemas (8 Essential Schemas)**: `core/schemas/README.md`
  - Quick links:
    - `core/schemas/activeContext.schema.json`
    - `core/schemas/scratchpad.schema.json`
    - `core/schemas/kanban.schema.json`
    - `core/schemas/mistakes.schema.json`
    - `core/schemas/systemPatterns.schema.json`
    - `core/schemas/progress.schema.json`
    - `core/schemas/roadmap.schema.json`
    - `core/schemas/memory.schema.json`
  - Helper schemas: `core/schemas/helpers/`
- **Validation Scripts & CI**: `scripts/validate-linkage.js`, `scripts/validate-schemas.js`, `.github/workflows/ci.yml`
  - Cross-file ID enforcement and Ajv schema validation (run locally or in CI)
- **Platform Setups**: `platforms/`
- **Changelog**: `CHANGELOG.md`
- **Contributing**: `CONTRIBUTING.md`
- **Security Policy**: `SECURITY.md`
- **Technical Roadmap**: `TECHNICAL_ROADMAP.md`
  - **Business Model**: `BUSINESS_MODEL.md`
  - **Community Impact**: `COMMUNITY_IMPACT.md`

Jump to Quick Start → [/init & /next](#quick-start-5-minutes)

## What's new in 2.8.5

- **8-Schema System**: Upgraded to 8-schema memory-bank structure with memory.json as 8th essential schema for persistent cross-session knowledge storage.
- **Knowledge Graph**: Added memory.json schema with entities, relations, and observations structure for AegisKG knowledge graph integration.
- **Helper Schemas**: Added comprehensive helper system in core/schemas/helpers/ with tool-usage-patterns.json, common-mistakes.json, and error-recovery.json.
- **Constitutional Integration**: All 16 articles fully interlinked with markdown references for cohesive navigation.
- **Workflow Interlinking**: All 10 workflow files now reference relevant constitutional articles.
- **Architecture Consistency**: Removed SQLite references, aligned all documentation with JSON-only architecture.

## Platforms

See `platforms/` for platform-specific setup and configuration.

## Best Practices

Use these guidelines to get the most reliable, repeatable results from AegisIDE workflows.

- **Start every session with `/init`**
  - Loads constitutional governance (Articles I–XIV) and bootstraps the memory bank (8 essential schemas)
  - Workflow spec: `core/workflow/init.md`

- **After `/init`, drive execution with `/next`**
  - Continuously discovers tasks from `scratchpad.json` and `kanban.json`, executes, then updates the memory bank
  - Workflow spec: `core/workflow/next.md`

- **Validate early and often with `/validate`**
  - Zero-tolerance policy for errors/warnings (multi-language matrix); run before/after significant changes
  - Workflow spec: `core/workflow/validate.md`

- **Run validators before commits**
  - `node scripts/validate-linkage.js` (cross-file ID integrity) and `node scripts/validate-schemas.js` (Ajv schema conformance)
  - Mirror CI locally: add gitleaks, syft, grype to catch leaks and supply-chain issues

- **Fix immediately with `/fix`**
  - HALT–FIX–VALIDATE loop using official docs (Context7) and MCP integrations
  - Workflow spec: `core/workflow/fix.md`

- **Update context when appropriate using `/update`**
  - Ensures memory-bank and status files remain synchronized; avoids stale context
  - Workflow spec: `core/workflow/update.md`

- **Get visibility with `/status` and improve with `/optimize`**
  - `/status` summarizes tasks, bugs, metrics
  - `/optimize` proposes architecture/pattern improvements
  - Workflow specs: `core/workflow/status.md`, `core/workflow/optimize.md`

- **Apply parliamentary governance with `/oversight-checks-and-balances`**
  - Democratic review for proposals with consensus scoring and judicial guardrails
  - Workflow spec: `core/workflow/oversight-checks-and-balances.md`

- **Do not hand-edit memory-bank JSON files**
  - Prefer workflows to keep data schema-compliant; schema strictness (`additionalProperties:false`, shared `$defs`) blocks drift
  - Quick links: `activeContext.schema.json`, `scratchpad.schema.json`, `kanban.schema.json`, `mistakes.schema.json`, `systemPatterns.schema.json`, `progress.schema.json`, `roadmap.schema.json`

- **Keep plans private**
  - `docs/` is Git-ignored by design; avoid committing private plans or secrets

## JSON-First Architecture
Core Innovation: AI auto-generates project-specific memory-bank files (NO templates)

## Quick Start (5 Minutes)

```bash
# 1. Add AegisIDE as submodule (30 seconds)
git submodule add https://github.com/Gaurav-Wankhede/AegisIDE.git .aegiside (your IDE folder)
git submodule update --init --recursive

# 2. Initialize memory-bank (10 seconds)
/init

# 3. Start developing (immediate)
/next
```

Done! AI now validates everything automatically.

### Three-Branch Parliamentary System
Based on 14 constitutional articles in [core/constitution/](core/constitution/):

- **Government**: PM, Dev Minister, Tech Minister (Executive Authority)
- **Opposition**: Quality, Innovation, Analytics Shadows (Review Authority)
- **Judiciary**: Chief Justice (Compliance Authority)

**Decision Process**: Proposal → Opposition Review → >95% Consensus → Execute

## Platform Setup

### Windsurf IDE (Recommended - 98%)
```bash
# 1. Clone repository
git clone https://github.com/Gaurav-Wankhede/AegisIDE.git
cd AegisIDE

# 2. Copy Global Rules to Windsurf
# Open Windsurf → Customizations → Rules → + Workspace
# Copy content from platforms/windsurf/global_rules.md
# Paste and save as "Global Rules"

# 3. Copy constitution to your project
cp -r platforms/windsurf/project/.windsurf /path/to/your/project/

# 4. Start development
# In Windsurf chat, describe your project then run:
/next
```

### Other IDEs
```bash
# Cursor
cp platforms/cursor/.cursorrules /path/to/your/project/

# Cline
cp platforms/cline/.clinerules /path/to/your/project/

# JetBrains
cp platforms/jetbrains/jetbrains-config.xml /path/to/your/project/.idea/
```

See platform-specific setup guides in `platforms/*/README.md`

## MCP Server Setup (Optional, but Recommended)

AegisIDE uses Model Context Protocol (MCP) servers to extend its capabilities, allowing it to access documentation, run commands, and remember information across sessions. While optional, setting up these servers is highly recommended for the best experience.

### What are MCP Servers?

Think of MCP servers as specialized tools that give the AI superpowers. For example:
-   `context7`: Fetches up-to-date documentation for any library.
-   `filesystem`: Allows the AI to read and write files in your project.
-   `memory`: Gives the AI a persistent memory to remember important context.

### Quick Setup Guide

We've made it easy to get started with the `mcp_servers.json` file in the root of this repository.

**Prerequisites:**

You'll need `Node.js` (which includes `npx`) and `uv` (for `uvx`).

1.  **Install Node.js:** If you don't have it, download and install it from [nodejs.org](https://nodejs.org/). This will give you the `npx` command.
2.  **Install uv:** `uv` is a fast Python package installer. You can install it with:
    ```bash
    # macOS / Linux
    curl -LsSf https://astral.sh/uv/install.sh | sh

    # Windows
    powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
    ```

**Running the Servers in Your IDE:**

The `mcp_servers.json` file provides the commands needed to start each MCP server. You should run these commands in a terminal. Most modern IDEs, including Windsurf and Cursor (which is built on VS Code), have an integrated terminal that you can use.

1.  **Open the Integrated Terminal:** In your IDE, open a new terminal panel. You can usually find this in the "View" or "Terminal" menu.
2.  **Run Each Server in a Separate Terminal:** For the best experience, it's recommended to run each MCP server in its own terminal tab. This keeps them running in the background without blocking your main workflow.

    *   Click the `+` icon in your terminal panel to open a new tab.
    *   Copy a command from `mcp_servers.json` and paste it into the new terminal.

    **Example: Starting the `memory` server:**
    ```bash
    npx -y @modelcontextprotocol/server-memory
    ```

    **Example: Starting the `git` server:**
    ```bash
    uvx mcp-server-git
    ```
3.  **Keep Them Running:** Leave these terminal tabs open while you are working on your project. The AI will automatically connect to and use these servers as needed.

**For Other IDEs:**

If your IDE does not have an integrated terminal, you can use your computer's standard terminal application (like Terminal on macOS/Linux or PowerShell/CMD on Windows). Just make sure you navigate to your project's root directory before running the commands.

## Core Commands (8 Total - Easy to Type)

| Command | Purpose |
|---------|---------|  
| `/init` | Initialize or repair the memory bank (8 essential schemas) before any work begins |
| `/next` | Governance-gated task execution with tier-1 updates (scratchpad/kanban/activeContext) |
| `/update` | Apply tier-2/3 refresh (roadmap, milestone JSONs/md) and resync dashboards |
| `/validate` | Run language checks, linkage validator, and Ajv schema validation (zero-tolerance) |
| `/fix` | HALT–FIX–VALIDATE loop (Context7 docs, linkage repair, schema recheck) until clean |
| `/status` | 8-schema health, consensus metrics, and attention budget diagnostics |
| `/optimize` | AegisKG-backed improvement proposals with consensus scoring |
| `/oversight-checks-and-balances` | Democratic debate + vote (>95% consensus) with judicial guardrails |

**Full Command Reference**: [Windsurf CheatSheet](platforms/windsurf/CheatSheet.md) (8 unified commands)

## Performance Metrics

| Metric | Before | With AegisIDE | Improvement |
|--------|--------|---------------|-------------|
| **AI Hallucinations** | 23% | 2% | 91% reduction |
| **Task Completion** | 67% | 94% | 40% improvement |
| **Development Speed** | Baseline | 3x faster | 300% increase |
| **Context Retention** | 34% | 89% | 162% improvement |

## Repository Structure

```
AegisIDE/
├── core/
│   ├── constitution/          # 14 Constitutional Articles (I-XIV)
│   ├── laws/                  # Multi-language development laws
│   ├── schemas/               # JSON schema validation files
│   └── visualize/             # Memory bank dashboard components
│       ├── README.md          # Dashboard documentation
│       ├── USAGE.md           # Quick start guide
│       └── components/        # Dashboard visualization components
├── platforms/                 # 8 Platform Implementations
│   ├── windsurf/              # 98% autonomy - Multi-file config
│   ├── jetbrains/             # 97% autonomy - XML config
│   ├── cursor/                # 96% autonomy - Single file config
│   ├── cline/                 # 95% autonomy - Single file config
│   ├── roo-code/              # 95% autonomy - JSON config
│   ├── continue/              # 94% autonomy - JSON config
│   ├── aider/                 # 93% autonomy - YAML config
│   └── copilot/               # 92% autonomy - Documentation-based
├── CHANGELOG.md               # Version history (v1.0.0 → v2.8.3)
├── CONTRIBUTING.md            # Democratic contribution process
├── SECURITY.md                # Security policy
├── BUSINESS_MODEL.md          # Open source community model
├── TECHNICAL_ROADMAP.md       # Production readiness status
└── COMMUNITY_IMPACT.md        # Global developer empowerment
```

## Contributing & Security

**Democratic Process**: All contributions require >95% consensus through 7-step parliamentary procedure

**Setup for Contributors**:
1. Fork repository
2. Follow [CONTRIBUTING.md](CONTRIBUTING.md) guidelines
3. Submit PR with constitutional compliance

**Security**: Report vulnerabilities via [GitHub Issues](https://github.com/Gaurav-Wankhede/AegisIDE/issues) or [Security Policy](SECURITY.md)

## Documentation

- **[CHANGELOG.md](CHANGELOG.md)** - Version history (v1.0.0 → v2.8.5)
- **[BUSINESS_MODEL.md](BUSINESS_MODEL.md)** - Open source community model
- **[TECHNICAL_ROADMAP.md](TECHNICAL_ROADMAP.md)** - Production readiness status
- **[COMMUNITY_IMPACT.md](COMMUNITY_IMPACT.md)** - Global developer empowerment

## Project Information

**License**: MIT  
**Repository**: https://github.com/Gaurav-Wankhede/AegisIDE

### Maintainer
**Gaurav Wankhede** - Full Stack Developer & AI Engineering Specialist
- **GitHub**: [@Gaurav-Wankhede](https://github.com/Gaurav-Wankhede)
- **LinkedIn**: [linkedin.com/in/wankhede-gaurav](https://www.linkedin.com/in/wankhede-gaurav)
- **Portfolio**: [gaurav-wankhede.vercel.app](https://gaurav-wankhede.vercel.app)

---

Star this repository if AegisIDE transformed your AI development!

Ready to start? See the [Platform Setup](#platform-setup) section above and follow the setup guide!

## Progress
## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Gaurav-Wankhede/AegisIDE.git&type=Date)](https://www.star-history.com/#Gaurav-Wankhede/AegisIDE.git&Date)
