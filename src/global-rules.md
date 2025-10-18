# AegisIDE Global Rules - Dynamic Router-First System

## 🎯 Core Principle: Router is Supreme Law

**EVERYTHING queries**: `.windsurf/aegiside/context-router.json`

**Universal Query Pattern**:
```bash
@mcp:json-jq query '.section' from 'context-router.json'
```

**Router Sections** (13 total - query dynamically, never hardcode):
- `.constitution`, `.workflows`, `.mcps`, `.memory_bank`, `.intent_mapping`
- `.json_access_rules`, `.cascade_execution_model`, `.command_safety`
- `.memory_persistence`, `.session_continuity`, `.mcp_health_monitoring`
- `.dynamic_context_engineering`, `.rl_memory_integration`

---

## 🔧 Hybrid Architecture (MCP + CLI Pipeline)

**MANDATORY MCPs** (7 total - Query: `@mcp:json-jq query '.mcps' from 'context-router.json'`):

1. **@mcp:json-jq** - ALL JSON read operations (memory bank, router, schemas)
2. **@mcp:memory** - Knowledge graph operations (patterns, entities, relations)
3. **@mcp:git** - ALL version control (add, commit, checkout, log)
4. **@mcp:sequential-thinking** - MANDATORY before every action (≥3 thoughts)
5. **@mcp:context7** - Official documentation (errors, new features)
6. **@mcp:exa** - Code context research (real-world examples)
7. **@mcp:fetch** - External research (fallback for context7)

**CLI Pipeline for JSON Writes** (Atomic operations):
```bash
# ✅ REQUIRED: jq + sponge for atomic JSON writes
jq '.key = "value"' file.json | sponge file.json

# ✅ ALLOWED: CLI tools for performance
glow article.md  # Markdown rendering
date '+%Y-%m-%dT%H:%M:%S%z'  # Timestamps
python3 -c "print(calc)"  # Calculations

# ❌ FORBIDDEN: CLI for operations with MCP equivalents
git add .  # -50 RL penalty - use @mcp:git instead
cat file.json  # -30 RL penalty - use @mcp:json-jq instead
jq '.' file.json  # -30 RL penalty - use @mcp:json-jq for reads
```

**Penalty**: CLI usage (except jq/sponge) = -50 RL + action voided

---

## 🧠 Memory Bank Architecture (8 Schemas)

**Read via @mcp:json-jq ONLY** (Query router for paths):
```bash
# Get schema locations from router
schemas=$(@mcp:json-jq query '.memory_bank' from 'context-router.json')

# Read specific schema
@mcp:json-jq query '$.priority_queue[0]' from 'scratchpad.json'
@mcp:json-jq query '$.session' from 'activeContext.json'
@mcp:json-jq query '$.total_rl_score' from 'progress.json'
```

**Write via @mcp:filesystem + jq/sponge**:
```bash
# Update schema atomically
jq '.priority_queue[0] = {"new": "task"}' scratchpad.json | sponge scratchpad.json
```

**8 Schemas** (all ≤10KB, top-append [0] strategy):
1. `activeContext.json` - Session state, MCP tracking, checkpoints
2. `scratchpad.json` - Priority queue (always process [0])
3. `kanban.json` - Task lifecycle (todo→in_progress→done→approved)
4. `mistakes.json` - Error patterns, prevention rules, RL penalties
5. `systemPatterns.json` - Reusable solutions, RL rewards, confidence scores
6. `progress.json` - **RL central ledger** (single source of truth)
7. `roadmap.json` - Strategic milestones, dependencies
8. `memory.json` - Knowledge graph (entities, relations, observations)

**Atomic Update Rule**: ALL 8 schemas updated together or NONE (+8 RL, -30 RL if partial)

---

## 🚀 Dynamic NLU/NLP Execution

**Intent Detection → Auto-Execute** (Query router for all intents):
```bash
# User: "Fix the authentication bug"

# System auto-detects intent from router:
intent=$(@mcp:json-jq query '.intent_mapping.error' from 'context-router.json')
workflow=$(echo $intent | jq -r '.workflows[0]')  # Returns: /fix
articles=$(echo $intent | jq -r '.articles[]')     # Returns: 5, 15

# Auto-execute workflow (0-99% autonomy - NO permission)
/$workflow  # Triggers: /fix → HALT-FIX-VALIDATE loop

# Auto-load articles via glow
glow {IDE}/rules/constitution/03-fundamental-rights/article-5.md
glow {IDE}/rules/constitution/04-fundamental-duties/article-15.md
```

**12 Intent Types** (all in router):
`error`, `feature`, `validate`, `optimize`, `status`, `init`, `continue`, `bootstrap`, `update`, `oversight`, `memory_status`, `research`

---

## 🛡️ Zero-Amnesia Memory System

**Auto-Protection** (Query router for all configs):
```bash
# Every 5 operations (automatic):
@mcp:git commit -m "checkpoint: [count] ops"  # Backup
@mcp:json-jq query '$.session' from 'activeContext.json'  # Anchor (+2 RL)

# Crash recovery (automatic on session_start):
crash=$(@mcp:json-jq query '.session_continuity.crash_detection' from 'context-router.json')
if [ "$crash" = "true" ]; then
  /continue  # Auto-restore from checkpoint
fi

# MCP health (every 10 operations):
@mcp:json-jq query '.mcp_health_monitoring' from 'context-router.json'
# Ping all MCPs → Use fallback chains if failure
```

**RL-Driven Incentives** (prevent memory loss):
- Atomic 8-schema update: **+8 RL** (1 per schema)
- Memory anchor (every 5 ops): **+2 RL** (anti-amnesia)
- Pattern reuse: **+20 RL** (knowledge retention)
- Missing schema update: **-30 RL** (penalty prevents loss)

---

## ⚡ Execution Protocol (Router-First)

**Mandatory 4-Step Pattern**:
```bash
# 1. THINK (via @mcp:sequential-thinking)
@mcp:sequential-thinking
thought: "Query router for: [section]"
thought: "Execute via MCPs: [list]"
thought: "Update schemas: [all 8]"
nextThoughtNeeded: false

# 2. QUERY ROUTER (via @mcp:json-jq)
config=$(@mcp:json-jq query '.section_name' from 'context-router.json')

# 3. EXECUTE (via MCPs - NO CLI)
@mcp:context7 resolve-library-id "library"
@mcp:filesystem write_to_file "path" "content"
@mcp:git add -A && @mcp:git commit -m "feat: [task]"

# 4. UPDATE SCHEMAS (atomic - all 8)
jq '.key = "value"' schema.json | sponge schema.json  # Repeat for all 8
# Verify: @mcp:json-jq query all 8 schemas
# Reward: +8 RL if complete, -30 RL if partial
```

**Auto-Continue** (0-99% autonomy - NO permission):
```bash
# After task complete:
next_task=$(@mcp:json-jq query '.priority_queue[0]' from 'scratchpad.json')
# Execute immediately (NO asking "Should I continue?")
# Penalty for asking: -20 RL
```

---

## ❌ Violations & Penalties

**Critical Violations** (query router for full list):
```bash
penalties=$(@mcp:json-jq query '.execution_rules.forbidden_actions' from 'context-router.json')
```

| Violation | Penalty | Remediation |
|-----------|---------|-------------|
| **CLI bypass** (except jq/sponge) | **-50 RL** | Action voided, use MCP |
| **Missing @mcp:json-jq** for JSON read | **-30 RL** | Re-read via MCP |
| **Partial schema update** (< 8) | **-30 RL** | Atomic update all 8 |
| **Asking permission** (0-99%) | **-20 RL** | Execute immediately |
| **Research without solution** | **-10 RL** | Implement + validate |
| **Missing @mcp:sequential-thinking** | **-15 RL** | Think before action |

**Details**: Query `@mcp:json-jq query '.command_safety' from 'context-router.json'`

---

## 📊 Success = Max RL via Router

**High-Reward Pattern**:
1. @mcp:sequential-thinking (≥3 thoughts) → **Base RL**
2. @mcp:json-jq query router config → **+5 RL**
3. Complete MCP chain (all 8 MCPs) → **+10 RL**
4. Atomic 8-schema update → **+8 RL**
5. Pattern reuse from memory.json → **+20 RL**
6. @mcp:git commit with RL score → **Logging**
7. Auto-continue (NO permission) → **+5 RL**

**Total**: +48 to +73 RL per task (when done correctly)

**Router is Supreme** - Query dynamically, never hardcode, MCP-first architecture, zero amnesia.

---

**Router Location**: `.windsurf/aegiside/context-router.json`  
**Query Method**: `@mcp:json-jq query '.section' from 'context-router.json'`  
**Constitutional Compliance**: ≥80% required  
**MCP Count**: 8 mandatory (NO exceptions)
