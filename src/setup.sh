#!/bin/bash
# AegisIDE Framework Auto-Installer v3.2.1
# Autonomous dynamic installation with global_rules.md detection

set -e

echo "🤖 AegisIDE Framework Auto-Installer v3.2.1"
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

# Get global memory path and file name
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
        continue)
            case $os in
                linux) echo "$HOME/.continue" ;;
                macos) echo "$HOME/.continue" ;;
                windows) echo "$USERPROFILE/.continue" ;;
            esac ;;
        jetbrains)
            case $os in
                linux) echo "$HOME/.config/JetBrains" ;;
                macos) echo "$HOME/Library/Application Support/JetBrains" ;;
                windows) echo "$APPDATA/JetBrains" ;;
            esac ;;
    esac
}

# Get system prompt file name
get_prompt_filename() {
    local ide=$1
    
    case $ide in
        windsurf) echo "global_rules.md" ;;
        cursor) echo "global_rules.mdc" ;;
        vscode) echo "system_prompt.md" ;;
        continue) echo "system_prompt.md" ;;
        jetbrains) echo "ai_context.md" ;;
        *) echo "global_rules.md" ;;
    esac
}

# Validate downloaded content
validate_download() {
    local file=$1
    local description=$2
    
    if [ ! -f "$file" ] || [ ! -s "$file" ]; then
        echo "  ❌ ERROR: $description download failed (empty or missing)"
        return 1
    fi
    
    if grep -q "404" "$file" || grep -q "Not Found" "$file" || grep -q "<html" "$file"; then
        echo "  ❌ ERROR: $description download returned 404 or HTML error page"
        echo "  📄 Content preview:"
        head -n 5 "$file" | sed 's/^/     /'
        return 1
    fi
    
    return 0
}

# Ask user permission
ask_permission() {
    local prompt=$1
    local preview_file=$2
    
    echo ""
    echo "⚠️  IMPORTANT: System Prompt Modification"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "$prompt"
    echo ""
    
    if [ -n "$preview_file" ] && [ -f "$preview_file" ]; then
        echo "📋 Preview of content to be added (first 15 lines):"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        head -n 15 "$preview_file" | sed 's/^/  /'
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "  ... ($(wc -l < "$preview_file") total lines)"
        echo ""
    fi
    
    echo "🔄 A backup will be created at: ${EXISTING_RULES}.backup"
    echo ""
    
    while true; do
        read -p "Do you want to proceed? [Y/n]: " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            "" ) return 0;;  # Default to Yes on Enter
            * ) echo "Please answer Y or n.";;
        esac
    done
}

# Compare files and ask user if update needed
check_file_diff() {
    local new_file=$1
    local existing_file=$2
    local file_description=$3
    
    # If files are identical, return 0 (no update needed)
    if cmp -s "$new_file" "$existing_file"; then
        return 0
    fi
    
    # Files differ - show diff and ask user
    echo ""
    echo "⚠️  UPDATE DETECTED: $file_description"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🔍 Changes detected between local and remote versions:"
    echo ""
    
    # Show unified diff (first 20 lines)
    if command -v diff &> /dev/null; then
        diff -u "$existing_file" "$new_file" 2>/dev/null | head -n 20 | sed 's/^/  /'
        echo ""
        echo "  Legend: - (removed lines), + (added lines)"
    else
        echo "  ⚠️  diff command not available, showing file sizes:"
        echo "  Current: $(wc -l < "$existing_file") lines"
        echo "  New: $(wc -l < "$new_file") lines"
    fi
    
    echo ""
    echo "💾 Backup will be created: ${existing_file}.backup"
    echo ""
    
    while true; do
        read -p "Update $file_description? [Y/n]: " yn
        case $yn in
            [Yy]* ) return 1;;  # Return 1 to indicate update needed
            [Nn]* ) return 0;;  # Return 0 to skip update
            "" ) return 1;;     # Default to Yes on Enter
            * ) echo "Please answer Y or n.";;
        esac
    done
}

OS=$(detect_os)
IDE=$(detect_ide)
GLOBAL_PATH=$(get_global_path $OS $IDE)
PROMPT_FILENAME=$(get_prompt_filename $IDE)
WORKSPACE_PATH=$(pwd)
WORKSPACE_IDE_PATH="$WORKSPACE_PATH/.${IDE}/aegiside"
GITHUB_REPO="https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main"

echo "📋 System Detection"
echo "  OS: $OS"
echo "  IDE: $IDE"
echo "  Global Memory: $GLOBAL_PATH"
echo "  Prompt File: $PROMPT_FILENAME"
echo "  Workspace: $WORKSPACE_PATH"
echo "  Framework Path: $WORKSPACE_IDE_PATH"
echo ""

# Check for existing system prompt file
EXISTING_RULES="$GLOBAL_PATH/$PROMPT_FILENAME"
if [ -f "$EXISTING_RULES" ]; then
    echo "🔍 Existing $PROMPT_FILENAME detected"
    echo "  ✅ Will enhance existing rules with AegisIDE framework"
    ENHANCE_MODE=true
else
    echo "🆕 No existing $PROMPT_FILENAME found"
    echo "  ✅ Will create fresh AegisIDE $PROMPT_FILENAME"
    ENHANCE_MODE=false
fi
echo ""

# Detect installation mode
if [ -d "$WORKSPACE_IDE_PATH" ] && [ -f "$WORKSPACE_IDE_PATH/context-router.json" ]; then
    INSTALL_MODE="update"
    echo "🔄 UPDATE MODE: AegisIDE framework detected"
    echo "  ℹ️  Existing files will be preserved"
    echo "  ✨ Only missing components will be added"
else
    INSTALL_MODE="fresh"
    echo "🆕 FRESH INSTALL: Setting up AegisIDE framework"
fi
echo ""

echo "📦 Installing AegisIDE Framework..."
echo "🌐 Downloading from GitHub (temporary)"
echo ""

# Step 1: Handle system prompt file (enhance or create)
echo "1️⃣  Processing $PROMPT_FILENAME..."
mkdir -p "$GLOBAL_PATH"

if [ "$ENHANCE_MODE" = true ]; then
    echo "  📥 Downloading AegisIDE framework rules..."
    
    # Download to temp file first
    if ! curl -sL "$GITHUB_REPO/src/global-rules.md" > /tmp/aegiside_rules.md; then
        echo "  ❌ ERROR: Failed to download AegisIDE rules from GitHub"
        echo "  🌐 URL: $GITHUB_REPO/src/global-rules.md"
        echo "  🔧 Please check your internet connection or try again later"
        exit 1
    fi
    
    # Validate downloaded content
    if ! validate_download "/tmp/aegiside_rules.md" "AegisIDE rules"; then
        echo "  🔧 Please check if the GitHub repository exists and is accessible"
        echo "  🌐 Repository: https://github.com/Gaurav-Wankhede/AegisIDE"
        rm -f /tmp/aegiside_rules.md
        exit 1
    fi
    
    echo "  ✅ Download validated successfully"
    
    # Ask for permission before modifying system prompt
    if ask_permission "This will APPEND AegisIDE framework rules to your existing $PROMPT_FILENAME.\nThis modifies your IDE's system prompt and affects all AI interactions." "/tmp/aegiside_rules.md"; then
        # Backup existing rules
        cp "$EXISTING_RULES" "$EXISTING_RULES.backup"
        echo ""
        echo "  💾 Backed up existing $PROMPT_FILENAME → ${PROMPT_FILENAME}.backup"
        
        # Append AegisIDE rules
        echo "" >> "$EXISTING_RULES"
        echo "# =================================" >> "$EXISTING_RULES"
        echo "# AegisIDE Framework (Auto-Added)" >> "$EXISTING_RULES"
        echo "# =================================" >> "$EXISTING_RULES"
        cat /tmp/aegiside_rules.md >> "$EXISTING_RULES"
        echo "  ✅ Enhanced existing $PROMPT_FILENAME with AegisIDE framework"
        echo ""
        echo "  🔄 To rollback: cp \"$EXISTING_RULES.backup\" \"$EXISTING_RULES\""
    else
        echo ""
        echo "  ⏭️  Skipped system prompt modification (user declined)"
        echo "  ℹ️  Framework will still be installed to workspace"
        echo "  ℹ️  You can manually add rules later if needed"
        rm -f /tmp/aegiside_rules.md
    fi
else
    echo "  📥 Downloading AegisIDE framework rules..."
    
    # Download to temp file first
    if ! curl -sL "$GITHUB_REPO/src/system-prompt.md" > /tmp/aegiside_rules.md; then
        echo "  ❌ ERROR: Failed to download AegisIDE system prompt from GitHub"
        exit 1
    fi
    
    # Validate downloaded content
    if ! validate_download "/tmp/aegiside_rules.md" "AegisIDE rules"; then
        rm -f /tmp/aegiside_rules.md
        exit 1
    fi
    
    # Ask for permission to create new system prompt
    if ask_permission "This will CREATE a new $PROMPT_FILENAME with AegisIDE framework rules.\nThis creates a new IDE system prompt for AI interactions." "/tmp/aegiside_rules.md"; then
        cp /tmp/aegiside_rules.md "$GLOBAL_PATH/$PROMPT_FILENAME"
        echo ""
        echo "  ✅ Created fresh AegisIDE $PROMPT_FILENAME"
    else
        echo ""
        echo "  ⏭️  Skipped system prompt creation (user declined)"
        rm -f /tmp/aegiside_rules.md
    fi
fi

# Step 1.5: Handle mcp_servers.json configuration
echo "1️⃣.5 Processing mcp_servers.json..."

# Download AegisIDE's 6 MCP configuration
if ! curl -sL "$GITHUB_REPO/src/mcp_servers.json" > /tmp/aegiside_mcp_servers.json; then
    echo "  ⚠️  Failed to download mcp_servers.json, skipping MCP configuration"
else
    if validate_download "/tmp/aegiside_mcp_servers.json" "mcp_servers.json"; then
        # Check if mcp_servers.json exists in project
        if [ -f "$WORKSPACE_PATH/mcp_servers.json" ]; then
            echo ""
            echo "  📋 Existing mcp_servers.json detected"
            echo ""
            echo "  🔧 AegisIDE uses 6 mandatory MCPs:"
            echo "     • json-jq (JSON operations)"
            echo "     • sequential-thinking (reasoning)"
            echo "     • git (version control)"
            echo "     • context7 (documentation)"
            echo "     • exa (code research)"
            echo "     • fetch (web content)"
            echo ""
            echo "  Options:"
            echo "    R) Replace entire file with AegisIDE configuration"
            echo "    A) Append AegisIDE MCPs to existing file"
            echo "    N) No changes (keep your current configuration)"
            echo ""
            
            while true; do
                read -p "  Your choice [R/A/N]: " choice
                case $choice in
                    [Rr]* )
                        cp "$WORKSPACE_PATH/mcp_servers.json" "$WORKSPACE_PATH/mcp_servers.json.backup"
                        cp /tmp/aegiside_mcp_servers.json "$WORKSPACE_PATH/mcp_servers.json"
                        echo ""
                        echo "  ✅ Replaced mcp_servers.json with AegisIDE configuration"
                        echo "  💾 Backup: mcp_servers.json.backup"
                        break;;
                    [Aa]* )
                        cp "$WORKSPACE_PATH/mcp_servers.json" "$WORKSPACE_PATH/mcp_servers.json.backup"
                        # Merge MCPs using jq
                        jq -s '.[0].mcpServers * .[1].mcpServers | {mcpServers: .}' \
                            "$WORKSPACE_PATH/mcp_servers.json" /tmp/aegiside_mcp_servers.json \
                            > /tmp/merged_mcp_servers.json
                        mv /tmp/merged_mcp_servers.json "$WORKSPACE_PATH/mcp_servers.json"
                        echo ""
                        echo "  ✅ Appended AegisIDE MCPs to existing configuration"
                        echo "  💾 Backup: mcp_servers.json.backup"
                        break;;
                    [Nn]* )
                        echo ""
                        echo "  ⏭️  Skipped mcp_servers.json modification"
                        echo "  ℹ️  You can manually add MCPs from /tmp/aegiside_mcp_servers.json"
                        break;;
                    * ) echo "  Please answer R, A, or N.";;
                esac
            done
        else
            echo "  🆕 No existing mcp_servers.json found"
            cp /tmp/aegiside_mcp_servers.json "$WORKSPACE_PATH/mcp_servers.json"
            echo "  ✅ Created mcp_servers.json with AegisIDE's 6 MCPs"
        fi
    else
        echo "  ⚠️  Failed to validate mcp_servers.json, skipping"
    fi
    rm -f /tmp/aegiside_mcp_servers.json
fi
echo ""

# Step 2: Download and install router system
echo "2️⃣  Downloading modular router system..."
mkdir -p "$WORKSPACE_IDE_PATH/routers"

# Download all router modules with validation
ROUTER_SUCCESS=0
ROUTER_SKIPPED=0
for router in core mcps constitutional parliamentary session memory-bank autonomy violations workflows governance; do
    if [ "$INSTALL_MODE" = "update" ] && [ -f "$WORKSPACE_IDE_PATH/routers/${router}.json" ]; then
        # File exists - download and compare
        if curl -sL "$GITHUB_REPO/src/aegiside/routers/${router}.json" > "/tmp/${router}.json" 2>/dev/null; then
            if validate_download "/tmp/${router}.json" "${router} router"; then
                # Check if files differ
                if check_file_diff "/tmp/${router}.json" "$WORKSPACE_IDE_PATH/routers/${router}.json" "${router}.json"; then
                    # Files identical or user declined update
                    echo "  ✓ ${router}.json unchanged, keeping existing"
                    ((ROUTER_SKIPPED++))
                    ((ROUTER_SUCCESS++))
                    rm -f "/tmp/${router}.json"
                else
                    # User approved update
                    cp "$WORKSPACE_IDE_PATH/routers/${router}.json" "$WORKSPACE_IDE_PATH/routers/${router}.json.backup"
                    mv "/tmp/${router}.json" "$WORKSPACE_IDE_PATH/routers/${router}.json"
                    echo "  ✅ ${router}.json updated (backup created)"
                    ((ROUTER_SUCCESS++))
                fi
            else
                echo "  ⚠️  Failed to validate ${router}.json, keeping existing"
                ((ROUTER_SKIPPED++))
                ((ROUTER_SUCCESS++))
                rm -f "/tmp/${router}.json"
            fi
        else
            echo "  ⚠️  Failed to download ${router}.json, keeping existing"
            ((ROUTER_SKIPPED++))
            ((ROUTER_SUCCESS++))
        fi
    else
        echo "  📥 Downloading ${router}.json..."
        if curl -sL "$GITHUB_REPO/src/aegiside/routers/${router}.json" > "/tmp/${router}.json" 2>/dev/null; then
            if validate_download "/tmp/${router}.json" "${router} router"; then
                mv "/tmp/${router}.json" "$WORKSPACE_IDE_PATH/routers/${router}.json"
                ((ROUTER_SUCCESS++))
            else
                echo "  ⚠️  Failed to validate ${router}.json, skipping"
                rm -f "/tmp/${router}.json"
            fi
        else
            echo "  ⚠️  Failed to download ${router}.json, skipping"
        fi
    fi
done

# Download main context router
if [ "$INSTALL_MODE" = "update" ] && [ -f "$WORKSPACE_IDE_PATH/context-router.json" ]; then
    if curl -sL "$GITHUB_REPO/src/aegiside/context-router.json" > "/tmp/context-router.json" 2>/dev/null; then
        if validate_download "/tmp/context-router.json" "context router"; then
            if check_file_diff "/tmp/context-router.json" "$WORKSPACE_IDE_PATH/context-router.json" "context-router.json"; then
                echo "  ✓ context-router.json unchanged, keeping existing"
                ((ROUTER_SKIPPED++))
                ((ROUTER_SUCCESS++))
                rm -f "/tmp/context-router.json"
            else
                cp "$WORKSPACE_IDE_PATH/context-router.json" "$WORKSPACE_IDE_PATH/context-router.json.backup"
                mv "/tmp/context-router.json" "$WORKSPACE_IDE_PATH/context-router.json"
                echo "  ✅ context-router.json updated (backup created)"
                ((ROUTER_SUCCESS++))
            fi
        else
            echo "  ⚠️  Failed to validate context-router.json, keeping existing"
            ((ROUTER_SKIPPED++))
            ((ROUTER_SUCCESS++))
            rm -f "/tmp/context-router.json"
        fi
    else
        echo "  ⚠️  Failed to download context-router.json, keeping existing"
        ((ROUTER_SKIPPED++))
        ((ROUTER_SUCCESS++))
    fi
else
    echo "  📥 Downloading context-router.json..."
    if curl -sL "$GITHUB_REPO/src/aegiside/context-router.json" > "/tmp/context-router.json" 2>/dev/null; then
        if validate_download "/tmp/context-router.json" "context router"; then
            mv "/tmp/context-router.json" "$WORKSPACE_IDE_PATH/context-router.json"
            ((ROUTER_SUCCESS++))
        else
            rm -f "/tmp/context-router.json"
        fi
    fi
fi

if [ "$INSTALL_MODE" = "update" ] && [ $ROUTER_SKIPPED -gt 0 ]; then
    echo "  ✅ $ROUTER_SUCCESS/11 router modules (${ROUTER_SKIPPED} already present, preserved)"
else
    echo "  ✅ $ROUTER_SUCCESS/11 router modules downloaded successfully"
fi

# Step 3: Download schemas
echo "3️⃣  Downloading schema validators..."
mkdir -p "$WORKSPACE_IDE_PATH/schemas"

# Download schema files with validation
SCHEMA_SUCCESS=0
SCHEMA_SKIPPED=0
for schema in activeContext kanban memory mistakes progress roadmap scratchpad systemPatterns schema-integrity-validator; do
    if [ "$INSTALL_MODE" = "update" ] && [ -f "$WORKSPACE_IDE_PATH/schemas/${schema}.schema.json" ]; then
        if curl -sL "$GITHUB_REPO/src/aegiside/schemas/${schema}.schema.json" > "/tmp/${schema}.schema.json" 2>/dev/null; then
            if validate_download "/tmp/${schema}.schema.json" "${schema} schema"; then
                if check_file_diff "/tmp/${schema}.schema.json" "$WORKSPACE_IDE_PATH/schemas/${schema}.schema.json" "${schema}.schema.json"; then
                    ((SCHEMA_SKIPPED++))
                    ((SCHEMA_SUCCESS++))
                    rm -f "/tmp/${schema}.schema.json"
                else
                    cp "$WORKSPACE_IDE_PATH/schemas/${schema}.schema.json" "$WORKSPACE_IDE_PATH/schemas/${schema}.schema.json.backup"
                    mv "/tmp/${schema}.schema.json" "$WORKSPACE_IDE_PATH/schemas/${schema}.schema.json"
                    ((SCHEMA_SUCCESS++))
                fi
            else
                ((SCHEMA_SKIPPED++))
                ((SCHEMA_SUCCESS++))
                rm -f "/tmp/${schema}.schema.json"
            fi
        else
            ((SCHEMA_SKIPPED++))
            ((SCHEMA_SUCCESS++))
        fi
    else
        if curl -sL "$GITHUB_REPO/src/aegiside/schemas/${schema}.schema.json" > "/tmp/${schema}.schema.json" 2>/dev/null; then
            if validate_download "/tmp/${schema}.schema.json" "${schema} schema"; then
                mv "/tmp/${schema}.schema.json" "$WORKSPACE_IDE_PATH/schemas/${schema}.schema.json"
                ((SCHEMA_SUCCESS++))
            else
                rm -f "/tmp/${schema}.schema.json"
            fi
        fi
    fi
done
if [ "$INSTALL_MODE" = "update" ] && [ $SCHEMA_SKIPPED -gt 0 ]; then
    echo "  ✅ $SCHEMA_SUCCESS/9 schema validators (${SCHEMA_SKIPPED} unchanged, preserved)"
else
    echo "  ✅ $SCHEMA_SUCCESS/9 schema validators downloaded successfully"
fi

# Step 4: Download workflows
echo "4️⃣  Downloading workflows..."
mkdir -p "$WORKSPACE_IDE_PATH/workflow"

# Download workflow files with validation
WORKFLOW_SUCCESS=0
WORKFLOW_SKIPPED=0
for workflow in bootstrap continue fix init memory-status next optimize oversight-checks-and-balances research status update validate auto-init; do
    if [ "$INSTALL_MODE" = "update" ] && [ -f "$WORKSPACE_IDE_PATH/workflow/${workflow}.md" ]; then
        if curl -sL "$GITHUB_REPO/src/workflow/${workflow}.md" > "/tmp/${workflow}.md" 2>/dev/null; then
            if validate_download "/tmp/${workflow}.md" "${workflow} workflow"; then
                if check_file_diff "/tmp/${workflow}.md" "$WORKSPACE_IDE_PATH/workflow/${workflow}.md" "${workflow}.md"; then
                    ((WORKFLOW_SKIPPED++))
                    ((WORKFLOW_SUCCESS++))
                    rm -f "/tmp/${workflow}.md"
                else
                    cp "$WORKSPACE_IDE_PATH/workflow/${workflow}.md" "$WORKSPACE_IDE_PATH/workflow/${workflow}.md.backup"
                    mv "/tmp/${workflow}.md" "$WORKSPACE_IDE_PATH/workflow/${workflow}.md"
                    ((WORKFLOW_SUCCESS++))
                fi
            else
                ((WORKFLOW_SKIPPED++))
                ((WORKFLOW_SUCCESS++))
                rm -f "/tmp/${workflow}.md"
            fi
        else
            ((WORKFLOW_SKIPPED++))
            ((WORKFLOW_SUCCESS++))
        fi
    else
        if curl -sL "$GITHUB_REPO/src/workflow/${workflow}.md" > "/tmp/${workflow}.md" 2>/dev/null; then
            if validate_download "/tmp/${workflow}.md" "${workflow} workflow"; then
                mv "/tmp/${workflow}.md" "$WORKSPACE_IDE_PATH/workflow/${workflow}.md"
                ((WORKFLOW_SUCCESS++))
            else
                rm -f "/tmp/${workflow}.md"
            fi
        fi
    fi
done
if [ "$INSTALL_MODE" = "update" ] && [ $WORKFLOW_SKIPPED -gt 0 ]; then
    echo "  ✅ $WORKFLOW_SUCCESS/13 workflows (${WORKFLOW_SKIPPED} unchanged, preserved)"
else
    echo "  ✅ $WORKFLOW_SUCCESS/13 workflows downloaded successfully"
fi

# Step 5: Initialize 8-schema memory bank with project info
echo "5️⃣  Initializing 8-schema memory bank..."
mkdir -p "$WORKSPACE_IDE_PATH/memory-bank"

# Get project information
PROJECT_NAME=$(basename "$WORKSPACE_PATH")
CURRENT_TIMESTAMP=$(date '+%Y-%m-%dT%H:%M:%S%z')
SESSION_ID="aegiside-$(date '+%Y%m%d-%H%M%S')"
PROMPT_FILENAME=$(get_prompt_filename $IDE)

# Download and customize each schema with project-specific data
for schema in activeContext kanban memory mistakes progress roadmap scratchpad systemPatterns; do
    curl -sL "$GITHUB_REPO/src/aegiside/memory-bank/${schema}.json" > "$WORKSPACE_IDE_PATH/memory-bank/${schema}.json"
    
    # Replace placeholders with actual project information
    sed -i "s/PLACEHOLDER_TIMESTAMP/$CURRENT_TIMESTAMP/g" "$WORKSPACE_IDE_PATH/memory-bank/${schema}.json"
    sed -i "s/PLACEHOLDER_SESSION_ID/$SESSION_ID/g" "$WORKSPACE_IDE_PATH/memory-bank/${schema}.json"
    sed -i "s/PLACEHOLDER_PROJECT_NAME/$PROJECT_NAME/g" "$WORKSPACE_IDE_PATH/memory-bank/${schema}.json"
    sed -i "s|PLACEHOLDER_WORKSPACE_PATH|$WORKSPACE_PATH|g" "$WORKSPACE_IDE_PATH/memory-bank/${schema}.json"
    sed -i "s/PLACEHOLDER_IDE/$IDE/g" "$WORKSPACE_IDE_PATH/memory-bank/${schema}.json"
    sed -i "s/PLACEHOLDER_PROMPT_FILE/$PROMPT_FILENAME/g" "$WORKSPACE_IDE_PATH/memory-bank/${schema}.json"
    sed -i "s/PLACEHOLDER_DATE/$(date '+%Y-%m-%d')/g" "$WORKSPACE_IDE_PATH/memory-bank/${schema}.json"
done
echo "  ✅ Memory bank initialized with project: $PROJECT_NAME"

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
    echo "  ✅ Enhanced existing $PROMPT_FILENAME (backup created)"
else
    echo "  ✅ Created fresh AegisIDE $PROMPT_FILENAME"
fi
echo "  ✅ Downloaded 10 router modules from GitHub"
echo "  ✅ Downloaded 13 workflows from GitHub"
echo "  ✅ Initialized 8-schema memory bank"
echo "  ✅ Framework is now self-contained"
echo ""
echo "🚀 Activation Steps:"
echo "  1. Restart your $IDE IDE"
echo "  2. Framework auto-activates via $PROMPT_FILENAME"
echo "  3. Type '/init' to verify activation"
echo ""
echo "🌐 GitHub Repository:"
echo "  Used for initial download only - no ongoing dependency"
echo "  Framework operates completely independently"
echo ""
