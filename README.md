# AegisIDE

Constitutional AI framework for autonomous development.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE.md)
[![Version](https://img.shields.io/badge/version-3.4.0-blue.svg)](CHANGELOG.md)

## Features

- 🧠 **Persistent Memory**: 8-schema system (activeContext, scratchpad, kanban, mistakes, systemPatterns, progress, roadmap, memory)
- ⚡ **Autonomous**: 0-99% execution without permission prompts
- 📚 **RL Learning**: PPO+GAE algorithm, +5 to +50 rewards, -5 to -50 penalties
- 🏛️ **Democratic Governance**: Tri-branch system (>95% consensus required)
- 🔧 **6 Mandatory MCPs**: json-jq, sequential-thinking, git, context7, exa, fetch

## Install

### Method 1: CURL (Full Automation)
```bash
bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh)
```

### Method 2: System Prompt Only
```bash
# Windsurf
cp src/system-prompt.md ~/.codeium/windsurf-next/memories/global_rules.md

# Cursor
cp src/system-prompt.md ~/.cursor/memories/global_rules.mdc

# Restart IDE
```

## Links

- 📖 [Documentation](src/README.md)
- 📝 [Changelog](CHANGELOG.md)
- 🐛 [Issues](https://github.com/Gaurav-Wankhede/AegisIDE/issues)
- 🌟 [GitHub](https://github.com/Gaurav-Wankhede/AegisIDE)

---

**License**: MIT
