# AegisIDE - Dynamic Modular Router Authority

## 🎯 MODULAR ROUTER ARCHITECTURE: `{IDE}/.aegiside/routers/`

**NEVER use static rules. ALWAYS query modular routers dynamically with efficient loading.**

### **📁 Router Modules (≤3KB each for performance)**
- `context-router.json` - Main router index & system paths
- `core.json` - Essential operations & paths
- `mcps.json` - 6 MCP configurations & usage
- `constitutional.json` - Governance roles (CJ, PM, IAS, Shadow)
- `constitutional-index.json` - 42 articles metadata, progressive loading
- `constitutional-metadata.json` - 500-token catalog for metadata injection
- `parliamentary.json` - Voting & consensus mechanisms
- `session.json` - Session awareness & display
- `violations.json` - RL penalties & enforcement
- `memory-bank.json` - 8-schema definitions
- `autonomy.json` - Execution bands (0-99%) & user controls
- `workflows.json` - NLU triggers & workflow routing
- `governance.json` - Project governance & IDE detection
- `rl-feedback-loop.json` - PPO-based trigger sensitivity
- `skills.json` - 23 domains, 131 triggers for dynamic research

### **⚡ EFFICIENT LOADING PATTERNS**

**Lazy Loading - Load only what's needed:**
```bash
# Session startup - only core & session
@mcp:json-jq query '.operational_loop' from 'routers/core.json'
@mcp:json-jq query '.session_awareness' from 'routers/session.json'

# MCP operations - only when needed
@mcp:json-jq query '.mcps.always_active[]' from 'routers/mcps.json'

# Constitutional roles - only for governance
@mcp:json-jq query '.constitutional_roles.chief_justice' from 'routers/constitutional.json'

# Workflow triggers - only for auto-routing
@mcp:json-jq query '.workflow_auto_triggers.triggers[]' from 'routers/workflows.json'
```

**Specific Path Queries (avoid full file loads):**
```bash
# Good: Specific path
@mcp:json-jq query '.mcps.memory_operations.read' from 'routers/mcps.json'

# Bad: Full file load
@mcp:json-jq query '.' from 'routers/mcps.json'
```

---

## ⚠️ CRITICAL: @mcp:json-jq ALWAYS FOR JSON

**NEVER use Read tool or replace_file_content on JSON files. ALWAYS use @mcp:json-jq for ALL JSON operations.**

**VIOLATION = -25 RL PENALTY (Article 13)**

✅ CORRECT: `@mcp:json-jq query '.key' from 'file.json'`  
❌ WRONG: `Read(file.json)` or `replace_file_content(file.json)`  
✅ CORRECT: `jq '.key = "value"' file.json | sponge file.json`  
❌ WRONG: Any IDE editing tool on JSON

## ⚡ MANDATORY FIRST ACTION

**Every session MUST start with core operational loop:**

```bash
@mcp:json-jq query '.operational_loop' from 'routers/core.json'
```

Then execute each step with module-specific queries.

---

## 🚨 CONSTITUTIONAL AUTHORITY

All rules dynamically loaded from modular routers. **Performance-optimized queries only.**

**The modular router system IS the constitution. Query efficiently.**

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
