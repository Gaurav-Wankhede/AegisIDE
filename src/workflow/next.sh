#!/bin/bash
# Next - Load and execute next task from scratchpad
# Auto-triggered: Continuous autonomous execution (Article 6)
set -euo pipefail

source "$(dirname "$0")/.lib/constitutional-display.sh"

# Load next task
task=$(jq -r '.priority_queue[0] // empty' .aegiside/memory-bank/scratchpad.json)

if [[ -z "$task" ]]; then
  echo "→ No tasks in queue" >&2
  exit 0
fi

echo "→ NEXT: Loading task" >&2
echo "   Task: $task" >&2

# Update activeContext
jq --arg task "$task" '.current_task = $task | .last_activity = now' \
  .aegiside/memory-bank/activeContext.json | sponge .aegiside/memory-bank/activeContext.json

echo "✅ Task loaded - execute autonomously (0-99% band)" >&2
