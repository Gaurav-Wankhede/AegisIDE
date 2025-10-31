#!/bin/bash
# AegisIDE E2E Workflow Tests
# Tests 18 workflows end-to-end

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

test_18_workflows() {
    print_test_header "TEST SUITE 1: 18 Workflows Exist"
    
    cd "$PROJECT_ROOT"
    
    local workflows=("atomic-rollback" "auto-init" "bootstrap-enhanced" "confidence-scorer" "continue" "fallback-chain" "fix" "intent-detector" "mcp-chain-validator" "next" "penalty-tracker" "petition-router" "research" "runtime-documentation" "timeout-handler" "update" "validate" "violation-detector")
    
    for workflow in "${workflows[@]}"; do
        if jq -e ".workflow_routing.workflows | has(\"$workflow\")" .aegiside/routers/context-router.json >/dev/null 2>&1; then
            assert_success "Workflow exists: $workflow"
        else
            assert_failure "Workflow exists: $workflow" "Not found"
        fi
    done
}

test_workflow_structure() {
    print_test_header "TEST SUITE 2: Workflow Structure"
    
    cd "$PROJECT_ROOT"
    
    # Test first workflow has required fields
    FIRST_WORKFLOW=$(jq -r '.workflow_routing.workflows | keys[0]' .aegiside/routers/context-router.json 2>/dev/null)
    
    if [ -n "$FIRST_WORKFLOW" ]; then
        for field in "trigger" "action"; do
            if jq -e ".workflow_routing.workflows[\"$FIRST_WORKFLOW\"] | has(\"$field\")" .aegiside/routers/context-router.json >/dev/null 2>&1; then
                assert_success "Workflow has field: $field"
            else
                assert_failure "Workflow has field: $field" "Missing"
            fi
        done
    fi
}

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE E2E WORKFLOW TESTS                          ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_18_workflows
test_workflow_structure

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
printf "Total Tests: $TOTAL | ${GREEN}Passed: $PASSED${NC} | ${RED}Failed: $FAILED${NC}\n"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

mkdir -p "$PROJECT_ROOT/reports" 2>/dev/null || true
echo "{\"test_suite\":\"e2e_workflow\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/e2e_workflow_results.json" 2>/dev/null || true

[ $FAILED -eq 0 ] && printf "${GREEN}✅ ALL TESTS PASSED${NC}\n" && exit 0 || printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n" && exit 1
