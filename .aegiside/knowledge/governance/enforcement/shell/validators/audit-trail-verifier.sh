#!/bin/bash
# Audit Trail Verifier - Basic integrity checking with checksums
# Prevents tampering with rl_ledger
# Penalty: -500

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

verify_audit_trail() {
    printf "${YELLOW}🔍 Audit Trail Verifier${NC}\n" >&2
    
    if [ ! -f "$MEMORY_BANK/progress.json" ]; then
        printf "${RED}❌ progress.json not found${NC}\n" >&2
        return 1
    fi
    
    # Generate checksum of rl_ledger
    local ledger_content=$(jq -c '.rl_ledger' "$MEMORY_BANK/progress.json")
    local current_checksum=$(echo "$ledger_content" | sha256sum | awk '{print $1}')
    
    # Check if checksum file exists
    local checksum_file="$MEMORY_BANK/.audit_checksum"
    
    if [ -f "$checksum_file" ]; then
        local stored_checksum=$(cat "$checksum_file")
        
        if [ "$current_checksum" != "$stored_checksum" ]; then
            printf "${RED}❌ AUDIT TRAIL TAMPERING DETECTED${NC}\n" >&2
            printf "   Stored checksum:  $stored_checksum\n" >&2
            printf "   Current checksum: $current_checksum\n" >&2
            
            # Apply severe penalty
            jq --arg penalty "-500" --arg timestamp "$TIMESTAMP" \
               '.rl_ledger += [{
                   tx_id: ("audit_tampering_" + $timestamp),
                   timestamp: $timestamp,
                   category: "audit_integrity",
                   penalty: -500,
                   details: "Audit trail checksum mismatch",
                   source: "audit-trail-verifier"
               }] | .rl_totals.total_score += -500' \
               "$MEMORY_BANK/progress.json" > /tmp/progress_audit.json
            
            mv /tmp/progress_audit.json "$MEMORY_BANK/progress.json"
            
            return 1
        fi
        
        printf "${GREEN}✓${NC} Audit trail integrity verified\n" >&2
    else
        printf "${YELLOW}ℹ️  First run - creating initial checksum${NC}\n" >&2
    fi
    
    # Update checksum
    echo "$current_checksum" > "$checksum_file"
    
    # Count ledger entries
    local entry_count=$(jq '.rl_ledger | length' "$MEMORY_BANK/progress.json")
    printf "   Ledger entries: $entry_count\n" >&2
    printf "   Checksum: ${current_checksum:0:16}...\n" >&2
    
    return 0
}

# Generate audit report
generate_audit_report() {
    if [ ! -f "$MEMORY_BANK/progress.json" ]; then
        return
    fi
    
    printf "\n${CYAN}📋 AUDIT REPORT${NC}\n" >&2
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Summary statistics
    local total_entries=$(jq '.rl_ledger | length' "$MEMORY_BANK/progress.json")
    local total_penalties=$(jq '[.rl_ledger[].penalty] | add' "$MEMORY_BANK/progress.json")
    local negative_entries=$(jq '[.rl_ledger[] | select(.penalty < 0)] | length' "$MEMORY_BANK/progress.json")
    local positive_entries=$(jq '[.rl_ledger[] | select(.penalty > 0)] | length' "$MEMORY_BANK/progress.json")
    
    echo "   Total Entries: $total_entries"
    echo "   Total Penalty Score: $total_penalties"
    echo "   Violations: $negative_entries"
    echo "   Rewards: $positive_entries"
    
    # Recent activity
    printf "\n   Recent Activity (Last 5):\n"
    jq -r '.rl_ledger | sort_by(.timestamp) | reverse | .[0:5] | .[] | 
        "   - \(.timestamp | split("T")[0]) \(.penalty) \(.category)"' \
        "$MEMORY_BANK/progress.json" 2>/dev/null || echo "   No activity"
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

# Main execution
verify_audit_trail
generate_audit_report
