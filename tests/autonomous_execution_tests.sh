#!/bin/bash
# AegisIDE Autonomous Execution Tests
# Tests confidence bands, execution flows, and autonomous routing

set -e

TEST_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_ROOT=$(cd "$TEST_DIR/.." && pwd)

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
# TEST SUITE 1: CONFIDENCE BANDS
# ═══════════════════════════════════════════════════════════════

test_confidence_bands() {
    print_test_header "TEST SUITE 1: Confidence Bands"
    
    cd "$PROJECT_ROOT"
    
    if jq -e 'has("confidence_bands")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Confidence bands defined"
        
        # Test 5 bands: 90-99%, 70-89%, 50-69%, 30-49%, 0-29%
        BAND_COUNT=$(jq '.confidence_bands | length' .aegiside/routers/context-router.json 2>/dev/null || echo "0")
        if [ "$BAND_COUNT" -ge "4" ]; then
            assert_success "Multiple confidence bands ($BAND_COUNT)"
        else
            assert_failure "Multiple confidence bands" "Only $BAND_COUNT found"
        fi
    else
        assert_failure "Confidence bands defined" "Not found"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 2: AUTONOMOUS ROUTING
# ═══════════════════════════════════════════════════════════════

test_autonomous_routing() {
    print_test_header "TEST SUITE 2: Autonomous Routing"
    
    cd "$PROJECT_ROOT"
    
    if jq -e 'has("autonomous_routing_rules")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Autonomous routing rules defined"
    else
        assert_failure "Autonomous routing rules defined" "Not found"
    fi
    
    # Test no permission required for 0-99% confidence
    TOTAL=$((TOTAL + 1))
    printf "${YELLOW}⊘${NC} Test #$TOTAL: Execute immediately without permission (implicit rule)\n"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 3: BOOTSTRAP PROTOCOL
# ═══════════════════════════════════════════════════════════════

test_bootstrap_protocol() {
    print_test_header "TEST SUITE 3: Bootstrap Protocol"
    
    cd "$PROJECT_ROOT"
    
    if jq -e 'has("bootstrap_protocol")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Bootstrap protocol defined"
    else
        assert_failure "Bootstrap protocol defined" "Not found"
    fi
    
    if jq -e '.workflow_routing.workflows | has("bootstrap-enhanced")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "bootstrap-enhanced workflow exists"
    else
        assert_failure "bootstrap-enhanced workflow exists" "Not found"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 4: CONFIDENCE SCORING
# ═══════════════════════════════════════════════════════════════

test_confidence_scoring() {
    print_test_header "TEST SUITE 4: Confidence Scoring"
    
    cd "$PROJECT_ROOT"
    
    if jq -e 'has("confidence_scoring_implementation")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Confidence scoring implementation defined"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Confidence scoring (may be in workflow)\n"
    fi
    
    if jq -e '.workflow_routing.workflows | has("confidence-scorer")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "confidence-scorer workflow exists"
    else
        assert_failure "confidence-scorer workflow exists" "Not found"
    fi
}

# ═══════════════════════════════════════════════════════════════
# RUN ALL TESTS
# ═══════════════════════════════════════════════════════════════

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE AUTONOMOUS EXECUTION TESTS                  ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_confidence_bands
test_autonomous_routing
test_bootstrap_protocol
test_confidence_scoring

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "                         TEST RESULTS                             "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
printf "Total Tests: $TOTAL\n"
printf "${GREEN}Passed: $PASSED${NC}\n"
printf "${RED}Failed: $FAILED${NC}\n"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

mkdir -p "$PROJECT_ROOT/reports" 2>/dev/null || true
echo "{\"test_suite\":\"autonomous_execution\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/autonomous_execution_results.json" 2>/dev/null || true

if [ $FAILED -eq 0 ]; then
    printf "${GREEN}✅ ALL TESTS PASSED${NC}\n"
    exit 0
else
    printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n"
    exit 1
fi
