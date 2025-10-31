#!/bin/bash

# AegisIDE Full Test Suite
# ------------------------

set -e

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$PROJECT_ROOT"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         AEGISIDE FULL TEST SUITE                             ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
printf "Starting at: ${BLUE}$(date)${NC}\n"
echo ""

# Create reports directory
mkdir -p ./reports

# Track test results
TOTAL_PASSED=0
TOTAL_FAILED=0
TOTAL_TESTS=0
FAILED_SUITES=""

# Test categories
TESTS=(
    "architecture_query_tests.sh"
    "memory_bank_tests.sh"
    "mcp_chain_tests.sh"
    "tool_compliance_tests.sh"
    "violation_detection_tests.sh"
    "autonomous_execution_tests.sh"
    "file_operation_tests.sh"
    "error_handling_tests.sh"
    "e2e_workflow_tests.sh"
)

for test in "${TESTS[@]}"; do
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    printf "${BLUE}Running: $test${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if bash "./tests/$test"; then
        printf "${GREEN}✓ $test PASSED${NC}\n\n"
    else
        printf "${RED}✗ $test FAILED${NC}\n\n"
        FAILED_SUITES="$FAILED_SUITES\n  - $test"
    fi
done

# Generate final report
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "                    AGGREGATING RESULTS                           "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

if [ -d "./reports" ] && [ "$(ls -A ./reports/*.json 2>/dev/null)" ]; then
    # Aggregate all test results
    jq -s '{
        timestamp: now | strftime("%Y-%m-%d %H:%M:%S"),
        test_suites: .,
        summary: {
            total_tests: ([.[].total] | add),
            total_passed: ([.[].passed] | add),
            total_failed: ([.[].failed] | add),
            pass_rate: (([.[].passed] | add) * 100 / ([.[].total] | add) | floor)
        }
    }' ./reports/*_results.json > ./reports/final_report.json 2>/dev/null || true
    
    # Display summary
    SUMMARY=$(cat ./reports/final_report.json 2>/dev/null || echo '{}')
    TOTAL_TESTS=$(echo "$SUMMARY" | jq -r '.summary.total_tests // 0')
    TOTAL_PASSED=$(echo "$SUMMARY" | jq -r '.summary.total_passed // 0')
    TOTAL_FAILED=$(echo "$SUMMARY" | jq -r '.summary.total_failed // 0')
    PASS_RATE=$(echo "$SUMMARY" | jq -r '.summary.pass_rate // 0')
    
    echo ""
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                    FINAL TEST SUMMARY                        ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo ""
    printf "Total Tests:  ${BLUE}$TOTAL_TESTS${NC}\n"
    printf "Passed:       ${GREEN}$TOTAL_PASSED${NC}\n"
    printf "Failed:       ${RED}$TOTAL_FAILED${NC}\n"
    printf "Pass Rate:    ${YELLOW}$PASS_RATE%%${NC}\n"
    echo ""
    
    if [ -n "$FAILED_SUITES" ]; then
        printf "${RED}Failed Test Suites:${NC}$FAILED_SUITES\n"
        echo ""
    fi
    
    printf "Completed at: ${BLUE}$(date)${NC}\n"
    printf "Report saved: ${GREEN}./reports/final_report.json${NC}\n"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    if [ "$TOTAL_FAILED" -eq "0" ]; then
        printf "${GREEN}✅ ALL TESTS PASSED!${NC}\n"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        exit 0
    else
        printf "${RED}❌ SOME TESTS FAILED${NC}\n"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        exit 1
    fi
else
    printf "${YELLOW}⚠ No test results found${NC}\n"
    exit 1
fi
