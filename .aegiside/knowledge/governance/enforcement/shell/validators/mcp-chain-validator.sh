#!/bin/bash
# MCP Chain Validator - Enforces 4-step chain completion
# Validates: sequential-thinking, memory-query, research, pattern-storage
# Auto-applies penalties for incomplete chain

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)

validate_mcp_chain() {
    local confidence=$(jq -r '.confidence_calculation.final_confidence // 0.5' "$MEMORY_BANK/activeContext.json")
    local total_penalty=0
    local violations=()
    
    # Step 1: Sequential thinking (≥3 steps)
    local seq_thinking=$(jq -r '.mcp_chain_execution.sequential_thinking_executed // false' "$MEMORY_BANK/activeContext.json")
    if [ "$seq_thinking" != "true" ]; then
        violations+=("sequential_thinking")
        total_penalty=$((total_penalty - 15))
    fi
    
    # Step 2: Memory query
    local memory_query=$(jq -r '.mcp_chain_execution.memory_query_executed // false' "$MEMORY_BANK/activeContext.json")
    if [ "$memory_query" != "true" ]; then
        violations+=("memory_query")
        total_penalty=$((total_penalty - 25))
    fi
    
    # Step 3: Research (only if confidence <0.8)
    if command -v bc &> /dev/null; then
        local needs_research=$(echo "$confidence < 0.8" | bc -l)
        if [ "$needs_research" -eq 1 ]; then
            local research=$(jq -r '.mcp_chain_execution.research_executed // false' "$MEMORY_BANK/activeContext.json")
            if [ "$research" != "true" ]; then
                violations+=("research")
                total_penalty=$((total_penalty - 30))
            fi
        fi
    fi
    
    # Step 4: Pattern storage
    local pattern_stored=$(jq -r '.mcp_chain_execution.pattern_stored // false' "$MEMORY_BANK/activeContext.json")
    if [ "$pattern_stored" != "true" ]; then
        violations+=("pattern_storage")
        total_penalty=$((total_penalty - 20))
    fi
    
    # Apply penalties if violations exist
    if [ ${#violations[@]} -gt 0 ]; then
        echo "⚠️  MCP chain incomplete. Missing: ${violations[*]}"
        echo "💰 Applying penalty: $total_penalty"
        
        # Update progress.json with penalty
        jq --arg penalty "$total_penalty" \
           --arg timestamp "$TIMESTAMP" \
           --arg details "Missing steps: ${violations[*]}" \
           '.rl_ledger += [{
               tx_id: ("mcp_chain_violation_" + $timestamp),
               timestamp: $timestamp,
               category: "mcp_chain_incomplete",
               penalty: ($penalty | tonumber),
               details: $details,
               source: "mcp-chain-validator"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_tmp.json
        
        mv /tmp/progress_tmp.json "$MEMORY_BANK/progress.json"
        return 1
    fi
    
    echo "✅ MCP chain complete - all 4 steps executed"
    return 0
}

validate_mcp_chain "$@"
