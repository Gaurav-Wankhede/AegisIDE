#!/bin/bash
# AegisIDE Framework Auto-Installer v3.0.0
# Autonomous dynamic installation with global_rules.md detection

set -e

echo "🤖 AegisIDE Framework Auto-Installer v3.0.0"
echo "================================================="
echo "🎆 Autonomous Dynamic Installation"
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
    if [ -d "$HOME/.codeium/windsurf-next" ] || [ -d "$HOME/.windsurf" ]; then
        echo "windsurf"
    elif [ -d "$HOME/.cursor" ]; then
        echo "cursor"
    elif [ -d "$HOME/.vscode" ]; then
        echo "vscode"
    elif [ -d "$HOME/.config/JetBrains" ]; then
        echo "jetbrains"
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
                linux) echo "$HOME/.codeium/windsurf-next/memories" ;;
                macos) echo "$HOME/Library/Application Support/Codeium/windsurf-next/memories" ;;
                windows) echo "$USERPROFILE/.codeium/windsurf-next/memories" ;;
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
    esac
}

OS=$(detect_os)
IDE=$(detect_ide)
GLOBAL_PATH=$(get_global_path $OS $IDE)
WORKSPACE_PATH=$(pwd)
GITHUB_REPO="https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main"

echo "📋 System Detection"
echo "  OS: $OS"
echo "  IDE: $IDE"
echo "  Global Memory: $GLOBAL_PATH"
echo "  Workspace: $WORKSPACE_PATH"
echo ""

# Check for existing global_rules.md
EXISTING_RULES="$GLOBAL_PATH/global_rules.md"
if [ -f "$EXISTING_RULES" ]; then
    echo "🔍 Existing global_rules.md detected"
    echo "  ✅ Will enhance existing rules with AegisIDE framework"
    ENHANCE_MODE=true
else
    echo "🆕 No existing global_rules.md found"
    echo "  ✅ Will create fresh AegisIDE global_rules.md"
    ENHANCE_MODE=false
fi
echo ""

echo "📦 Installing AegisIDE Framework..."
echo "🌐 Downloading from GitHub (temporary)"
echo ""

# Step 1: Handle global_rules.md (enhance or create)
echo "1️⃣  Processing global_rules.md..."
mkdir -p "$GLOBAL_PATH"

if [ "$ENHANCE_MODE" = true ]; then
    # Backup existing rules
    cp "$EXISTING_RULES" "$EXISTING_RULES.backup"
    echo "  💾 Backed up existing rules"
    
    # Download AegisIDE rules and append
    curl -sL "$GITHUB_REPO/src/.aegiside/global_rules.md" > /tmp/aegiside_rules.md
    echo "" >> "$EXISTING_RULES"
    echo "# =================================" >> "$EXISTING_RULES"
    echo "# AegisIDE Framework (Auto-Added)" >> "$EXISTING_RULES"
    echo "# =================================" >> "$EXISTING_RULES"
    cat /tmp/aegiside_rules.md >> "$EXISTING_RULES"
    echo "  ✅ Enhanced existing global_rules.md with AegisIDE"
else
    # Create fresh AegisIDE rules
    curl -sL "$GITHUB_REPO/src/.aegiside/global_rules.md" > "$GLOBAL_PATH/global_rules.md"
    echo "  ✅ Created fresh AegisIDE global_rules.md"
fi

# Step 2: Download and install router system
echo "2️⃣  Downloading modular router system..."
mkdir -p "$WORKSPACE_PATH/.aegiside/routers"

# Download all router modules
for router in core mcps constitutional parliamentary session memory-bank autonomy violations workflows governance; do
    curl -sL "$GITHUB_REPO/src/.aegiside/routers/${router}.json" > "$WORKSPACE_PATH/.aegiside/routers/${router}.json"
done

# Download main context router
curl -sL "$GITHUB_REPO/src/.aegiside/context-router.json" > "$WORKSPACE_PATH/.aegiside/context-router.json"
echo "  ✅ 10 router modules downloaded and installed"

# Step 3: Download schemas
echo "3️⃣  Downloading schema validators..."
mkdir -p "$WORKSPACE_PATH/.aegiside/schemas"

# Download schema files
for schema in activeContext kanban memory mistakes progress roadmap scratchpad systemPatterns schema-integrity-validator; do
    curl -sL "$GITHUB_REPO/src/.aegiside/schemas/${schema}.schema.json" > "$WORKSPACE_PATH/.aegiside/schemas/${schema}.schema.json" 2>/dev/null || true
done
echo "  ✅ Schema validators downloaded"

# Step 4: Download workflows
echo "4️⃣  Downloading workflows..."
mkdir -p "$WORKSPACE_PATH/.aegiside/workflow"

# Download workflow files
for workflow in bootstrap continue fix init memory-status next optimize oversight-checks-and-balances research status update validate auto-init; do
    curl -sL "$GITHUB_REPO/src/workflow/${workflow}.md" > "$WORKSPACE_PATH/.aegiside/workflow/${workflow}.md" 2>/dev/null || true
done
echo "  ✅ 13 workflows downloaded"

# Step 5: Initialize memory bank
echo "5️⃣  Initializing 8-schema memory bank..."
mkdir -p "$WORKSPACE_PATH/.aegiside/memory-bank"

# Create empty schemas if they don't exist
for schema in activeContext scratchpad kanban mistakes systemPatterns progress roadmap memory; do
    if [ ! -f "$WORKSPACE_PATH/.aegiside/memory-bank/${schema}.json" ]; then
        echo "{}" > "$WORKSPACE_PATH/.aegiside/memory-bank/${schema}.json"
    fi
done
echo "  ✅ Memory bank initialized"

# Step 6: Git initialization
echo "6️⃣  Setting up version control..."
if [ ! -d "$WORKSPACE_PATH/.git" ]; then
    git init
    echo "  ✅ Git initialized"
else
    echo "  ℹ️  Git already initialized"
fi

# Step 7: Self-contained setup complete
echo "7️⃣  Making framework self-contained..."
echo "  ✅ All components downloaded from GitHub"
echo "  ✅ Framework now operates independently"
echo "  ✅ No further GitHub dependency required"

# Cleanup temporary files
rm -f /tmp/aegiside_rules.md 2>/dev/null || true

echo ""
echo "==============================================="
echo "🎆 AegisIDE Framework Autonomously Installed!"
echo "==============================================="
echo ""
echo "🤖 Installation Summary:"
if [ "$ENHANCE_MODE" = true ]; then
    echo "  ✅ Enhanced existing global_rules.md (backup created)"
else
    echo "  ✅ Created fresh AegisIDE global_rules.md"
fi
echo "  ✅ Downloaded 10 router modules from GitHub"
echo "  ✅ Downloaded 13 workflows from GitHub"
echo "  ✅ Initialized 8-schema memory bank"
echo "  ✅ Framework is now self-contained"
echo ""
echo "🚀 Activation Steps:"
echo "  1. Restart your $IDE IDE"
echo "  2. Framework auto-activates via global_rules.md"
echo "  3. Type '/init' to verify activation"
echo ""
echo "🌐 GitHub Repository:"
echo "  Used for initial download only - no ongoing dependency"
echo "  Framework operates completely independently"
echo ""
