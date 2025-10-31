#!/bin/bash
# AegisIDE Pre-Execution Enforcement Hook
# Runs BEFORE any AI action - blocks execution if rules violated
# Install location: .git/hooks/aegis-pre-execution
# Called by: Git hooks, IDE integrations, manual execution

set -e

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ═══════════════════════════════════════════════════════════════
# GATE 1: Bootstrap Check
# ═══════════════════════════════════════════════════════════════
enforce_bootstrap() {
    local bootstrap_complete=$(jq -r '.session.status // "uninitialized"' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    if [ "$bootstrap_complete" != "initialized" ]; then
        echo -e "${RED}❌ GATE 1 FAILED: Bootstrap not complete${NC}" >&2
        echo "   Status: $bootstrap_complete" >&2
        echo "   Required: initialized" >&2
        echo "   Fix: Run bootstrap protocol from context-router.json" >&2
        exit 1
    fi
    echo -e "${GREEN}✓${NC} Gate 1: Bootstrap complete"
}

# ═══════════════════════════════════════════════════════════════
# GATE 2: Confidence Check
# ═══════════════════════════════════════════════════════════════
enforce_confidence() {
    local confidence=$(jq -r '.confidence_calculation.final_confidence // 0' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    local band=$(jq -r '.confidence_calculation.execution_band // "unknown"' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    # Use bc for floating point comparison
    if command -v bc &> /dev/null; then
        local below_threshold=$(echo "$confidence < 0.5" | bc -l)
        if [ "$below_threshold" -eq 1 ]; then
            echo -e "${RED}❌ GATE 2 FAILED: Confidence too low${NC}" >&2
            echo "   Confidence: $confidence" >&2
            echo "   Band: $band" >&2
            echo "   Required: ≥0.5 for autonomous execution" >&2
            echo "   Fix: Run confidence-scorer workflow or request user permission" >&2
            exit 1
        fi
    fi
    echo -e "${GREEN}✓${NC} Gate 2: Confidence $confidence ($band)"
}

# ═══════════════════════════════════════════════════════════════
# GATE 3: Memory Query Check
# ═══════════════════════════════════════════════════════════════
enforce_memory_query() {
    local memory_queried=$(jq -r '.mcp_chain_execution.memory_query_executed // false' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    if [ "$memory_queried" != "true" ]; then
        echo -e "${YELLOW}⚠${NC}  Gate 3: Memory not queried (acceptable for simple tasks)"
        # Don't block, just warn
        return 0
    fi
    echo -e "${GREEN}✓${NC} Gate 3: Memory queried"
}

# ═══════════════════════════════════════════════════════════════
# GATE 4: MCP Chain Check
# ═══════════════════════════════════════════════════════════════
enforce_mcp_chain() {
    local chain_started=$(jq -r '.mcp_chain_execution.sequential_thinking_executed // false' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    if [ "$chain_started" != "true" ]; then
        echo -e "${RED}❌ GATE 4 FAILED: MCP chain not started${NC}" >&2
        echo "   Sequential thinking: $chain_started" >&2
        echo "   Required: true (≥3 reasoning steps)" >&2
        echo "   Fix: Execute @mcp:sequential-thinking before task" >&2
        
        # Apply -15 penalty
        jq --arg penalty "-15" --arg timestamp "$TIMESTAMP" \
           '.rl_ledger += [{
               tx_id: ("mcp_chain_not_started_" + $timestamp),
               timestamp: $timestamp,
               category: "mcp_chain_incomplete",
               penalty: ($penalty | tonumber),
               details: "Sequential thinking not executed",
               source: "pre-execution-hook"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_tmp.json
        
        mv /tmp/progress_tmp.json "$MEMORY_BANK/progress.json"
        exit 1
    fi
    echo -e "${GREEN}✓${NC} Gate 4: MCP chain started"
}

# ═══════════════════════════════════════════════════════════════
# GATE 5: File Operation Intent Check
# ═══════════════════════════════════════════════════════════════
enforce_intent_match() {
    local intent=$(jq -r '.file_operation_intent.last_intent_type // "UNKNOWN"' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    local operation=$(jq -r '.file_operation_intent.pending_operation // "none"' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    # Validate intent matches operation
    if [ "$intent" = "UPDATE" ] && [ "$operation" = "CREATE" ]; then
        echo -e "${RED}❌ GATE 5 FAILED: Intent mismatch${NC}" >&2
        echo "   Intent: $intent" >&2
        echo "   Operation: $operation" >&2
        echo "   Violation: Cannot CREATE files when intent is UPDATE" >&2
        
        # Apply -100 penalty
        jq --arg penalty "-100" --arg timestamp "$TIMESTAMP" \
           '.rl_ledger += [{
               tx_id: ("intent_mismatch_" + $timestamp),
               timestamp: $timestamp,
               category: "intent_violation",
               penalty: ($penalty | tonumber),
               details: "Intent UPDATE but operation CREATE",
               source: "pre-execution-hook"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_tmp.json
        
        mv /tmp/progress_tmp.json "$MEMORY_BANK/progress.json"
        exit 1
    fi
    echo -e "${GREEN}✓${NC} Gate 5: Intent matches operation ($intent → $operation)"
}

# ═══════════════════════════════════════════════════════════════
# GATE 6: Source Verification (Anti-Hallucination)
# ═══════════════════════════════════════════════════════════════
enforce_source_verification() {
    if [ -f ".aegiside/enforcement/shell/hooks/source-verification.sh" ]; then
        bash .aegiside/enforcement/shell/hooks/source-verification.sh || {
            echo -e "${RED}❌ GATE 6 FAILED: Source verification${NC}" >&2
            exit 1
        }
    else
        echo -e "${YELLOW}⚠${NC}  Gate 6: Source verification script not found (skipped)"
    fi
}

# ═══════════════════════════════════════════════════════════════
# GATE 7: Requirements Compliance
# ═══════════════════════════════════════════════════════════════
enforce_requirements_compliance() {
    if [ -f ".aegiside/enforcement/shell/hooks/requirements-validator.sh" ]; then
        bash .aegiside/enforcement/shell/hooks/requirements-validator.sh || {
            echo -e "${RED}❌ GATE 7 FAILED: Requirements compliance${NC}" >&2
            exit 1
        }
    else
        echo -e "${YELLOW}⚠${NC}  Gate 7: Requirements validator not found (skipped)"
    fi
}

# ═══════════════════════════════════════════════════════════════
# GATE 8: Constitutional Flow
# ═══════════════════════════════════════════════════════════════
enforce_constitutional_flow() {
    if [ -f ".aegiside/enforcement/shell/validators/constitutional-flow.sh" ]; then
        bash .aegiside/enforcement/shell/validators/constitutional-flow.sh || {
            echo -e "${RED}❌ GATE 8 FAILED: Constitutional flow${NC}" >&2
            exit 1
        }
    else
        echo -e "${YELLOW}⚠${NC}  Gate 8: Constitutional flow validator not found (skipped)"
    fi
}

# ═══════════════════════════════════════════════════════════════
# GATE 9: Harmful Command Validator
# ═══════════════════════════════════════════════════════════════
enforce_harmful_command_check() {
    local pending_command=$(jq -r '.pending_command // ""' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    if [ -n "$pending_command" ] && [ "$pending_command" != "null" ] && [ "$pending_command" != "" ]; then
        if [ -f ".aegiside/enforcement/shell/validators/harmful-command-validator.sh" ]; then
            bash .aegiside/enforcement/shell/validators/harmful-command-validator.sh "$pending_command" || {
                echo -e "${RED}❌ GATE 9 FAILED: Harmful command detected${NC}" >&2
                exit 1
            }
        fi
    else
        echo -e "${GREEN}✓${NC} Gate 9: No pending commands to validate"
    fi
}

# ═══════════════════════════════════════════════════════════════
# GATE 10: Safe Command Auto-Approver
# ═══════════════════════════════════════════════════════════════
enforce_safe_command_check() {
    local pending_command=$(jq -r '.pending_command // ""' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    if [ -n "$pending_command" ] && [ "$pending_command" != "null" ] && [ "$pending_command" != "" ]; then
        if [ -f ".aegiside/enforcement/shell/validators/safe-command-auto-approver.sh" ]; then
            if bash .aegiside/enforcement/shell/validators/safe-command-auto-approver.sh "$pending_command" 2>/dev/null; then
                echo -e "${GREEN}✓${NC} Gate 10: Command auto-approved (safe)"
            else
                echo -e "${YELLOW}⚠${NC}  Gate 10: Command requires manual approval"
            fi
        fi
    else
        echo -e "${GREEN}✓${NC} Gate 10: No pending commands"
    fi
}

# ═══════════════════════════════════════════════════════════════
# GATE 11: JSON Tool Enforcement (JQ-ONLY, MCP-ONLY)
# ═══════════════════════════════════════════════════════════════
enforce_json_tool_validation() {
    local pending_command=$(jq -r '.pending_command // ""' "$MEMORY_BANK/activeContext.json" 2>/dev/null)
    
    if [ -n "$pending_command" ] && [ "$pending_command" != "null" ] && [ "$pending_command" != "" ]; then
        if [ -f ".aegiside/enforcement/shell/validators/json-tool-enforcement.sh" ]; then
            bash .aegiside/enforcement/shell/validators/json-tool-enforcement.sh "$pending_command" || {
                echo -e "${RED}❌ GATE 11 FAILED: JSON tool enforcement${NC}" >&2
                exit 1
            }
        fi
    else
        echo -e "${GREEN}✓${NC} Gate 11: No JSON commands to validate"
    fi
}

# ═══════════════════════════════════════════════════════════════
# Execute All Gates
# ═══════════════════════════════════════════════════════════════
main() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🛡️  AegisIDE Pre-Execution Enforcement (11 Gates)"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Check if memory-bank exists
    if [ ! -d "$MEMORY_BANK" ]; then
        echo -e "${RED}❌ FATAL: memory-bank not found${NC}" >&2
        echo "   Expected: $MEMORY_BANK" >&2
        echo "   Fix: Run setup.sh to initialize framework" >&2
        exit 1
    fi
    
    # Execute gates in order (1-11)
    enforce_bootstrap                  # Gate 1
    enforce_json_tool_validation       # Gate 11 (early enforcement)
    enforce_confidence                 # Gate 2
    enforce_memory_query              # Gate 3
    enforce_mcp_chain                 # Gate 4
    enforce_intent_match              # Gate 5
    enforce_source_verification       # Gate 6
    enforce_requirements_compliance   # Gate 7
    enforce_constitutional_flow       # Gate 8
    enforce_harmful_command_check     # Gate 9
    enforce_safe_command_check        # Gate 10
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo -e "${GREEN}✅ All 11 enforcement gates passed - execution authorized${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    exit 0
}

# Run main function
main "$@"
