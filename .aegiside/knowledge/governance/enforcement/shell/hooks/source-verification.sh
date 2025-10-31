#!/bin/bash
# Source Verification Gate - Prevents AI hallucination by requiring sources
# Penalty: -1000 (same as GITHUB-FIRST rule)
# Usage: Called before any AI response with factual claims

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

verify_sources() {
    local response_file="$1"
    
    printf "${YELLOW}🔍 Source Verification Gate${NC}\n" >&2
    
    # Check if response contains factual claims
    local has_factual_claims=false
    
    # Keywords indicating factual claims that need sources
    local factual_keywords=(
        "implementation"
        "requirement"
        "must have"
        "configuration"
        "API endpoint"
        "function"
        "class"
        "method"
        "file structure"
        "architecture"
    )
    
    # Check for factual claims in response
    for keyword in "${factual_keywords[@]}"; do
        if grep -qi "$keyword" "$response_file" 2>/dev/null; then
            has_factual_claims=true
            break
        fi
    done
    
    if [ "$has_factual_claims" = false ]; then
        printf "${GREEN}✅ No factual claims detected - source verification skipped${NC}\n" >&2
        return 0
    fi
    
    # Check for valid sources
    local valid_sources=(
        "@mcp:context7"
        "@mcp:exa"
        "GitHub"
        "curl"
        "memory-bank"
        "systemPatterns"
        "activeContext"
        "\.json"
        "\.schema\.json"
        "enforcement"
        "verified"
    )
    
    local has_sources=false
    for source in "${valid_sources[@]}"; do
        if grep -qi "$source" "$response_file" 2>/dev/null; then
            has_sources=true
            break
        fi
    done
    
    if [ "$has_sources" = false ]; then
        printf "${RED}❌ SOURCE VERIFICATION FAILED${NC}\n" >&2
        printf "   Factual claims detected but NO sources cited\n" >&2
        printf "   Required sources: @mcp:context7, GitHub, memory-bank\n" >&2
        printf "   HALLUCINATION RISK: HIGH\n" >&2
        
        # Apply -1000 penalty
        if [ -f "$MEMORY_BANK/progress.json" ]; then
            jq --arg penalty "-1000" --arg timestamp "$TIMESTAMP" \
               '.rl_ledger += [{
                   tx_id: ("source_verification_failed_" + $timestamp),
                   timestamp: $timestamp,
                   category: "hallucination_prevention",
                   penalty: ($penalty | tonumber),
                   details: "Factual claims without sources - potential hallucination",
                   source: "source-verification-gate"
               }] | .rl_totals.total_score += ($penalty | tonumber)' \
               "$MEMORY_BANK/progress.json" > /tmp/progress_source.json 2>/dev/null
            
            mv /tmp/progress_source.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
            printf "${YELLOW}💰 Applied -1000 penalty${NC}\n" >&2
        fi
        
        return 1
    fi
    
    printf "${GREEN}✅ Source verification passed - sources cited${NC}\n" >&2
    return 0
}

# Main execution
if [ $# -lt 1 ]; then
    echo "Usage: $0 <response_file>" >&2
    exit 1
fi

verify_sources "$1"
