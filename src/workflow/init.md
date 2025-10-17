---
description: Session initialization with selective article loading
---

# /init — Session Initialization

## 1. Load Router & Check Memory Bank

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']
schemas_path = ROUTER['system_paths']['schemas']

# Check 8 schemas exist
if missing: invoke_workflow("/bootstrap")
```

## 2. Load Schemas (Top-Append)

```python
# Query specific fields only
task = @mcp:json-jq query '$.priority_queue[0]' from f"{memory_bank}scratchpad.json"
session = @mcp:json-jq query '$.session' from f"{memory_bank}activeContext.json"
errors = @mcp:json-jq query '$.error_log[0]' from f"{memory_bank}mistakes.json"
rl_score = @mcp:json-jq query '$.total_rl_score' from f"{memory_bank}progress.json"

# Readiness
readiness = Python eval()  # schema_count/8 * 100%
```

## 3. Selective Article Loading

```python
# From router auto_triggers.session_start
auto_triggers = @mcp:json-jq query '$.auto_triggers.session_start' from 'context-router.json'
articles_always = auto_triggers['load_articles']['always']  # [1, 2, 3]

# Detect project language
detection = auto_triggers['detection_logic']
if exists('package.json'): load detection['package.json']
if exists('Cargo.toml'): load detection['Cargo.toml']

# On error: load Article 36 (judiciary)
```

## 4. Validate & Commit

1. `@mcp:filesystem` → Validate schemas
2. `@mcp:memory` → Restore knowledge graph
3. Terminal `date` → Timestamp session
4. `@mcp:git` → Verify clean tree

**RL**: +10 success | -15 fail

---
**Lines**: ~60 | **Selective**: Articles 1-3 + project-based
