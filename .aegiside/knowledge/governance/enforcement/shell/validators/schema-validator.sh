#!/bin/bash
# Schema Validator - Enforces JSON schema compliance before memory-bank updates
# Usage: ./schema-validator.sh <file> <schema>
# Returns: 0 (pass) or 1 (fail)

set -e

# Detect if we're running from project root or .aegiside directory
if [ -d "src/.aegiside/memory-bank/memory" ]; then
    MEMORY_BANK="src/.aegiside/memory-bank/memory"
    SCHEMAS="src/.aegiside/memory-bank/schemas"
elif [ -d ".aegiside/memory-bank/memory" ]; then
    MEMORY_BANK=".aegiside/memory-bank/memory"
    SCHEMAS=".aegiside/memory-bank/schemas"
elif [ -d "memory-bank/memory" ]; then
    MEMORY_BANK="memory-bank/memory"
    SCHEMAS="memory-bank/schemas"
else
    echo "❌ Error: Cannot find memory-bank directory" >&2
    exit 1
fi
TIMESTAMP=$(date -Iseconds)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

validate_schema() {
    local file="$1"
    local schema_name="$2"
    local file_path="$MEMORY_BANK/$file.json"
    local schema_path="$SCHEMAS/$schema_name.schema.json"
    
    printf "${YELLOW}🔍 Validating schema compliance...${NC}\n" >&2
    printf "   File: $file.json\n" >&2
    printf "   Schema: $schema_name.schema.json\n" >&2
    
    # Check if files exist
    if [ ! -f "$file_path" ]; then
        printf "${RED}❌ File not found: $file_path${NC}\n" >&2
        return 1
    fi
    
    if [ ! -f "$schema_path" ]; then
        printf "${RED}❌ Schema not found: $schema_path${NC}\n" >&2
        return 1
    fi
    
    # Validate JSON syntax first
    if ! jq empty "$file_path" 2>/dev/null; then
        printf "${RED}❌ Invalid JSON syntax in $file.json${NC}\n" >&2
        return 1
    fi
    
    # Check required fields based on schema
    local required_fields=$(jq -r '.required[]' "$schema_path" 2>/dev/null)
    local missing_fields=()
    
    while IFS= read -r field; do
        if ! jq -e ".$field" "$file_path" >/dev/null 2>&1; then
            missing_fields+=("$field")
        fi
    done <<< "$required_fields"
    
    if [ ${#missing_fields[@]} -gt 0 ]; then
        printf "${RED}❌ Missing required fields: ${missing_fields[*]}${NC}\n" >&2
        printf "${YELLOW}   Required by schema: $schema_name.schema.json${NC}\n" >&2
        
        # Apply -500 penalty
        if [ -f "$MEMORY_BANK/progress.json" ]; then
            jq --arg penalty "-500" --arg timestamp "$TIMESTAMP" \
               --arg details "Schema validation failed for $file.json - Missing: ${missing_fields[*]}" \
               '.rl_ledger += [{
                   tx_id: ("schema_violation_" + $timestamp),
                   timestamp: $timestamp,
                   category: "schema_compliance",
                   penalty: ($penalty | tonumber),
                   details: $details,
                   source: "schema-validator"
               }] | .rl_totals.total_score += ($penalty | tonumber)' \
               "$MEMORY_BANK/progress.json" > /tmp/progress_penalty.json
            
            mv /tmp/progress_penalty.json "$MEMORY_BANK/progress.json"
            printf "${YELLOW}💰 Applied -500 penalty to progress.json${NC}\n" >&2
        fi
        
        return 1
    fi
    
    # Validate schema_version exists and is a string
    local version=$(jq -r '.schema_version // "missing"' "$file_path")
    if [ "$version" = "missing" ] || [ -z "$version" ]; then
        printf "${RED}❌ Missing or invalid schema_version${NC}\n" >&2
        return 1
    fi
    
    # Validate last_updated exists and is recent
    local last_updated=$(jq -r '.last_updated // "missing"' "$file_path")
    if [ "$last_updated" = "missing" ] || [ -z "$last_updated" ]; then
        printf "${YELLOW}⚠️  Missing last_updated field${NC}\n" >&2
    fi
    
    printf "${GREEN}✅ Schema validation passed${NC}\n" >&2
    printf "   All required fields present\n" >&2
    printf "   Version: $version\n" >&2
    return 0
}

# Main execution
if [ $# -lt 2 ]; then
    echo "Usage: $0 <file> <schema>" >&2
    echo "Example: $0 activeContext activeContext" >&2
    exit 1
fi

validate_schema "$1" "$2"
