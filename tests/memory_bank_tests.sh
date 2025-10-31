#!/bin/bash
# AegisIDE Memory Bank Tests
# Tests 9 schema files and @mcp:json-jq operations

set -e

TEST_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_ROOT=$(cd "$TEST_DIR/.." && pwd)
MEMORY_DIR="$PROJECT_ROOT/.aegiside/memory-bank/memory"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

PASSED=0
FAILED=0
TOTAL=0

print_test_header() {
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    printf "${BLUE}🧪 $1${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

assert_success() {
    local test_name="$1"
    
    TOTAL=$((TOTAL + 1))
    printf "${GREEN}✓${NC} Test #$TOTAL: $test_name\n"
    PASSED=$((PASSED + 1))
}

assert_failure() {
    local test_name="$1"
    local reason="$2"
    
    TOTAL=$((TOTAL + 1))
    printf "${RED}✗${NC} Test #$TOTAL: $test_name ($reason)\n"
    FAILED=$((FAILED + 1))
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 1: SCHEMA FILE EXISTENCE
# ═══════════════════════════════════════════════════════════════

test_schema_files() {
    print_test_header "TEST SUITE 1: Schema File Existence"
    
    cd "$PROJECT_ROOT"
    
    # Test: Memory bank directory exists
    if [ -d "$MEMORY_DIR" ]; then
        assert_success "memory-bank/memory directory exists"
    else
        assert_failure "memory-bank/memory directory exists" "Directory not found"
        return
    fi
    
    # Test: 9 required schema files exist
    local schemas=("activeContext" "progress" "systemPatterns" "scratchpad" "kanban" "mistakes" "roadmap" "memory" "RL_SCORING_EXAMPLE")
    
    for schema in "${schemas[@]}"; do
        if [ -f "$MEMORY_DIR/$schema.json" ]; then
            assert_success "Schema file exists: $schema.json"
        else
            assert_failure "Schema file exists: $schema.json" "File not found"
        fi
    done
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 2: JSON VALIDITY
# ═══════════════════════════════════════════════════════════════

test_json_validity() {
    print_test_header "TEST SUITE 2: JSON Validity"
    
    cd "$PROJECT_ROOT"
    
    local schemas=("activeContext" "progress" "systemPatterns" "scratchpad" "kanban" "mistakes" "roadmap" "memory" "RL_SCORING_EXAMPLE")
    
    for schema in "${schemas[@]}"; do
        if [ -f "$MEMORY_DIR/$schema.json" ]; then
            if jq empty "$MEMORY_DIR/$schema.json" 2>/dev/null; then
                assert_success "Valid JSON: $schema.json"
            else
                assert_failure "Valid JSON: $schema.json" "Invalid JSON format"
            fi
        fi
    done
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 3: SCHEMA STRUCTURE
# ═══════════════════════════════════════════════════════════════

test_schema_structure() {
    print_test_header "TEST SUITE 3: Schema Structure"
    
    cd "$PROJECT_ROOT"
    
    # Test: activeContext.json structure
    if [ -f "$MEMORY_DIR/activeContext.json" ]; then
        for key in "schema_version" "last_updated" "session_context"; do
            if jq -e --arg k "$key" 'has($k)' "$MEMORY_DIR/activeContext.json" >/dev/null 2>&1; then
                assert_success "activeContext has key: $key"
            else
                assert_failure "activeContext has key: $key" "Key missing"
            fi
        done
    fi
    
    # Test: progress.json structure
    if [ -f "$MEMORY_DIR/progress.json" ]; then
        for key in "schema_version" "last_updated" "metrics"; do
            if jq -e --arg k "$key" 'has($k)' "$MEMORY_DIR/progress.json" >/dev/null 2>&1; then
                assert_success "progress has key: $key"
            else
                assert_failure "progress has key: $key" "Key missing"
            fi
        done
    fi
    
    # Test: systemPatterns.json structure
    if [ -f "$MEMORY_DIR/systemPatterns.json" ]; then
        for key in "schema_version" "last_updated" "learned_patterns"; do
            if jq -e --arg k "$key" 'has($k)' "$MEMORY_DIR/systemPatterns.json" >/dev/null 2>&1; then
                assert_success "systemPatterns has key: $key"
            else
                assert_failure "systemPatterns has key: $key" "Key missing"
            fi
        done
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 4: JQ QUERY OPERATIONS
# ═══════════════════════════════════════════════════════════════

test_jq_queries() {
    print_test_header "TEST SUITE 4: JQ Query Operations"
    
    cd "$PROJECT_ROOT"
    
    # Test: Query activeContext session info
    if [ -f "$MEMORY_DIR/activeContext.json" ]; then
        RESULT=$(jq -r '.schema_version' "$MEMORY_DIR/activeContext.json" 2>/dev/null)
        if [ -n "$RESULT" ] && [ "$RESULT" != "null" ]; then
            assert_success "Query activeContext.schema_version"
        else
            assert_failure "Query activeContext.schema_version" "No result"
        fi
    fi
    
    # Test: Query progress metrics
    if [ -f "$MEMORY_DIR/progress.json" ]; then
        RESULT=$(jq -r '.metrics' "$MEMORY_DIR/progress.json" 2>/dev/null)
        if [ -n "$RESULT" ] && [ "$RESULT" != "null" ]; then
            assert_success "Query progress.metrics"
        else
            assert_failure "Query progress.metrics" "No result"
        fi
    fi
    
    # Test: Query systemPatterns learned_patterns
    if [ -f "$MEMORY_DIR/systemPatterns.json" ]; then
        RESULT=$(jq -r '.learned_patterns' "$MEMORY_DIR/systemPatterns.json" 2>/dev/null)
        if [ -n "$RESULT" ] && [ "$RESULT" != "null" ]; then
            assert_success "Query systemPatterns.learned_patterns"
        else
            assert_failure "Query systemPatterns.learned_patterns" "No result"
        fi
    fi
    
    # Test: Count array elements
    if [ -f "$MEMORY_DIR/progress.json" ]; then
        RESULT=$(jq '.reinforcement_learning | length' "$MEMORY_DIR/progress.json" 2>/dev/null)
        if [ -n "$RESULT" ] && [ "$RESULT" != "null" ]; then
            assert_success "Count progress.reinforcement_learning array"
        else
            assert_failure "Count progress.reinforcement_learning array" "Cannot count"
        fi
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 5: SCHEMA VERSION COMPLIANCE
# ═══════════════════════════════════════════════════════════════

test_schema_versions() {
    print_test_header "TEST SUITE 5: Schema Version Compliance"
    
    cd "$PROJECT_ROOT"
    
    local schemas=("activeContext" "progress" "systemPatterns" "scratchpad" "kanban" "mistakes" "roadmap" "memory")
    
    for schema in "${schemas[@]}"; do
        if [ -f "$MEMORY_DIR/$schema.json" ]; then
            VERSION=$(jq -r '.schema_version' "$MEMORY_DIR/$schema.json" 2>/dev/null)
            if [ -n "$VERSION" ] && [ "$VERSION" != "null" ]; then
                assert_success "Schema version present: $schema ($VERSION)"
            else
                assert_failure "Schema version present: $schema" "No version field"
            fi
        fi
    done
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 6: TIMESTAMP VALIDATION
# ═══════════════════════════════════════════════════════════════

test_timestamps() {
    print_test_header "TEST SUITE 6: Timestamp Validation"
    
    cd "$PROJECT_ROOT"
    
    local schemas=("activeContext" "progress" "systemPatterns" "scratchpad" "kanban" "mistakes" "roadmap" "memory")
    
    for schema in "${schemas[@]}"; do
        if [ -f "$MEMORY_DIR/$schema.json" ]; then
            TIMESTAMP=$(jq -r '.last_updated' "$MEMORY_DIR/$schema.json" 2>/dev/null)
            if [ -n "$TIMESTAMP" ] && [ "$TIMESTAMP" != "null" ]; then
                assert_success "Timestamp present: $schema"
            else
                assert_failure "Timestamp present: $schema" "No last_updated field"
            fi
        fi
    done
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 7: FILE PERMISSIONS
# ═══════════════════════════════════════════════════════════════

test_file_permissions() {
    print_test_header "TEST SUITE 7: File Permissions"
    
    cd "$PROJECT_ROOT"
    
    local schemas=("activeContext" "progress" "systemPatterns" "scratchpad" "kanban" "mistakes" "roadmap" "memory" "RL_SCORING_EXAMPLE")
    
    for schema in "${schemas[@]}"; do
        if [ -f "$MEMORY_DIR/$schema.json" ]; then
            if [ -r "$MEMORY_DIR/$schema.json" ]; then
                assert_success "File readable: $schema.json"
            else
                assert_failure "File readable: $schema.json" "No read permission"
            fi
            
            if [ -w "$MEMORY_DIR/$schema.json" ]; then
                assert_success "File writable: $schema.json"
            else
                assert_failure "File writable: $schema.json" "No write permission"
            fi
        fi
    done
}

# ═══════════════════════════════════════════════════════════════
# RUN ALL TESTS
# ═══════════════════════════════════════════════════════════════

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE MEMORY BANK TESTS                           ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_schema_files
test_json_validity
test_schema_structure
test_jq_queries
test_schema_versions
test_timestamps
test_file_permissions

# ═══════════════════════════════════════════════════════════════
# RESULTS
# ═══════════════════════════════════════════════════════════════

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "                         TEST RESULTS                             "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
printf "Total Tests: $TOTAL\n"
printf "${GREEN}Passed: $PASSED${NC}\n"
printf "${RED}Failed: $FAILED${NC}\n"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Create reports directory if needed
mkdir -p "$PROJECT_ROOT/reports" 2>/dev/null || true

# Export results for report aggregation
echo "{\"test_suite\":\"memory_bank\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/memory_bank_results.json" 2>/dev/null || true

if [ $FAILED -eq 0 ]; then
    printf "${GREEN}✅ ALL TESTS PASSED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 0
else
    printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 1
fi
