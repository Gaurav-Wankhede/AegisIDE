#!/bin/bash
# Execution Time Limiter - Prevents runaway processes
# Penalty: -200

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)
TIMEOUT_SECONDS=${2:-300}  # Default 5 minutes

enforce_timeout() {
    local command="$1"
    
    timeout "$TIMEOUT_SECONDS" bash -c "$command" || {
        local exit_code=$?
        if [ $exit_code -eq 124 ]; then
            echo "❌ Command timed out after $TIMEOUT_SECONDS seconds" >&2
            
            if [ -f "$MEMORY_BANK/progress.json" ]; then
                jq --arg penalty "-200" --arg timestamp "$TIMESTAMP" \
                   '.rl_ledger += [{
                       tx_id: ("timeout_" + $timestamp),
                       timestamp: $timestamp,
                       category: "execution_timeout",
                       penalty: -200,
                       details: "Command exceeded timeout",
                       source: "timeout-enforcer"
                   }] | .rl_totals.total_score += -200' \
                   "$MEMORY_BANK/progress.json" > /tmp/progress_timeout.json
                
                mv /tmp/progress_timeout.json "$MEMORY_BANK/progress.json"
            fi
            return 1
        fi
    }
    
    echo "✅ Command completed within timeout" >&2
    return 0
}

if [ $# -lt 1 ]; then
    echo "Usage: $0 <command> [timeout_seconds]" >&2
    exit 1
fi

enforce_timeout "$1"
