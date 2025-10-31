#!/bin/bash
# Bootstrap Initialization - Automates session initialization
# Prevents manual bootstrap errors
# Usage: Run at start of every AegisIDE session

set -e

GITHUB_BASE="https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/.aegiside"
MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

bootstrap_session() {
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "🚀 AegisIDE Bootstrap Initialization"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Step 0: Detect Model (placeholder - requires AI context)
    printf "${BLUE}Step 0: Model Detection${NC}\n"
    printf "   Model: Detected from session context\n"
    printf "   Tier: To be determined by AI\n"
    printf "   Has Thinking: To be determined\n"
    
    # Step 1: Bootstrap Protocol from GitHub
    printf "\n${BLUE}Step 1: Fetching Bootstrap Protocol${NC}\n"
    if ! curl -sf "$GITHUB_BASE/routers/context-router.json" > /tmp/context-router.json; then
        printf "${RED}❌ Failed to fetch context-router.json from GitHub${NC}\n" >&2
        exit 1
    fi
    printf "${GREEN}✓${NC} Downloaded context-router.json\n"
    
    local bootstrap_protocol=$(jq -r '.bootstrap_protocol // "missing"' /tmp/context-router.json)
    if [ "$bootstrap_protocol" = "missing" ]; then
        printf "${RED}❌ Bootstrap protocol not found in context-router.json${NC}\n" >&2
        exit 1
    fi
    printf "${GREEN}✓${NC} Bootstrap protocol loaded\n"
    
    # Step 2: Initialize Memory-Bank (if not exists)
    printf "\n${BLUE}Step 2: Memory-Bank Initialization${NC}\n"
    
    if [ ! -d "$MEMORY_BANK" ]; then
        printf "   Creating memory-bank directory...\n"
        mkdir -p "$MEMORY_BANK"
        
        # Initialize default schemas
        printf "   Initializing activeContext.json...\n"
        jq -n '{
            "schema_version": "2.0.0",
            "last_updated": "'$TIMESTAMP'",
            "session": {
                "status": "initialized",
                "initialized_at": "'$TIMESTAMP'",
                "bootstrap_complete": true
            },
            "current_phase": "initialization",
            "model_info": {
                "name": "detected_at_runtime",
                "tier": "value",
                "has_thinking": false,
                "context_window": 200000
            },
            "confidence_calculation": {
                "final_confidence": 0.5,
                "execution_band": "Query Memory (50-69%)"
            },
            "mcp_chain_execution": {
                "sequential_thinking_executed": false,
                "memory_query_executed": false,
                "research_executed": false,
                "pattern_stored": false
            },
            "file_operation_intent": {
                "last_intent_type": "UNKNOWN",
                "pending_operation": "none",
                "user_requested_file_creation": false
            },
            "recent_learnings": []
        }' > "$MEMORY_BANK/activeContext.json"
        
        printf "   Initializing progress.json...\n"
        jq -n '{
            "schema_version": "2.0.0",
            "last_updated": "'$TIMESTAMP'",
            "rl_totals": {
                "total_score": 0,
                "session_start": "'$TIMESTAMP'"
            },
            "rl_ledger": [],
            "tasks_completed": 0,
            "violations": []
        }' > "$MEMORY_BANK/progress.json"
        
        printf "   Initializing systemPatterns.json...\n"
        jq -n '{
            "schema_version": "2.0.0",
            "last_updated": "'$TIMESTAMP'",
            "architecture_patterns": [],
            "reuse_metrics": {}
        }' > "$MEMORY_BANK/systemPatterns.json"
        
        printf "   Initializing scratchpad.json...\n"
        jq -n '{
            "schema_version": "1.0.0",
            "last_updated": "'$TIMESTAMP'",
            "active_tasks": []
        }' > "$MEMORY_BANK/scratchpad.json"
        
        printf "   Initializing mistakes.json...\n"
        jq -n '{
            "schema_version": "1.0.0",
            "last_updated": "'$TIMESTAMP'",
            "errors": []
        }' > "$MEMORY_BANK/mistakes.json"
        
        printf "   Initializing kanban.json...\n"
        jq -n '{
            "schema_version": "1.0.0",
            "last_updated": "'$TIMESTAMP'",
            "features": []
        }' > "$MEMORY_BANK/kanban.json"
        
        printf "   Initializing roadmap.json...\n"
        jq -n '{
            "schema_version": "1.0.0",
            "last_updated": "'$TIMESTAMP'",
            "milestones": []
        }' > "$MEMORY_BANK/roadmap.json"
        
        printf "   Initializing memory.json...\n"
        jq -n '{
            "schema_version": "1.0.0",
            "last_updated": "'$TIMESTAMP'",
            "learnings": []
        }' > "$MEMORY_BANK/memory.json"
        
        printf "${GREEN}✅ Memory-bank initialized with default schemas${NC}\n"
    else
        printf "${GREEN}✓${NC} Memory-bank already exists\n"
        
        # Update session status
        jq '.session.status = "initialized" | 
            .session.bootstrap_complete = true |
            .session.last_bootstrap = "'$TIMESTAMP'" |
            .last_updated = "'$TIMESTAMP'"' \
            "$MEMORY_BANK/activeContext.json" > /tmp/activeContext_bootstrap.json
        
        mv /tmp/activeContext_bootstrap.json "$MEMORY_BANK/activeContext.json"
        printf "${GREEN}✓${NC} Session status updated\n"
    fi
    
    # Step 3: Query Current State
    printf "\n${BLUE}Step 3: Current State Verification${NC}\n"
    
    local current_phase=$(jq -r '.current_phase' "$MEMORY_BANK/activeContext.json")
    local model_name=$(jq -r '.model_info.name // "unknown"' "$MEMORY_BANK/activeContext.json")
    local rl_score=$(jq -r '.rl_totals.total_score // 0' "$MEMORY_BANK/progress.json")
    
    printf "   Current Phase: $current_phase\n"
    printf "   Model: $model_name\n"
    printf "   RL Score: $rl_score\n"
    
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    printf "${GREEN}✅ Bootstrap complete - AegisIDE session initialized${NC}\n"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    
    # Cleanup
    rm -f /tmp/context-router.json
    
    return 0
}

# Main execution
bootstrap_session
