# AegisIDE - Dynamic Modular Router Authority

## 📦 INSTALLATION

**CURL:** `bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh)`
**Manual:** Copy to IDE global rules, auto-initializes via git diff verification

---

## 🎯 ARCHITECTURE

**Location:** `.aegiside/` (project-local, bootstrapped from GitHub)
**Source:** https://github.com/Gaurav-Wankhede/AegisIDE
**Bootstrap:** `git clone --depth 1 --filter=blob:none --sparse https://github.com/Gaurav-Wankhede/AegisIDE.git /tmp/aegiside && git -C /tmp/aegiside sparse-checkout set src/.aegiside`

**ARCHITECTURE INJECTION (Once Per Session):**
```bash
# Load architecture diagram ONLY at first session startup OR new session after context window reset
Read '.aegiside/architecture/architecture.mmd'
```

**Architecture Diagram:** `.aegiside/architecture/architecture.mmd` - Loaded once for BEST architectural awareness
- Complete user flow: Input → NLU → Context Router → Execution → Memory Bank → Response
- 15 specialized routers grouped by function (Governance, Operations, Learning, Infrastructure)
- All system components: Constitution (42 articles), Workflows (8), Memory Bank (8), Schemas (10), MCPs (6)
- **Reload Triggers:** 
  - First session startup
  - Context window near end (preparing new session)
  - **LLM loses track** - Re-read architecture.mmd to regain system understanding
- **Lazy Load Everything Else:** Context-router.json is the tunnel for on-demand loading

**Query:** @mcp:json-jq only. NEVER Read() or replace_file_content() on JSON.

---

## JSON OPERATIONS

**Read:** `@mcp:json-jq query '.path' from 'file.json'` (50-200 tokens) | ❌ Read(file.json) (-25 RL)
**Update:** `jq '.key = value' file.json | sponge file.json` (atomic) | ❌ replace_file_content() (-25 RL)
**Validation:** MANDATORY before memory-bank updates:
```bash
jq empty file.json && jsonschema -i file.json schema.json && jq '.field = value' file.json | sponge file.json
```
**Violation:** -30 RL + HALT

## SESSION STARTUP

**First Session OR New Session After Context Window Reset:**
```bash
# Step 1: ONCE - Read architecture diagram (BEST Awareness)
Read '.aegiside/architecture/architecture.mmd'

# Step 2: Discover available routers for semantic routing
@mcp:json-jq query '.modular_routers | keys' from '.aegiside/routers/context-router.json'

# Step 3: Load session state
@mcp:json-jq query '.session_context' from '.aegiside/memory-bank/activeContext.json'

# Step 4: Check immediate tasks
@mcp:json-jq query '.priority_queue[0]' from '.aegiside/memory-bank/scratchpad.json'
```

**Subsequent Requests (Same Session):**
```bash
# Skip Step 1 - Architecture already loaded in context
# Use context-router.json as tunnel for lazy loading routers/articles/workflows as needed
```

## VERIFICATION

**4 Scenarios:** Fresh project → Bootstrap | No framework → Bootstrap | Framework exists → Git diff update | Multi-project → Version sync

**Auto-bootstrap:** `bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh) --verify`

**🚨 CRITICAL: NEVER assume local AegisIDE repository exists. ALWAYS use GitHub as source of truth.**

## VERSION TRACKING

**🚨 MANDATORY: GitHub is ONLY source. DIFF-FIRST verification (check before download).**

```bash
# Step 1: Check local version
LOCAL=$(jq -r '.schema_version' .aegiside/routers/context-router.json 2>/dev/null || echo "none")

# Step 2: Fetch GitHub version (header-only, no full download)
GITHUB=$(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/.aegiside/routers/context-router.json | jq -r '.schema_version')

# Step 3: DIFF FIRST - Compare, download ONLY if different
if [[ "$LOCAL" != "$GITHUB" ]]; then
  echo "⚠️ Diff: Local=$LOCAL, GitHub=$GITHUB"
  echo "🔄 Sync: $(git ls-remote https://github.com/Gaurav-Wankhede/AegisIDE.git HEAD | cut -f1 | cut -c1-7))"
  bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh) --verify
else
  echo "✅ Up-to-date ($LOCAL)"
fi
```

**DIFF-FIRST PROTOCOL:**
```bash
# ❌ WRONG: Download first, compare later (wasteful)
curl -o /tmp/f.json URL && diff /tmp/f.json local.json

# ✅ CORRECT: Compare metadata first, download only if needed  
curl -sI URL | grep ETag != cat local.etag && curl -o local.json URL
```

## DYNAMIC NLU/NLP ROUTING
**Post-Verification:**
```bash
@mcp:json-jq query '.modular_routers | keys' from '.aegiside/routers/context-router.json'
```

**VIOLATIONS:** 
- Using local AegisIDE files instead of GitHub (-50 RL) ← **CRITICAL GAP**
- Skip verification (-25 RL) 
- Wrong paths (-20 RL) 
- Overwrite memory-bank (-50 RL)
- Assume local repo exists (-40 RL)

---

## 🧠 ROUTING STRATEGY

**Architecture (Direct Inject):** Complete system overview in `architecture.mmd` - read at session start

**Context-Router (Semantic Routing):** User queries → NLU analysis → context-router.json → Routes to specialized routers

**Lazy Load:** @mcp:json-jq via context-router.json tunnel
- 15 routers: core, mcps, constitutional, parliamentary, session, memory-bank, autonomy, violations, workflows, governance, skills, rl-feedback-loop, constitutional-metadata, constitutional-index
- 43 constitution articles (JSON format)
- 8 workflows: auto-init, bootstrap, continue, fix, next, research, update, validate

**Router Categories:**
- **Governance:** constitutional, parliamentary, governance
- **Operations:** core, session, memory-bank, workflows
- **Learning:** rl-feedback-loop, skills, autonomy
- **Infrastructure:** mcps, violations, constitutional-metadata

**NLU/NLP Query Processing:**
```bash
# User query analyzed for intent/context
# context-router.json maps to appropriate specialized router
# Specialized router loads only needed articles/workflows
# Response with constitutional compliance
```

**Constitution Format:** All 43 articles stored as JSON files (NOT markdown) for:
- ⚡ Fast queries via `jq` and `@mcp:json-jq`
- 📊 Structured data access (definition, powers, implementation, violations)
- 🎯 Direct field extraction without parsing
- 🔄 Atomic updates via `jq` + `sponge`

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
