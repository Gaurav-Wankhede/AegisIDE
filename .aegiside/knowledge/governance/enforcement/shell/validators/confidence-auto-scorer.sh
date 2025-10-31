#!/bin/bash
# Confidence Auto-Scorer - Automatically calculates confidence scores
# Formula: (keyword×0.4) + (semantic×0.3) + (memory×0.2) + (history×0.1)

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)

calculate_confidence() {
    local query="$1"
    
    echo "🎯 Confidence Auto-Scorer" >&2
    
    # Component scores
    local keyword_score=0.5
    local semantic_score=0.5
    local memory_score=0.0
    local history_score=0.0
    
    # Calculate keyword match (simple heuristic)
    if echo "$query" | grep -qE "(create|build|implement)"; then
        keyword_score=0.8
    elif echo "$query" | grep -qE "(fix|debug|resolve)"; then
        keyword_score=0.7
    fi
    
    # Check memory context
    if [ -f "$MEMORY_BANK/systemPatterns.json" ]; then
        local pattern_count=$(jq '.architecture_patterns | length' "$MEMORY_BANK/systemPatterns.json" 2>/dev/null)
        if [ "$pattern_count" -gt 0 ]; then
            memory_score=0.6
        fi
    fi
    
    # Check history
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        local tasks_completed=$(jq '.tasks_completed // 0' "$MEMORY_BANK/progress.json" 2>/dev/null)
        if [ "$tasks_completed" -gt 5 ]; then
            history_score=0.8
        elif [ "$tasks_completed" -gt 0 ]; then
            history_score=0.5
        fi
    fi
    
    # Calculate final confidence
    local confidence=$(echo "scale=2; ($keyword_score * 0.4) + ($semantic_score * 0.3) + ($memory_score * 0.2) + ($history_score * 0.1)" | bc)
    
    echo "   Confidence: $confidence" >&2
    echo "$confidence"
}

calculate_confidence "$1"
