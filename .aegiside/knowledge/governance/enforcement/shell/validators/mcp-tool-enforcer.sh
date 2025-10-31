#!/bin/bash
# MCP Tool Selection Enforcer - Ensures correct MCP tool usage
# Penalty: -300 (prevents tool misuse)
# Rules:
#   - JSON files: MUST use @mcp:json-jq (NEVER read_file/edit)
#   - .aegiside/* (except memory-bank): MUST use curl from GitHub
#   - Memory-bank queries: MUST use @mcp:json-jq

set -e

# Detect path
if [ -n "$AEGISIDE_ROOT" ] && [ -d "$AEGISIDE_ROOT/.aegiside/memory-bank/memory" ]; then
    MEMORY_BANK="$AEGISIDE_ROOT/.aegiside/memory-bank/memory"
else
    SEARCH_DIR="$(pwd)"
    while [ "$SEARCH_DIR" != "/" ]; do
        if [ -d "$SEARCH_DIR/.aegiside/memory-bank/memory" ]; then
            MEMORY_BANK="$SEARCH_DIR/.aegiside/memory-bank/memory"
            break
        elif [ -d "$SEARCH_DIR/src/.aegiside/memory-bank/memory" ]; then
            MEMORY_BANK="$SEARCH_DIR/src/.aegiside/memory-bank/memory"
            break
        fi
        SEARCH_DIR="$(dirname "$SEARCH_DIR")"
    done
    
    if [ -z "$MEMORY_BANK" ]; then
        echo "❌ Error: Cannot find .aegiside/memory-bank/memory" >&2
        exit 1
    fi
fi

TIMESTAMP=$(date -Iseconds)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

validate_tool_selection() {
    local file_path="$1"
    local tool_used="$2"  # read_file, edit, curl, @mcp:json-jq, etc.
    
    printf "${YELLOW}🔍 MCP Tool Selection Enforcer${NC}\n" >&2
    printf "   File: $file_path\n" >&2
    printf "   Tool: $tool_used\n" >&2
    
    # RULE 1: JSON files MUST use @mcp:json-jq
    if echo "$file_path" | grep -qE '\.json$'; then
        if [ "$tool_used" != "@mcp:json-jq" ]; then
            printf "${RED}❌ VIOLATION: Wrong tool for JSON file${NC}\n" >&2
            printf "   File: $file_path (JSON)\n" >&2
            printf "   Tool Used: $tool_used\n" >&2
            printf "   Required: @mcp:json-jq\n" >&2
            printf "   Reason: JSON-ONLY rule (-25 penalty per global_rules.md)\n" >&2
            
            apply_penalty "Wrong tool for JSON: $tool_used instead of @mcp:json-jq" "-300"
            return 1
        fi
    fi
    
    # RULE 2: .aegiside/* framework files MUST use curl (GitHub)
    if echo "$file_path" | grep -qE '\.aegiside/(constitution|routers|workflows|schemas|enforcement|architecture)/'; then
        if [ "$tool_used" != "curl" ]; then
            printf "${RED}❌ VIOLATION: Framework file accessed incorrectly${NC}\n" >&2
            printf "   File: $file_path\n" >&2
            printf "   Tool Used: $tool_used\n" >&2
            printf "   Required: curl (GitHub)\n" >&2
            printf "   Reason: GITHUB-FIRST rule (-1000 penalty)\n" >&2
            
            apply_penalty "Framework file not accessed via GitHub: $file_path" "-1000"
            return 1
        fi
    fi
    
    # RULE 3: memory-bank/* MUST use @mcp:json-jq (LOCAL-ONLY)
    if echo "$file_path" | grep -qE '\.aegiside/memory-bank/memory/.*\.json'; then
        if [ "$tool_used" != "@mcp:json-jq" ]; then
            printf "${RED}❌ VIOLATION: Memory-bank accessed incorrectly${NC}\n" >&2
            printf "   File: $file_path\n" >&2
            printf "   Tool Used: $tool_used\n" >&2
            printf "   Required: @mcp:json-jq\n" >&2
            printf "   Reason: LOCAL-ONLY rule (-1000 penalty)\n" >&2
            
            apply_penalty "Memory-bank not accessed via @mcp:json-jq: $file_path" "-1000"
            return 1
        fi
    fi
    
    # RULE 4: Shell scripts (.sh) should use read_file (not banned)
    if echo "$file_path" | grep -qE '\.sh$'; then
        if [ "$tool_used" = "@mcp:json-jq" ]; then
            printf "${YELLOW}⚠️  Warning: @mcp:json-jq used for shell script${NC}\n" >&2
            printf "   Recommendation: Use read_file for .sh files\n" >&2
        fi
    fi
    
    printf "${GREEN}✅ Tool selection validated${NC}\n" >&2
    return 0
}

apply_penalty() {
    local reason="$1"
    local penalty="$2"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg penalty "$penalty" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("mcp_tool_violation_" + $timestamp),
               timestamp: $timestamp,
               category: "tool_selection",
               penalty: ($penalty | tonumber),
               details: $reason,
               source: "mcp-tool-enforcer"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_mcp_tool.json 2>/dev/null
        
        mv /tmp/progress_mcp_tool.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
        printf "${YELLOW}💰 Applied $penalty penalty${NC}\n" >&2
    fi
}

# Main execution
if [ $# -lt 2 ]; then
    echo "Usage: $0 <file_path> <tool_used>" >&2
    echo "Tools: read_file, edit, curl, @mcp:json-jq" >&2
    exit 1
fi

validate_tool_selection "$1" "$2"
