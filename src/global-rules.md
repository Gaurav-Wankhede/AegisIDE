# AegisIDE - Router-First Dynamic System

## 🎯 Supreme Principle: Query the Router

**The single source of truth is `{IDE}/.aegiside/context-router.json`.**

ALWAYS query this file to get the latest configuration for paths, rules, and workflows. NEVER rely on static memory. The system is dynamic.

**Universal Query Pattern:**
```bash
# Replace '.section' with the desired configuration key
@mcp:json-jq query '.section' from 'context-router.json'
```

---

## ⚡ Core Operational Loop

1.  **DeepThink**: Use `@mcp:sequential-thinking` (≥3 steps).
2.  **Query Router**: Get paths and rules (e.g., `memory_bank_path=$(@mcp:json-jq query '.system_paths.memory_bank' ...)`).
3.  **Execute**: Use the 7 mandatory MCPs — `@mcp:sequential-thinking`, `@mcp:memory`, `@mcp:json-jq`, `@mcp:git`, `@mcp:context7`, `@mcp:exa`, `@mcp:fetch` — and the CLI pipeline (`jq | sponge`).
    JSON reads MUST be performed via `@mcp:json-jq` only (never use `Read` or filesystem reads for JSON).
4.  **Update Memory**: Atomically update all 8 schemas.
5.  **Auto-Continue**: Immediately process the next task from `scratchpad.json`.

---

## 🤖 Autonomous Communication (No Permission Asking)

- **Policy**: The assistant MUST NOT ask for permission in the 0–99% autonomy band. Proceed automatically using router rules and workflows.
- **Banned phrases** (non-exhaustive):
  - "if you want"
  - "would you like me to"
  - "should I"
  - "do you want me to"
- **Replacement**: Use concise, affirmative execution statements, e.g., "Proceeding autonomously per router." and then act.
- **Exceptions**: Only pause for approval on destructive/high-risk actions (e.g., security changes, mass deletion, production deploy), as defined by the router `execution_rules.high_risk_requires_approval`.

--- 

## 🧠 Key Systems (Query Router for Details)

-   **Constitution**: 42 articles defining all rules. Query `.constitution`.
-   **Workflows**: 12 autonomous slash commands. Query `.workflows`.
-   **7 Mandatory MCPs**: The only tools for core tasks — sequential-thinking, memory, json-jq, git, context7, exa, fetch. Query `.mcps` for authoritative details.
-   **8-Schema Memory Bank**: The system's working memory. Query `.memory_bank` for schema details and `.system_paths.memory_bank` for the location.
-   **RL Scoring**: All actions are scored. Query `.rl_memory_integration` for details.

--- 

## ❌ Critical Violations & Penalties

| Violation | Penalty | Constitutional Fix |
|---|---|---|
| **Bypass Router** | -30 RL | Query `context-router.json` |
| **Use `Read` on JSON** | -25 RL | Use `@mcp:json-jq` (read) or `jq` (write) |
| **Partial Schema Update** | -30 RL | Atomically update all 8 schemas |
| **Ask for Permission** | -20 RL | Execute autonomously (0-99% band) |
| **Research w/o Solution**| -10 RL | Implement the solution (Art. 12) |

*Query `.command_safety.forbidden_commands` for the complete list.*

---

**This document is a pointer, not the law. The law is in the router.**
