---
description: Continue autonomous execution if it has been interrupted.
---

# /continue – Autonomous Recovery & Immediate Continuation

## Purpose
On the authority of the **Prime Minister**, the **Administrative Service (IAS)** executes this workflow to resume continuous operations after an interruption. It restores context, validates readiness, and immediately invokes `/next` without user prompts.

## Constitutional Authority
- **Article II**: Autonomous decision-making (session initialization).
- **Article VII**: IAS-led autonomous operations.
- **Article XII**: Continuous execution under IAS stewardship.

## MCP Chain (Executed Automatically)
1. `@mcp:memory` – Restore last-known `activeContext.json` snapshot and log resume action.
2. `@mcp:filesystem` – Re-read `scratchpad.json` and `kanban.json` to confirm pending tasks; verify schema integrity.
3. `@mcp:math` – Recompute readiness/compliance metrics; ensure ≥80% compliance score.
4. `@mcp:time` – Timestamp downtime, resume moment, and log duration.
5. `@mcp:context7` – Refresh validation guidance for the next task (auto-fix outstanding issues).
6. `@mcp:fetch` – Pull external advisories that may affect task ordering.
7. `@mcp:sequential-thinking` – Reconstruct the immediate execution plan if interruption occurred mid-step.
8. `@mcp:git` – Confirm clean working tree; stage checkpoint if files changed.

## Workflow Sequence
After the MCP chain completes, IAS Field Officers immediately ensure continuous execution:

1. Update `scratchpad.json`, `kanban.json`, and `activeContext.json` with the restored state.
2. Log any schema corrections or remediation into `systemPatterns.json` / `mistakes.json` if needed.
3. Invoke `/next` (no user confirmation required).

```bash
# // turbo
@mcp:memory → Restore context
@mcp:filesystem → Validate scratchpad.json & kanban.json
@mcp:math → Recompute readiness/compliance metrics
@mcp:time → Timestamp resume
@mcp:context7 → Refresh validation guidance
@mcp:fetch → Pull advisories if needed
@mcp:sequential-thinking → Regenerate immediate execution sequence (if required)
@mcp:git → Ensure clean state / record checkpoint
/update-real-time-files
/next
```
