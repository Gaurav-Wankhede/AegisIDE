#!/bin/bash
# Bootstrap - Initialize 8-schema memory bank
# Auto-triggered when: Schemas missing or corrupted
set -euo pipefail

source "$(dirname "$0")/.lib/constitutional-display.sh"
display_constitutional_rules

echo "→ BOOTSTRAP: Initializing memory bank" >&2

# Check existing schemas
memory_bank=".aegiside/memory-bank/"
required_schemas=("activeContext" "scratchpad" "kanban" "mistakes" "systemPatterns" "progress" "roadmap" "memory")
missing=0

for schema in "${required_schemas[@]}"; do
  [[ ! -f "$memory_bank${schema}.json" ]] && ((missing++))
done

echo "→ Found $((8-missing))/8 schemas" >&2

# Create missing schemas
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

for schema in "${required_schemas[@]}"; do
  if [[ ! -f "$memory_bank${schema}.json" ]]; then
    echo "→ Creating ${schema}.json" >&2
    echo "{\"schema_version\":\"1.0.0\",\"timestamp\":\"$timestamp\"}" > "$memory_bank${schema}.json"
  fi
done

echo "✅ Bootstrap complete - 8/8 schemas initialized" >&2
