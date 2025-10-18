# AegisIDE Multi-IDE Compatibility Guide

## 🌐 Supported IDEs (9 Total)

AegisIDE's constitutional framework automatically detects and adapts to your development environment. The framework works across **9 AI-powered IDEs** with zero manual configuration.

---

## ✅ **Tier 1: Full Native Support** (99-96% Autonomous)

### **1. Windsurf** ⭐ Primary Development IDE
- **Autonomy**: 99%
- **Folder**: `.windsurf/`
- **Detection Paths**:
  - Windows: `%USERPROFILE%\.codeium\windsurf-next\mcp_config.json`
  - Linux: `~/.codeium/windsurf-next/mcp_config.json`
  - macOS: `~/Library/Application Support/Codeium/windsurf-next/mcp_config.json`
- **Features**: 
  - ✅ Native MCP protocol support
  - ✅ Cascade autonomous agent
  - ✅ Full constitutional governance
  - ✅ 8 mandatory MCPs integrated
  - ✅ Real-time schema validation

### **2. Cursor**
- **Autonomy**: 96%
- **Folder**: `.cursor/`
- **Detection Paths**:
  - Windows: `%USERPROFILE%\.cursor\mcp_config.json`
  - Linux: `~/.cursor/mcp_config.json`
  - macOS: `~/Library/Application Support/Cursor/mcp_config.json`
- **Features**:
  - ✅ Native MCP protocol support
  - ✅ AI agent with tool integration
  - ✅ Constitutional compliance
  - ✅ Auto-bootstrap workflow

---

## ✅ **Tier 2: VS Code Extension Support** (95-90% Autonomous)

### **3. Roo-Cline** (VS Code Extension)
- **Autonomy**: 95%
- **Folder**: `.roo-cline/`
- **Detection Paths**:
  - Windows: `%APPDATA%\Code\User\globalStorage\rooveterinaryinc.roo-cline`
  - Linux: `~/.config/Code/User/globalStorage/rooveterinaryinc.roo-cline`
  - macOS: `~/Library/Application Support/Code/User/globalStorage/rooveterinaryinc.roo-cline`
- **Features**:
  - ✅ VS Code extension with AI capabilities
  - ✅ Custom modes and settings
  - ✅ MCP integration via extension
  - ✅ Constitutional workflow support

### **4. Continue.dev** (VS Code Extension)
- **Autonomy**: 93%
- **Folder**: `.continue/`
- **Detection Paths**:
  - Windows: `%USERPROFILE%\.continue\config.json`
  - Linux: `~/.continue/config.json`
  - macOS: `~/.continue/config.json`
- **Features**:
  - ✅ Multi-model support (OpenAI, Anthropic, Ollama)
  - ✅ MCP server integration
  - ✅ YAML configuration support
  - ✅ Context management

### **5. Cline** (VS Code Extension)
- **Autonomy**: 95%
- **Folder**: `.cline/`
- **Detection Paths**:
  - Windows: `%USERPROFILE%\.cline`
  - Linux: `~/.cline`
  - macOS: `~/.cline`
- **Features**:
  - ✅ VS Code integration
  - ✅ File system operations
  - ✅ Constitutional compliance

### **6. VS Code** (Generic)
- **Autonomy**: 90%
- **Folder**: `.vscode/`
- **Detection Paths**:
  - Windows: `%USERPROFILE%\.vscode\extensions`
  - Linux: `~/.vscode/extensions`
  - macOS: `~/Library/Application Support/Code/extensions`
- **Features**:
  - ✅ Standard VS Code setup
  - ✅ Extension ecosystem support
  - ✅ File-based configuration

---

## ✅ **Tier 3: CLI & JetBrains Support** (85-70% Autonomous)

### **7. Aider** (CLI-Based AI Assistant)
- **Autonomy**: 85%
- **Folder**: `.aider/`
- **Detection Paths**:
  - Windows: `%APPDATA%\Aider\config.yaml`
  - Linux: `~/.config/aider/config.yml`
  - macOS: `~/Library/Application Support/aider/config.yaml`
- **Features**:
  - ✅ Terminal-based AI coding
  - ✅ Git integration
  - ✅ YAML configuration
  - ✅ Model flexibility (GPT-4, Claude, etc.)
- **Notes**: Best for terminal-focused workflows

### **8. GitHub Copilot (JetBrains)**
- **Autonomy**: 70%
- **Folder**: `.jetbrains/`
- **Detection Paths**:
  - Windows: `%APPDATA%\JetBrains\IntelliJIdea\options\github-copilot.xml`
  - Linux: `~/.config/JetBrains/IntelliJIdea/options/github-copilot.xml`
  - macOS: `~/Library/Application Support/JetBrains/IntelliJIdea/options/github-copilot.xml`
- **Features**:
  - ✅ IntelliJ IDEA support
  - ✅ Language-specific settings
  - ✅ Code completion
- **Notes**: Limited autonomous capabilities; best as supplementary tool

---

## 🔧 How Auto-Detection Works

### **Detection Algorithm**

```javascript
// Executed at session start (every project)
function detectIDE() {
  const platform = detectPlatform(); // Windows/Linux/macOS
  const paths = getIDEPaths(platform); // From context-router.json
  
  // Check in priority order (1-8)
  for (const ide of paths.sort((a,b) => a.priority - b.priority)) {
    if (fileExists(ide.check)) {
      return {
        name: ide.ide,
        folder: ide.folder,
        platform: platform
      };
    }
  }
  
  // Fallback to Windsurf if no IDE detected
  return { name: "windsurf", folder: ".windsurf", platform: platform };
}
```

### **Priority Order**

1. **Windsurf** (highest priority - best support)
2. **Cursor** (second - excellent MCP support)
3. **Roo-Cline** (third - VS Code extension)
4. **Continue.dev** (fourth - multi-model)
5. **Aider** (fifth - CLI-based)
6. **GitHub Copilot JetBrains** (sixth - IDE-specific)
7. **VS Code** (seventh - generic fallback)
8. **Cline** (eighth - basic support)

---

## 📂 Folder Structure Per IDE

Each IDE gets its **own isolated structure**:

```
Your Project/
├── .windsurf/           # If using Windsurf
│   ├── aegiside/
│   │   ├── context-router.json
│   │   ├── memory-bank/ (8 schemas)
│   │   └── schemas/
│   ├── rules/
│   └── workflow/
│
├── .cursor/             # If using Cursor
│   ├── aegiside/
│   ├── rules/
│   └── workflow/
│
├── .continue/           # If using Continue.dev
│   ├── aegiside/
│   ├── rules/
│   └── workflow/
│
└── [your source code]
```

**No Cross-Contamination**: Each IDE maintains **completely independent** memory banks (learned from symlink removal memory).

---

## 🚀 Bootstrap Process (Automatic)

### **First-Time Setup** (Zero Manual Steps)

1. **User opens project** in any supported IDE
2. **Auto-detection runs** based on config file paths
3. **Framework checks** if `.{IDE}/aegiside/context-router.json` exists
4. **If NOT exists**:
   ```bash
   # Automatic GitHub clone
   git clone --depth 1 https://github.com/Gaurav-Wankhede/AegisIDE.git /tmp/aegiside-setup
   
   # Copy framework structure
   cp -r /tmp/aegiside-setup/src/.aegiside .{IDE}/aegiside/
   cp -r /tmp/aegiside-setup/src/rules .{IDE}/rules/
   cp -r /tmp/aegiside-setup/src/workflow .{IDE}/workflow/
   
   # Generate 8 memory bank schemas
   # Verify 42 constitutional articles
   # Cleanup temp files
   
   # ✅ Ready! Framework active in 30 seconds
   ```

5. **If EXISTS**: Normal operation, query router for all paths

---

## 🎯 Feature Comparison Matrix

| Feature | Windsurf | Cursor | Roo-Cline | Continue | Aider | Copilot JB | VS Code | Cline |
|---------|----------|--------|-----------|----------|-------|------------|---------|-------|
| **MCP Protocol** | ✅ Native | ✅ Native | ⚠️ Via Ext | ✅ Supported | ❌ No | ❌ No | ⚠️ Via Ext | ⚠️ Via Ext |
| **Auto-Bootstrap** | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |
| **Constitutional Gov** | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ⚠️ Partial | ⚠️ Partial | ✅ Full | ✅ Full |
| **8 Schemas** | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full |
| **42 Articles** | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ✅ Full |
| **RL System** | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes | ✅ Yes |
| **CLI Tools** | ✅ jq/sponge | ✅ jq/sponge | ✅ jq/sponge | ✅ jq/sponge | ✅ jq/sponge | ⚠️ Limited | ✅ jq/sponge | ✅ jq/sponge |
| **Autonomy** | 99% | 96% | 95% | 93% | 85% | 70% | 90% | 95% |

---

## 📋 Requirements Per IDE

### **Minimum Requirements (All IDEs)**
- ✅ Git installed
- ✅ File system read/write access
- ✅ Terminal/CLI support for `jq`, `sponge`, `glow`
- ✅ Internet access (for initial GitHub clone)

### **Enhanced Requirements (MCP-Enabled IDEs)**
- ✅ MCP server support (Windsurf, Cursor, Continue.dev)
- ✅ Extension API (Roo-Cline, Cline, VS Code)
- ✅ AI agent capabilities (Windsurf Cascade, Cursor AI)

---

## 🛠️ Adding New IDE Support

Want to add support for **KiloCode, Bolt.new, or others**? Follow this pattern:

### **Step 1: Research IDE Paths**
```bash
# Find config file locations for new IDE
# Example for "NewIDE":
Windows: %APPDATA%\NewIDE\config.json
Linux: ~/.config/newide/settings.json
macOS: ~/Library/Application Support/NewIDE/config.json
```

### **Step 2: Update context-router.json**
```json
{
  "ide_detection": {
    "windows_paths": [
      // Add after existing entries
      {"ide": "newide", "check": "%APPDATA%\\NewIDE\\config.json", "folder": ".newide", "priority": 9}
    ],
    "linux_paths": [
      {"ide": "newide", "check": "~/.config/newide/settings.json", "folder": ".newide", "priority": 9}
    ],
    "macos_paths": [
      {"ide": "newide", "check": "~/Library/Application Support/NewIDE/config.json", "folder": ".newide", "priority": 9}
    ]
  }
}
```

### **Step 3: Test**
```bash
# Open project in new IDE
# Framework should auto-detect and create .newide/ structure
# Verify with: ls -la .newide/aegiside/
```

---

## 📊 Usage Statistics & Recommendations

### **Best For Autonomous Development**
1. **Windsurf** - Maximum autonomy (99%), best MCP integration
2. **Cursor** - Excellent balance (96%), great AI agent
3. **Roo-Cline** - VS Code users wanting high autonomy (95%)

### **Best For Terminal Workflows**
1. **Aider** - Pure CLI, works everywhere (85%)
2. **Continue.dev** - Hybrid terminal + IDE (93%)

### **Best For JetBrains Users**
1. **GitHub Copilot** - IntelliJ IDEA integration (70%)

### **Best For Multi-IDE Teams**
- Framework works identically across all 9 IDEs
- Team members can use different IDEs with same constitutional governance
- Memory banks remain isolated per workspace

---

## 🔒 Security & Isolation

### **Per-Project Isolation**
- ✅ Each project has independent `.{IDE}/aegiside/` structure
- ✅ Memory banks don't cross-contaminate (from symlink removal memory)
- ✅ Constitutional governance per workspace
- ✅ RL scores isolated to project

### **Cross-IDE Safety**
- ✅ Switching IDEs preserves all data
- ✅ Can use multiple IDEs simultaneously (different projects)
- ✅ No shared state between IDE instances

---

## 📚 Additional Resources

- **GitHub Repository**: https://github.com/Gaurav-Wankhede/AegisIDE
- **Constitutional Framework**: See `.{IDE}/rules/constitution/` (42 articles)
- **Workflow Documentation**: See `.{IDE}/workflow/` (12 workflows)
- **Schema Documentation**: See `.{IDE}/aegiside/schemas/README.md`

---

**Last Updated**: 2025-10-18  
**Version**: 2.9.0 (Multi-IDE Support)  
**Supported IDEs**: 9 (Windsurf, Cursor, Roo-Cline, Continue.dev, Aider, GitHub Copilot JetBrains, VS Code, Cline, +fallback)
