#!/bin/bash
# AegisIDE Error Handling Tests
# Tests error protocols and atomic rollback

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

test_error_protocol() {
    print_test_header "TEST SUITE 1: Error Handling Protocol"
    
    cd "$PROJECT_ROOT"
    
    if jq -e 'has("error_handling_protocol")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Error handling protocol defined"
    else
        assert_failure "Error handling protocol defined" "Not found"
    fi
}

test_atomic_rollback() {
    print_test_header "TEST SUITE 2: Atomic Rollback"
    
    cd "$PROJECT_ROOT"
    
    if jq -e 'has("atomic_rollback_execution_protocol")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Atomic rollback protocol defined"
    else
        assert_failure "Atomic rollback protocol defined" "Not found"
    fi
    
    if jq -e '.workflow_routing.workflows | has("atomic-rollback")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "atomic-rollback workflow exists"
    else
        assert_failure "atomic-rollback workflow exists" "Not found"
    fi
}

test_fallback_chain() {
    print_test_header "TEST SUITE 3: Fallback Chain"
    
    cd "$PROJECT_ROOT"
    
    if jq -e '.workflow_routing.workflows | has("fallback-chain")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "fallback-chain workflow exists"
    else
        assert_failure "fallback-chain workflow exists" "Not found"
    fi
}

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE ERROR HANDLING TESTS                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_error_protocol
test_atomic_rollback
test_fallback_chain

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
printf "Total Tests: $TOTAL | ${GREEN}Passed: $PASSED${NC} | ${RED}Failed: $FAILED${NC}\n"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

mkdir -p "$PROJECT_ROOT/reports" 2>/dev/null || true
echo "{\"test_suite\":\"error_handling\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/error_handling_results.json" 2>/dev/null || true

[ $FAILED -eq 0 ] && printf "${GREEN}✅ ALL TESTS PASSED${NC}\n" && exit 0 || printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n" && exit 1
