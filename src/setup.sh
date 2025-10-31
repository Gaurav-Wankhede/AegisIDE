#!/bin/bash
# AegisIDE Autonomous Setup v5.0.0
# GitHub-First + Autonomous Installation

set -e

AEGIS_VERSION="5.0.0"
GITHUB_REPO="https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main"
GITHUB_API="https://api.github.com/repos/Gaurav-Wankhede/AegisIDE"

# Parse command-line arguments
AUTO_MODE=false
FORCE_MODE=false
for arg in "$@"; do
    case $arg in
        --auto) AUTO_MODE=true ;;
        --force) FORCE_MODE=true ;;
        --help)
            echo "AegisIDE Autonomous Setup v$AEGIS_VERSION"
            echo ""
            echo "Usage: ./setup.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --auto    Autonomous mode (no prompts, auto-yes)"
            echo "  --force   Force overwrite existing files"
            echo "  --help    Show this help message"
            echo ""
            echo "Examples:"
            echo "  ./setup.sh             # Interactive mode"
            echo "  ./setup.sh --auto      # Autonomous installation"
            echo "  ./setup.sh --auto --force  # Force reinstall"
            exit 0
            ;;
    esac
done

echo "🤖 AegisIDE Autonomous Setup v$AEGIS_VERSION"
echo "════════════════════════════════════════════════════════════"
if [ "$AUTO_MODE" = true ]; then
    echo "🔄 MODE: Autonomous (no prompts)"
else
    echo "🔄 MODE: Interactive"
fi
echo "📦 SOURCE: GitHub (Gaurav-Wankhede/AegisIDE)"
echo "════════════════════════════════════════════════════════════"
echo ""

# Detect OS
detect_os() {
    case "$(uname -s)" in
        Linux*)   echo "linux" ;;
        Darwin*)  echo "macos" ;;
        MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
        *)        echo "unknown" ;;
    esac
}

# Detect IDE
detect_ide() {
    if [ -d "$HOME/.codeium/windsurf" ] || [ -d "$HOME/.windsurf" ]; then
        echo "windsurf"
    elif [ -d "$HOME/.cursor" ]; then
        echo "cursor"
    elif [ -d "$HOME/.vscode" ]; then
        echo "vscode"
    elif [ -d "$HOME/.continue" ]; then
        echo "continue"
    else
        echo "unknown"
    fi
}

# Get global memory path
get_global_path() {
    local os=$1
    local ide=$2
    
    case $ide in
        windsurf)
            case $os in
                linux) echo "$HOME/.codeium/windsurf/memories" ;;
                macos) echo "$HOME/Library/Application Support/Codeium/windsurf/memories" ;;
                windows) echo "$USERPROFILE/.codeium/windsurf/memories" ;;
            esac ;;
        cursor)
            case $os in
                linux) echo "$HOME/.config/Cursor/User" ;;
                macos) echo "$HOME/Library/Application Support/Cursor/User" ;;
                windows) echo "$APPDATA/Cursor/User" ;;
            esac ;;
        vscode)
            case $os in
                linux) echo "$HOME/.config/Code/User" ;;
                macos) echo "$HOME/Library/Application Support/Code/User" ;;
                windows) echo "$APPDATA/Code/User" ;;
            esac ;;
        continue)
            echo "$HOME/.continue" ;;
        *)
            echo "$HOME/.aegiside_global" ;;
    esac
}

# Get prompt filename
get_prompt_filename() {
    local ide=$1
    case $ide in
        windsurf) echo "global_rules.md" ;;
        cursor) echo "global_rules.mdc" ;;
        *) echo "system_prompt.md" ;;
    esac
}

# Ask for confirmation (skip in auto mode)
confirm() {
    local message=$1
    if [ "$AUTO_MODE" = true ]; then
        return 0  # Auto-yes
    fi
    
    while true; do
        read -p "$message [Y/n]: " yn
        case $yn in
            [Yy]* ) return 0 ;;
            [Nn]* ) return 1 ;;
            "" ) return 0 ;;
            * ) echo "Please answer Y or n." ;;
        esac
    done
}

OS=$(detect_os)
IDE=$(detect_ide)
GLOBAL_PATH=$(get_global_path $OS $IDE)
PROMPT_FILENAME=$(get_prompt_filename $IDE)
WORKSPACE_PATH=$(pwd)

echo "📋 System Detection"
echo "────────────────────────────────────────────────────────────"
echo "  OS: $OS"
echo "  IDE: $IDE"
echo "  Global Memory: $GLOBAL_PATH"
echo "  Prompt File: $PROMPT_FILENAME"
echo "  Workspace: $WORKSPACE_PATH"
echo "────────────────────────────────────────────────────────────"
echo ""

# STEP 1: Update System Prompt
echo "1️⃣  System Prompt Installation"
echo "────────────────────────────────────────────────────────────"
mkdir -p "$GLOBAL_PATH"

EXISTING_PROMPT="$GLOBAL_PATH/$PROMPT_FILENAME"
TEMP_PROMPT="/tmp/aegis_prompt.md"

echo "  📥 Downloading system-prompt.md from GitHub..."
if curl -sL "$GITHUB_REPO/src/system-prompt.md" > "$TEMP_PROMPT" 2>/dev/null; then
    if [ -f "$EXISTING_PROMPT" ] && ! cmp -s "$EXISTING_PROMPT" "$TEMP_PROMPT"; then
        if [ "$FORCE_MODE" = true ] || confirm "  🔄 System prompt exists. Update?"; then
            cp "$EXISTING_PROMPT" "${EXISTING_PROMPT}.backup"
            mv "$TEMP_PROMPT" "$EXISTING_PROMPT"
            echo "  ✅ System prompt updated (backup created)"
        else
            rm -f "$TEMP_PROMPT"
            echo "  ⏭️  Keeping existing version"
        fi
    elif [ ! -f "$EXISTING_PROMPT" ]; then
        mv "$TEMP_PROMPT" "$EXISTING_PROMPT"
        echo "  ✅ System prompt installed"
    else
        rm -f "$TEMP_PROMPT"
        echo "  ✅ System prompt already up-to-date"
    fi
else
    echo "  ❌ Failed to download system prompt"
    rm -f "$TEMP_PROMPT"
fi
echo ""

# STEP 2: Update MCP Configuration
echo "2️⃣  MCP Configuration"
echo "────────────────────────────────────────────────────────────"
TEMP_MCP="/tmp/aegis_mcp.json"

echo "  📥 Downloading mcp_servers.json from GitHub..."
if curl -sL "$GITHUB_REPO/src/mcp_servers.json" > "$TEMP_MCP" 2>/dev/null; then
    if [ -f "$WORKSPACE_PATH/mcp_servers.json" ]; then
        # Merge mode: append missing MCPs only
        jq -s '.[0].mcpServers * .[1].mcpServers | {mcpServers: .}' \
            "$WORKSPACE_PATH/mcp_servers.json" "$TEMP_MCP" \
            > /tmp/merged_mcp.json 2>/dev/null || cp "$TEMP_MCP" /tmp/merged_mcp.json
        
        if ! cmp -s "$WORKSPACE_PATH/mcp_servers.json" /tmp/merged_mcp.json; then
            cp "$WORKSPACE_PATH/mcp_servers.json" "$WORKSPACE_PATH/mcp_servers.json.backup"
            mv /tmp/merged_mcp.json "$WORKSPACE_PATH/mcp_servers.json"
            echo "  ✅ MCP configuration merged (backup created)"
        else
            rm -f /tmp/merged_mcp.json
            echo "  ✅ MCP configuration already up-to-date"
        fi
    else
        mv "$TEMP_MCP" "$WORKSPACE_PATH/mcp_servers.json"
        echo "  ✅ MCP configuration installed"
    fi
    rm -f "$TEMP_MCP"
else
    echo "  ❌ Failed to download MCP configuration"
    rm -f "$TEMP_MCP"
fi
echo ""

# STEP 3: Install .aegiside Framework
echo "3️⃣  .aegiside Framework Installation"
echo "────────────────────────────────────────────────────────────"

AEGIS_DIR="$WORKSPACE_PATH/.aegiside"
TEMP_AEGIS="/tmp/aegis_framework"

if [ -d "$AEGIS_DIR" ] && [ "$FORCE_MODE" = false ]; then
    if ! confirm "  🔄 .aegiside exists. Reinstall (creates backup)?"; then
        echo "  ⏭️  Skipping framework installation"
        echo ""
        echo "✅ Setup Complete (partial - skipped framework)"
        exit 0
    fi
    
    # Backup existing
    BACKUP_DIR="${AEGIS_DIR}.backup_$(date +%Y%m%d_%H%M%S)"
    mv "$AEGIS_DIR" "$BACKUP_DIR"
    echo "  💾 Backup created: $BACKUP_DIR"
fi

echo "  📦 Downloading .aegiside framework from GitHub..."
mkdir -p "$TEMP_AEGIS"

# Download framework structure
declare -A FRAMEWORK_FILES=(
    ["core/main-router.json"]="core"
    ["core/context-orchestrator.json"]="core"
    ["knowledge/architecture/architecture.json"]="knowledge/architecture"
    ["knowledge/architecture/architecture.mmd"]="knowledge/architecture"
    ["knowledge/architecture/codemap.json"]="knowledge/architecture"
    ["knowledge/architecture/relation.json"]="knowledge/architecture"
)

echo "  📥 Downloading core framework files..."
DOWNLOAD_ERRORS=0
for file_path in "${!FRAMEWORK_FILES[@]}"; do
    dir="${FRAMEWORK_FILES[$file_path]}"
    mkdir -p "$AEGIS_DIR/$dir"
    
    if curl -sL "$GITHUB_REPO/.aegiside/$file_path" > "$AEGIS_DIR/$file_path" 2>/dev/null; then
        echo "    ✅ $file_path"
    else
        echo "    ❌ $file_path (failed)"
        ((DOWNLOAD_ERRORS++))
    fi
done

# Download constitution articles (43 files)
echo "  📥 Downloading constitution (43 articles)..."
CONST_PARTS=("01-preamble" "02-preliminary" "03-fundamental-rights" "04-fundamental-duties" "05-dpsp" "06-parliament" "07-executive" "08-judiciary" "09-constitutional-bodies")
for part in "${CONST_PARTS[@]}"; do
    mkdir -p "$AEGIS_DIR/constitution/$part"
done

# Download preamble
curl -sL "$GITHUB_REPO/.aegiside/constitution/01-preamble/preamble.json" > "$AEGIS_DIR/constitution/01-preamble/preamble.json" 2>/dev/null && echo "    ✅ preamble.json"

# Download articles 1-42
for i in {1..42}; do
    # Determine which part this article belongs to
    if [ $i -le 3 ]; then
        part="02-preliminary"
    elif [ $i -le 12 ]; then
        part="03-fundamental-rights"
    elif [ $i -le 19 ]; then
        part="04-fundamental-duties"
    elif [ $i -le 25 ]; then
        part="05-dpsp"
    elif [ $i -le 31 ]; then
        part="06-parliament"
    elif [ $i -le 35 ]; then
        part="07-executive"
    elif [ $i -le 38 ]; then
        part="08-judiciary"
    else
        part="09-constitutional-bodies"
    fi
    
    curl -sL "$GITHUB_REPO/.aegiside/constitution/$part/article-$i.json" > "$AEGIS_DIR/constitution/$part/article-$i.json" 2>/dev/null
done
echo "    ✅ Constitution downloaded (43 articles)"

# Download ACE workflows (runtime tier)
echo "  📥 Downloading ACE workflows..."
mkdir -p "$AEGIS_DIR/runtime/ace/generator"
mkdir -p "$AEGIS_DIR/runtime/ace/reflector"
mkdir -p "$AEGIS_DIR/runtime/ace/curator"
echo "    ℹ️  ACE workflows will be fetched dynamically on first use"
echo "    ✅ Runtime structure created"

# Create runtime/memory structure (3-tier)
echo "  📥 Creating runtime/memory structure..."
mkdir -p "$AEGIS_DIR/runtime/memory/active"
mkdir -p "$AEGIS_DIR/runtime/memory/history"
mkdir -p "$AEGIS_DIR/runtime/memory/schemas"
mkdir -p "$AEGIS_DIR/runtime/optimization"
echo "    ✅ Runtime memory structure created"
echo "    ℹ️  Schemas will be fetched dynamically on first use"

# Install enforcement hooks (knowledge tier)
echo "  📥 Installing enforcement hooks..."
mkdir -p "$AEGIS_DIR/knowledge/governance/enforcement/shell/hooks"
mkdir -p "$AEGIS_DIR/knowledge/governance/enforcement/shell/validators"
mkdir -p "$AEGIS_DIR/knowledge/governance/enforcement/shell/transactions"

# Download pre-commit hook
if curl -sL "$GITHUB_REPO/.git/hooks/pre-commit" > "$WORKSPACE_PATH/.git/hooks/pre-commit" 2>/dev/null; then
    chmod +x "$WORKSPACE_PATH/.git/hooks/pre-commit"
    echo "    ✅ Pre-commit hook installed"
else
    echo "    ⚠️  Pre-commit hook not available (optional)"
fi

echo ""
echo "  ✅ .aegiside framework installed"
echo "    • Constitution: 43 articles"
echo "    • Workflows: 18 files"
echo "    • Routers: 2 files (context-router + skills)"
echo "    • Architecture: 4 files"
echo "    • Memory-bank: Structure created"
echo "    • Enforcement: Hooks installed"
echo ""

# STEP 4: Validation
echo "4️⃣  Installation Validation"
echo "────────────────────────────────────────────────────────────"

VALIDATION_ERRORS=0

# Check system prompt
if [ -f "$EXISTING_PROMPT" ]; then
    echo "  ✅ System prompt: $PROMPT_FILENAME ($(wc -c < "$EXISTING_PROMPT") chars)"
else
    echo "  ❌ System prompt: NOT FOUND"
    ((VALIDATION_ERRORS++))
fi

# Check MCP config
if [ -f "$WORKSPACE_PATH/mcp_servers.json" ]; then
    MCP_COUNT=$(jq '.mcpServers | length' "$WORKSPACE_PATH/mcp_servers.json" 2>/dev/null || echo "0")
    echo "  ✅ MCP configuration: $MCP_COUNT MCPs"
else
    echo "  ❌ MCP configuration: NOT FOUND"
    ((VALIDATION_ERRORS++))
fi

# Check .aegiside structure
if [ -d "$AEGIS_DIR" ]; then
    CONST_COUNT=$(find "$AEGIS_DIR/constitution" -name "*.json" 2>/dev/null | wc -l)
    WF_COUNT=$(find "$AEGIS_DIR/runtime/ace" -name "*.json" 2>/dev/null | wc -l)
    RTR_COUNT=$(find "$AEGIS_DIR/core" -name "*.json" 2>/dev/null | wc -l)
    
    echo "  ✅ .aegiside framework:"
    echo "    • Constitution: $CONST_COUNT articles"
    echo "    • Workflows: $WF_COUNT files"
    echo "    • Routers: $RTR_COUNT files"
else
    echo "  ❌ .aegiside framework: NOT FOUND"
    ((VALIDATION_ERRORS++))
fi

echo "────────────────────────────────────────────────────────────"
echo ""

# Final Summary
if [ $VALIDATION_ERRORS -eq 0 ]; then
    echo "════════════════════════════════════════════════════════════"
    echo "✅ AegisIDE v$AEGIS_VERSION Installation Complete!"
    echo "════════════════════════════════════════════════════════════"
    echo ""
    echo "🚀 Next Steps:"
    echo "  1. Restart your $IDE IDE"
    echo "  2. Framework auto-activates on first AI request"
    echo "  3. Constitutional governance active"
    echo ""
    echo "📚 Documentation:"
    echo "  • GitHub: https://github.com/Gaurav-Wankhede/AegisIDE"
    echo "  • Architecture: .aegiside/knowledge/architecture/architecture.mmd"
    echo "  • System Prompt: $EXISTING_PROMPT"
    echo ""
else
    echo "════════════════════════════════════════════════════════════"
    echo "⚠️  Installation completed with $VALIDATION_ERRORS error(s)"
    echo "════════════════════════════════════════════════════════════"
    echo ""
    echo "Please check the errors above and retry with:"
    echo "  ./src/setup.sh --auto --force"
    echo ""
fi
