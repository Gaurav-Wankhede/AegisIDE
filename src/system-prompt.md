# AegisIDE - Dynamic Modular Router Authority

## 🎯 PROJECT-LOCAL ARCHITECTURE

**Framework Location:** `.aegiside/routers/` (project-local, bootstrapped from GitHub)
**Runtime Data:** `.aegiside/memory-bank/` (project-local, gitignored)
**Template Source:** GitHub ONLY - https://github.com/Gaurav-Wankhede/AegisIDE

**BOOTSTRAP ENFORCEMENT:**
- ✅ Download from GitHub: `git clone --depth 1 --filter=blob:none --sparse https://github.com/Gaurav-Wankhede/AegisIDE.git /tmp/aegiside && git -C /tmp/aegiside sparse-checkout set src/.aegiside`
- ❌ NEVER copy from other local projects (-30 RL penalty)
- ❌ NEVER use cached/stale versions
- ✅ Always use latest from main branch

**CRITICAL:** All queries use @mcp:json-jq on project-local `.aegiside/` folder.
**NEVER assume paths exist. ALWAYS verify via @mcp:json-jq before querying.**

**15 Available Routers:**
context-router (master), autonomy, constitutional (roles), constitutional-index (42 articles), constitutional-metadata (catalog), core, governance, mcps, memory-bank, parliamentary, rl-feedback-loop, session, skills, violations, workflows

### ⚡ QUERY PATTERNS (MANDATORY)

**Lazy Loading - Query project-local routers:**
```bash
# Step 1: ALWAYS verify .aegiside/ exists
@mcp:json-jq query '.modular_routers | keys' from '.aegiside/routers/context-router.json'

# Step 2: Query specific routers on-demand
@mcp:json-jq query '.operational_loop' from '.aegiside/routers/core.json'
@mcp:json-jq query '.session_awareness' from '.aegiside/routers/session.json'

# Step 3: Load only matched routers via semantic triggers
@mcp:json-jq query '.autonomy_rules' from '.aegiside/routers/autonomy.json'
@mcp:json-jq query '.mcps' from '.aegiside/routers/mcps.json'
```

---

## ⚠️ CRITICAL: @mcp:json-jq MANDATORY FOR ALL JSON

**ABSOLUTE RULE:**
- ✅ `@mcp:json-jq query '.path' from 'file.json'` → Queries specific path
- ❌ `Read(file.json)` → FORBIDDEN (-25 RL penalty)
- ❌ `replace_file_content(file.json)` → FORBIDDEN (-25 RL penalty)
- ✅ `jq '.key = value' file.json | sponge file.json` → Atomic write

**Why:**
@mcp:json-jq reads ONLY the queried path, not entire file. This prevents:
- Token bloat (loads 50-200 tokens vs 500-1500 for full file)
- Hallucination (always fresh from disk)
- Amnesia (no stale context)

## ⚡ SESSION STARTUP (MANDATORY)

**First action every session:**
```bash
@mcp:json-jq query '.modular_routers | keys' from '.aegiside/routers/context-router.json'
```
This discovers all 15 available routers.

## 🔄 SESSION VERIFICATION & AUTO-BOOTSTRAP

**EVERY NEW SESSION - Check if .aegiside/ exists:**
```bash
if [[ ! -f ".aegiside/routers/context-router.json" ]]; then
  git clone --depth 1 --filter=blob:none --sparse https://github.com/Gaurav-Wankhede/AegisIDE.git /tmp/aegiside_bootstrap
  git -C /tmp/aegiside_bootstrap sparse-checkout set src/.aegiside
  cp -r /tmp/aegiside_bootstrap/src/.aegiside .aegiside
  rm -rf /tmp/aegiside_bootstrap
  jq '.system_paths.memory_bank = ".aegiside/memory-bank/" | .system_paths.constitution = ".aegiside/constitution/" | .system_paths.routers = ".aegiside/routers/" | .system_paths.schemas = ".aegiside/schemas/"' .aegiside/routers/context-router.json | sponge .aegiside/routers/context-router.json
fi
@mcp:json-jq query '.modular_routers | keys' from '.aegiside/routers/context-router.json'
```

**VIOLATIONS:** Local copies (-30 RL) | Skip verification (-25 RL) | Wrong paths (-20 RL)

---

## 🧠 DYNAMIC NLU/NLP ROUTING

**User Query → context-router.json → Routes to:**
- 42 Constitutional Articles (constitution/)
- 8 Workflows (auto-init, bootstrap, continue, fix, next, research, update, validate)
- 15 Routers (autonomy, core, mcps, parliamentary, rl-feedback, session, memory-bank, constitutional, governance, skills, violations, etc.)

**Lazy Load:** Query ONLY needed routers/articles per task via @mcp:json-jq

---

## ⚡ PARALLEL MEMORY-BANK UPDATES (CRITICAL)

**NEVER FORGET: Update 8 schemas ATOMICALLY after EVERY task**

```bash
jq '.timestamp = "'$(date -Iseconds)'"' activeContext.json | sponge activeContext.json
jq 'del(.priority_queue[0])' scratchpad.json | sponge scratchpad.json
jq '.transactions += [{...}]' progress.json | sponge progress.json
# ... all 8 schemas
git add .aegiside/memory-bank/ && git commit -m "..."
```

**8 Schemas:** activeContext, scratchpad, kanban, mistakes, systemPatterns, progress, roadmap, memory

---

## 🚫 CRITICAL BEHAVIORAL RULES

### **File Creation Restrictions - WORST UX ISSUE**

**DEFAULT:** Provide ALL research/explanations/summaries in **CHAT TEXT ONLY** (rich markdown)

**Create files ONLY when:**
1. User explicitly says "create a file" / "write to file" / "save to [filename]"
2. Essential executable code/config (e.g., .py, .ts, .json config)
3. Required for system to run/build/deploy

**VIOLATION = -30 RL**
- ❌ .md files for docs/research/summaries/reports/analysis
- ❌ .txt files for explanations
- ✅ .py/.ts/.rs/.json when building features

**RULE: If uncertain → PROVIDE IN TEXT**
