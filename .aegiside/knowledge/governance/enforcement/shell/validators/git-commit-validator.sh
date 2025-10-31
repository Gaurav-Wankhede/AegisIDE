#!/bin/bash
# Git Commit Validator - Ensures quality commit messages
# Penalty: -100

MEMORY_BANK=".aegiside/memory-bank/memory"

validate_commit_message() {
    local message="$1"
    
    echo "🔍 Git Commit Validator" >&2
    echo "   Message: $message" >&2
    
    # Check minimum length
    if [ ${#message} -lt 10 ]; then
        echo "❌ Commit message too short (min 10 chars)" >&2
        return 1
    fi
    
    # Check for conventional commit format
    if ! echo "$message" | grep -qE '^(feat|fix|docs|style|refactor|perf|test|chore|build|ci|revert)(\(.+\))?:'; then
        echo "⚠️  Not using conventional commit format" >&2
    fi
    
    echo "✅ Commit message validated" >&2
    return 0
}

if [ $# -lt 1 ]; then
    echo "Usage: $0 <commit_message>" >&2
    exit 1
fi

validate_commit_message "$1"
