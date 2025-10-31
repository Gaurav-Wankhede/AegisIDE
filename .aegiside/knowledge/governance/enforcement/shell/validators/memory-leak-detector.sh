#!/bin/bash
# Memory Leak Detector - Prevents unbounded growth
# Penalty: -200

MEMORY_BANK=".aegiside/memory-bank/memory"
MAX_PATTERNS=1000  # Max patterns in systemPatterns.json

detect_memory_leaks() {
    echo "🔍 Memory Leak Detector" >&2
    
    local file="$MEMORY_BANK/systemPatterns.json"
    
    if [ ! -f "$file" ]; then
        echo "⚠️  systemPatterns.json not found" >&2
        return 0
    fi
    
    local pattern_count=$(jq '.architecture_patterns | length' "$file" 2>/dev/null)
    local file_size=$(stat -f%z "$file" 2>/dev/null || stat -c%s "$file" 2>/dev/null)
    
    echo "   Patterns: $pattern_count" >&2
    echo "   File size: $((file_size / 1024)) KB" >&2
    
    if [ "$pattern_count" -gt "$MAX_PATTERNS" ]; then
        echo "❌ Memory leak detected: Too many patterns" >&2
        
        if [ -f "$MEMORY_BANK/progress.json" ]; then
            jq --arg penalty "-200" --arg timestamp "$(date -Iseconds)" \
               '.rl_ledger += [{
                   tx_id: ("memory_leak_" + $timestamp),
                   timestamp: $timestamp,
                   category: "memory_leak",
                   penalty: -200,
                   details: "systemPatterns exceeded limit",
                   source: "memory-leak-detector"
               }] | .rl_totals.total_score += -200' \
               "$MEMORY_BANK/progress.json" > /tmp/progress_leak.json
            
            mv /tmp/progress_leak.json "$MEMORY_BANK/progress.json"
        fi
        return 1
    fi
    
    echo "✅ No memory leaks detected" >&2
    return 0
}

detect_memory_leaks
