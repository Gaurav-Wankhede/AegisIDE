#!/bin/bash
# Validate - Zero-tolerance validation (Article 5)
# Auto-triggered: Before every git commit
set -euo pipefail

source "$(dirname "$0")/.lib/constitutional-display.sh"

echo "→ VALIDATE: Running zero-tolerance checks" >&2

# Validate all 8 schemas
memory_bank=".aegiside/memory-bank/"
errors=0

for schema in activeContext scratchpad kanban mistakes systemPatterns progress roadmap memory; do
  if ! jq empty "$memory_bank${schema}.json" 2>/dev/null; then
    echo "✗ ${schema}.json - Invalid JSON" >&2
    ((errors++))
  else
    echo "✓ ${schema}.json" >&2
  fi
done

if [[ $errors -gt 0 ]]; then
  echo "❌ VALIDATION FAILED: $errors schema(s) invalid" >&2
  echo "→ Run /fix to resolve" >&2
  exit 1
fi

echo "✅ VALIDATION PASSED: All schemas valid" >&2
