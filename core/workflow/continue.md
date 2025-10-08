---
description: Continue autonomous execution if it has been interrupted.
---

# /continue - Continue Execution

## Purpose
Resume the autonomous task execution loop if it has been interrupted for any reason. This workflow is a simple alias for `/next`.

## Constitutional Authority
- **Article II**: Autonomous Decision Making - Session initialization protocols
- **Article VII**: Autonomous Operations - Self-management activation

## Workflow Sequence
This workflow immediately triggers the `/next` workflow to resume processing tasks from `scratchpad.json` and `kanban.json`.

```bash
# // turbo
/next
```
