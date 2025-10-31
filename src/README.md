# AegisIDE - Constitutional AI Framework

Democratic governance + persistent memory + autonomous workflows for AI development.

## Structure

```
.aegiside/           # GitHub-First Architecture (128 files)
├── routers/         # 2 configs (context-router.json, skills.json)
├── workflows/       # 19 workflows + scripts/2 (github sync)
├── constitution/    # 43 articles (1 preamble + 42 articles)
├── schemas/         # 19 validators (fetched on-demand)
├── architecture/    # 5 files (mermaid, codemap, relations)
├── enforcement/     # 28 files (engine.json + README + shell/26 scripts)
└── visualize/       # 6 files (dashboard.html + README + startup scripts)

memory-bank/         # Local only (8 JSON files, ~2KB)
system-prompt.md     # IDE global rules
mcp_servers.json     # 6 mandatory MCPs
setup.sh             # v4.0.0 minimal setup (297 lines)
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

### Quick Setup (2 minutes)
```bash
bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh)
```
**What it does (v4.0.0):**
- System prompt (DIFF-FIRST with user approval)
- MCP config (APPEND-ONLY, never replaces)
- Empty memory-bank/ directory
- Optional git init
- Framework files fetched from GitHub on-demand (always fresh)

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