#!/bin/bash
# Output Validator - Ensures AI responses are complete and well-formed
# Penalty: -500 (prevents incomplete deliverables)
# Usage: Called before sending response to user

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

validate_output() {
    local response="$1"
    
    printf "${YELLOW}🔍 Output Validator${NC}\n" >&2
    
    local validation_errors=()
    
    # Check 1: Response length (minimum 50 characters)
    local length=${#response}
    if [ "$length" -lt 50 ]; then
        validation_errors+=("Response too short ($length chars, minimum 50)")
    fi
    
    # Check 2: STRUCTURED response required (confidence, sources, verification)
    if ! echo "$response" | grep -qE "(confidence|sources|verification)"; then
        validation_errors+=("Missing structured response fields (confidence, sources, verification)")
    fi
    
    # Check 3: Check for incomplete code blocks
    local backtick_count=$(echo "$response" | grep -o '```' | wc -l)
    if [ $((backtick_count % 2)) -ne 0 ]; then
        validation_errors+=("Incomplete code blocks (unmatched \`\`\`)")
    fi
    
    # Check 4: Check for TODO/FIXME/placeholder comments
    if echo "$response" | grep -qE "(TODO:|FIXME:|PLACEHOLDER|\\.\\.\\.|XXX)"; then
        validation_errors+=("Response contains placeholder/incomplete markers")
    fi
    
    # Check 5: Check for broken markdown links
    if echo "$response" | grep -qE '\[[^]]+\]\(\)'; then
        validation_errors+=("Broken markdown links detected")
    fi
    
    # Check 6: Verify requirements coverage (if requirements exist)
    if [ -f "$MEMORY_BANK/activeContext.json" ]; then
        local requirements=$(jq -r '.requirements // [] | length' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
        if [ "$requirements" -gt 0 ]; then
            # Check if requirements were addressed in response
            local requirements_list=$(jq -r '.requirements[]' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
            while IFS= read -r req; do
                if ! echo "$response" | grep -qiE "$req"; then
                    validation_errors+=("Requirement not addressed: $req")
                fi
            done <<< "$requirements_list"
        fi
    fi
    
    # Check 7: Verify no hallucination markers
    if echo "$response" | grep -qE "(I think|probably|maybe|might be|I assume|I believe)"; then
        validation_errors+=("Response contains uncertainty markers (potential hallucination)")
    fi
    
    # Report results
    if [ ${#validation_errors[@]} -gt 0 ]; then
        printf "${RED}❌ OUTPUT VALIDATION FAILED${NC}\n" >&2
        printf "   Errors found: ${#validation_errors[@]}\n" >&2
        for error in "${validation_errors[@]}"; do
            printf "   - $error\n" >&2
        done
        
        apply_penalty "Output validation failed: ${validation_errors[*]}" "-500"
        return 1
    fi
    
    printf "${GREEN}✅ Output validation passed${NC}\n" >&2
    printf "   Length: $length chars\n" >&2
    printf "   Structured: Yes\n" >&2
    printf "   Complete: Yes\n" >&2
    
    return 0
}

apply_penalty() {
    local reason="$1"
    local penalty="$2"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg penalty "$penalty" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("output_validation_" + $timestamp),
               timestamp: $timestamp,
               category: "output_quality",
               penalty: ($penalty | tonumber),
               details: $reason,
               source: "output-validator"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_output.json 2>/dev/null
        
        mv /tmp/progress_output.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
        printf "${YELLOW}💰 Applied $penalty penalty${NC}\n" >&2
    fi
}

# Main execution
if [ $# -lt 1 ]; then
    echo "Usage: $0 <response_text_or_file>" >&2
    exit 1
fi

# Check if input is a file or text
if [ -f "$1" ]; then
    response=$(cat "$1")
else
    response="$1"
fi

validate_output "$response"
