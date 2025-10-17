---
description: RL-driven session initialization with selective article loading
---

# /init — Session Initialization

## RL-Driven Session Setup (0-99% Auto)

**Purpose**: Initialize session with 8-schema validation + selective article loading
**RL Reward**: +10 for successful initialization
**RL Penalty**: -15 if schema validation fails
**RL Architecture**: Verify progress.json = SINGLE SOURCE, others have rl_source_ref
**Context Assembly**: Top-append strategy for optimal window usage

## Directives (Query Router Dynamically)
- Invoke `/init` once per session; IAS runs it autonomously and records progress in `activeContext.json`.
- Constitution files and memory-bank schemas must load without prompts. Missing assets trigger `/bootstrap` automatically.
- Schema validation uses schemas from `@mcp:json-jq query '$.system_paths.schemas' from 'context-router.json'`

## MCP Chain (Query Router First)

1. **Load Router Paths**:
   ```python
   ROUTER = @mcp:json-jq query '$' from 'context-router.json'
   paths = ROUTER['system_paths']
   memory_bank = paths['memory_bank']
   schemas = paths['schemas']
   ```
2. `@mcp:filesystem` → Scan `memory_bank` for 8 schemas from `ROUTER['schema_files']`
3. IF missing → Trigger `/bootstrap` workflow
4. `@mcp:json-jq` → Load schemas (top-append order):
   - Query `$.priority_queue[0]` from `scratchpad.json` → Latest priority task
   - Query `$.session` from `activeContext.json` → Last session state
   - Query `$.error_log[0]` from `mistakes.json` → Recent errors
   - Query `$.total_rl_score` from `progress.json` → Latest RL score
5. **Manual Function**: Python `eval()` → Compute readiness: schema_count/8 * 100%
6. `@mcp:filesystem` → Validate against schemas from `ROUTER['schema_files']`
7. `@mcp:memory` → Restore knowledge graph snapshot
8. **Manual Function**: Terminal `date '+%Y-%m-%dT%H:%M:%S%z'` → Timestamp session start
9. `@mcp:git` → Verify clean working tree

**Selective Article Loading** (Query from Router):
```python
# Load from context-router.json auto_triggers.session_start
auto_triggers = @mcp:json-jq query '$.auto_triggers.session_start' from 'context-router.json'
load_config = auto_triggers['load_articles']

# Always Load: Articles from load_config['always']
articles_always = load_config['always']  # [1, 2, 3]

# Project-Based: Use detection_logic from router
detection = auto_triggers['detection_logic']
IF exists('package.json'): load detection['package.json']  # laws/javascript.md
IF exists('Cargo.toml'): load detection['Cargo.toml']      # laws/rust.md
IF exists('requirements.txt'): load detection['requirements.txt']  # laws/python.md
```
- **IF errors detected** → Load `08-judiciary/article-36.md`

## Actions & RL Logging

1. **Technology Laws**: Auto-detect and load language-specific rules
2. **Verify RL Architecture**: Check progress.json has total_rl_score, others have rl_source_ref
3. **Update activeContext.json**: Prepend init event at [0]:
   ```json
   {"event": "session_init", "schema_compliance": 100,
    "articles_loaded": ["01", "02", "03"],
    "rl_source_ref": "progress.json", "timestamp": "..."}
   ```
4. **RL Scoring** (Single Source):
   - All 8 schemas valid → +10 RL → `progress.json[0]` transaction
   - Validation fails → -15 RL → `mistakes.json[0]` + trigger `/fix`
5. **Schema Remediation**: IF failures → Queue in `scratchpad.json`[0] + invoke `/fix`

## Exit & Auto-Chain

- **RL Scoring (PPO+GAE)**

- **Success**: +5 RL → `progress.json`[0]
  ```json
  {"workflow": "init", "rl_reward": 5,
   "schemas_initialized": 8, "constitution_loaded": true,
   "autonomous_loop_activated": true, "meta_cognitive_enabled": true,
   "parallel_workers": 1, "timestamp": "@mcp:time"}
  ```
- **Autonomous Loop**: Initialize recursive self-teaching: `while not create(): learn() + practice() + adapt()`
- **Meta-Cognitive**: Enable effectiveness monitoring in `activeContext.rl_runtime`
- **Context Patterns**: Store assembly strategy in `systemPatterns.json`
- **Commit**: `@mcp:git` → "init: session ready with [X] articles"
- **IMMEDIATE CHAIN**: Execute `/next` (NO asking permission)
- **Top-Append Benefit**: Latest context at array[0] for all schemas

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/init.md`