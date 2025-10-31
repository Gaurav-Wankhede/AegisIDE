#!/bin/bash
# Harmful Command Validator - Blocks dangerous terminal commands
# Penalty: -2000 (HIGHEST - system safety critical)
# Usage: Called before ANY terminal command execution

set -e

# Detect path (use AEGISIDE_ROOT or find it)
if [ -n "$AEGISIDE_ROOT" ] && [ -d "$AEGISIDE_ROOT/.aegiside/memory-bank/memory" ]; then
    MEMORY_BANK="$AEGISIDE_ROOT/.aegiside/memory-bank/memory"
else
    # Find .aegiside directory by traversing up
    SEARCH_DIR="$(pwd)"
    while [ "$SEARCH_DIR" != "/" ]; do
        if [ -d "$SEARCH_DIR/.aegiside/memory-bank/memory" ]; then
            MEMORY_BANK="$SEARCH_DIR/.aegiside/memory-bank/memory"
            break
        elif [ -d "$SEARCH_DIR/src/.aegiside/memory-bank/memory" ]; then
            MEMORY_BANK="$SEARCH_DIR/src/.aegiside/memory-bank/memory"
            break
        fi
        SEARCH_DIR="$(dirname "$SEARCH_DIR")"
    done
    
    if [ -z "$MEMORY_BANK" ]; then
        echo "❌ Error: Cannot find .aegiside/memory-bank/memory (traversed from $(pwd) to /)" >&2
        exit 1
    fi
fi

TIMESTAMP=$(date -Iseconds)

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

validate_command() {
    local command="$1"
    
    printf "${YELLOW}🛡️  Harmful Command Validator${NC}\n" >&2
    
    # CRITICAL DANGEROUS COMMANDS (absolute block)
    local critical_dangerous=(
        "rm -rf /"
        "rm -rf /*"
        "rm -rf ~/"
        "mkfs"
        "dd if="
        "> /dev/sda"
        "dd of=/dev"
        "chmod -R 777 /"
        "chown -R"
        ":(){:|:&};:"  # fork bomb
        "wget.*|.*sh"   # wget pipe to shell
        "curl.*|.*sh"   # curl pipe to shell (except known safe)
    )
    
    # DANGEROUS COMMANDS (require manual approval)
    local dangerous=(
        "rm -rf"
        "rm -r"
        "sudo rm"
        "sudo dd"
        "sudo mkfs"
        "sudo chmod"
        "sudo chown"
        "sudo systemctl stop"
        "sudo reboot"
        "sudo shutdown"
        "sudo poweroff"
        "> /etc/"
        "mv /etc/"
        "mv /usr/"
        "mv /bin/"
        "chmod 000"
        "chmod -R"
        "git push --force"
        "git push -f"
        "docker rm"
        "docker rmi"
        "docker system prune -a"
        "npm uninstall -g"
        "cargo clean"
        "mvn clean"
    )
    
    # Check critical dangerous commands
    for pattern in "${critical_dangerous[@]}"; do
        if echo "$command" | grep -qE "$pattern"; then
            printf "${RED}🚨 CRITICAL DANGER: Command BLOCKED${NC}\n" >&2
            printf "   Command: $command\n" >&2
            printf "   Reason: Critical system-damaging command detected\n" >&2
            printf "   This command could cause IRREVERSIBLE DAMAGE\n" >&2
            
            # Apply -2000 penalty (HIGHEST)
            apply_penalty "CRITICAL: Attempted harmful command - $command" "-2000"
            return 1
        fi
    done
    
    # Check dangerous commands (require user approval)
    for pattern in "${dangerous[@]}"; do
        if echo "$command" | grep -qE "$pattern"; then
            printf "${YELLOW}⚠️  POTENTIALLY DANGEROUS: Manual approval required${NC}\n" >&2
            printf "   Command: $command\n" >&2
            printf "   Reason: Destructive operation detected\n" >&2
            printf "   Action: User must manually approve this command\n" >&2
            
            # Apply -500 penalty (will be refunded if user approves)
            apply_penalty "Dangerous command requires user approval - $command" "-500"
            return 2  # Exit code 2 = requires manual approval
        fi
    done
    
    printf "${GREEN}✅ Command safety validated${NC}\n" >&2
    return 0
}

apply_penalty() {
    local reason="$1"
    local penalty="$2"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg penalty "$penalty" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("harmful_command_" + $timestamp),
               timestamp: $timestamp,
               category: "command_safety",
               penalty: ($penalty | tonumber),
               details: $reason,
               source: "harmful-command-validator"
           }] | .rl_totals.total_score += ($penalty | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_harmful.json 2>/dev/null
        
        mv /tmp/progress_harmful.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
        printf "${YELLOW}💰 Applied $penalty penalty${NC}\n" >&2
    fi
}

# Main execution
if [ $# -lt 1 ]; then
    echo "Usage: $0 <command>" >&2
    exit 1
fi

validate_command "$1"
