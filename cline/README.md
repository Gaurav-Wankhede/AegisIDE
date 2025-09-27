# AegisIDE — Cline Constitutional Framework
 
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](../LICENSE.md) [![Docs](https://img.shields.io/badge/docs-read-blue)](./.clinerules/guide/index.md)
 
> Cheat Sheet: [CheatSheet.md](CheatSheet.md)
> Project Intelligence: [global_rules.md](global_rules.md)

This folder adapts the Constitutional Framework for Agentic IDE to Cline with **democratic parliamentary governance** and **96% autonomous capability**.

## What it is
- Constitution governs agent behavior
- Executive: `global_rules.md` + `guide/` + `docs/`
- Oversight workflow ensures checks & balances
## Autonomous Workflow: Commands

| Command | What it does |
|---|---|
| "follow your custom instructions" | Load Constitution + `guide/` + `docs/` + Memory Bank |
| "Plan Mode: <your goal>" | Generate a plan grounded in rules and docs |
| "run pre-oversight" | Constitutional review before execution (legislative compliance check) |
| "Act Mode: execute step 1" | Perform the first step; repeat for subsequent steps |
| "next task" | Execute the next immediate task from current plans |
| "what next" | Provide next planned steps and strategic direction based on current project state |
| "solve lint" | Identify and fix linting issues in the codebase |
| "solve error" | Identify and resolve compilation/runtime errors |
| "fix issues" | Comprehensive scan and resolution of all code issues |
| "update memory bank" | Write back decisions and changes (`activeContext.md`, `progress.md`) |
| "check memory bank status" | Provide summary of all memory bank files and their current state |
| "run post-oversight" | Execution audit after completion (checks & balances validation) |

## How to use
1) Copy `./.clinerules/` into your project root.
2) Review and tailor `rules/constitution.md`.
3) Curate official links under `guide/index.md`.

## Citations and Context7
- Use official sources and include URLs in `guide/index.md`.
- For Context7, prefer library IDs when available (e.g., `/vercel/next.js`).

## Best Practices
- Use Plan Mode for strategy; Act Mode for implementation
- Always read Constitution + `guide/` + `docs/` + Memory Bank before acting
- Parallelize reads/search only; never parallelize writes
- Keep `activeContext.md` and `progress.md` up to date
- Cite official sources in `guide/index.md` for Context7/fetch
- Use the Oversight workflow for pre/during/post execution checks

## Tips: Using CheatSheet + Project Intelligence
- CheatSheet.md: Quick, copy-paste commands to drive Plan/Act/Oversight. Use during day‑to‑day execution.
- global_rules.md: Governance and context. Read to understand rules, Memory Bank flow, and Cline‑specific paths.
- Suggested flow: Open CheatSheet → "follow your custom instructions" → "Plan Mode" → execute → update Memory Bank per global_rules.md.

## Documentation Flow
- `projectbrief.md` — foundation and scope
- `productContext.md` — problem, goals, UX expectations
- `systemPatterns.md` — architecture, decisions, patterns
- `techContext.md` — stack, dependencies, constraints
- `activeContext.md` — current focus, recent changes, next steps
- `progress.md` — what works, milestones, status
- `*/global_rules.md` — per‑IDE Project Intelligence (learning journal)
