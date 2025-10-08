---
description: Check for and create any missing memory bank files to ensure integrity.
---

# /bootstrap – Memory Bank Integrity Check

## Purpose
Executed by the **Administrative Service (IAS)**, this workflow ensures all **8 constitutionally mandated memory-bank schemas** exist in `.windsurf/memory-bank/`, guaranteeing the integrity of the digital Republic's context.

## Constitutional Authority
- **Article I**: Mandates the IAS (Cabinet Secretary) to maintain schema health.
- **Article III & III-A**: Define the 8-schema memory-bank structure and its implementation.
- **Article XI**: Enforces agent compliance with the constitutional framework.

## MCP Roles
- `@mcp:context7` – Confirm schema contracts and constitutional mandates.
- `@mcp:filesystem` – List, create, and validate JSON files atomically.
- `@mcp:git` – Stage and commit repairs for auditability.
- `@mcp:memory` – Persist integrity events in the knowledge graph.
- `@mcp:sequential-thinking` – Compare the required list vs. on-disk state and plan remediation.
- `@mcp:time` – Timestamp scan, repair, and verification phases.
- `@mcp:math` – Count files and compute completion percentage.

## Workflow Sequence

### 1. Scan Memory Bank Directory
```bash
# // turbo
@mcp:filesystem → List .windsurf/memory-bank/
@mcp:time → Log scan timestamp
```

### 2. Identify Missing Schemas
```bash
# // turbo
@mcp:sequential-thinking → Compare contents with the 8 required schemas:
# activeContext.json, scratchpad.json, kanban.json, mistakes.json, systemPatterns.json, progress.json, roadmap.json, memory.json
@mcp:math → Report counts and missing names
```

### 3. Create Missing Files
```bash
# // turbo
FOR each missing_file DO
  @mcp:context7 → Verify schema contract for missing_file
  @mcp:filesystem → Write minimal valid payload {}
  @mcp:git → Stage change "bootstrap: create missing_file"
  @mcp:time → Record creation timestamp
  @mcp:memory → Store bootstrap event metadata
DONE
```

### 4. Final Verification
```bash
# // turbo
@mcp:filesystem → List .ide/memory-bank/ post-repair
@mcp:math → Compute % completeness
@mcp:sequential-thinking → Plan follow-up if gaps remain
@mcp:git → Commit "bootstrap: ensure memory bank schemas present"
@mcp:time → Timestamp completion and schedule next check
@mcp:memory → Persist verification outcome
→ Report completion status
```
