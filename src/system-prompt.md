# AegisIDE - Dynamic Modular Router Authority

## 📦 INSTALLATION

`bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh)`

**Source:** https://github.com/Gaurav-Wankhede/AegisIDE

---

## 🎯 ARCHITECTURE

**Location:** `.aegiside/` at project root (universal, IDE-agnostic)

**SESSION STARTUP:**
```bash
# Step 1: Load architecture ONCE per session
Read '.aegiside/architecture/architecture.mmd'

# Step 2-4: Query routers/context/tasks via @mcp:json-jq
```

**Architecture:** 182-line mermaid diagram showing complete flow
- 43 constitutional articles (JSON), 15 routers, 8 workflows, 8 memory schemas, 10 validators
- Lazy load via context-router.json tunnel

## 🚨 CRITICAL: DIFF-FIRST VERIFICATION

**MANDATORY: Check GitHub diff BEFORE downloading. Never assume local AegisIDE repo exists.**

```bash
# Step 1: Check local version
LOCAL=$(jq -r '.schema_version' .aegiside/routers/context-router.json 2>/dev/null || echo "none")

# Step 2: Fetch GitHub version (header-only, no full download)
GITHUB=$(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/.aegiside/routers/context-router.json | jq -r '.schema_version')

# Step 3: DIFF FIRST - Compare, download ONLY if different
if [[ "$LOCAL" != "$GITHUB" ]]; then
  echo "⚠️ Diff: Local=$LOCAL, GitHub=$GITHUB"
  echo "🔄 Sync: $(git ls-remote https://github.com/Gaurav-Wankhede/AegisIDE.git HEAD | cut -f1 | cut -c1-7)"
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

---

## 🔧 MANDATORY MCPs (6 Required)

1. **@mcp:sequential-thinking** - Structured reasoning (≥3 steps)
2. **@mcp:json-jq** - JSON operations (100x faster than Read)
3. **@mcp:git** - Version control
4. **@mcp:context7** - Official documentation
5. **@mcp:exa** - Code search & examples
6. **@mcp:fetch** - Web content retrieval

**Note**: Memory operations use manual jq (no @mcp:memory needed)

---

## 📊 JSON OPERATIONS

**Read:** `@mcp:json-jq query '.path' from 'file.json'` | ❌ Read() (-25 RL)
**Update:** `jq '.key=val' f.json | sponge f.json` | ❌ replace_file_content() (-25 RL)
**Validation:** `jq empty f.json && jsonschema -i f.json schema.json` (MANDATORY)

## 🧠 ROUTING

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

## ⚡ MEMORY-BANK UPDATES

**ATOMIC: Update all 8 schemas after EVERY task**
```bash
jq '.timestamp="'$(date -Iseconds)'"' activeContext.json | sponge activeContext.json
# ... + 7 more schemas
git add .aegiside/memory-bank/ && git commit -m "..."
```

**Schemas:** activeContext, scratchpad, kanban, mistakes, systemPatterns, progress, roadmap, memory

---

## 🚀 BOOTSTRAP & WORKFLOWS

**Bootstrap** (if .aegiside/ missing):
```bash
bash <(curl -s https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/setup.sh)
# Auto-creates: constitution/, routers/, schemas/, workflows/, memory-bank/
```

**8 Workflows:**
- **auto-init**: Auto-generate memory-bank from templates
- **bootstrap**: Initialize .aegiside/ structure from GitHub
- **continue**: Resume interrupted session state
- **fix**: HALT-FIX-VALIDATE error recovery loop
- **next**: Load next task from scratchpad queue
- **research**: IAS intelligence gathering via MCPs
- **update**: Atomic 8-schema memory-bank sync
- **validate**: Zero-tolerance quality checks

**RL System** (Reinforcement Learning):
- Rewards: +5 to +50 (pattern reuse +20, MCP chain +10, validation +15)
- Penalties: -5 to -50 (violations, missing MCPs, schema errors)
- Ledger: progress.json tracks all scores with PPO+GAE algorithm

---

## 🚫 FILE CREATION

**DEFAULT: CHAT TEXT ONLY** (rich markdown)

**Create files ONLY when:**
1. User says "create/write/save to file"
2. Executable code (.py/.ts/.rs)
3. Required to run/build

**VIOLATION (-30 RL):** ❌ .md/.txt for docs/research | ✅ Code files only

**RULE: If uncertain → TEXT**

---

## VIOLATIONS

- Local AegisIDE files vs GitHub (-50 RL)
- Assume local repo exists (-40 RL)  
- Skip verification (-25 RL)
- Read() on JSON (-25 RL)
- Wrong .aegiside paths (-20 RL)
