#!/bin/bash
# Rollback Verifier - Ensures rollback operations complete successfully
# Penalty: -500 (prevents silent rollback failures)
# Usage: Called after rollback operations to verify integrity

set -e

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

verify_rollback() {
    local schemas=("$@")
    local backup_dir="$1"
    
    if [ ${#schemas[@]} -eq 0 ]; then
        echo "Usage: $0 <backup_dir> [schema1 schema2 ...]" >&2
        exit 1
    fi
    
    # Remove backup_dir from schemas array
    shift
    schemas=("$@")
    
    printf "${YELLOW}🔍 Rollback Verifier${NC}\n" >&2
    printf "   Backup: $backup_dir\n" >&2
    printf "   Schemas: ${schemas[*]}\n" >&2
    
    local failed_rollbacks=()
    local verification_errors=()
    
    # Phase 1: Verify backup directory existed
    if [ ! -d "$backup_dir" ]; then
        printf "${RED}❌ CRITICAL: Backup directory not found${NC}\n" >&2
        printf "   Expected: $backup_dir\n" >&2
        apply_penalty "Rollback verification failed - no backup found" "-500"
        return 1
    fi
    
    # Phase 2: Verify each schema was restored
    for schema in "${schemas[@]}"; do
        local file_path="$MEMORY_BANK/$schema.json"
        local backup_path="$backup_dir/$schema.json"
        
        # Check if backup existed
        if [ ! -f "$backup_path" ]; then
            verification_errors+=("No backup for $schema.json")
            continue
        fi
        
        # Check if current file exists
        if [ ! -f "$file_path" ]; then
            failed_rollbacks+=("$schema.json missing after rollback")
            continue
        fi
        
        # Verify JSON syntax
        if ! jq empty "$file_path" 2>/dev/null; then
            failed_rollbacks+=("$schema.json has invalid JSON after rollback")
            continue
        fi
        
        # Verify schema compliance
        if [ -f ".aegiside/enforcement/shell/validators/schema-validator.sh" ]; then
            if ! bash .aegiside/enforcement/shell/validators/schema-validator.sh "$schema" "$schema" 2>/dev/null; then
                failed_rollbacks+=("$schema.json failed schema validation after rollback")
            fi
        fi
        
        printf "${GREEN}✓${NC} Verified: $schema.json\n" >&2
    done
    
    # Phase 3: Check for failures
    if [ ${#failed_rollbacks[@]} -gt 0 ]; then
        printf "${RED}❌ ROLLBACK VERIFICATION FAILED${NC}\n" >&2
        printf "   Failed: ${failed_rollbacks[*]}\n" >&2
        
        apply_penalty "Rollback verification failed: ${failed_rollbacks[*]}" "-500"
        return 1
    fi
    
    if [ ${#verification_errors[@]} -gt 0 ]; then
        printf "${YELLOW}⚠️  Verification warnings:${NC}\n" >&2
        for error in "${verification_errors[@]}"; do
            printf "   - $error\n" >&2
        done
    fi
    
    # Phase 4: Verify backup cleanup
    if [ -d "$backup_dir" ]; then
        printf "${YELLOW}⚠️  Warning: Backup directory still exists${NC}\n" >&2
        printf "   Location: $backup_dir\n" >&2
        printf "   Recommendation: Clean up backup after verification\n" >&2
    fi
    
    printf "${GREEN}✅ Rollback verified - all schemas restored successfully${NC}\n" >&2
    
    # Record successful rollback in progress.json
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg timestamp "$TIMESTAMP" \
           --arg schemas "${schemas[*]}" \
           '.rl_ledger += [{
               tx_id: ("rollback_verified_" + $timestamp),
               timestamp: $timestamp,
               category: "rollback_success",
               penalty: 0,
               details: ("Rollback verified for: " + $schemas),
               source: "rollback-verifier"
           }]' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_rollback.json 2>/dev/null
        
        mv /tmp/progress_rollback.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
    fi
    
    return 0
}

apply_penalty() {
    local reason="$1"
    local penalty="$2"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg penalty "$penalty" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("rollback_failure_" + $timestamp),
               timestamp: $timestamp,
               category: "rollback_integrity",
               penalty: ($penalty | tonumber),
               details: $reason,
               source: "rollback-verifier"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_rollback_penalty.json 2>/dev/null
        
        mv /tmp/progress_rollback_penalty.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
        printf "${YELLOW}💰 Applied $penalty penalty${NC}\n" >&2
    fi
}

# Main execution
if [ $# -lt 1 ]; then
    echo "Usage: $0 <backup_dir> [schema1 schema2 ...]" >&2
    exit 1
fi

verify_rollback "$@"
