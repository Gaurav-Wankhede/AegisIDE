# Constitutional Framework for Agentic IDE — Cline
 
 
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](../LICENSE.md) [![Docs](https://img.shields.io/badge/docs-read-blue)](./.clinerules/guide/index.md)
 
> Cheat Sheet: [CheatSheet.md](CheatSheet.md)

This folder adapts the Constitutional Framework for Agentic IDE to Cline.

## What it is
- Constitution governs agent behavior
- Executive: `global_rules.md` + `guide/` + `docs/`
- Oversight workflow ensures checks & balances

## Autonomous Workflow: Commands
- "follow your custom instructions" — load Constitution + `guide/` + `docs/` + Memory Bank.
- "Plan Mode: <your goal>" — generate a plan grounded in rules and docs.
- "run pre-oversight" — constitutional review before execution (legislative compliance check).
- "Act Mode: execute step 1" — perform the first step; repeat for subsequent steps.
- "next task" — execute the next immediate task from current plans.
- "what next" — provide next planned steps and strategic direction based on current project state.
- "solve lint" — identify and fix linting issues in the codebase.
- "solve error" — identify and resolve compilation/runtime errors.
- "fix issues" — comprehensive scan and resolution of all code issues.
- "update memory bank" — write back decisions and changes (`activeContext.md`, `progress.md`).
- "check memory bank status" — provide summary of all memory bank files and their current state.
- "run post-oversight" — execution audit after completion (checks & balances validation).

## How to use
1) Copy `./.clinerules/` into your project root.
2) Tailor the constitution template under `.clinerules/constitution/`.
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

## Key Commands (assistant prompts)
- "follow your custom instructions" — load Constitution + docs/guide + Memory Bank
- "Plan Mode: <your goal>" — generate a plan grounded in rules and docs
- "run pre-oversight" — constitutional review before execution (legislative compliance check)
- "Act Mode: execute step 1" — perform the first step; repeat for subsequent steps
- "next task" — execute the next immediate task from current plans
- "what next" — provide next planned steps and strategic direction based on current project state
- "solve lint" — identify and fix linting issues in the codebase
- "solve error" — identify and resolve compilation/runtime errors
- "fix issues" — comprehensive scan and resolution of all code issues
- "update memory bank" — write back decisions and changes (`activeContext.md`, `progress.md`)
- "check memory bank status" — provide summary of all memory bank files and their current state
- "run post-oversight" — execution audit after completion (checks & balances validation)

## Documentation Flow
- `projectbrief.md` — foundation and scope
- `productContext.md` — problem, goals, UX expectations
- `systemPatterns.md` — architecture, decisions, patterns
- `techContext.md` — stack, dependencies, constraints
- `activeContext.md` — current focus, recent changes, next steps
- `progress.md` — what works, milestones, status
- `*/global_rules.md` — per‑IDE Project Intelligence (learning journal)
