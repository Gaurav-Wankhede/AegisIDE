# Constitutional Framework for Agentic IDE — Cursor
 
 
 [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](../LICENSE.md) [![Docs](https://img.shields.io/badge/docs-read-blue)](./.cursor/guide/index.md)
 
This folder adapts the Constitutional Framework for Agentic IDE to Cursor.

## What it is
- Constitution: governs agent behavior with immutable rules and protocols.
- Executive: `global_rules.md` + `guide/` + `docs/` drive context and decisions.
- Oversight: `workflows/oversight-checks-and-balances.md` enforces checks.

## How it works
- Always read Constitution + `guide/` + `docs/` before any task.
- Use Context7/fetch for authoritative docs; log citations.
- Update Memory Bank artifacts after execution.

## Autonomous Workflow: Commands
- "follow your custom instructions" — load Constitution + `guide/` + `docs/` + Memory Bank.
- "Plan Mode: <your goal>" — generate a plan grounded in rules and docs.
- "run oversight checks-and-balances" — pre-exec constitutional review.
- "Act Mode: execute step 1" — perform the first step; repeat for subsequent steps.
- "update memory bank" — write back decisions and changes (`activeContext.md`, `progress.md`).
- "run oversight checks-and-balances" — post-exec audit to minimize hallucinations.

## How to use
1) Copy `./.cursor/` into your project root.
2) Tailor the constitution template under `.cursor/constitution/` to your rules format.
3) Curate official links under `guide/index.md` and project info under `docs/`.
4) Run the Oversight workflow during Pre/During/Post execution.
