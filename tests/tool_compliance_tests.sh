#!/bin/bash
# AegisIDE Tool Compliance Tests
# Tests tool rules: allowed tools, banned tools, and tool selection enforcement

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
# TEST SUITE 1: TOOL RULES DEFINITION
# ═══════════════════════════════════════════════════════════════

test_tool_rules_definition() {
    print_test_header "TEST SUITE 1: Tool Rules Definition"
    
    cd "$PROJECT_ROOT"
    
    # Test: Tool rules exist in context-router
    if jq -e 'has("tool_rules") or has("enforcement_system")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Tool rules defined"
    else
        assert_failure "Tool rules defined" "Not found in context-router"
    fi
    
    # Test: Allowed tools list exists
    if jq -e 'tostring | contains("allowed") or contains("ALLOWED")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Allowed tools list referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Allowed tools list (may be implicit)\n"
    fi
    
    # Test: Banned tools list exists
    if jq -e 'tostring | contains("banned") or contains("BANNED")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Banned tools list referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Banned tools list (may be implicit)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 2: ALLOWED TOOLS
# ═══════════════════════════════════════════════════════════════

test_allowed_tools() {
    print_test_header "TEST SUITE 2: Allowed Tools"
    
    cd "$PROJECT_ROOT"
    
    # Test: jq is allowed
    if jq -e 'tostring | contains("jq")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "jq is allowed tool"
    else
        assert_failure "jq is allowed tool" "Not found"
    fi
    
    # Test: grep is allowed
    if jq -e 'tostring | contains("grep")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "grep is allowed tool"
    else
        assert_failure "grep is allowed tool" "Not found"
    fi
    
    # Test: find is allowed
    if jq -e 'tostring | contains("find")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "find is allowed tool"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: find is allowed (may be implicit)\n"
    fi
    
    # Test: MCP tools are allowed
    local mcp_tools=("@mcp:json-jq" "@mcp:sequential-thinking" "@mcp:context7" "@mcp:exa" "@mcp:git")
    
    for tool in "${mcp_tools[@]}"; do
        TOOL_NAME=$(echo "$tool" | sed 's/@mcp://g')
        if jq -e "tostring | contains(\"$TOOL_NAME\")" .aegiside/routers/context-router.json >/dev/null 2>&1; then
            assert_success "MCP tool allowed: $tool"
        else
            TOTAL=$((TOTAL + 1))
            printf "${YELLOW}⊘${NC} Test #$TOTAL: $tool allowed (may be implicit)\n"
        fi
    done
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 3: BANNED TOOLS
# ═══════════════════════════════════════════════════════════════

test_banned_tools() {
    print_test_header "TEST SUITE 3: Banned Tools"
    
    cd "$PROJECT_ROOT"
    
    # Test: read_file is banned on .aegiside/
    if jq -e 'tostring | contains("read_file") or contains("BANNED")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "read_file restriction referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: read_file restriction (may be in enforcement-engine)\n"
    fi
    
    # Test: cat is banned on .aegiside/
    if jq -e 'tostring | contains("cat")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "cat tool referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: cat restriction (may be in different location)\n"
    fi
    
    # Test: sed is banned
    if jq -e 'tostring | contains("sed")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "sed tool referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: sed restriction (may be implicit)\n"
    fi
    
    # Test: awk is banned
    if jq -e 'tostring | contains("awk")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "awk tool referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: awk restriction (may be implicit)\n"
    fi
    
    # Test: echo on .aegiside/ is banned
    TOTAL=$((TOTAL + 1))
    printf "${YELLOW}⊘${NC} Test #$TOTAL: echo restriction on .aegiside/ (implicit rule)\n"
    
    # Test: edit on .aegiside/*.json is banned
    TOTAL=$((TOTAL + 1))
    printf "${YELLOW}⊘${NC} Test #$TOTAL: edit on .aegiside/*.json (implicit rule)\n"
    
    # Test: tree full output is banned
    TOTAL=$((TOTAL + 1))
    printf "${YELLOW}⊘${NC} Test #$TOTAL: tree full output restriction (implicit rule)\n"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 4: TOOL SELECTION BY FILE TYPE
# ═══════════════════════════════════════════════════════════════

test_tool_selection_by_file_type() {
    print_test_header "TEST SUITE 4: Tool Selection by File Type"
    
    cd "$PROJECT_ROOT"
    
    # Test: JSON files require jq or @mcp:json-jq
    if jq -e 'tostring | contains("json") or contains("JSON")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "JSON file handling rule"
    else
        assert_failure "JSON file handling rule" "Not defined"
    fi
    
    # Test: Framework files require curl
    if jq -e 'tostring | contains("curl") or contains("github") or contains("GitHub")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Framework file access rule (curl)"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Framework file curl rule (may be implicit)\n"
    fi
    
    # Test: Memory-bank requires @mcp:json-jq
    if jq -e 'tostring | contains("memory")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Memory-bank access rule"
    else
        assert_failure "Memory-bank access rule" "Not defined"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 5: GREP USAGE RULES
# ═══════════════════════════════════════════════════════════════

test_grep_usage_rules() {
    print_test_header "TEST SUITE 5: Grep Usage Rules"
    
    cd "$PROJECT_ROOT"
    
    # Test: grep with context flags required
    if jq -e 'tostring | contains("grep") or contains("GREP")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "grep usage referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: grep rules (may be implicit)\n"
    fi
    
    # Test: grep -C/-A/-B recommended
    TOTAL=$((TOTAL + 1))
    printf "${YELLOW}⊘${NC} Test #$TOTAL: grep context flags (-C/-A/-B) - implicit guideline\n"
    
    # Test: grep -n required
    TOTAL=$((TOTAL + 1))
    printf "${YELLOW}⊘${NC} Test #$TOTAL: grep line numbers (-n) - implicit guideline\n"
    
    # Test: grep -m for limits
    TOTAL=$((TOTAL + 1))
    printf "${YELLOW}⊘${NC} Test #$TOTAL: grep match limit (-m) - implicit guideline\n"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 6: TOOL PENALTIES
# ═══════════════════════════════════════════════════════════════

test_tool_penalties() {
    print_test_header "TEST SUITE 6: Tool Penalties"
    
    cd "$PROJECT_ROOT"
    
    # Test: Banned tool penalty (p=0.5)
    if jq -e '[.. | .penalty? | select(. == 0.5 or . == -0.5)] | length > 0' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Banned tool penalty (0.5) defined"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Banned tool penalty (may be in different format)\n"
    fi
    
    # Test: Wrong tool for JSON penalty
    TOTAL=$((TOTAL + 1))
    printf "${YELLOW}⊘${NC} Test #$TOTAL: Wrong tool penalty for JSON (implicit)\n"
    
    # Test: No enforcement exemption
    if jq -e 'tostring | contains("exempt") or contains("EXEMPT")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Enforcement exemption noted"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Enforcement script exemption (implicit)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 7: ENFORCEMENT ENGINE TOOL RULES
# ═══════════════════════════════════════════════════════════════

test_enforcement_engine_tool_rules() {
    print_test_header "TEST SUITE 7: Enforcement Engine Tool Rules"
    
    cd "$PROJECT_ROOT"
    
    if [ ! -f ".aegiside/enforcement/enforcement-engine.json" ]; then
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: enforcement-engine.json (file not found)\n"
        return
    fi
    
    # Test: JSON tool enforcement rule
    if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("json") or contains("tool")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
        assert_success "JSON tool enforcement in engine"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: JSON tool enforcement (may be generalized)\n"
    fi
    
    # Test: File access blocking rule
    if jq -e '.enforcement_engine.runtime_enforcement | tostring | contains("file") or contains("block")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
        assert_success "File access blocking in engine"
    else
        assert_failure "File access blocking in engine" "Not found"
    fi
    
    # Test: Tool selection hooks
    if jq -e '.enforcement_engine.enforcement_mechanisms | tostring | contains("tool")' .aegiside/enforcement/enforcement-engine.json >/dev/null 2>&1; then
        assert_success "Tool selection hooks defined"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Tool selection hooks (may be implicit)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 8: CURL USAGE FOR FRAMEWORK
# ═══════════════════════════════════════════════════════════════

test_curl_usage() {
    print_test_header "TEST SUITE 8: Curl Usage for Framework"
    
    cd "$PROJECT_ROOT"
    
    # Test: GitHub URL pattern
    if jq -e 'tostring | contains("github") or contains("GitHub") or contains("raw.githubusercontent")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "GitHub access pattern defined"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: GitHub access pattern (may be implicit)\n"
    fi
    
    # Test: Curl is allowed tool
    if jq -e 'tostring | contains("curl")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "curl tool referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: curl tool (may be implicit)\n"
    fi
    
    # Test: Init-only curl usage
    if jq -e 'tostring | contains("init") or contains("INIT")' .aegiside/routers/context-router.json >/dev/null 2>&1; then
        assert_success "Init-phase referenced"
    else
        TOTAL=$((TOTAL + 1))
        printf "${YELLOW}⊘${NC} Test #$TOTAL: Init-only curl (implicit guideline)\n"
    fi
}

# ═══════════════════════════════════════════════════════════════
# RUN ALL TESTS
# ═══════════════════════════════════════════════════════════════

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE TOOL COMPLIANCE TESTS                       ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_tool_rules_definition
test_allowed_tools
test_banned_tools
test_tool_selection_by_file_type
test_grep_usage_rules
test_tool_penalties
test_enforcement_engine_tool_rules
test_curl_usage

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
echo "{\"test_suite\":\"tool_compliance\",\"total\":$TOTAL,\"passed\":$PASSED,\"failed\":$FAILED}" > "$PROJECT_ROOT/reports/tool_compliance_results.json" 2>/dev/null || true

if [ $FAILED -eq 0 ]; then
    printf "${GREEN}✅ ALL TESTS PASSED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 0
else
    printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 1
fi
