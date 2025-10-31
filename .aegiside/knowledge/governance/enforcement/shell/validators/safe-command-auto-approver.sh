#!/bin/bash
# Safe Command Auto-Approver - Auto-approves safe commands (test, lint, compile)
# Reward: +50 for efficient use of safe commands
# Usage: Called before terminal command execution

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
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

detect_tech_stack() {
    # Detect project type based on files present
    local tech_stack="unknown"
    
    if [ -f "package.json" ]; then
        tech_stack="nodejs"
    elif [ -f "Cargo.toml" ]; then
        tech_stack="rust"
    elif [ -f "pom.xml" ]; then
        tech_stack="java"
    elif [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
        tech_stack="python"
    elif [ -f "go.mod" ]; then
        tech_stack="go"
    elif [ -f "composer.json" ]; then
        tech_stack="php"
    elif [ -f "Gemfile" ]; then
        tech_stack="ruby"
    elif [ -f "mix.exs" ]; then
        tech_stack="elixir"
    fi
    
    echo "$tech_stack"
}

check_safe_command() {
    local command="$1"
    local tech_stack=$(detect_tech_stack)
    
    printf "${YELLOW}🔍 Safe Command Auto-Approver${NC}\n" >&2
    printf "   Tech Stack: $tech_stack\n" >&2
    
    # ALWAYS SAFE COMMANDS (any tech stack)
    local always_safe=(
        "^ls"
        "^pwd"
        "^echo"
        "^cat"
        "^head"
        "^tail"
        "^grep"
        "^find"
        "^tree"
        "^which"
        "^whoami"
        "^date"
        "^git status"
        "^git log"
        "^git diff"
        "^git branch"
        "^git show"
    )
    
    # Check always safe
    for pattern in "${always_safe[@]}"; do
        if echo "$command" | grep -qE "$pattern"; then
            printf "${GREEN}✅ AUTO-APPROVED: Always safe command${NC}\n" >&2
            apply_reward "Safe command used efficiently"
            return 0
        fi
    done
    
    # TECH STACK SPECIFIC SAFE COMMANDS
    case "$tech_stack" in
        nodejs)
            if echo "$command" | grep -qE "^(npm test|npm run test|npm run lint|npm run build|npm run check|yarn test|yarn lint|yarn build|pnpm test|pnpm lint|eslint|prettier|tsc --noEmit)"; then
                printf "${GREEN}✅ AUTO-APPROVED: Node.js safe command (test/lint/build)${NC}\n" >&2
                apply_reward "Node.js safe command: $command"
                return 0
            fi
            ;;
        rust)
            if echo "$command" | grep -qE "^(cargo test|cargo check|cargo build|cargo clippy|cargo fmt --check|cargo doc|rustfmt|cargo bench)"; then
                printf "${GREEN}✅ AUTO-APPROVED: Rust safe command (test/check/build)${NC}\n" >&2
                apply_reward "Rust safe command: $command"
                return 0
            fi
            ;;
        python)
            if echo "$command" | grep -qE "^(pytest|python -m pytest|python -m unittest|pylint|flake8|black --check|mypy|bandit|python -m pip list|pip list)"; then
                printf "${GREEN}✅ AUTO-APPROVED: Python safe command (test/lint)${NC}\n" >&2
                apply_reward "Python safe command: $command"
                return 0
            fi
            ;;
        java)
            if echo "$command" | grep -qE "^(mvn test|mvn compile|mvn verify|mvn checkstyle|gradle test|gradle build|gradle check)"; then
                printf "${GREEN}✅ AUTO-APPROVED: Java safe command (test/build)${NC}\n" >&2
                apply_reward "Java safe command: $command"
                return 0
            fi
            ;;
        go)
            if echo "$command" | grep -qE "^(go test|go build|go vet|go fmt|go mod verify|golint|staticcheck)"; then
                printf "${GREEN}✅ AUTO-APPROVED: Go safe command (test/build)${NC}\n" >&2
                apply_reward "Go safe command: $command"
                return 0
            fi
            ;;
        php)
            if echo "$command" | grep -qE "^(phpunit|composer test|php -l|phpcs|phpstan|psalm)"; then
                printf "${GREEN}✅ AUTO-APPROVED: PHP safe command (test/lint)${NC}\n" >&2
                apply_reward "PHP safe command: $command"
                return 0
            fi
            ;;
        ruby)
            if echo "$command" | grep -qE "^(rspec|rake test|rubocop|bundle exec rspec)"; then
                printf "${GREEN}✅ AUTO-APPROVED: Ruby safe command (test/lint)${NC}\n" >&2
                apply_reward "Ruby safe command: $command"
                return 0
            fi
            ;;
    esac
    
    # Not a safe command - requires manual approval
    printf "${YELLOW}ℹ️  Not auto-approved - requires manual approval${NC}\n" >&2
    return 1
}

apply_reward() {
    local reason="$1"
    
    if [ -f "$MEMORY_BANK/progress.json" ]; then
        jq --arg reward "50" --arg timestamp "$TIMESTAMP" --arg reason "$reason" \
           '.rl_ledger += [{
               tx_id: ("safe_command_" + $timestamp),
               timestamp: $timestamp,
               category: "command_efficiency",
               penalty: ($reward | tonumber),
               details: $reason,
               source: "safe-command-auto-approver"
           }] | .rl_totals.total_score += ($reward | tonumber)' \
           "$MEMORY_BANK/progress.json" > /tmp/progress_safe.json 2>/dev/null
        
        mv /tmp/progress_safe.json "$MEMORY_BANK/progress.json" 2>/dev/null || true
        printf "${GREEN}🎁 Applied +50 reward${NC}\n" >&2
    fi
}

# Main execution
if [ $# -lt 1 ]; then
    echo "Usage: $0 <command>" >&2
    exit 1
fi

check_safe_command "$1"
