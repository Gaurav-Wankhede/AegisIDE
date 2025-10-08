---
description: Check for and create any missing memory bank files to ensure integrity.
---

# /bootstrap - Memory Bank Integrity Check

## Purpose
Ensure the 8 core schema files exist in the `.ide/memory-bank/` directory. If any are missing, create them with minimal valid JSON structures to prevent system errors.

## Constitutional Authority
- **Article III**: Context-Engineered Development Workflow
- **Article XI**: Mandatory AI Agent Compliance

## Workflow Sequence

### 1. Scan Memory Bank Directory
```bash
# // turbo
@mcp:filesystem → List files in .ide/memory-bank/
```

### 2. Identify Missing Schemas
```bash
# // turbo
@mcp:sequential-thinking → Compare file list against the 8 required schemas:
# activeContext.json, scratchpad.json, kanban.json, mistakes.json, 
# systemPatterns.json, progress.json, roadmap.json, memory.json
```

### 3. Create Missing Files
```bash
# // turbo
FOR each missing_file DO
  @mcp:filesystem → Create missing_file with content: {}
  → Log creation in activeContext.json
DONE
```

### 4. Final Verification
```bash
# // turbo
@mcp:filesystem → List files again to confirm all 8 schemas are present.
→ Report completion status.
```
