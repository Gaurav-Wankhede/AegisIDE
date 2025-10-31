#!/bin/bash
# Response Size Limiter - Prevents token overflow
# Penalty: -100

MEMORY_BANK=".aegiside/memory-bank/memory"
MAX_RESPONSE_SIZE=${2:-60000}  # Default 60K tokens (~240KB)

validate_response_size() {
    local response="$1"
    local size=${#response}
    
    echo "🔍 Response Size Limiter" >&2
    echo "   Size: $size characters" >&2
    echo "   Max: $MAX_RESPONSE_SIZE characters" >&2
    
    if [ "$size" -gt "$MAX_RESPONSE_SIZE" ]; then
        echo "❌ Response exceeds size limit" >&2
        
        if [ -f "$MEMORY_BANK/progress.json" ]; then
            jq --arg penalty "-100" --arg timestamp "$(date -Iseconds)" \
               '.rl_ledger += [{
                   tx_id: ("size_limit_" + $timestamp),
                   timestamp: $timestamp,
                   category: "response_size",
                   penalty: -100,
                   details: "Response too large",
                   source: "response-size-limiter"
               }] | .rl_totals.total_score += -100' \
               "$MEMORY_BANK/progress.json" > /tmp/progress_size.json
            
            mv /tmp/progress_size.json "$MEMORY_BANK/progress.json"
        fi
        return 1
    fi
    
    echo "✅ Response size within limits" >&2
    return 0
}

if [ $# -lt 1 ]; then
    echo "Usage: $0 <response_text> [max_size]" >&2
    exit 1
fi

validate_response_size "$1"
