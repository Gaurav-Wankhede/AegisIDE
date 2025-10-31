#!/bin/bash
# File Operation Guard - Prevents AI from modifying framework files
# Penalty: -1000 (framework corruption prevention)
# Usage: Called before ANY file write operation

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

validate_file_operation() {
    local file_path="$1"
    local operation="$2"  # CREATE, UPDATE, DELETE
    
    printf "${YELLOW}🛡️  File Operation Guard${NC}\n" >&2
    printf "   File: $file_path\n" >&2
    printf "   Operation: $operation\n" >&2
    
    # PROTECTED PATHS (absolute block)
    local protected_paths=(
        ".aegiside/constitution/"
        ".aegiside/routers/"
        ".aegiside/workflows/"
        ".aegiside/schemas/"
        ".aegiside/enforcement/shell/"
        ".aegiside/architecture/"
        ".aegiside/memory-bank/schemas/"
        "src/.aegiside/constitution/"
        "src/.aegiside/routers/"
        "src/.aegiside/workflows/"
        "src/.aegiside/schemas/"
        "src/.aegiside/enforcement/"
        "src/.aegiside/architecture/"
        "src/.aegiside/memory-bank/schemas/"
    )
    
    # Check if file is in protected path
    for protected in "${protected_paths[@]}"; do
        if echo "$file_path" | grep -q "$protected"; then
            printf "${RED}🚨 CRITICAL: Framework file modification BLOCKED${NC}\n" >&2
            printf "   Path: $file_path\n" >&2
            printf "   Reason: Framework files are immutable (GitHub-sourced)\n" >&2
            printf "   Protected: $protected\n" >&2
            printf "   Only .aegiside/memory-bank/memory/* is writable\n" >&2
            
            # Apply -1000 penalty
            apply_penalty "Attempted to modify protected file: $file_path" "-1000"
            return 1
        fi
    done
    
    # ALLOWED PATHS (explicitly permit)
    local allowed_paths=(
        ".aegiside/memory-bank/memory/"
        "src/.aegiside/memory-bank/memory/"
    )
    
    local is_allowed=false
    for allowed in "${allowed_paths[@]}"; do
        if echo "$file_path" | grep -q "$allowed"; then
            is_allowed=true
            break
        fi
    done
    
    # If not in allowed paths AND not user-requested, block
    if [ "$is_allowed" = false ]; then
        # Check if user explicitly requested file creation
        local user_requested=$(jq -r '.file_operation_intent.user_requested_file_creation // false' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
        
        if [ "$user_requested" != "true" ]; then
            printf "${RED}⚠️  BLOCKED: File operation outside memory-bank${NC}\n" >&2
            printf "   File: $file_path\n" >&2
            printf "   Allowed: .aegiside/memory-bank/memory/* only\n" >&2
            printf "   Exception: User must explicitly request file creation\n" >&2
            
            # Apply -500 penalty (less severe than framework modification)
            apply_penalty "Unauthorized file operation: $file_path" "-500"
            return 1
        fi
    fi
    
    printf "${GREEN}✅ File operation authorized${NC}\n" >&2
    return 0
}

apply_penalty() {
    local reason="$1"
    local penalty="$2"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg penalty "$penalty" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("file_operation_violation_" + $timestamp),
               timestamp: $timestamp,
               category: "file_protection",
               penalty: ($penalty | tonumber),
               details: $reason,
               source: "file-operation-guard"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_file_guard.json 2>/dev/null
        
        mv /tmp/progress_file_guard.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
        printf "${YELLOW}💰 Applied $penalty penalty${NC}\n" >&2
    fi
}

# Main execution
if [ $# -lt 2 ]; then
    echo "Usage: $0 <file_path> <operation>" >&2
    echo "Operations: CREATE, UPDATE, DELETE" >&2
    exit 1
fi

validate_file_operation "$1" "$2"
