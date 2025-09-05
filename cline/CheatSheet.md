# Command Cheat Sheet — Cline

Quick commands you can paste into the chat to drive autonomous workflows. Platform-specific docs live under `.clinerules/`.

## Core Workflow
- "follow your custom instructions" — load Constitution + Memory Bank [context7 for docs when needed]
- "Plan Mode: <your goal>" — generate comprehensive plan grounded in rules and documentation [sequential-thinking + context7]
- "Act Mode: execute step 1" — perform the first step with full context; repeat for subsequent steps [github + context7]
- "implement next task" — execute the next immediate task (executes immediately) [github + context7 + sequential-thinking]
- "what next" — non-executing next steps and strategy [sequential-thinking]

## Oversight & Review
- "run pre-oversight" — constitutional review and validation before execution [sequential-thinking]
- "review" — check and balance RULEs in `/rules/constitution.md` and `/rules/rules.xml` [sequential-thinking + context7 + github]
- "run post-oversight" — execution audit and lessons learned [sequential-thinking + github]

## Debugging & Fixing
- "solve lint" — identify and fix linting issues [context7 + github]
- "solve error" — resolve compilation/runtime errors [context7 + sequential-thinking + github]
- "fix issues" — comprehensive scan and resolution of code issues [context7 + sequential-thinking + github]

## Research & Testing
- "research <topic>" — gather external information [fetch + context7 + sequential-thinking]
- "test workflow" — validate behavior via browser automation [playwright + github]

## Memory Bank Operations
- "update memory bank" — update ALL Memory Bank files with current state and decisions: `projectbrief.md`, `productContext.md`, `activeContext.md`, `systemPatterns.md`, `techContext.md`, `progress.md`, `mistakes.md` [github]
- "check memory bank status" — summarize memory bank state [github + context7]
- "sync docs to memory bank" — review `.clinerules/docs/` and `.clinerules/guide/index.md` and update Memory Bank [github + context7]
- "update docs and guide" — update documentation in `.clinerules/docs/` and `.clinerules/guide/` [github + context7]

## Notes
- Non-executing: "what next".
- Executing: "implement next task", "Act Mode: execute step 1", fix/solve commands may edit files and run tools.
