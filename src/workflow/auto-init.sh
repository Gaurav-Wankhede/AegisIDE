#!/bin/bash
# Auto-Init - Automatic session initialization
# Auto-triggered when: New session detected (session.status == "new")
set -euo pipefail

# Source shared constitutional display
source "$(dirname "$0")/.lib/constitutional-display.sh"

# Check trigger condition
session_status=$(jq -r '.session.status // "new"' .aegiside/memory-bank/activeContext.json 2>/dev/null || echo "new")

if [[ "$session_status" != "new" ]]; then
  exit 0  # Not a new session, exit silently
fi

# Display constitutional rules
display_constitutional_rules

# Load router catalog
echo "🚀 AegisIDE Session Starting..." >&2
routers=$(jq '.modular_routers | length' .aegiside/routers/context-router.json)
echo "→ Discovered $routers routers" >&2

# Update session state
jq '.session = {
  status: "active",
  last_activity: now,
  started_at: now
}' .aegiside/memory-bank/activeContext.json | sponge .aegiside/memory-bank/activeContext.json

# Update RL score
jq '.transactions = [{
  workflow: "auto-init",
  rl_reward: 5,
  timestamp: now | todate
}] + .transactions | .total_rl_score += 5' \
  .aegiside/memory-bank/progress.json | sponge .aegiside/memory-bank/progress.json

echo "✅ Auto-init complete" >&2
