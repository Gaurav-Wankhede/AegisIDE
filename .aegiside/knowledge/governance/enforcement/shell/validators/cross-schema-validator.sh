#!/bin/bash
# Cross-Schema Consistency Validator - Ensures temporal consistency
# Penalty: -200 (prevents stale data)
# Checks: last_updated timestamps, schema_version consistency

set -e

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)
CURRENT_EPOCH=$(date +%s)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

validate_cross_schema_consistency() {
    printf "${YELLOW}🔍 Cross-Schema Consistency Validator${NC}\n" >&2
    
    local consistency_errors=()
    local warnings=()
    
    # All memory-bank schemas
    local schemas=("activeContext" "progress" "systemPatterns" "scratchpad" "kanban" "roadmap" "memory" "mistakes")
    
    # Phase 1: Validate last_updated timestamps
    printf "   Phase 1: Checking timestamp consistency...\n" >&2
    
    local oldest_update=9999999999
    local newest_update=0
    local stale_schemas=()
    
    for schema in "${schemas[@]}"; do
        local file="$MEMORY_BANK/$schema.json"
        
        if [ ! -f "$file" ]; then
            warnings+=("Schema missing: $schema.json")
            continue
        fi
        
        local last_updated=$(jq -r '.last_updated // "missing"' "$file" 2>/dev/null)
        
        if [ "$last_updated" = "missing" ] || [ -z "$last_updated" ]; then
            consistency_errors+=("$schema.json: Missing last_updated field")
            continue
        fi
        
        # Convert ISO 8601 to epoch for comparison
        local update_epoch=$(date -d "$last_updated" +%s 2>/dev/null || echo "0")
        
        if [ "$update_epoch" -eq 0 ]; then
            consistency_errors+=("$schema.json: Invalid last_updated format")
            continue
        fi
        
        # Track oldest/newest
        if [ "$update_epoch" -lt "$oldest_update" ]; then
            oldest_update=$update_epoch
        fi
        if [ "$update_epoch" -gt "$newest_update" ]; then
            newest_update=$update_epoch
        fi
        
        # Check if stale (>1 hour old)
        local age=$((CURRENT_EPOCH - update_epoch))
        if [ "$age" -gt 3600 ]; then
            stale_schemas+=("$schema.json ($(($age / 60)) minutes old)")
        fi
    done
    
    # Report stale schemas
    if [ ${#stale_schemas[@]} -gt 0 ]; then
        warnings+=("Stale schemas detected: ${stale_schemas[*]}")
    fi
    
    # Phase 2: Validate schema_version consistency
    printf "   Phase 2: Checking schema version consistency...\n" >&2
    
    local version_map=()
    for schema in "${schemas[@]}"; do
        local file="$MEMORY_BANK/$schema.json"
        
        if [ ! -f "$file" ]; then
            continue
        fi
        
        local version=$(jq -r '.schema_version // "missing"' "$file" 2>/dev/null)
        
        if [ "$version" = "missing" ] || [ -z "$version" ]; then
            consistency_errors+=("$schema.json: Missing schema_version")
            continue
        fi
        
        version_map+=("$schema=$version")
    done
    
    # Phase 3: Validate cross-references
    printf "   Phase 3: Checking cross-references...\n" >&2
    
    # Example: activeContext.current_phase should match scratchpad active tasks
    local current_phase=$(jq -r '.current_phase // "unknown"' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    local active_tasks=$(jq -r '.active_tasks | length' "$MEMORY_BANK/scratchpad.json" 2>/dev/null)
    
    if [ "$current_phase" != "initialization" ] && [ "$current_phase" != "unknown" ] && [ "$active_tasks" -eq 0 ]; then
        warnings+=("Phase is '$current_phase' but no active tasks in scratchpad")
    fi
    
    # Report results
    if [ ${#consistency_errors[@]} -gt 0 ]; then
        printf "${RED}❌ CONSISTENCY VALIDATION FAILED${NC}\n" >&2
        printf "   Errors: ${#consistency_errors[@]}\n" >&2
        for error in "${consistency_errors[@]}"; do
            printf "   - $error\n" >&2
        done
        
        apply_penalty "Cross-schema consistency errors: ${consistency_errors[*]}" "-200"
        return 1
    fi
    
    if [ ${#warnings[@]} -gt 0 ]; then
        printf "${YELLOW}⚠️  Consistency warnings:${NC}\n" >&2
        for warning in "${warnings[@]}"; do
            printf "   - $warning\n" >&2
        done
    fi
    
    printf "${GREEN}✅ Cross-schema consistency validated${NC}\n" >&2
    printf "   Schemas checked: ${#schemas[@]}\n" >&2
    printf "   Time span: $(( (newest_update - oldest_update) / 60 )) minutes\n" >&2
    
    return 0
}

apply_penalty() {
    local reason="$1"
    local penalty="$2"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg penalty "$penalty" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("consistency_violation_" + $timestamp),
               timestamp: $timestamp,
               category: "cross_schema_consistency",
               penalty: ($penalty | tonumber),
               details: $reason,
               source: "cross-schema-validator"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_consistency.json 2>/dev/null
        
        mv /tmp/progress_consistency.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
        printf "${YELLOW}💰 Applied $penalty penalty${NC}\n" >&2
    fi
}

# Main execution
validate_cross_schema_consistency
