# AegisIDE Installation Guide

## 🚀 Quick Start (Autonomous Installation)

### One-Line Install

```bash
curl -sL https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh | bash -s -- --auto
```

This will:
1. ✅ Install system prompt to your IDE's global memory
2. ✅ Configure MCP servers (6 essential tools)
3. ✅ Download entire .aegiside framework from GitHub (43 articles, 18 workflows, etc.)
4. ✅ Install enforcement hooks
5. ✅ Validate installation

---

## 📦 Manual Installation

### Step 1: Clone or Download

```bash
# Option A: Clone the repository
git clone https://github.com/Gaurav-Wankhede/AegisIDE.git
cd AegisIDE

# Option B: Download setup script only
curl -O https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh
chmod +x setup.sh
```

### Step 2: Run Setup

```bash
# Interactive mode (recommended for first-time users)
./src/setup.sh

# Autonomous mode (no prompts)
./src/setup.sh --auto

# Force reinstall (overwrites existing files)
./src/setup.sh --auto --force
```

---

## 🎯 What Gets Installed

### 1. System Prompt (6,080 chars)
- **Location:** `~/.codeium/windsurf/memories/global_rules.md` (or IDE-specific path)
- **Purpose:** AI governance rules, constitutional framework, autonomous routing
- **Content:** 
  - Source verification protocol
  - Autonomous governance (43 constitutional articles)
  - MCP chain enforcement
  - RL scoring (PPO+GAE)
  - File routing rules

### 2. MCP Configuration
- **Location:** `./mcp_servers.json` (workspace root)
- **MCPs Installed:**
  - `json-jq` - JSON query/update for memory-bank
  - `sequential-thinking` - 10+ step planning
  - `context7` - Official documentation lookup
  - `exa` - Code example search
  - `git` - Version control operations
  - `fetch` - Web content retrieval

### 3. .aegiside Framework
- **Location:** `./.aegiside/` (workspace)
- **Structure:**
  ```
  .aegiside/
  ├── constitution/ (43 articles)
  │   ├── 01-preamble/
  │   ├── 02-preliminary/ (Articles 1-3)
  │   ├── 03-fundamental-rights/ (Articles 4-12)
  │   ├── 04-fundamental-duties/ (Articles 13-19)
  │   ├── 05-dpsp/ (Articles 20-25)
  │   ├── 06-parliament/ (Articles 26-31)
  │   ├── 07-executive/ (Articles 32-35)
  │   ├── 08-judiciary/ (Articles 36-38)
  │   └── 09-constitutional-bodies/ (Articles 39-42)
  ├── workflows/ (18 files)
  │   └── petition-router.json, research.json, fix.json, etc.
  ├── routers/ (2 files)
  │   ├── context-router.json (19 keys, master routing)
  │   └── skills.json (21 tech domains)
  ├── architecture/ (4 files)
  │   ├── architecture.mmd (Flow awareness)
  │   ├── codemap.json (File inventory)
  │   ├── relation.json (Relationships)
  │   └── architecture.json (Metadata)
  ├── memory-bank/
  │   ├── memory/ (8 runtime schemas - auto-created)
  │   └── schemas/ (19 validation schemas - dynamic)
  └── enforcement/
      └── shell/
          ├── hooks/ (4 hooks)
          ├── validators/ (17 validators)
          └── transactions/ (2 transaction handlers)
  ```

### 4. Git Hooks (Optional)
- **Location:** `./.git/hooks/pre-commit`
- **Purpose:** Protect memory-bank schemas from accidental modification
- **Enforcement:** Future-proofed (allows framework updates)

---

## 🔍 Supported IDEs

| IDE | Status | Global Memory Path |
|---|---|---|
| **Windsurf** | ✅ Fully Supported | `~/.codeium/windsurf/memories/` |
| **Cursor** | ✅ Supported | `~/.config/Cursor/User/` |
| **VSCode** | ✅ Supported | `~/.config/Code/User/` |
| **Continue.dev** | ✅ Supported | `~/.continue/` |
| **Other** | ⚠️ Partial | `~/.aegiside_global/` |

---

## ✅ Verification

After installation, verify:

```bash
# 1. Check system prompt
ls -lh ~/.codeium/windsurf/memories/global_rules.md

# 2. Check MCP configuration
jq '.mcpServers | keys' mcp_servers.json

# 3. Check .aegiside framework
find .aegiside/constitution -name "*.json" | wc -l  # Should be 43
find .aegiside/workflows -name "*.json" | wc -l     # Should be 18
```

**Expected output:**
```
✅ System prompt: global_rules.md (6080 chars)
✅ MCP configuration: 6 MCPs
✅ .aegiside framework:
  • Constitution: 43 articles
  • Workflows: 18 files
  • Routers: 2 files
```

---

## 🚀 Post-Installation

1. **Restart your IDE** (Windsurf, Cursor, VSCode, etc.)
2. **Start coding** - Framework auto-activates on first AI request
3. **Test governance:**
   ```
   Ask AI: "How does parliament work?"
   → Triggers constitutional flow (Legislature branch, Articles 26-31)
   ```

---

## 🔄 Updating

To update to the latest version:

```bash
# Pull latest from GitHub and reinstall
git pull origin main
./src/setup.sh --auto --force
```

Or use the one-liner:

```bash
curl -sL https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh | bash -s -- --auto --force
```

---

## 🛠️ Troubleshooting

### Setup script fails to download files

**Solution:** Check internet connection and GitHub availability:
```bash
curl -I https://github.com/Gaurav-Wankhede/AegisIDE
```

### MCP servers not working

**Solution:** Restart IDE and check MCP configuration:
```bash
jq '.mcpServers' mcp_servers.json
```

### Constitutional articles not found

**Solution:** Verify .aegiside structure:
```bash
ls -R .aegiside/constitution/
```

### System prompt not loading

**Solution:** Check IDE-specific path:
```bash
# Windsurf
ls ~/.codeium/windsurf/memories/global_rules.md

# Cursor
ls ~/.config/Cursor/User/global_rules.mdc
```

---

## 📚 Documentation

- **GitHub:** https://github.com/Gaurav-Wankhede/AegisIDE
- **Architecture:** `.aegiside/architecture/architecture.mmd`
- **System Prompt:** `~/.codeium/windsurf/memories/global_rules.md`
- **Constitution:** `.aegiside/constitution/`

---

## 🆘 Support

- **Issues:** https://github.com/Gaurav-Wankhede/AegisIDE/issues
- **Discussions:** https://github.com/Gaurav-Wankhede/AegisIDE/discussions

---

## 📄 License

MIT License - See LICENSE file for details
