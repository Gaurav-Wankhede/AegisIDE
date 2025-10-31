#!/bin/bash
# Constitutional Flow Enforcer - Enforces Legislature→Executive→Judiciary→Bodies sequence
# Penalty: -500
# Usage: Called when constitutional articles invoked

set -e

# Detect path
if [ -d "src/.aegiside/memory-bank/memory" ]; then
    MEMORY_BANK="src/.aegiside/memory-bank/memory"
elif [ -d ".aegiside/memory-bank/memory" ]; then
    MEMORY_BANK=".aegiside/memory-bank/memory"
elif [ -d "memory-bank/memory" ]; then
    MEMORY_BANK="memory-bank/memory"
else
    echo "❌ Error: Cannot find memory-bank" >&2
    exit 1
fi

TIMESTAMP=$(date -Iseconds)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

enforce_constitutional_flow() {
    local current_body="$1"
    
    printf "${YELLOW}⚖️  Constitutional Flow Enforcer${NC}\n" >&2
    printf "   Current body: $current_body\n" >&2
    
    # Valid constitutional flow sequence
    # Legislature (Parliament) → Executive → Judiciary → Constitutional Bodies
    
    # Get current flow position from activeContext
    local last_body=$(jq -r '.constitutional_flow.last_body // "none"' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    local flow_sequence=$(jq -r '.constitutional_flow.sequence // []' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    # Define valid transitions
    case "$last_body" in
        "none"|"initialization")
            # Can start with any body
            printf "${GREEN}✅ Starting constitutional flow${NC}\n" >&2
            ;;
        "legislature"|"parliament")
            # Legislature → Executive (valid)
            # Legislature → Judiciary (skip - invalid)
            if [ "$current_body" = "executive" ]; then
                printf "${GREEN}✅ Valid transition: Legislature → Executive${NC}\n" >&2
            else
                printf "${RED}❌ INVALID TRANSITION${NC}\n" >&2
                printf "   From: Legislature → To: $current_body\n" >&2
                printf "   Required: Legislature → Executive\n" >&2
                apply_penalty "Invalid constitutional flow: Skipped Executive"
                return 1
            fi
            ;;
        "executive")
            # Executive → Judiciary (valid)
            # Executive → Bodies (skip - invalid)
            if [ "$current_body" = "judiciary" ]; then
                printf "${GREEN}✅ Valid transition: Executive → Judiciary${NC}\n" >&2
            else
                printf "${RED}❌ INVALID TRANSITION${NC}\n" >&2
                printf "   From: Executive → To: $current_body\n" >&2
                printf "   Required: Executive → Judiciary\n" >&2
                apply_penalty "Invalid constitutional flow: Skipped Judiciary"
                return 1
            fi
            ;;
        "judiciary")
            # Judiciary → Bodies (valid)
            # Judiciary → Legislature (restart - valid)
            if [ "$current_body" = "bodies" ] || [ "$current_body" = "legislature" ]; then
                printf "${GREEN}✅ Valid transition: Judiciary → $current_body${NC}\n" >&2
            else
                printf "${YELLOW}⚠️  Unusual transition: Judiciary → $current_body${NC}\n" >&2
            fi
            ;;
        "bodies"|"constitutional_bodies")
            # Bodies can transition to any (cycle complete)
            printf "${GREEN}✅ Flow cycle complete - any transition allowed${NC}\n" >&2
            ;;
        *)
            printf "${YELLOW}⚠️  Unknown body: $last_body${NC}\n" >&2
            ;;
    esac
    
    # Update flow in activeContext
    update_flow "$current_body"
    
    return 0
}

apply_penalty() {
    local reason="$1"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg penalty "-500" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("constitutional_flow_violation_" + $timestamp),
               timestamp: $timestamp,
               category: "constitutional_compliance",
               penalty: ($penalty | tonumber),
               details: $reason,
               source: "constitutional-flow-enforcer"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_const.json 2>/dev/null
        
        mv /tmp/progress_const.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
        printf "${YELLOW}💰 Applied -500 penalty${NC}\n" >&2
    fi
}

update_flow() {
    local current_body="$1"
    
    if [ -f "$MEMORY_BANK/activeContext.json" ]; then
        jq --arg body "$current_body" --arg timestamp "$TIMESTAMP" \
           '.constitutional_flow.last_body = $body | 
            .constitutional_flow.last_transition = $timestamp |
            .constitutional_flow.sequence += [$body]' \
           "$MEMORY_BANK/activeContext.json" > /tmp/active_const.json 2>/dev/null
        
        mv /tmp/active_const.json "$MEMORY_BANK/activeContext.json" 2>/dev/null || true
    fi
}

# Main execution
if [ $# -lt 1 ]; then
    echo "Usage: $0 <current_body>" >&2
    echo "Bodies: legislature, executive, judiciary, bodies" >&2
    exit 1
fi

enforce_constitutional_flow "$1"
