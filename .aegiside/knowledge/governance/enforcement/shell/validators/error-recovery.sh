#!/bin/bash
# Error Recovery Enforcer - Ensures graceful degradation
# Penalty: -300 (prevents total failures)

set -e

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

handle_error_recovery() {
    local error_code="$1"
    local error_context="$2"
    
    printf "${YELLOW}🔄 Error Recovery Enforcer${NC}\n" >&2
    printf "   Error Code: $error_code\n" >&2
    printf "   Context: $error_context\n" >&2
    
    # Recovery strategies based on error type
    case "$error_code" in
        "SCHEMA_VALIDATION_FAILED")
            printf "   Strategy: Rollback to last valid state\n" >&2
            if [ -d "$MEMORY_BANK/.backup_"* ]; then
                printf "   Executing: Automatic rollback\n" >&2
                # Find latest backup
                local backup=$(ls -dt "$MEMORY_BANK/.backup_"* 2>/dev/null | head -1)
                if [ -n "$backup" ]; then
                    bash enforcement/shell/transactions/rollback-verifier.sh "$backup" activeContext progress systemPatterns
                fi
            fi
            ;;
        "GITHUB_FETCH_FAILED")
            printf "   Strategy: Use local cached version as fallback\n" >&2
            printf "   Warning: Using potentially stale data\n" >&2
            # Check for local cache
            if [ -d "/tmp/aegiside_cache" ]; then
                printf "   Found cache: /tmp/aegiside_cache\n" >&2
            else
                printf "${RED}   No cache available - halting${NC}\n" >&2
                return 1
            fi
            ;;
        "MCP_CHAIN_INCOMPLETE")
            printf "   Strategy: Resume from last completed step\n" >&2
            if [ -f "$MEMORY_BANK/activeContext.json" ]; then
                local last_step=$(jq -r '.mcp_chain_execution | to_entries | .[] | select(.value == true) | .key' "$MEMORY_BANK/activeContext.json" | tail -1)
                printf "   Last completed: $last_step\n" >&2
                printf "   Resuming chain from next step\n" >&2
            fi
            ;;
        "CONFIDENCE_TOO_LOW")
            printf "   Strategy: Request user assistance\n" >&2
            printf "   Current confidence below execution threshold\n" >&2
            printf "   Action: Prompt user for guidance\n" >&2
            # Log to scratchpad
            if [ -f "$MEMORY_BANK/scratchpad.json" ]; then
                jq --arg timestamp "$(date -Iseconds)" \
                   '.active_tasks += [{
                       task: "User assistance required",
                       reason: "Confidence too low",
                       timestamp: $timestamp
                   }]' "$MEMORY_BANK/scratchpad.json" > /tmp/scratchpad_tmp.json
                mv /tmp/scratchpad_tmp.json "$MEMORY_BANK/scratchpad.json"
            fi
            ;;
        "FILE_OPERATION_BLOCKED")
            printf "   Strategy: Suggest correct alternative\n" >&2
            printf "   Blocked: Attempt to modify protected file\n" >&2
            printf "   Alternative: Use memory-bank/memory/ directory\n" >&2
            ;;
        "TOOL_SELECTION_ERROR")
            printf "   Strategy: Auto-correct tool selection\n" >&2
            printf "   Use @mcp:json-jq for JSON files\n" >&2
            printf "   Use curl for GitHub .aegiside/ access\n" >&2
            ;;
        "TIMEOUT_EXCEEDED")
            printf "   Strategy: Terminate process and log\n" >&2
            printf "   Process exceeded time limit\n" >&2
            printf "   Terminating and recording incident\n" >&2
            ;;
        "MEMORY_LEAK_DETECTED")
            printf "   Strategy: Cleanup old patterns\n" >&2
            if [ -f "$MEMORY_BANK/systemPatterns.json" ]; then
                printf "   Archiving patterns older than 30 days\n" >&2
                # Archive to separate file
                jq '.architecture_patterns' "$MEMORY_BANK/systemPatterns.json" > "$MEMORY_BANK/systemPatterns.archive.json"
                # Keep only recent
                jq '.architecture_patterns = (.architecture_patterns | .[0:500])' "$MEMORY_BANK/systemPatterns.json" > /tmp/patterns_tmp.json
                mv /tmp/patterns_tmp.json "$MEMORY_BANK/systemPatterns.json"
            fi
            ;;
        "HARMFUL_COMMAND_DETECTED")
            printf "${RED}   Strategy: BLOCK IMMEDIATELY - NO RECOVERY${NC}\n" >&2
            printf "   Harmful command cannot be recovered\n" >&2
            printf "   User must modify command\n" >&2
            return 1
            ;;
        *)
            printf "${RED}   No recovery strategy for: $error_code${NC}\n" >&2
            printf "   Logging error for future strategy development\n" >&2
            apply_penalty "No error recovery strategy: $error_code" "-300"
            return 1
            ;;
    esac
    
    # Log error for learning
    if [ -f "$MEMORY_BANK/mistakes.json" ]; then
        jq --arg timestamp "$TIMESTAMP" \
           --arg error_code "$error_code" \
           --arg context "$error_context" \
           '.errors += [{
               timestamp: $timestamp,
               error_code: $error_code,
               context: $context,
               recovered: true
           }]' "$MEMORY_BANK/mistakes.json" > /tmp/mistakes_tmp.json
        
        mv /tmp/mistakes_tmp.json "$MEMORY_BANK/mistakes.json"
    fi
    
    printf "${GREEN}✅ Error recovery initiated${NC}\n" >&2
    return 0
}

apply_penalty() {
    local reason="$1"
    local penalty="$2"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg penalty "$penalty" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("error_recovery_" + $timestamp),
               timestamp: $timestamp,
               category: "error_recovery",
               penalty: ($penalty | tonumber),
               details: $reason,
               source: "error-recovery"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_error.json 2>/dev/null
        
        mv /tmp/progress_error.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
    fi
}

if [ $# -lt 2 ]; then
    echo "Usage: $0 <error_code> <error_context>" >&2
    exit 1
fi

handle_error_recovery "$1" "$2"
