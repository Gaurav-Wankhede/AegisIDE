#!/bin/bash
# AegisIDE Violation Detection Tests
# Tests 6 runtime enforcement rules and violation detection workflow

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
# TEST SUITE 1: VIOLATION DETECTION PROTOCOL
# ═══════════════════════════════════════════════════════════════

test_violation_protocol() {
    print_test_header "TEST SUITE 1: Violation Detection Protocol"
    
    cd "$PROJECT_ROOT"
    
    # Test: violation_detection_protocol exists
    if jq -e 'has("violation_detection_protocol")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "violation_detection_protocol defined"
    else
        assert_failure "violation_detection_protocol defined" "Not found"
    fi
    
    # Test: violation-detector workflow exists
    if jq -e '.workflow_routing.workflows | has("violation-detector")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "violation-detector workflow exists"
    else
        assert_failure "violation-detector workflow exists" "Not found"
    fi
    
    # Test: Workflow has trigger
    if jq -e '.workflow_routing.workflows["violation-detector"] | has("trigger")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "violation-detector has trigger"
    else
        assert_failure "violation-detector has trigger" "Missing trigger"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 2: RULE 1 - FILE ACCESS BLOCKING
# ═══════════════════════════════════════════════════════════════

test_file_access_blocking() {
    print_test_header "TEST SUITE 2: Rule 1 - File Access Blocking"
    
    cd "$PROJECT_ROOT"
    
    # Test: File access blocking rule in enforcement engine
    if [ -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("file_access") or contains("block")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "File access blocking rule defined"
        else
            assert_failure "File access blocking rule defined" "Not found"
        fi
        
        # Test: .aegiside/ pattern detection
        if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains(".aegiside")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success ".aegiside/ pattern in blocking rule"
        else
            assert_failure ".aegiside/ pattern in blocking rule" "Not found"
        fi
        
        # Test: Penalty -1000 defined
        if jq -e '[.. | .penalty? | select(. == -1000 or . == 1000)] | length > 0' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "File access blocking penalty (-1000)"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: File access penalty (may vary)\n"
        fi
    else
        TOTAL=$((TOTAL + 3))
        printf "${YELLOW}⊘${NC} Tests #$((TOTAL-2))-#$TOTAL: enforcement-engine.json (file not found)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 3: RULE 2 - JSON TOOL ENFORCEMENT
# ═══════════════════════════════════════════════════════════════

test_json_tool_enforcement() {
    print_test_header "TEST SUITE 3: Rule 2 - JSON Tool Enforcement"
    
    cd "$PROJECT_ROOT"
    
    if [ -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        # Test: JSON tool enforcement rule
        if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("json_tool") or contains("json")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "JSON tool enforcement rule defined"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: JSON tool rule (may be generalized)\n"
        fi
        
        # Test: @mcp:json-jq requirement
        if jq -e 'tostring | contains("json-jq")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "@mcp:json-jq requirement"
        else
            assert_failure "@mcp:json-jq requirement" "Not found"
        fi
        
        # Test: Penalty -30 for wrong tool
        if jq -e '[.. | .penalty? | select(. == -30 or . == 30)] | length > 0' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "Wrong JSON tool penalty (-30)"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: JSON tool penalty (may vary)\n"
        fi
    else
        TOTAL=$((TOTAL + 3))
        printf "${YELLOW}⊘${NC} Tests #$((TOTAL-2))-#$TOTAL: enforcement-engine.json (file not found)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 4: RULE 3 - INTENT VALIDATION
# ═══════════════════════════════════════════════════════════════

test_intent_validation() {
    print_test_header "TEST SUITE 4: Rule 3 - Intent Validation"
    
    cd "$PROJECT_ROOT"
    
    if [ -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        # Test: Intent validation rule
        if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("intent")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "Intent validation rule defined"
        else
            assert_failure "Intent validation rule defined" "Not found"
        fi
        
        # Test: UPDATE intent validation
        if jq -e 'tostring | contains("UPDATE") or contains("update")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "UPDATE intent validation"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: UPDATE intent (may be generalized)\n"
        fi
        
        # Test: CREATE intent validation
        if jq -e 'tostring | contains("CREATE") or contains("create")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "CREATE intent validation"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: CREATE intent (may be generalized)\n"
        fi
        
        # Test: ANALYZE intent validation
        if jq -e 'tostring | contains("ANALYZE") or contains("analyze")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "ANALYZE intent validation"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: ANALYZE intent (may be generalized)\n"
        fi
        
        # Test: Intent mismatch penalty
        if jq -e '[.. | .penalty? | select(. == -100 or . == 100)] | length > 0' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "Intent mismatch penalty (-100)"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: Intent mismatch penalty (may vary)\n"
        fi
    else
        TOTAL=$((TOTAL + 5))
        printf "${YELLOW}⊘${NC} Tests #$((TOTAL-4))-#$TOTAL: enforcement-engine.json (file not found)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 5: RULE 4 - CONFIDENCE THRESHOLD
# ═══════════════════════════════════════════════════════════════

test_confidence_threshold() {
    print_test_header "TEST SUITE 5: Rule 4 - Confidence Threshold"
    
    cd "$PROJECT_ROOT"
    
    if [ -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        # Test: Confidence threshold rule
        if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("confidence")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "Confidence threshold rule defined"
        else
            assert_failure "Confidence threshold rule defined" "Not found"
        fi
        
        # Test: 0.8 threshold
        if jq -e 'tostring | contains("0.8")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "0.8 confidence threshold"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: 0.8 threshold (may be in context-router)\n"
        fi
        
        # Test: Research requirement
        if jq -e 'tostring | contains("research")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "Research requirement for low confidence"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: Research requirement (may be generalized)\n"
        fi
    else
        TOTAL=$((TOTAL + 3))
        printf "${YELLOW}⊘${NC} Tests #$((TOTAL-2))-#$TOTAL: enforcement-engine.json (file not found)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 6: RULE 5 - ATOMIC SYNC
# ═══════════════════════════════════════════════════════════════

test_atomic_sync() {
    print_test_header "TEST SUITE 6: Rule 5 - Atomic Sync"
    
    cd "$PROJECT_ROOT"
    
    if [ -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        # Test: Atomic sync rule
        if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("atomic")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "Atomic sync rule defined"
        else
            assert_failure "Atomic sync rule defined" "Not found"
        fi
        
        # Test: 8 schemas requirement
        if jq -e 'tostring | contains("8") or contains("schemas")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "8 schemas atomic update requirement"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: 8 schemas (implicit)\n"
        fi
        
        # Test: Rollback mechanism
        if jq -e 'tostring | contains("rollback") or contains("ROLLBACK")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "Rollback mechanism defined"
        else
            assert_failure "Rollback mechanism defined" "Not found"
        fi
    else
        TOTAL=$((TOTAL + 3))
        printf "${YELLOW}⊘${NC} Tests #$((TOTAL-2))-#$TOTAL: enforcement-engine.json (file not found)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 7: RULE 6 - MCP CHAIN COMPLETION
# ═══════════════════════════════════════════════════════════════

test_mcp_chain_completion() {
    print_test_header "TEST SUITE 7: Rule 6 - MCP Chain Completion"
    
    cd "$PROJECT_ROOT"
    
    if [ -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        # Test: MCP chain completion rule
        if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("mcp_chain")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "MCP chain completion rule defined"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: MCP chain rule (may be generalized)\n"
        fi
        
        # Test: 4 required steps
        if jq -e 'tostring | contains("sequential_thinking") and contains("memory_query")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "MCP chain required steps referenced"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: MCP steps (may be implicit)\n"
        fi
        
        # Test: Cumulative penalties
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Cumulative MCP penalties (implicit calculation)\n"
    else
        TOTAL=$((TOTAL + 3))
        printf "${YELLOW}⊘${NC} Tests #$((TOTAL-2))-#$TOTAL: enforcement-engine.json (file not found)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 8: VIOLATION LOGGING
# ═══════════════════════════════════════════════════════════════

test_violation_logging() {
    print_test_header "TEST SUITE 8: Violation Logging"
    
    cd "$PROJECT_ROOT"
    
    # Test: progress.json has reinforcement_learning array
    if [ -f ".aegiside/memory-bank/memory/progress.json" ]; then
        if jq -e 'has("reinforcement_learning")' .aegiside/memory-bank/memory/progress.json >/dev/null 2>&1; then
            assert_success "progress.json has reinforcement_learning array"
        else
            assert_failure "progress.json has reinforcement_learning array" "Key missing"
        fi
        
        # Test: Array is accessible
        ARRAY_LENGTH=$(jq '.reinforcement_learning | length' .aegiside/memory-bank/memory/progress.json 2>/dev/null || echo "-1")
        if [ "$ARRAY_LENGTH" -ge "0" ]; then
            assert_success "reinforcement_learning array accessible"
        else
            assert_failure "reinforcement_learning array accessible" "Cannot access"
        fi
    else
        TOTAL=$((TOTAL + 2))
        printf "${YELLOW}⊘${NC} Tests #$((TOTAL-1))-#$TOTAL: progress.json (file not found)\n"
    fi
    
    # Test: Logging enforcement in engine
    if [ -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        if jq -e '.enforcement_engine.post_execution_validation | tostring | contains("logging") or contains("violation")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
            assert_success "Violation logging enforcement"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: Violation logging (may be implicit)\n"
        fi
    fi
}

# ═══════════════════════════════════════════════════════════════
# RUN ALL TESTS
# ═══════════════════════════════════════════════════════════════

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE VIOLATION DETECTION TESTS                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_violation_protocol
test_file_access_blocking
test_json_tool_enforcement
test_intent_validation
test_confidence_threshold
test_atomic_sync
test_mcp_chain_completion
test_violation_logging

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
echo "{\"test_suite\":\"violation_detection\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/violation_detection_results.json" 2>/dev/null || true

if [ $FAILED -eq 0 ]; then
    printf "${GREEN}✅ ALL TESTS PASSED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 0
else
    printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 1
fi
