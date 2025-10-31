#!/bin/bash
# AegisIDE Enforcement Dashboard - Real-time monitoring
# Displays violations, penalties, and enforcement status

set -e

MEMORY_BANK=".aegiside/memory-bank/memory"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m'

clear

print_header() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    printf "${CYAN}     🛡️  AEGISIDE ENFORCEMENT DASHBOARD${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Live monitoring of AI enforcement activity"
    echo "  Updated: $(date '+%Y-%m-%d %H:%M:%S')"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
}

print_rl_score() {
    if [ ! -f "$MEMORY_BANK/progress.json" ]; then
        printf "${RED}❌ progress.json not found${NC}\n"
        return
    fi
    
    local total_score=$(jq -r '.rl_totals.total_score // 0' "$MEMORY_BANK/progress.json")
    local tasks_completed=$(jq -r '.tasks_completed // 0' "$MEMORY_BANK/progress.json")
    local session_start=$(jq -r '.rl_totals.session_start // "unknown"' "$MEMORY_BANK/progress.json")
    
    printf "${BLUE}📊 REINFORCEMENT LEARNING SCORE${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Score visualization
    if [ "$total_score" -lt -500 ]; then
        printf "   Score: ${RED}$total_score${NC} (CRITICAL)\n"
    elif [ "$total_score" -lt 0 ]; then
        printf "   Score: ${YELLOW}$total_score${NC} (WARNING)\n"
    else
        printf "   Score: ${GREEN}$total_score${NC} (GOOD)\n"
    fi
    
    echo "   Tasks Completed: $tasks_completed"
    echo "   Session Start: $session_start"
    echo ""
}

print_recent_violations() {
    if [ ! -f "$MEMORY_BANK/progress.json" ]; then
        return
    fi
    
    printf "${YELLOW}⚠️  RECENT VIOLATIONS (Last 10)${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    local violations=$(jq -r '.rl_ledger | 
        select(length > 0) | 
        sort_by(.timestamp) | 
        reverse | 
        .[0:10] | 
        .[] | 
        "\(.timestamp | split("T")[0]) \(.timestamp | split("T")[1] | split(".")[0]) | \(.category) | \(.penalty) | \(.source)"' \
        "$MEMORY_BANK/progress.json" 2>/dev/null)
    
    if [ -z "$violations" ]; then
        printf "${GREEN}   ✓ No violations recorded${NC}\n"
    else
        echo "$violations" | while IFS='|' read -r timestamp category penalty source; do
            if [ "${penalty// /}" -lt -500 ]; then
                printf "${RED}   🚨 $timestamp | $category | $penalty | $source${NC}\n"
            elif [ "${penalty// /}" -lt 0 ]; then
                printf "${YELLOW}   ⚠️  $timestamp | $category | $penalty | $source${NC}\n"
            else
                printf "${GREEN}   ✓ $timestamp | $category | $penalty | $source${NC}\n"
            fi
        done
    fi
    echo ""
}

print_violation_breakdown() {
    if [ ! -f "$MEMORY_BANK/progress.json" ]; then
        return
    fi
    
    printf "${MAGENTA}📈 VIOLATION BREAKDOWN${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Count by category
    jq -r '.rl_ledger | 
        group_by(.category) | 
        .[] | 
        "\(.[0].category): \(length) violations (Total: \(map(.penalty) | add))"' \
        "$MEMORY_BANK/progress.json" 2>/dev/null || echo "   No violations"
    
    echo ""
}

print_enforcement_gates() {
    printf "${GREEN}🚧 ENFORCEMENT GATES STATUS${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if [ ! -f "$MEMORY_BANK/activeContext.json" ]; then
        printf "${RED}   ❌ activeContext.json not found${NC}\n"
        echo ""
        return
    fi
    
    local bootstrap=$(jq -r '.session.status // "unknown"' "$MEMORY_BANK/activeContext.json")
    local confidence=$(jq -r '.confidence_calculation.final_confidence // 0' "$MEMORY_BANK/activeContext.json")
    local mcp_chain=$(jq -r '.mcp_chain_execution.sequential_thinking_executed // false' "$MEMORY_BANK/activeContext.json")
    
    # Gate 1: Bootstrap
    if [ "$bootstrap" = "initialized" ]; then
        printf "${GREEN}   ✓ Gate 1: Bootstrap${NC}\n"
    else
        printf "${RED}   ✗ Gate 1: Bootstrap (Status: $bootstrap)${NC}\n"
    fi
    
    # Gate 2: Confidence
    if (( $(echo "$confidence >= 0.5" | bc -l 2>/dev/null || echo 0) )); then
        printf "${GREEN}   ✓ Gate 2: Confidence ($confidence)${NC}\n"
    else
        printf "${YELLOW}   ⚠ Gate 2: Confidence ($confidence < 0.5)${NC}\n"
    fi
    
    # Gate 4: MCP Chain
    if [ "$mcp_chain" = "true" ]; then
        printf "${GREEN}   ✓ Gate 4: MCP Chain${NC}\n"
    else
        printf "${YELLOW}   ⚠ Gate 4: MCP Chain (Not started)${NC}\n"
    fi
    
    echo ""
}

print_system_health() {
    printf "${CYAN}💚 SYSTEM HEALTH${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Check file sizes
    local pattern_size=$(stat -f%z "$MEMORY_BANK/systemPatterns.json" 2>/dev/null || stat -c%s "$MEMORY_BANK/systemPatterns.json" 2>/dev/null || echo 0)
    local progress_size=$(stat -f%z "$MEMORY_BANK/progress.json" 2>/dev/null || stat -c%s "$MEMORY_BANK/progress.json" 2>/dev/null || echo 0)
    
    echo "   systemPatterns.json: $((pattern_size / 1024)) KB"
    echo "   progress.json: $((progress_size / 1024)) KB"
    
    # Check pattern count
    if [ -f "$MEMORY_BANK/systemPatterns.json" ]; then
        local pattern_count=$(jq '.architecture_patterns | length' "$MEMORY_BANK/systemPatterns.json" 2>/dev/null || echo 0)
        echo "   Architecture Patterns: $pattern_count"
        
        if [ "$pattern_count" -gt 1000 ]; then
            printf "${RED}   ⚠️  Memory leak warning (>1000 patterns)${NC}\n"
        fi
    fi
    
    echo ""
}

print_footer() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    printf "${CYAN}Press Ctrl+C to exit | Auto-refresh every 5 seconds${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# Main loop
while true; do
    clear
    print_header
    print_rl_score
    print_enforcement_gates
    print_violation_breakdown
    print_recent_violations
    print_system_health
    print_footer
    
    sleep 5
done
