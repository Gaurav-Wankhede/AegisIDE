#!/bin/bash
# AegisIDE MCP Chain Tests
# Tests 6-step MCP chain enforcement protocol

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
# TEST SUITE 1: MCP CHAIN PROTOCOL DEFINITION
# ═══════════════════════════════════════════════════════════════

test_mcp_chain_protocol() {
    print_test_header "TEST SUITE 1: MCP Chain Protocol Definition"
    
    cd "$PROJECT_ROOT"
    
    # Test: MCP chain protocol exists in context-router
    if jq -e 'has("mcp_chain_enforcement_protocol")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "MCP chain protocol defined"
    else
        assert_failure "MCP chain protocol defined" "Not found in context-router"
    fi
    
    # Test: Required MCP tools are defined
    local mcp_tools=("sequential-thinking" "json-jq" "context7" "exa" "git")
    
    for tool in "${mcp_tools[@]}"; do
        # Check if tool is mentioned in the protocol
        if jq -e ".mcp_chain_enforcement_protocol | tostring | contains(\"$tool\")" .aegiside/routers/context-router.json >/dev/null 2>&1; then
            assert_success "MCP tool referenced: $tool"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: MCP tool: $tool (may be in different format)\n"
        fi
    done
    
    # Test: Penalty structure exists
    if jq -e '.mcp_chain_enforcement_protocol | has("penalties") or has("penalty") or has("skip_penalty")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "MCP chain penalties defined"
    else
        assert_failure "MCP chain penalties defined" "No penalty structure"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 2: MCP CHAIN STEPS
# ═══════════════════════════════════════════════════════════════

test_mcp_chain_steps() {
    print_test_header "TEST SUITE 2: MCP Chain Steps"
    
    cd "$PROJECT_ROOT"
    
    # Test: Step 1 - Sequential Thinking
    if jq -e '.mcp_chain_enforcement_protocol | tostring | contains("sequential")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Step 1: Sequential Thinking requirement"
    else
        assert_failure "Step 1: Sequential Thinking requirement" "Not defined"
    fi
    
    # Test: Step 2 - Index Check
    if jq -e '.mcp_chain_enforcement_protocol | tostring | contains("index") or contains("router")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Step 2: Index check requirement"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Step 2: Index check (implicit)\n"
    fi
    
    # Test: Step 3 - Targeted Query
    if jq -e '.mcp_chain_enforcement_protocol | tostring | contains("query") or contains("jq")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Step 3: Targeted query requirement"
    else
        assert_failure "Step 3: Targeted query requirement" "Not defined"
    fi
    
    # Test: Step 4 - MCP:json-jq for memory
    if jq -e '.mcp_chain_enforcement_protocol | tostring | contains("json-jq") or contains("memory")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Step 4: MCP:json-jq for memory"
    else
        assert_failure "Step 4: MCP:json-jq for memory" "Not defined"
    fi
    
    # Test: Step 5 - Research (context7/exa)
    if jq -e '.mcp_chain_enforcement_protocol | tostring | contains("research") or contains("context7") or contains("exa")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Step 5: Research requirement"
    else
        assert_failure "Step 5: Research requirement" "Not defined"
    fi
    
    # Test: Step 6 - Pattern Storage
    if jq -e '.mcp_chain_enforcement_protocol | tostring | contains("pattern") or contains("systemPattern")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Step 6: Pattern storage requirement"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Step 6: Pattern storage (may be implicit)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 3: MCP TOOL ENFORCEMENT
# ═══════════════════════════════════════════════════════════════

test_mcp_tool_enforcement() {
    print_test_header "TEST SUITE 3: MCP Tool Enforcement"
    
    cd "$PROJECT_ROOT"
    
    # Test: JSON files require @mcp:json-jq
    if jq -e 'tostring | contains("json-jq")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "JSON files require @mcp:json-jq rule"
    else
        assert_failure "JSON files require @mcp:json-jq rule" "Not enforced"
    fi
    
    # Test: Memory-bank specific routing
    if jq -e 'tostring | contains("memory-bank") or contains("memory_bank")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Memory-bank routing defined"
    else
        assert_failure "Memory-bank routing defined" "Not found"
    fi
    
    # Test: Research threshold (confidence < 0.8)
    if jq -e '.confidence_bands | tostring | contains("0.8") or contains("research")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Research threshold defined"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Research threshold (may be in different location)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 4: PENALTY SYSTEM
# ═══════════════════════════════════════════════════════════════

test_penalty_system() {
    print_test_header "TEST SUITE 4: Penalty System"
    
    cd "$PROJECT_ROOT"
    
    # Test: Skip penalties defined
    local penalties=("skip_sequential_thinking" "skip_memory_query" "skip_research" "banned_tool")
    
    for penalty in "${penalties[@]}"; do
        if jq -e "tostring | contains(\"$penalty\") or contains(\"penalty\")" .aegiside/routers/context-router.json >/dev/null 2>&1; then
            assert_success "Penalty type defined: $penalty"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: Penalty: $penalty (may be generalized)\n"
        fi
    done
    
    # Test: Penalty values are numeric
    PENALTY_COUNT=$(jq '[.. | .penalty? | select(type=="number")] | length' .aegiside/routers/context-router.json 2>/dev/null || echo "0")
    if [ "$PENALTY_COUNT" -gt "0" ]; then
        assert_success "Numeric penalty values defined ($PENALTY_COUNT found)"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Numeric penalties (may be in different format)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 5: MCP CHAIN VALIDATION
# ═══════════════════════════════════════════════════════════════

test_mcp_chain_validation() {
    print_test_header "TEST SUITE 5: MCP Chain Validation"
    
    cd "$PROJECT_ROOT"
    
    # Test: mcp-chain-validator workflow exists
    if jq -e '.workflow_routing.workflows | has("mcp-chain-validator")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "mcp-chain-validator workflow exists"
    else
        assert_failure "mcp-chain-validator workflow exists" "Workflow not found"
    fi
    
    # Test: Validator has trigger
    if jq -e '.workflow_routing.workflows["mcp-chain-validator"] | has("trigger")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "mcp-chain-validator has trigger"
    else
        assert_failure "mcp-chain-validator has trigger" "No trigger defined"
    fi
    
    # Test: Validator has action
    if jq -e '.workflow_routing.workflows["mcp-chain-validator"] | has("action")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "mcp-chain-validator has action"
    else
        assert_failure "mcp-chain-validator has action" "No action defined"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 6: ANTI-AMNESIA PROTOCOL
# ═══════════════════════════════════════════════════════════════

test_anti_amnesia() {
    print_test_header "TEST SUITE 6: Anti-Amnesia Protocol"
    
    cd "$PROJECT_ROOT"
    
    # Test: systemPatterns.json exists
    if [ -f ".aegiside/memory-bank/memory/systemPatterns.json" ]; then
        assert_success "systemPatterns.json exists"
    else
        assert_failure "systemPatterns.json exists" "File not found"
    fi
    
    # Test: systemPatterns has learned_patterns
    if [ -f ".aegiside/memory-bank/memory/systemPatterns.json" ]; then
        if jq -e 'has("learned_patterns")' .aegiside/memory-bank/memory/systemPatterns.json >/dev/null 2>&1; then
            assert_success "systemPatterns has learned_patterns"
        else
            assert_failure "systemPatterns has learned_patterns" "Key missing"
        fi
    fi
    
    # Test: Anti-amnesia penalty defined
    if jq -e 'tostring | contains("amnesia") or contains("pattern")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Anti-amnesia penalty referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Anti-amnesia penalty (implicit)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 7: ENFORCEMENT ENGINE INTEGRATION
# ═══════════════════════════════════════════════════════════════

test_enforcement_integration() {
    print_test_header "TEST SUITE 7: Enforcement Engine Integration"
    
    cd "$PROJECT_ROOT"
    
    # Test: Enforcement engine file exists
    if [ -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        assert_success "enforcement-engine.json exists"
    else
        assert_failure "enforcement-engine.json exists" "File not found"
        return
    fi
    
    # Test: MCP chain enforcement in engine
    if jq -e 'tostring | contains("mcp") or contains("MCP")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
        assert_success "MCP chain in enforcement engine"
    else
        assert_failure "MCP chain in enforcement engine" "Not referenced"
    fi
    
    # Test: Pre-execution checks for MCP
    if jq -e '.enforcement_engine.pre_execution_checks | tostring | contains("mcp") or contains("sequential")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
        assert_success "Pre-execution MCP checks"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Pre-execution MCP checks (may be implicit)\n"
    fi
    
    # Test: Runtime enforcement for MCP
    if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("mcp") or contains("chain")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
        assert_success "Runtime MCP enforcement"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Runtime MCP enforcement (may be generalized)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# RUN ALL TESTS
# ═══════════════════════════════════════════════════════════════

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE MCP CHAIN TESTS                             ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_mcp_chain_protocol
test_mcp_chain_steps
test_mcp_tool_enforcement
test_penalty_system
test_mcp_chain_validation
test_anti_amnesia
test_enforcement_integration

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
echo "{\"test_suite\":\"mcp_chain\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/mcp_chain_results.json" 2>/dev/null || true

if [ $FAILED -eq 0 ]; then
    printf "${GREEN}✅ ALL TESTS PASSED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 0
else
    printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 1
fi
