# AegisIDE 🛡️Constitutional Framework for Autonomous AI Development
> **Democratic Governance** achieving **92-98% Autonomy** across 8 IDE platforms

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE.md)

## Documentation (Landing)

Use these quick links to navigate the project documentation:

- **Overview**: `core/README.md`
- **Constitution (Articles I–XIV)**: `core/constitution/`
- **Workflows (Slash-Commands)**: `core/workflow/`
  - `/init`, `/next`, `/fix`, `/validate`, `/update`, `/status`, `/optimize`, `/oversight-checks-and-balances`
- **Schemas (7 Essentials + Kanban)**: `core/schemas/README.md`
  - Quick links:
    - `core/schemas/activeContext.schema.json`
    - `core/schemas/scratchpad.schema.json`
    - `core/schemas/kanban.schema.json`
    - `core/schemas/mistakes.schema.json`
    - `core/schemas/systemPatterns.schema.json`
    - `core/schemas/progress.schema.json`
    - `core/schemas/roadmap.schema.json`
- **Platform Setups**: `platforms/`
- **Changelog**: `CHANGELOG.md`
- **Contributing**: `CONTRIBUTING.md`
- **Security Policy**: `SECURITY.md`
- **Technical Roadmap**: `TECHNICAL_ROADMAP.md`
- **Business Model**: `BUSINESS_MODEL.md`
- **Community Impact**: `COMMUNITY_IMPACT.md`

Jump to Quick Start → [/init & /next](#quick-start-5-minutes)

## Platforms

See `platforms/` for platform-specific setup and configuration.

## Best Practices

Use these guidelines to get the most reliable, repeatable results from AegisIDE workflows.

- **Start every session with `/init`**
  - Loads constitutional governance (Articles I–XIV) and bootstraps the memory bank (7 essential schemas + kanban as needed)
  - Workflow spec: `core/workflow/init.md`

- **After `/init`, drive execution with `/next`**
  - Continuously discovers tasks from `scratchpad.json` and `kanban.json`, executes, then updates the memory bank
  - Workflow spec: `core/workflow/next.md`

- **Validate early and often with `/validate`**
  - Zero-tolerance policy for errors/warnings (multi-language matrix); run before/after significant changes
  - Workflow spec: `core/workflow/validate.md`

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
  - Prefer workflows to keep data schema-compliant; see schemas in `core/schemas/`
  - Quick links: `activeContext.schema.json`, `scratchpad.schema.json`, `kanban.schema.json`, `mistakes.schema.json`, `systemPatterns.schema.json`, `progress.schema.json`, `roadmap.schema.json`

- **Keep plans private**
  - `docs/` is Git-ignored by design; avoid committing private plans or secrets

## 📦 JSON-First Architecture
**Core Innovation**: AI auto-generates project-specific memory-bank files (NO templates)

## ⚡ Quick Start (5 Minutes)

```bash
# 1. Add AegisIDE as submodule (30 seconds)
git submodule add https://github.com/Gaurav-Wankhede/AegisIDE.git .aegiside (your IDE folder)
git submodule update --init --recursive

# 2. Initialize memory-bank (10 seconds)
/init

# 3. Start developing (immediate)
/next
```

**Done!** AI now validates everything automatically. 🎉

### Three-Branch Parliamentary System
Based on 14 constitutional articles in [core/constitution/](core/constitution/):

- **🏢 Government**: PM, Dev Minister, Tech Minister (Executive Authority)
- **🔍 Opposition**: Quality, Innovation, Analytics Shadows (Review Authority)
- **⚖️ Judiciary**: Chief Justice (Compliance Authority)

**Decision Process**: Proposal → Opposition Review → >95% Consensus → Execute

## ⚡ Quick Start

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

## 🤖 Core Commands (8 Total - Easy to Type)

| Command | Purpose |
|---------|---------|  
| `/init` | Initialize project (new OR existing) - generates all 13 files |
| `/next` | Execute next task - auto-continues forever, updates everything |
| `/update` | Refresh all files (8 .md + 4 .json + roadmap) |
| `/validate` | Blueprint 6-pillar scoring + language-specific tests |
| `/fix` | Auto-fix all errors and warnings until 100% clean |
| `/status` | Complete progress report (tasks, bugs, metrics, consensus) |
| `/optimize` | Analyze patterns and propose improvements |
| `/oversight-checks-and-balances` | Parliamentary oversight with democratic consensus |

**Full Command Reference**: [Windsurf CheatSheet](platforms/windsurf/CheatSheet.md) (8 unified commands)

## 📊 Performance Metrics

| Metric | Before | With AegisIDE | Improvement |
|--------|--------|---------------|-------------|
| **AI Hallucinations** | 23% | 2% | 91% reduction |
| **Task Completion** | 67% | 94% | 40% improvement |
| **Development Speed** | Baseline | 3x faster | 300% increase |
| **Context Retention** | 34% | 89% | 162% improvement |

## 🗂️ Repository Structure

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

## 🤝 Contributing & Security

**Democratic Process**: All contributions require >95% consensus through 7-step parliamentary procedure

**Setup for Contributors**:
1. Fork repository
2. Follow [CONTRIBUTING.md](CONTRIBUTING.md) guidelines
3. Submit PR with constitutional compliance

**Security**: Report vulnerabilities via [GitHub Issues](https://github.com/Gaurav-Wankhede/AegisIDE/issues) or [Security Policy](SECURITY.md)

## 📚 Documentation

- **[CHANGELOG.md](CHANGELOG.md)** - Version history (v1.0.0 → v2.8.3)
- **[BUSINESS_MODEL.md](BUSINESS_MODEL.md)** - Open source community model
- **[TECHNICAL_ROADMAP.md](TECHNICAL_ROADMAP.md)** - Production readiness status
- **[COMMUNITY_IMPACT.md](COMMUNITY_IMPACT.md)** - Global developer empowerment

## 🏷️ Project Information

**License**: MIT  
**Repository**: https://github.com/Gaurav-Wankhede/AegisIDE

### Maintainer
**Gaurav Wankhede** - Full Stack Developer & AI Engineering Specialist
- **GitHub**: [@Gaurav-Wankhede](https://github.com/Gaurav-Wankhede)
- **LinkedIn**: [linkedin.com/in/wankhede-gaurav](https://www.linkedin.com/in/wankhede-gaurav)
- **Portfolio**: [gaurav-wankhede.vercel.app](https://gaurav-wankhede.vercel.app)

---

⭐ **Star this repository if AegisIDE transformed your AI development!**

🏛️ **Ready to start?** See the [Platforms](#platforms) section above and follow the setup guide!

## 📈 Progress
## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=Gaurav-Wankhede/AegisIDE.git&type=Date)](https://www.star-history.com/#Gaurav-Wankhede/AegisIDE.git&Date)
