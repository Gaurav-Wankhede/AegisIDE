#!/bin/bash
# Intent Auto-Detector - Automatically detects file operation intent
# Prevents manual intent detection errors

MEMORY_BANK=".aegiside/memory-bank/memory"
TIMESTAMP=$(date -Iseconds)

detect_intent() {
    local query="$1"
    
    echo "🎯 Intent Auto-Detector" >&2
    
    local intent="UNKNOWN"
    
    # CREATE intent
    if echo "$query" | grep -qiE "(create|add|new|generate|write|build|make).*file"; then
        intent="CREATE"
    # UPDATE intent
    elif echo "$query" | grep -qiE "(update|modify|change|edit|fix|patch|refactor)"; then
        intent="UPDATE"
    # DELETE intent
    elif echo "$query" | grep -qiE "(delete|remove|clean|purge)"; then
        intent="DELETE"
    # READ intent
    elif echo "$query" | grep -qiE "(read|show|display|view|list|find|search)"; then
        intent="READ"
    fi
    
    echo "   Detected Intent: $intent" >&2
    echo "$intent"
}

detect_intent "$1"
