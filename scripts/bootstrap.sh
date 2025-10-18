#!/bin/bash
# /bootstrap - Memory Bank Initialization
set -euo pipefail

echo "→ BOOTSTRAP: Initializing AegisIDE memory bank" >&2

# 1. Create directory structure
mkdir -p .aegiside/memory-bank
mkdir -p .aegiside/schemas
mkdir -p .aegiside/cache/skills
mkdir -p .aegiside/routers

echo "→ FOLDERS: Created .aegiside structure" >&2

# 2. Initialize 8 schemas with minimal valid JSON
cat > .aegiside/memory-bank/activeContext.json << 'EOF'
{
  "schema_version": "1.0.0",
  "timestamp": "",
  "session_metadata": {
    "auto_init_complete": false,
    "constitutional_awareness": "inactive",
    "metadata_injection": "disabled"
  },
  "loaded_articles": [],
  "mcp_fallback_chain": [],
  "user_controls": {
    "pause_requested": false,
    "stop_current_task": false,
    "skip_to_next": false
  }
}
EOF

cat > .aegiside/memory-bank/scratchpad.json << 'EOF'
{
  "schema_version": "1.0.0",
  "timestamp": "",
  "priority_queue": []
}
EOF

cat > .aegiside/memory-bank/kanban.json << 'EOF'
{
  "schema_version": "1.0.0",
  "timestamp": "",
  "columns": {
    "todo": [],
    "in_progress": [],
    "done": [],
    "approved": []
  }
}
EOF

cat > .aegiside/memory-bank/mistakes.json << 'EOF'
{
  "schema_version": "1.0.0",
  "timestamp": "",
  "error_log": []
}
EOF

cat > .aegiside/memory-bank/systemPatterns.json << 'EOF'
{
  "schema_version": "1.0.0",
  "timestamp": "",
  "patterns": []
}
EOF

cat > .aegiside/memory-bank/progress.json << 'EOF'
{
  "schema_version": "1.0.0",
  "timestamp": "",
  "total_rl_score": 0,
  "transactions": [],
  "article_selection_history": [],
  "article_effectiveness": {},
  "trigger_sensitivity": {
    "autonomy": 0.7,
    "validation": 0.8,
    "mcp_usage": 0.75,
    "memory": 0.7,
    "governance": 0.6,
    "quality": 0.75
  },
  "metadata_injection_stats": {
    "total_sessions": 0,
    "avg_articles_per_session": 0,
    "token_savings_vs_full_load": 0,
    "catalog_load_time_ms": 0
  }
}
EOF

cat > .aegiside/memory-bank/roadmap.json << 'EOF'
{
  "schema_version": "1.0.0",
  "timestamp": "",
  "milestones": []
}
EOF

cat > .aegiside/memory-bank/memory.json << 'EOF'
{
  "schema_version": "1.0.0",
  "timestamp": "",
  "entities": [],
  "relations": []
}
EOF

echo "→ SCHEMAS: 8 JSON files initialized" >&2

# 3. Timestamp all schemas
timestamp=$(date '+%Y-%m-%dT%H:%M:%S%z')
for schema in .aegiside/memory-bank/*.json; do
  jq --arg ts "$timestamp" '.timestamp = $ts' "$schema" | sponge "$schema"
done

echo "→ TIMESTAMPS: Applied to all schemas" >&2

# 4. Validate JSON syntax
for schema in .aegiside/memory-bank/*.json; do
  if ! jq empty "$schema" 2>/dev/null; then
    echo "✗ INVALID: $schema" >&2
    exit 1
  fi
done

echo "→ VALIDATION: All schemas valid JSON" >&2
echo "✅ BOOTSTRAP COMPLETE: Memory bank ready at .aegiside/" >&2
