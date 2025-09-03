# Constitutional Framework for Agentic IDE — Windsurf
 
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](../LICENSE.md) [![Docs](https://img.shields.io/badge/docs-read-blue)](./.windsurf/guide/index.md)
 
This folder adapts the Constitutional Framework for Agentic IDE to Windsurf.

## What it is
- Constitution: `.windsurf/rules/rules.xml` defines immutable rules and MCP usage.
- Executive: `global_rules.md` + `guide/` + `docs/` drive context and decisions.
- Oversight: `workflows/oversight-checks-and-balances.md` enforces checks.

## How it works
- Always read the Constitution + `guide/` + `docs/` before any task.
- Use MCP tools per rules: context7 for docs, fetch for live info, filesystem/git/memory for code & state.
- Update Memory Bank artifacts after execution.

## Autonomous Workflow: Commands
- "follow your custom instructions" — load Constitution + `guide/` + `docs/` + Memory Bank.
- "Plan Mode: <your goal>" — generate a plan grounded in rules and docs.
- "run oversight checks-and-balances" — pre-exec constitutional review.
- "Act Mode: execute step 1" — perform the first step; repeat for subsequent steps.
- "update memory bank" — write back decisions and changes (`activeContext.md`, `progress.md`).
- "run oversight checks-and-balances" — post-exec audit to minimize hallucinations.

## How to use
1) Copy `./.windsurf/` into your project root.
2) Review and tailor `rules/rules.xml`.
3) Add official links under `guide/index.md` and project info under `docs/`.
4) Run the Oversight workflow during Pre/During/Post execution.
