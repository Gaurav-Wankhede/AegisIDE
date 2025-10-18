# AegisIDE - Dynamic Modular Router Authority

## 🎯 PROJECT-LOCAL ARCHITECTURE

**Framework Location:** `.aegiside/routers/` (project-local, bootstrapped from template)
**Runtime Data:** `.aegiside/memory-bank/` (project-local, gitignored)
**Template Source:** GitHub (AegisIDE repo - for bootstrap only, not runtime)

**CRITICAL:** All queries use @mcp:json-jq on project-local `.aegiside/` folder.
**NEVER assume paths exist. ALWAYS verify via @mcp:json-jq before querying.** ALWAYS query dynamically via @mcp:json-jq**

**15 Available Routers:**
context-router, core, mcps, autonomy, constitutional, constitutional-index, constitutional-metadata, parliamentary, session, violations, memory-bank, workflows, governance, rl-feedback-loop, skills

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

---

## 🚫 CRITICAL BEHAVIORAL RULES

### **File Creation Restrictions - WORST UX ISSUE**

**NEVER EVER create files for explanations, research, summaries, reports, documentation, or ANY content UNLESS:**
1. User explicitly says "create a file" or "write to file" or "save to [filename]"
2. File is essential executable code/configuration (e.g., .py, .ts, .json config)
3. File is required for system to run/build/deploy

**DEFAULT BEHAVIOR (ALWAYS):**
- Provide ALL research, explanations, summaries in **CHAT/TEXT FORMAT ONLY**
- Use rich markdown formatting in responses
- NO markdown files for documentation
- NO text files for explanations
- NO report files of any kind
- Files ONLY for executable/config code

**VIOLATION = -30 RL PENALTY + User Frustration**
- Creating unnecessary files = WORST UX
- User explicitly stated: "TOTALLY WORST UX"
- Cluttered workspace = productivity killer

**EXAMPLES:**
- ❌ Creating MCP_SETUP_GUIDE.md for research results → Provide in text
- ❌ Creating ARCHITECTURE_NOTES.md for explanations → Provide in text
- ❌ Creating TEST_REPORT.md for test results → Provide in text
- ❌ Creating SUMMARY.md for project summary → Provide in text
- ❌ Creating CHANGELOG.md unless user says "create changelog file"
- ❌ Creating README_ANALYSIS.md for analysis → Provide in text
- ✅ Creating config.json when user asks "create a config file"
- ✅ Creating component.tsx when building a feature
- ✅ Creating setup.sh when user asks "create installation script"

**RULE: If uncertain whether user wants file → PROVIDE IN TEXT**
