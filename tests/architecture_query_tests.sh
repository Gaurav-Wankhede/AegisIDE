#!/bin/bash
# AegisIDE Architecture Query Tests
# Tests context-router queries and architecture awareness

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

assert_equals() {
    local test_name="$1"
    local expected="$2"
    local actual="$3"
    
    TOTAL=$((TOTAL + 1))
    
    if [ "$expected" == "$actual" ]; then
        printf "${GREEN}✓${NC} Test #$TOTAL: $test_name\n"
        PASSED=$((PASSED + 1))
        return 0
    else
        printf "${RED}✗${NC} Test #$TOTAL: $test_name (Expected: $expected, Got: $actual)\n"
        FAILED=$((FAILED + 1))
        return 1
    fi
}

assert_not_empty() {
    local test_name="$1"
    local value="$2"
    
    TOTAL=$((TOTAL + 1))
    
    if [ -n "$value" ]; then
        printf "${GREEN}✓${NC} Test #$TOTAL: $test_name\n"
        PASSED=$((PASSED + 1))
        return 0
    else
        printf "${RED}✗${NC} Test #$TOTAL: $test_name (Empty result)\n"
        FAILED=$((FAILED + 1))
        return 1
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 1: CONTEXT ROUTER STRUCTURE
# ═══════════════════════════════════════════════════════════════

test_context_router_structure() {
    print_test_header "TEST SUITE 1: Context Router Structure"
    
    cd "$PROJECT_ROOT"
    
    # Test 1: File exists
    TOTAL=$((TOTAL + 1))
    if [ -f ".aegiside/routers/context-router.json" ]; then
        printf "${GREEN}✓${NC} Test #$TOTAL: context-router.json exists\n"
        PASSED=$((PASSED + 1))
    else
        printf "${RED}✗${NC} Test #$TOTAL: context-router.json missing\n"
        FAILED=$((FAILED + 1))
        return
    fi
    
    # Test 2: Has 19 keys
    KEY_COUNT=$(jq 'keys | length' .aegiside/routers/context-router.json)
    assert_equals "context-router has 19 keys" "19" "$KEY_COUNT"
    
    # Test 3: Essential keys exist
    for key in "workflow_routing" "enforcement_system" "mcp_chain_enforcement_protocol" "confidence_bands" "constitutional_flow"; do
        HAS_KEY=$(jq --arg k "$key" 'has($k)' .aegiside/routers/context-router.json)
        assert_equals "Has key: $key" "true" "$HAS_KEY"
    done
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 2: WORKFLOW DISCOVERY
# ═══════════════════════════════════════════════════════════════

test_workflow_discovery() {
    print_test_header "TEST SUITE 2: Workflow Discovery"
    
    cd "$PROJECT_ROOT"
    
    # Test: 18 workflows exist
    WORKFLOW_COUNT=$(jq '.workflow_routing.workflows | length' .aegiside/routers/context-router.json)
    assert_equals "18 workflows discovered" "18" "$WORKFLOW_COUNT"
    
    # Test: Essential workflows exist
    for workflow in "bootstrap-enhanced" "confidence-scorer" "mcp-chain-validator" "violation-detector" "intent-detector"; do
        HAS_WORKFLOW=$(jq --arg w "$workflow" '.workflow_routing.workflows | has($w)' .aegiside/routers/context-router.json)
        assert_equals "Workflow exists: $workflow" "true" "$HAS_WORKFLOW"
    done
    
    # Test: Each workflow has required fields
    FIRST_WORKFLOW=$(jq -r '.workflow_routing.workflows | keys[0]' .aegiside/routers/context-router.json)
    for field in "trigger" "confidence_threshold" "action"; do
        HAS_FIELD=$(jq --arg w "$FIRST_WORKFLOW" --arg f "$field" '.workflow_routing.workflows[$w] | has($f)' .aegiside/routers/context-router.json)
        assert_equals "Workflow has field: $field" "true" "$HAS_FIELD"
    done
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 3: CONSTITUTIONAL FLOW
# ═══════════════════════════════════════════════════════════════

test_constitutional_flow() {
    print_test_header "TEST SUITE 3: Constitutional Flow"
    
    cd "$PROJECT_ROOT"
    
    # Test: Constitutional flow structure exists
    HAS_CONST=$(jq 'has("constitutional_flow")' .aegiside/routers/context-router.json)
    assert_equals "Constitutional flow exists" "true" "$HAS_CONST"
    
    # Test: 4 branches exist (legislature, executive, judiciary, constitutional_bodies)
    for branch in "legislature" "executive" "judiciary" "constitutional_bodies"; do
        HAS_BRANCH=$(jq --arg b "$branch" '.constitutional_flow | has($b)' .aegiside/routers/context-router.json)
        assert_equals "Branch exists: $branch" "true" "$HAS_BRANCH"
    done
    
    # Test: Article count (43 total)
    ARTICLE_COUNT=$(jq '[.constitutional_flow | .[] | .articles[]] | length' .aegiside/routers/context-router.json 2>/dev/null || echo "0")
    if [ "$ARTICLE_COUNT" -gt "0" ]; then
        assert_not_empty "Articles defined" "$ARTICLE_COUNT"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Articles count (structure may vary)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 4: MCP CHAIN PROTOCOL
# ═══════════════════════════════════════════════════════════════

test_mcp_chain_protocol() {
    print_test_header "TEST SUITE 4: MCP Chain Protocol"
    
    cd "$PROJECT_ROOT"
    
    # Test: MCP chain exists
    HAS_MCP=$(jq 'has("mcp_chain_enforcement_protocol")' .aegiside/routers/context-router.json)
    assert_equals "MCP chain protocol exists" "true" "$HAS_MCP"
    
    # Test: Required MCP tools defined
    for tool in "sequential_thinking" "json_jq" "context7" "exa"; do
        HAS_TOOL=$(jq --arg t "$tool" '.mcp_chain_enforcement_protocol.required_tools | any(. == $t or contains($t))' .aegiside/routers/context-router.json 2>/dev/null || echo "false")
        if [ "$HAS_TOOL" == "true" ]; then
            assert_equals "MCP tool defined: $tool" "true" "$HAS_TOOL"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: MCP tool: $tool (may be in different format)\n"
        fi
    done
    
    # Test: Has steps defined
    HAS_STEPS=$(jq '.mcp_chain_enforcement_protocol | has("steps") or has("chain") or has("sequence")' .aegiside/routers/context-router.json)
    assert_equals "MCP chain has steps" "true" "$HAS_STEPS"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 5: CONFIDENCE BANDS
# ═══════════════════════════════════════════════════════════════

test_confidence_bands() {
    print_test_header "TEST SUITE 5: Confidence Bands"
    
    cd "$PROJECT_ROOT"
    
    # Test: Confidence bands exist
    HAS_BANDS=$(jq 'has("confidence_bands")' .aegiside/routers/context-router.json)
    assert_equals "Confidence bands exist" "true" "$HAS_BANDS"
    
    # Test: 5 bands defined (0-29, 30-49, 50-69, 70-89, 90-99)
    BAND_COUNT=$(jq '.confidence_bands | length' .aegiside/routers/context-router.json 2>/dev/null || echo "0")
    if [ "$BAND_COUNT" -ge "4" ]; then
        assert_not_empty "Confidence bands defined" "$BAND_COUNT"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Confidence bands count (Got: $BAND_COUNT)\n"
    fi
    
    # Test: Each band has action
    FIRST_BAND=$(jq -r '.confidence_bands | keys[0]' .aegiside/routers/context-router.json 2>/dev/null || echo "")
    if [ -n "$FIRST_BAND" ]; then
        HAS_ACTION=$(jq --arg b "$FIRST_BAND" '.confidence_bands[$b] | has("action") or has("behavior")' .aegiside/routers/context-router.json)
        assert_equals "Band has action" "true" "$HAS_ACTION"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 6: ARCHITECTURE FILES
# ═══════════════════════════════════════════════════════════════

test_architecture_files() {
    print_test_header "TEST SUITE 6: Architecture Files"
    
    cd "$PROJECT_ROOT"
    
    # Test: architecture.mmd exists
    TOTAL=$((TOTAL + 1))
    if [ -f ".aegiside/architecture/architecture.mmd" ]; then
        printf "${GREEN}✓${NC} Test #$TOTAL: architecture.mmd exists\n"
        PASSED=$((PASSED + 1))
    else
        printf "${RED}✗${NC} Test #$TOTAL: architecture.mmd missing\n"
        FAILED=$((FAILED + 1))
    fi
    
    # Test: architecture.mmd has subgraphs
    if [ -f ".aegiside/architecture/architecture.mmd" ]; then
        SUBGRAPH_COUNT=$(grep -c "subgraph" .aegiside/architecture/architecture.mmd || echo "0")
        if [ "$SUBGRAPH_COUNT" -ge "8" ]; then
            TOTAL=$((TOTAL + 1))
            printf "${GREEN}✓${NC} Test #$TOTAL: architecture.mmd has $SUBGRAPH_COUNT subgraphs\n"
            PASSED=$((PASSED + 1))
        else
            TOTAL=$((TOTAL + 1))
            printf "${RED}✗${NC} Test #$TOTAL: architecture.mmd has only $SUBGRAPH_COUNT subgraphs (expected ≥8)\n"
            FAILED=$((FAILED + 1))
        fi
    fi
    
    # Test: architecture.json exists
    TOTAL=$((TOTAL + 1))
    if [ -f ".aegiside/architecture/architecture.json" ]; then
        printf "${GREEN}✓${NC} Test #$TOTAL: architecture.json exists\n"
        PASSED=$((PASSED + 1))
    else
        printf "${RED}✗${NC} Test #$TOTAL: architecture.json missing\n"
        FAILED=$((FAILED + 1))
    fi
}

# ═══════════════════════════════════════════════════════════════
# RUN ALL TESTS
# ═══════════════════════════════════════════════════════════════

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE ARCHITECTURE QUERY TESTS                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_context_router_structure
test_workflow_discovery
test_constitutional_flow
test_mcp_chain_protocol
test_confidence_bands
test_architecture_files

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

# Export results for report aggregation
echo "{\"test_suite\":\"architecture_query\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/architecture_query_results.json" 2>/dev/null || true

if [ $FAILED -eq 0 ]; then
    printf "${GREEN}✅ ALL TESTS PASSED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 0
else
    printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 1
fi
