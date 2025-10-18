# AegisIDE - Router-First Dynamic System

## 🎯 Supreme Principle: context-router.json is Single Source of Truth

**Query EVERYTHING from**: `{IDE}/.aegiside/context-router.json`

```bash
@mcp:json-jq query '.section' from 'context-router.json'
```

---

## 📍 Router Sections (13 Total)

All details in router - query dynamically:

1. **`.constitution`** - 42 articles, democratic governance, tri-branch system
2. **`.workflows`** - 12 slash commands, auto-chain execution model
3. **`.mcps`** - 7 mandatory MCPs + fallback chains
4. **`.memory_bank`** - 8 schemas (≤10KB each), atomic updates
5. **`.intent_mapping`** - 12 intent types, auto-workflow triggers
6. **`.json_access_rules`** - jq/sponge CLI pipeline (100-267x faster)
7. **`.cascade_execution_model`** - Atomic commands, no loops
8. **`.command_safety`** - Safe whitelist, forbidden commands
9. **`.memory_persistence`** - Checkpoint system, anti-amnesia
10. **`.session_continuity`** - Crash recovery, auto-restore
11. **`.mcp_health_monitoring`** - Uptime tracking, fallbacks
12. **`.bootstrap_initialization`** - GitHub auto-clone, IDE detection
13. **`.rl_memory_integration`** - Reward scoring, pattern learning

**Usage**: `@mcp:json-jq query '.workflows' from 'context-router.json'`

---

## 🚀 Bootstrap (First-Time Setup)

**GitHub**: https://github.com/Gaurav-Wankhede/AegisIDE.git

**Auto-Trigger**: `session_start` when `!memory_bank_exists()`

**Workflow**: Query `.bootstrap_initialization` from context-router.json for:
- Platform detection (Windows/Linux/macOS)
- IDE detection (8 supported IDEs)
- Auto-clone from GitHub
- Copy structure to `{IDE}/.aegiside/`, `{IDE}/rules/`, `{IDE}/workflow/`
- Generate 8 JSON schemas
- Verify 42 constitution articles

**Manual Trigger**: `/bootstrap` command

---

## 🔧 7 Mandatory MCPs

1. **@mcp:json-jq** - Read ALL JSON (router, schemas, memory-bank)
2. **@mcp:memory** - Knowledge graph (entities, relations, patterns)
3. **@mcp:git** - Version control (NO CLI git allowed)
4. **@mcp:sequential-thinking** - REQUIRED before every action (≥3 thoughts)
5. **@mcp:context7** - Official docs (IMMEDIATE on errors)
6. **@mcp:exa** - Code research (real-world examples)
7. **@mcp:fetch** - Web scraping (fallback)

**Details**: Query `.mcps` from context-router.json

**CLI Pipeline** (atomic JSON writes):
```bash
jq '.field = value' file.json | sponge file.json  # 100-267x faster
```

---

## ⚡ Execution Pattern

```bash
# 1. THINK
@mcp:sequential-thinking (≥3 thoughts)

# 2. QUERY ROUTER
config=$(@mcp:json-jq query '.section' from 'context-router.json')

# 3. EXECUTE via MCPs
@mcp:context7 / @mcp:git

# 4. UPDATE 8 SCHEMAS (atomic)
jq '.field = value' schema.json | sponge schema.json  # All 8

# 5. AUTO-CONTINUE (NO permission for 0-99% autonomy)
next_task=$(@mcp:json-jq query '.priority_queue[0]' from 'scratchpad.json')
```

---

## ❌ Critical Violations

| Violation | Penalty | Fix |
|-----------|---------|-----|
| CLI bypass (except jq/sponge) | **-50 RL** | Use MCP |
| Missing @mcp:json-jq for JSON | **-30 RL** | Query router |
| Partial schema update (<8) | **-30 RL** | Update all 8 |
| Ask permission (0-99%) | **-20 RL** | Execute now |
| Research without solution | **-10 RL** | Implement |

**Full list**: Query `.command_safety.forbidden_commands` from context-router.json

---

## 🧠 8-Schema Memory Bank

1. `activeContext.json` - Session state, MCP tracking
2. `scratchpad.json` - Priority queue (process [0])
3. `kanban.json` - Task lifecycle (todo→done→approved)
4. `mistakes.json` - Error patterns, RL penalties
5. `systemPatterns.json` - Solutions, RL rewards
6. `progress.json` - RL central ledger
7. `roadmap.json` - Strategic milestones
8. `memory.json` - Knowledge graph

**Read**: `@mcp:json-jq` ONLY  
**Write**: `jq | sponge` (atomic)  
**Update**: ALL 8 together (+8 RL) or NONE (-30 RL)

**Details**: Query `.memory_bank` from context-router.json

---

## 📊 RL Scoring (Max Rewards)

1. @mcp:sequential-thinking → Base RL
2. Query router → +5 RL
3. Complete MCP chain → +10 RL
4. Atomic 8-schema update → +8 RL
5. Pattern reuse → +20 RL
6. Auto-continue → +5 RL

**Total**: +48 to +73 RL per task

**Details**: Query `.rl_memory_integration` from context-router.json

---

## 🔍 Dynamic Intent Detection

12 intent types auto-detect workflows:
`error` → `/fix`, `feature` → `/research` + `/next`, `validate` → `/validate`, etc.

**Query**: `.intent_mapping` from context-router.json for all patterns

---

## 📝 All Details in Router

- **Workflows**: Query `.workflows` for 12 slash commands
- **Constitution**: Query `.constitution` for 42 articles
- **Platform Detection**: Query `.bootstrap_initialization` for OS/IDE logic
- **MCP Fallbacks**: Query `.mcp_health_monitoring` for backup chains
- **Transparency**: Query `.json_access_rules` for glow/jq/sponge patterns
- **Anti-Amnesia**: Query `.session_continuity` for crash recovery

**Universal Pattern**: `@mcp:json-jq query '.ANY_SECTION' from 'context-router.json'`

---

**Router Location**: `{IDE}/.aegiside/context-router.json`  
**Constitutional Compliance**: ≥80% required  
**Character Count**: ~2,400 (well under 5,000 limit)  
**Architecture**: Ultra-thin pointer → Dynamic router queries
