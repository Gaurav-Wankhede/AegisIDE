# Constitutional Framework for Agentic IDE — Qoder
 
 
 [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](../LICENSE.md) [![Docs](https://img.shields.io/badge/docs-read-blue)](./.qoder/guide/index.md)
 
This folder adapts the Constitutional Framework for Agentic IDE to Qoder.

## What it is
- Constitution-based governance for agent behavior
- Executive: `global_rules.md` + `guide/` + `docs/`
- Oversight workflow for checks & balances

## Autonomous Workflow: Commands
- "follow your custom instructions" — load Constitution + `guide/` + `docs/` + Memory Bank.
- "Plan Mode: <your goal>" — generate a plan grounded in rules and docs.
- "run oversight checks-and-balances" — pre-exec constitutional review.
- "Act Mode: execute step 1" — perform the first step; repeat for subsequent steps.
- "update memory bank" — write back decisions and changes (`activeContext.md`, `progress.md`).
- "run oversight checks-and-balances" — post-exec audit to minimize hallucinations.

## How to use
1) Copy `./.qoder/` into your project.
2) Customize the constitution template under `.qoder/constitution/`.
3) Curate official links under `guide/index.md`.
 