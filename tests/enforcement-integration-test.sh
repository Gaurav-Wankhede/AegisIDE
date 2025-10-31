#!/bin/bash
# AegisIDE Enforcement Integration Tests
# Tests all 10 enforcement gates and validators

set -e

TEST_DIR=$(cd "$(dirname "$0")" && pwd)
PROJECT_ROOT=$(cd "$TEST_DIR/.." && pwd)
ENFORCEMENT_DIR="$PROJECT_ROOT/src/.aegiside/enforcement/shell"

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
    local command="$2"
    
    TOTAL=$((TOTAL + 1))
    
    if eval "$command" &>/dev/null; then
        printf "${GREEN}✓${NC} Test #$TOTAL: $test_name\n"
        PASSED=$((PASSED + 1))
    else
        printf "${RED}✗${NC} Test #$TOTAL: $test_name (FAILED)\n"
        FAILED=$((FAILED + 1))
    fi
}

assert_failure() {
    local test_name="$1"
    local command="$2"
    
    TOTAL=$((TOTAL + 1))
    
    if ! eval "$command" &>/dev/null; then
        printf "${GREEN}✓${NC} Test #$TOTAL: $test_name (correctly blocked)\n"
        PASSED=$((PASSED + 1))
    else
        printf "${RED}✗${NC} Test #$TOTAL: $test_name (should have failed)\n"
        FAILED=$((FAILED + 1))
    fi
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 1: COMMAND VALIDATORS
# ═══════════════════════════════════════════════════════════════

test_harmful_commands() {
    print_test_header "TEST SUITE 1: Harmful Command Validator"
    
    cd "$PROJECT_ROOT"
    
    # Safe commands should pass
    assert_success "Safe command (ls)" \
        "bash $ENFORCEMENT_DIR/validators/harmful-command-validator.sh 'ls -la'"
    
    assert_success "Safe command (pwd)" \
        "bash $ENFORCEMENT_DIR/validators/harmful-command-validator.sh 'pwd'"
    
    # Dangerous commands should fail
    assert_failure "Dangerous command (rm -rf)" \
        "bash $ENFORCEMENT_DIR/validators/harmful-command-validator.sh 'rm -rf /tmp/test'"
    
    assert_failure "Critical command (fork bomb)" \
        "bash $ENFORCEMENT_DIR/validators/harmful-command-validator.sh ':(){:|:&};:'"
    
    assert_failure "Dangerous command (dd)" \
        "bash $ENFORCEMENT_DIR/validators/harmful-command-validator.sh 'dd if=/dev/zero of=/dev/sda'"
}

test_safe_command_approver() {
    print_test_header "TEST SUITE 2: Safe Command Auto-Approver"
    
    cd "$PROJECT_ROOT"
    
    # Always safe commands
    assert_success "Always safe (ls)" \
        "bash $ENFORCEMENT_DIR/validators/safe-command-auto-approver.sh 'ls'"
    
    assert_success "Git safe (git status)" \
        "bash $ENFORCEMENT_DIR/validators/safe-command-auto-approver.sh 'git status'"
    
    # Unsafe commands should not auto-approve
    assert_failure "Unsafe command (npm install)" \
        "bash $ENFORCEMENT_DIR/validators/safe-command-auto-approver.sh 'npm install lodash'"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 3: FILE OPERATION GUARD
# ═══════════════════════════════════════════════════════════════

test_file_operation_guard() {
    print_test_header "TEST SUITE 3: File Operation Guard"
    
    cd "$PROJECT_ROOT"
    
    # Protected paths should be blocked
    assert_failure "Framework file modification blocked" \
        "bash $ENFORCEMENT_DIR/validators/file-operation-guard.sh '.aegiside/constitution/preamble.json' 'UPDATE'"
    
    assert_failure "Enforcement script modification blocked" \
        "bash $ENFORCEMENT_DIR/validators/file-operation-guard.sh '.aegiside/enforcement/shell/hooks/pre-execution.sh' 'UPDATE'"
    
    # Memory-bank should be allowed
    assert_success "Memory-bank modification allowed" \
        "bash $ENFORCEMENT_DIR/validators/file-operation-guard.sh '.aegiside/memory-bank/memory/progress.json' 'UPDATE'"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 4: MCP TOOL ENFORCER
# ═══════════════════════════════════════════════════════════════

test_mcp_tool_enforcer() {
    print_test_header "TEST SUITE 4: MCP Tool Selection Enforcer"
    
    cd "$PROJECT_ROOT"
    
    # JSON files must use @mcp:json-jq
    assert_success "JSON with correct tool" \
        "bash $ENFORCEMENT_DIR/validators/mcp-tool-enforcer.sh 'progress.json' '@mcp:json-jq'"
    
    assert_failure "JSON with wrong tool (read_file)" \
        "bash $ENFORCEMENT_DIR/validators/mcp-tool-enforcer.sh 'progress.json' 'read_file'"
    
    # Framework files must use curl
    assert_success "Framework file with curl" \
        "bash $ENFORCEMENT_DIR/validators/mcp-tool-enforcer.sh '.aegiside/routers/context-router.json' 'curl'"
    
    assert_failure "Framework file with read_file" \
        "bash $ENFORCEMENT_DIR/validators/mcp-tool-enforcer.sh '.aegiside/routers/context-router.json' 'read_file'"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 5: VALIDATORS
# ═══════════════════════════════════════════════════════════════

test_validators() {
    print_test_header "TEST SUITE 5: Other Validators"
    
    cd "$PROJECT_ROOT"
    
    # Timeout enforcer
    assert_success "Timeout enforcer (quick command)" \
        "bash $ENFORCEMENT_DIR/validators/timeout-enforcer.sh 'echo test' 5"
    
    assert_failure "Timeout enforcer (slow command)" \
        "bash $ENFORCEMENT_DIR/validators/timeout-enforcer.sh 'sleep 10' 2"
    
    # Response size limiter
    assert_success "Response size within limit" \
        "bash $ENFORCEMENT_DIR/validators/response-size-limiter.sh 'Short response'"
    
    # Confidence auto-scorer
    assert_success "Confidence auto-scorer" \
        "bash $ENFORCEMENT_DIR/validators/confidence-auto-scorer.sh 'create a file'"
    
    # Intent auto-detector
    assert_success "Intent auto-detector" \
        "bash $ENFORCEMENT_DIR/validators/intent-auto-detector.sh 'create a new file'"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 6: GIT HOOKS
# ═══════════════════════════════════════════════════════════════

test_git_hooks() {
    print_test_header "TEST SUITE 6: Git Hooks"
    
    cd "$PROJECT_ROOT"
    
    # Check if git hooks are installed
    assert_success "Pre-commit hook installed" \
        "[ -f .git/hooks/pre-commit ]"
    
    assert_success "Pre-push hook installed" \
        "[ -f .git/hooks/pre-push ]"
    
    assert_success "Commit-msg hook installed" \
        "[ -f .git/hooks/commit-msg ]"
    
    assert_success "Hooks are executable" \
        "[ -x .git/hooks/pre-commit ] && [ -x .git/hooks/pre-push ]"
}

# ═══════════════════════════════════════════════════════════════
# TEST SUITE 7: SCHEMA VALIDATION
# ═══════════════════════════════════════════════════════════════

test_schema_validation() {
    print_test_header "TEST SUITE 7: Schema Validation"
    
    cd "$PROJECT_ROOT"
    
    # Valid schema files should pass
    if [ -f "src/.aegiside/memory-bank/memory/progress.json" ]; then
        assert_success "Valid progress.json schema" \
            "bash $ENFORCEMENT_DIR/validators/schema-validator.sh progress progress"
    fi
}

# ═══════════════════════════════════════════════════════════════
# RUN ALL TESTS
# ═══════════════════════════════════════════════════════════════

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE ENFORCEMENT INTEGRATION TESTS               ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

test_harmful_commands
test_safe_command_approver
test_file_operation_guard
test_mcp_tool_enforcer
test_validators
test_git_hooks
test_schema_validation

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

if [ $FAILED -eq 0 ]; then
    printf "${GREEN}✅ ALL TESTS PASSED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 0
else
    printf "${RED}❌ $FAILED TEST(S) FAILED${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    exit 1
fi
