#!/bin/bash
# Requirements Compliance Gate - Ensures solution matches client requirements
# Penalty: -1000
# Usage: Called before delivering solution

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

validate_requirements() {
    local user_query="$1"
    local solution="$2"
    
    printf "${YELLOW}🎯 Requirements Compliance Gate${NC}\n" >&2
    
    # Extract requirements from user query
    # Keywords indicating requirements
    local requirement_keywords=(
        "must"
        "need"
        "required"
        "should"
        "have to"
        "ensure"
        "make sure"
        "implement"
        "add"
        "create"
        "update"
    )
    
    local requirements_found=()
    
    # Extract requirements
    while IFS= read -r line; do
        for keyword in "${requirement_keywords[@]}"; do
            if echo "$line" | grep -qi "$keyword"; then
                requirements_found+=("$line")
                break
            fi
        done
    done <<< "$user_query"
    
    if [ ${#requirements_found[@]} -eq 0 ]; then
        printf "${GREEN}✅ No explicit requirements detected${NC}\n" >&2
        return 0
    fi
    
    printf "   Found ${#requirements_found[@]} requirement(s)\n" >&2
    
    # Check if solution addresses each requirement
    local unmet_requirements=()
    
    for req in "${requirements_found[@]}"; do
        # Extract key words from requirement
        local key_words=$(echo "$req" | tr '[:upper:]' '[:lower:]' | grep -oE '\b[a-z]{4,}\b' | head -5)
        
        local requirement_met=false
        for word in $key_words; do
            if echo "$solution" | grep -qi "$word"; then
                requirement_met=true
                break
            fi
        done
        
        if [ "$requirement_met" = false ]; then
            unmet_requirements+=("$req")
        fi
    done
    
    if [ ${#unmet_requirements[@]} -gt 0 ]; then
        printf "${RED}❌ REQUIREMENTS COMPLIANCE FAILED${NC}\n" >&2
        printf "   ${#unmet_requirements[@]} requirement(s) not addressed in solution\n" >&2
        printf "   Unmet requirements:\n" >&2
        for unmet in "${unmet_requirements[@]}"; do
            printf "   - ${unmet:0:80}...\n" >&2
        done
        
        # Apply -1000 penalty
        if [ -f "$MEMORY_BANK/progress.json" ]; then
            jq --arg penalty "-1000" --arg timestamp "$TIMESTAMP" \
               --arg details "Solution does not address all client requirements (${#unmet_requirements[@]} unmet)" \
               '.rl_ledger += [{
                   tx_id: ("requirements_violation_" + $timestamp),
                   timestamp: $timestamp,
                   category: "requirements_compliance",
                   penalty: ($penalty | tonumber),
                   details: $details,
                   source: "requirements-validator"
               }] | .rl_totals.total_score += ($penalty | tonumber)' \
               "$MEMORY_BANK/progress.json" > /tmp/progress_req.json 2>/dev/null
            
            mv /tmp/progress_req.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
            printf "${YELLOW}💰 Applied -1000 penalty${NC}\n" >&2
        fi
        
        return 1
    fi
    
    printf "${GREEN}✅ All requirements addressed in solution${NC}\n" >&2
    return 0
}

# Main execution
if [ $# -lt 2 ]; then
    echo "Usage: $0 <user_query_file> <solution_file>" >&2
    exit 1
fi

validate_requirements "$1" "$2"
