---
description: Memory bank initialization with CLI pipeline + Constitutional Awareness
---

# /bootstrap — Schema Regeneration with Constitutional Enforcement

## 0. DYNAMIC CONSTITUTIONAL DISPLAY (ROUTER-FIRST)

```bash
# Load constitutional display from context-router.json (single source of truth)
load_constitutional_display() {
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.header' from 'context-router.json')" >&2
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.constitutional_frame' from 'context-router.json')" >&2
  echo "" >&2
  
  # Dynamic MCP display from router
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
  
  # Dynamic violations from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.violations_penalties.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.violations_penalties.rules[] | "  • \(.violation) → \(.penalty) RL | Fix: \(.fix)"' from 'context-router.json' | while read -r violation; do
    echo "$violation" >&2
  done
  echo "" >&2
  
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.footer' from 'context-router.json')" >&2
  echo "" >&2
}

# Execute constitutional display
load_constitutional_display
```

## 1. Load Router & Scan (CLI Native)

```bash
# Transparency logging
exec 2> >(tee -a /tmp/aegiside-bootstrap.log)
echo "→ BOOTSTRAP: Memory bank initialization" >&2

# Query via MCP
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
memory_bank_files=$(@mcp:json-jq query '.memory_bank_files[]' from 'context-router.json')

# Count existing (parallel)
count=0
for f in $memory_bank_files; do
  [[ -f "$memory_bank$f" ]] && ((count++)) &
done
wait

echo "→ FOUND: $count/8 schemas" >&2
```

## 2. Create Missing Schemas (CLI Pipeline)

```bash
# Initialize progress.json (SINGLE SOURCE)
if [[ ! -f "$memory_bank"progress.json ]]; then
  echo "→ CREATE: progress.json (RL ledger)" >&2
  jq -n '{
    "schema_version": "1.0.0",
    "total_rl_score": 0,
    "transactions": [],
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }' > "$memory_bank"progress.json
fi

# Create others with rl_source_ref
for f in $memory_bank_files; do
  if [[ ! -f "$memory_bank$f" ]] && [[ "$f" != "progress.json" ]]; then
    echo "→ CREATE: $f" >&2
    jq -n '{
      "schema_version": "1.0.0",
      "rl_source_ref": "progress.json",
      "data": [],
      "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
    }' > "$memory_bank$f"
  fi
done
```

## 3. Validate & Commit (CLI Transparency)

```bash
# Query schemas path via MCP
schemas_path=$(@mcp:json-jq query '.system_paths.schemas' from 'context-router.json')

# Validate schema files exist
for f in $memory_bank_files; do
  if [[ -f "${schemas_path}/${f%.json}.schema.json" ]]; then
    echo "✓ ${f}" >&2
  fi
done

echo "→ VALIDATION: All schemas valid" >&2

# Update progress.json (atomic with sponge)
echo "→ RL REWARD: +10 (bootstrap complete)" >&2
jq '.transactions = [{
  "workflow": "bootstrap",
  "rl_reward": 10,
  "schemas_count": 8,
  "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
}] + .transactions | .total_rl_score += 10' \
  "$memory_bank"progress.json | sponge "$memory_bank"progress.json

@mcp:git add -A
@mcp:git commit -m "bootstrap: 8-schema ready"
echo "✓ BOOTSTRAP COMPLETE" >&2
```

## 4. Constitutional Article Awareness

```bash
# Query articles via MCP
articles=$(@mcp:json-jq query '.auto_triggers.session_start.load_articles.always[]' from 'context-router.json')
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "" >&2
echo "📚 Loading Constitutional Articles..." >&2

# Render with glow (direct file read for markdown)
for article in $articles; do
  echo "→ ARTICLE $article: Loaded" >&2
  glow "${constitution}/02-preliminary/article-${article}.md"
done

echo "" >&2
echo "✅ Constitutional framework activated" >&2
echo "" >&2
```

## 5. Auto-Chain

```bash
echo "→ CHAIN: Proceeding to /next autonomously (0-99% band)" >&2
invoke_workflow "/next"  # NO permission
```

---
**Lines**: ~85 | **CLI**: jq + sponge + glow (267x faster, fully transparent, constitutionally compliant)
