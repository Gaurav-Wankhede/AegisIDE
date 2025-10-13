---
description: RL-driven session initialization with selective article loading
---

# /init — Session Initialization

## RL-Driven Session Setup (0-99% Auto)

**Purpose**: Initialize session with 8-schema validation + selective article loading
**RL Reward**: +10 for successful initialization
**RL Penalty**: -15 if schema validation fails
**Context Assembly**: Top-append strategy for optimal window usage

## Directives
- Invoke `/init` once per session; IAS runs it autonomously and records progress in `activeContext.json`.
- Constitution files and memory-bank schemas must load without prompts. Missing assets trigger `/bootstrap` automatically.
- Schema validation uses `{IDE}/aegiside/memory-bank/schemas/*.schema.json` every time a file is read or regenerated.

## MCP Chain (Selective Loading)

1. `@mcp:filesystem` → Scan `{IDE}/aegiside/memory-bank/` for 8 schemas
2. IF missing → Trigger `/bootstrap` workflow
3. `@mcp:filesystem` → Load schemas (top-append order):
   - Read `scratchpad.json`[0] → Latest priority task
   - Read `activeContext.json` → Last session state
   - Read `mistakes.json`[0] → Recent errors
   - Read `progress.json`[0] → Latest RL score
4. `@mcp:math` → Compute readiness: schema_count/8 * 100%
5. `@mcp:filesystem` → Validate against `{IDE}/aegiside/schemas/*.schema.json`
6. `@mcp:memory` → Restore knowledge graph snapshot
7. `@mcp:time` → Timestamp session start
8. `@mcp:git` → Verify clean working tree

**Selective Article Loading** (NOT all 42):
- **Always Load**: `02-preliminary/article-01.md` to `article-03.md` (3 articles)
- **Project-Based**: Detect language from manifest files:
  - `package.json` → Load `laws/javascript.md`
  - `Cargo.toml` → Load `laws/rust.md`
  - `requirements.txt` → Load `laws/python.md`
- **IF errors detected** → Load `08-judiciary/article-36.md`

## Actions & RL Logging

1. **Technology Laws**: Auto-detect and load language-specific rules
2. **Update activeContext.json**: Prepend init event at [0]:
   ```json
   {"event": "session_init", "schema_compliance": 100,
    "articles_loaded": ["01", "02", "03"],
    "rl_reward": 10, "timestamp": "..."}
   ```
3. **RL Scoring**:
   - All 8 schemas valid → +10 RL → Prepend to `progress.json`
   - Validation fails → -15 RL → Prepend to `mistakes.json` + trigger `/fix`
4. **Schema Remediation**: IF failures → Queue in `scratchpad.json`[0] + invoke `/fix`

## Exit & Auto-Chain

- **Readiness Metrics**: Prepend to `progress.json`[0]:
  ```json
  {"workflow": "init", "rl_reward": 10,
   "schema_compliance": 100, "articles_loaded": 3,
   "timestamp": "@mcp:time"}
  ```
- **Context Patterns**: Store assembly strategy in `systemPatterns.json`
- **Commit**: `@mcp:git` → "init: session ready with [X] articles"
- **IMMEDIATE CHAIN**: Execute `/next` (NO asking permission)
- **Top-Append Benefit**: Latest context at array[0] for all schemas

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/init.md`