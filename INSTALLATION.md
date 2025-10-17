# AegisIDE Installation Guide

Complete setup instructions for deploying AegisIDE constitutional framework in your local development environment.

## Prerequisites

- **Git** installed
- **Node.js** (v18+) with `npx` for MCP servers
- **Python** (3.8+) with `uvx` for Python-based MCPs
- AI-powered IDE: Windsurf, Cursor, VS Code (with Cline/Continue), or JetBrains

## Step 1: Clone Repository

```bash
git clone https://github.com/Gaurav-Wankhede/AegisIDE.git
cd AegisIDE
```

## Step 2: IDE-Specific Setup

### For Windsurf IDE

```bash
# Create directory structure
mkdir -p ~/.windsurf/aegiside

# Copy framework files (NOT symlink to avoid cross-contamination)
cp -r src/.aegiside ~/.windsurf/aegiside
cp -r src/rules ~/.windsurf/rules
cp -r src/workflow ~/.windsurf/workflow

# Copy global rules to IDE memories
cp src/global-rules.md ~/.codeium/windsurf-next/memories/global_rules.md
```

### For Cursor IDE

```bash
mkdir -p ~/.cursor/aegiside
cp -r src/.aegiside ~/.cursor/aegiside
cp -r src/rules ~/.cursor/rules
cp -r src/workflow ~/.cursor/workflow
```

### For VS Code (with Cline/Continue)

```bash
mkdir -p ~/.vscode/aegiside
cp -r src/.aegiside ~/.vscode/aegiside
cp -r src/rules ~/.vscode/rules
cp -r src/workflow ~/.vscode/workflow
```

## Step 3: Configure MCP Servers

### Edit MCP Configuration

1. **Copy template:**
   ```bash
   cp src/mcp_servers.json ~/mcp_servers.json
   ```

2. **Update paths in `~/mcp_servers.json`:**
   - Replace `${HOME}/Projects` with your actual projects directory
   - Verify `${HOME}/.windsurf/memory.json` path matches your IDE

3. **Install MCP servers:**
   ```bash
   # Test context7 (documentation)
   npx -y @upstash/context7-mcp@latest

   # Test filesystem
   npx -y @modelcontextprotocol/server-filesystem "${HOME}/Projects"

   # Test memory
   npx -y @modelcontextprotocol/server-memory
   ```

### Add to IDE MCP Settings

**Windsurf:** Settings → MCP Servers → Import `~/mcp_servers.json`  
**Cursor:** Settings → Extensions → MCP → Import configuration  
**VS Code:** Cline/Continue settings → MCP configuration

## Step 4: Initialize Memory Bank

The memory-bank starts empty by design. It will auto-generate on first `/init` workflow:

```bash
# Verify empty memory-bank (should only have README.md + RL_SCORING_EXAMPLE.json)
ls ~/.windsurf/aegiside/memory-bank/

# Expected output: README.md, RL_SCORING_EXAMPLE.json (both are documentation)
```

## Step 5: Verify Installation

Run validation checks:

```bash
# Check MCP servers respond
npx -y @modelcontextprotocol/server-filesystem "${HOME}/Projects" --version

# Check constitutional files
ls ~/.windsurf/rules/constitution/01-preamble/preamble.md

# Check workflows
ls ~/.windsurf/workflow/init.md
```

## Step 6: Activate AI Framework

1. **Open your IDE** (Windsurf/Cursor/VS Code)
2. **Start AI assistant**
3. **Trigger initialization:**
   - Type: `/init` or
   - Say: "Initialize AegisIDE framework"
4. **AI will auto-generate 8 core schemas:**
   - activeContext.json
   - scratchpad.json
   - kanban.json
   - mistakes.json
   - systemPatterns.json
   - progress.json
   - roadmap.json
   - memory.json

## Troubleshooting

### MCP Servers Not Working

**Error:** `Command not found: npx`  
**Fix:** Install Node.js from https://nodejs.org/

**Error:** `Command not found: uvx`  
**Fix:** Install uv: `curl -LsSf https://astral.sh/uv/install.sh | sh`

**Error:** `EACCES: permission denied`  
**Fix:** Run with proper permissions or use `sudo` (not recommended for npm)

### Memory Bank Not Generating

**Symptom:** `/init` doesn't create 8 JSON files  
**Fix:**
1. Check `.windsurf/aegiside/schemas/*.schema.json` exist
2. Verify AI has filesystem MCP access
3. Manually trigger: "Generate 8 core memory-bank files from schemas"

### Constitutional Articles Not Loading

**Symptom:** AI doesn't reference articles  
**Fix:**
1. Verify `~/.windsurf/rules/constitution/` has 9 folders
2. Check preamble.md exists: `cat ~/.windsurf/rules/constitution/01-preamble/preamble.md`
3. Ensure AI has filesystem access to rules folder

### Cross-Project Contamination

**Symptom:** Updates in one project appear in another  
**Cause:** Using symlinks instead of copies  
**Fix:**
```bash
# Remove symlinks
rm ~/.windsurf/aegiside

# Use proper copy
cp -r AegisIDE/src/.aegiside ~/.windsurf/aegiside
```

## Advanced Configuration

### Multi-IDE Setup

Each IDE needs independent structure:

```bash
# Windsurf
cp -r src/.aegiside ~/.windsurf/aegiside

# Cursor (separate copy)
cp -r src/.aegiside ~/.cursor/aegiside

# VS Code (separate copy)
cp -r src/.aegiside ~/.vscode/aegiside
```

### Custom MCP Paths

Edit `~/mcp_servers.json`:

```json
{
  "filesystem": {
    "args": ["...", "/your/custom/path"]
  },
  "memory": {
    "env": {
      "MEMORY_FILE_PATH": "/your/custom/memory.json"
    }
  }
}
```

### Enable Additional MCPs

Framework supports 9 core MCPs. To add more:

1. Edit `mcp_servers.json`
2. Follow MCP server documentation
3. Add to constitutional `laws/` if project-specific

## Validation

After setup, verify:

- [ ] MCP servers respond (test with `npx` commands)
- [ ] Constitutional files accessible
- [ ] Workflows readable
- [ ] Memory-bank empty (only README + example)
- [ ] AI can execute `/init` successfully
- [ ] 8 JSON files auto-generate after `/init`

## Support

- **Issues:** https://github.com/Gaurav-Wankhede/AegisIDE/issues
- **Discussions:** https://github.com/Gaurav-Wankhede/AegisIDE/discussions
- **Documentation:** See `README.md` for architecture overview

---

**Installation Version:** 3.1.0  
**Last Updated:** 2025-10-17
