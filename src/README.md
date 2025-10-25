# AegisIDE - Constitutional AI Framework

Democratic governance + persistent memory + autonomous workflows for AI development.

## Structure

```
.aegiside/
├── routers/          # 15 JSON configs (context-router, core, mcps, etc.)
├── workflows/        # 8 auto-triggered workflows
├── constitution/     # 43 articles (preamble + 42)
├── schemas/          # 8 validation + 9 helpers
├── memory-bank/      # 8 runtime files (gitignored)
└── architecture/     # Mermaid diagram + metadata

system-prompt.md      # IDE global rules
mcp_servers.json      # 6 mandatory MCPs
```

## Features

- **8-Schema Memory**: activeContext, scratchpad, kanban, mistakes, systemPatterns, progress, roadmap, memory
- **Tri-Branch Governance**: Executive, Legislative, Judicial (>95% consensus)
- **Autonomous Execution**: 0-99% band (no permission prompts)
- **RL System**: +5 to +50 rewards, -5 to -50 penalties, PPO+GAE algorithm
- **6 Mandatory MCPs**: json-jq, sequential-thinking, git, context7, exa, fetch
- **Zero-Tolerance Validation**: HALT-FIX-VALIDATE loop
- **182-Line Architecture**: Complete system visualization in Mermaid

## Installation

### CURL (Full Automation)
```bash
bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh)
```
- Installs system prompt + framework
- Configures 6 MCPs
- Auto-detects 4 scenarios (fresh/existing/update/up-to-date)

### System Prompt Only (Lightweight)
```bash
# Windsurf
cp src/system-prompt.md ~/.codeium/windsurf-next/memories/global_rules.md

# Cursor
cp src/system-prompt.md ~/.cursor/memories/global_rules.mdc

# Restart IDE
```
- One-time global install
- Auto-initializes per project
- Git diff auto-updates

---

**GitHub**: https://github.com/Gaurav-Wankhede/AegisIDE  
**License**: MIT