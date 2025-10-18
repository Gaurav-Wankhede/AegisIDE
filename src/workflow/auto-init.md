---
description: Automatic session initialization with immediate constitutional awareness
---

# Auto-Init — NLU-Based Session Intelligence

## Dynamic Constitutional Display

```bash
# Load constitutional awareness from context-router.json
display_constitutional_awareness() {
  local memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
  local rl_score=$(@mcp:json-jq query '.total_rl_score // 0' from "${memory_bank}progress.json")
  local schema_health=$(@mcp:json-jq query '.memory_bank.schemas | length' from 'context-router.json')
  
  # Dynamic header from context-router
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.header' from 'context-router.json')" >&2
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.constitutional_frame' from 'context-router.json')" >&2
  echo "" >&2
  
  # Core MCPs from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.always_active[]' from 'context-router.json' | while read -r mcp; do
    echo "  $mcp" >&2
  done
  @mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.on_demand[]' from 'context-router.json' | while read -r mcp; do
    echo "  $mcp" >&2
  done
  echo "" >&2
  
  # Memory operations from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.memory_operations.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.session_awareness.dynamic_display.memory_operations.operations[]' from 'context-router.json' | while read -r op; do
    echo "  $op" >&2
  done
  echo "" >&2
  
  # Violations reference from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.violations_penalties.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.violations_penalties.rules[] | "  • \(.violation) → \(.penalty) RL | Fix: \(.fix)"' from 'context-router.json' | while read -r violation; do
    echo "$violation" >&2
  done
  echo "" >&2
  
  # Personalized status
  echo "📊 CURRENT STATUS:" >&2
  echo "  • RL Score: $rl_score" >&2
  echo "  • Schema Health: $schema_health/8" >&2
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.footer' from 'context-router.json')" >&2
  echo "" >&2
}

# NLU-enhanced session detection
detect_session_intelligence() {
  local memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
  local session_status=$(@mcp:json-jq query '.session.status // "new"' from "${memory_bank}activeContext.json")
  local last_activity=$(@mcp:json-jq query '.session.last_activity // null' from "${memory_bank}activeContext.json")
  
  # Check NLU conditions from context-router
  local conditions=$(@mcp:json-jq query '.workflow_auto_triggers.intelligent_conditions[] | select(.workflow == "/auto-init") | .condition' from 'context-router.json')
  
  # Evaluate: new_session && (no_recent_activity || context_switch_detected)
  if [[ "$session_status" == "new" ]] || [[ "$last_activity" == "null" ]]; then
    return 0  # New session detected
  fi
  
  # Time gap analysis (30 min threshold)
  local current_time=$(date '+%s')
  local last_time=$(date -d "$last_activity" '+%s' 2>/dev/null || echo "0")
  local time_diff=$((current_time - last_time))
  
  if [[ $time_diff -gt 1800 ]]; then
    return 0  # Context switch detected
  fi
  
  return 1  # Existing session continues
}

# Main auto-init with intelligence
main() {
  if detect_session_intelligence; then
    display_constitutional_awareness
    
    # Auto-trigger based on NLU analysis
    echo "→ NLU ANALYSIS: Session intelligence activated" >&2
    invoke_workflow "/init"
  fi
}

# Execute with constitutional compliance
main
```
