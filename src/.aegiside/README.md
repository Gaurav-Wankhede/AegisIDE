# AegisIDE - Unified Configuration

This directory (`.aegiside`) serves as the single source of truth for the AegisIDE constitutional framework, memory bank, and operational rules. This unified structure is designed to be IDE-agnostic, providing a consistent experience for all developers and stakeholders.

## Directory Structure

- **`/memory-bank`**: Contains the 8 core JSON schemas that form the system's memory, along with visualization assets.
  - **`/schemas`**: The JSON schema definitions for the memory bank files.
  - **`/visualize`**: Assets for the real-time dashboard.
- **`/rules`**: Contains the constitutional laws of the system.
  - **`/constitution`**: The core articles of the AegisIDE constitution.
  - **`/laws`**: Technology-specific laws and best practices.
- **`/workflow`**: Contains all defined autonomous workflows (e.g., `/init`, `/next`, `/validate`).
- **`global-rules.md`**: The canonical set of global rules for the AI agent. See below for IDE-specific adaptations.
- **`mcp_servers.json`**: The canonical list of MCP servers.

## Supported IDEs (20+)

The system automatically detects your IDE and uses the appropriate configuration. Supported IDEs include:

- **Windsurf** (`.windsurf/`)
- **Cursor** (`.cursor/`)
- **VS Code** (`.vscode/`)
- **Cline** (`.cline/`)
- **Qodo Gen** (`.qoder/`)
- **Trae** (`.trae/`)
- **Zed** (`.zed/`)
- **JetBrains** (`.jetbrains/`)
- **Replit** (`.replit/`)
- **PyCharm** (`.pycharm/`)
- And 10+ more...

### Setup for Any IDE

```bash
# From your project root - replace {IDE} with your IDE's directory name
ln -s src/.aegiside {IDE}/aegiside

# Examples:
ln -s src/.aegiside .windsurf/aegiside
ln -s src/.aegiside .cursor/aegiside
ln -s src/.aegiside .vscode/aegiside
```

### Version 2.8.7 Features

- **Unified Configuration**: Single source of truth eliminates duplication
- **Auto-Detection**: System scans for IDE directories automatically
- **Cross-Platform**: Works on Windows, Linux, and macOS
- **Beginner-Friendly**: No more confusion about which files to use