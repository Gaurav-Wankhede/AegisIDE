---
description: Automatic session initialization with metadata injection + Constitutional awareness
---

# /auto-init — Metadata Injection + Constitutional Awareness

## 1. Router Catalog Discovery (Anti-Amnesia)

```bash
# Step 1: Load router catalog
echo "→ ROUTER DISCOVERY: Loading catalog" >&2
router_count=$(@mcp:json-jq query '.modular_routers | length' from 'src/.aegiside/context-router.json')
echo "  ✓ Discovered $router_count routers" >&2

# Step 2: Load system paths
system_paths=$(@mcp:json-jq query '.system_paths' from 'src/.aegiside/context-router.json')
echo "  ✓ System paths loaded" >&2
```

## 2. Load Constitutional Metadata Catalog (500 tokens)

```bash
# Inject lightweight catalog into session context
catalog=$(@mcp:json-jq query '.constitutional_catalog' from 'routers/constitutional-metadata.json')

echo "🛡️ CONSTITUTIONAL METADATA INJECTED" >&2
echo "→ 6 Categories: autonomy, validation, mcp_usage, memory, governance, quality" >&2
echo "→ Token Budget: 500 (vs 25,200 for full load = 98% savings)" >&2
```

## 2. Pre-Load Critical Articles (1,800 tokens)

```bash
# Article 0: Preamble - Constitutional foundation
article_0=$(@mcp:json-jq query '.' from 'constitution/01-preamble/preamble.json')

# Article 4: Autonomous Execution - 0-99% band
article_4=$(@mcp:json-jq query '.' from 'constitution/03-fundamental-rights/article-4.json')

# Article 13: MCP Mandate - 6 mandatory MCPs
article_13=$(@mcp:json-jq query '.' from 'constitution/04-fundamental-duties/article-13.json')

echo "→ 3 Critical Articles Loaded: article-0, article-4, article-13" >&2
```

## 3. Initialize RL Selection Tracking

```bash
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'routers/context-router.json')

# Initialize article_selection_history if not exists
jq --arg ts "$(date '+%Y-%m-%dT%H:%M:%S%z')" '
if .article_selection_history then . else 
  .article_selection_history = [] |
  .article_effectiveness = {} |
  .trigger_sensitivity = {
    "autonomy": 0.7,
    "validation": 0.8,
    "mcp_usage": 0.75,
    "memory": 0.7,
    "governance": 0.6,
    "quality": 0.75
  } |
  .metadata_injection_stats = {
    "total_sessions": 0,
    "avg_articles_per_session": 0,
    "token_savings_vs_full_load": 0,
    "catalog_load_time_ms": 0
  }
end |
.metadata_injection_stats.total_sessions += 1 |
.metadata_injection_stats.last_session = $ts
' "${memory_bank}progress.json" | sponge "${memory_bank}progress.json"

echo "→ RL Selection Tracking Initialized" >&2
```

## 4. Enable NLU Intent Recognition

```bash
# Load workflow triggers
nlu_engine=$(@mcp:json-jq query '.workflow_auto_triggers.nlu_engine' from 'routers/workflows.json')

echo "→ NLU Engine Active: Intent recognition enabled" >&2
echo "→ Semantic Matching: Claude's native reasoning" >&2
```

## 5. Display Constitutional Status

```bash
echo "" >&2
echo "═══════════════════════════════════════════════════════════" >&2
echo "  ✅ CONSTITUTIONAL AWARENESS ACTIVE" >&2
echo "═══════════════════════════════════════════════════════════" >&2
echo "" >&2
echo "📊 Metadata Injection:" >&2
echo "  • Catalog: 6 categories × ~80 tokens = 500 tokens loaded" >&2
echo "  • Critical Articles: 3 pre-loaded (article-0, 4, 13)" >&2
echo "  • Progressive Loading: 39 articles on-demand via triggers" >&2
echo "" >&2
echo "🎯 Semantic Discovery Enabled:" >&2
echo "  • Claude matches user intent → constitutional catalog" >&2
echo "  • RL feedback optimizes selection accuracy over time" >&2
echo "  • Token savings: ~98% vs full article loading" >&2
echo "" >&2
echo "⚡ 6 Mandatory MCPs Ready:" >&2
echo "  @mcp:sequential-thinking @mcp:json-jq @mcp:git" >&2
echo "  @mcp:context7 @mcp:exa @mcp:fetch" >&2
echo "" >&2
echo "═══════════════════════════════════════════════════════════" >&2
echo "" >&2
```

## 6. Session Intelligence Activation

```bash
# Mark session as initialized
jq '.session_metadata.auto_init_complete = true |
    .session_metadata.constitutional_awareness = "active" |
    .session_metadata.metadata_injection = "enabled"' \
  "${memory_bank}activeContext.json" | sponge "${memory_bank}activeContext.json"

echo "✨ Session Ready - Constitutional AI Active" >&2
```

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
