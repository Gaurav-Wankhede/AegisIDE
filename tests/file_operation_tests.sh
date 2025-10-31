#!/bin/bash
# AegisIDE File Operation Tests
# Tests file operation semantics and intent detection

set -e

TEST_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_ROOT=$(cd "$TEST_DIR/.." && pwd)

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
    TOTAL=$((TOTAL + 1))
    printf "${GREEN}✓${NC} Test #$TOTAL: $1\n"
    PASSED=$((PASSED + 1))
}

assert_failure() {
    TOTAL=$((TOTAL + 1))
    printf "${RED}✗${NC} Test #$TOTAL: $1 ($2)\n"
    FAILED=$((FAILED + 1))
}

test_file_semantics() {
    print_test_header "TEST SUITE 1: File Operation Semantics"
    
    cd "$PROJECT_ROOT"
    
    if jq -e 'has("file_operation_semantics_enforcement")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "File operation semantics defined"
    else
        assert_failure "File operation semantics defined" "Not found"
    fi
}

test_intent_detection() {
    print_test_header "TEST SUITE 2: Intent Detection"
    
    cd "$PROJECT_ROOT"
    
    if jq -e '.workflow_routing.workflows | has("intent-detector")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "intent-detector workflow exists"
    else
        assert_failure "intent-detector workflow exists" "Not found"
    fi
}

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE FILE OPERATION TESTS                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_file_semantics
test_intent_detection

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
printf "Total Tests: $TOTAL | ${GREEN}Passed: $PASSED${NC} | ${RED}Failed: $FAILED${NC}\n"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

mkdir -p "$PROJECT_ROOT/reports" 2>/dev/null || true
echo "{\"test_suite\":\"file_operation\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/file_operation_results.json" 2>/dev/null || true

[ $FAILED -eq 0 ] && printf "${GREEN}✅ ALL TESTS PASSED${NC}\n" && exit 0 || printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n" && exit 1
