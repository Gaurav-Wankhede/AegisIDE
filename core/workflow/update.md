---
description: Fallback command to manually update memory bank when real-time updates fail.
---

# /update – Memory-Bank Manual Synchronization (Fallback)

## Purpose
This is a constitutional recovery procedure executed by the **Administrative Service (IAS) Field Officers** to manually synchronize all **18 memory-bank files** when the autonomous real-time update system fails. It serves as a fallback to the automatic updates handled by the `/next` workflow.

## Constitutional Authority
- **Article I**: Mandates the IAS to ensure the real-time integrity of the memory-bank.
- **Article III-A**: Defines the real-time update enforcement that this workflow manually restores.
- **Article VII**: Governs autonomous operations and self-management, including recovery.
- **Article XV**: Outlines the error prevention and recovery protocols for tool usage.

## MCP Role Map
- `@mcp:context7`: Reconfirms schema contracts and constitutional rules.
- `@mcp:fetch`: Retrieves upstream schema changes if discrepancies are found.
- `@mcp:filesystem`: Inspects, edits, and validates all 18 memory-bank files atomically.
- `@mcp:git`: Records the manual update for the constitutional audit trail.
- `@mcp:memory`: Pulls historical patterns and persists the fallback event in the knowledge graph.
- `@mcp:sequential-thinking`: Plans the synchronization and remediation steps.
- `@mcp:time`: Timestamps all phases of the recovery process.
- `@mcp:math`: Computes file size compliance and success rates.

## Workflow Sequence

### Phase 1: Health Check & Remediation Plan
*The IAS assesses the current state of the entire memory-bank.*
```bash
# // turbo
@mcp:context7 → Review schema requirements for all 18 files
@mcp:filesystem → Read all 18 memory-bank files
@mcp:math → Calculate file sizes and attention allocation
@mcp:sequential-thinking → Outline remediation for files >10KB, schema failures, or missing files
```

### Phase 2: Manual Update & Cross-File Sync
*The IAS Field Officer manually synchronizes all 18 files based on the current project state.*
```bash
# // turbo
# Core (8): activeContext, scratchpad, mistakes, progress, systemPatterns, techContext, productContext, projectbrief
# Automation (8): kanban, blueprint, userflow, bugfix, deployment, monitoring, dependencies, memory
# Strategy (2): roadmap.json, roadmap.md
# Visualization (1): mermaid.json

# Synchronize linkage keys (proposal_id, task_id, etc.) across all files
@mcp:sequential-thinking → Verify cross-file consistency
```

### Phase 3: Validation, Optimization & Snapshot
*The integrity of the restored memory-bank is validated and recorded.*
```bash
# // turbo
# Validate all 18 files against their schemas in .windsurf/memory-bank/schemas/
@mcp:filesystem → Validate each schema
@mcp:math → Verify file sizes ≤10KB

# Compress files if needed
IF any file >10KB → Auto-compress, preserving critical patterns

# Create immutable snapshot
@mcp:git → Commit all changes with message "Memory bank update - manual fallback"
@mcp:time → Log commit timestamp
```

### Phase 4: Knowledge Sync & Resumption
```bash
# Sync with knowledge systems and resume
@mcp:memory → Store updated patterns in local knowledge graph
@mcp:time → Record knowledge sync completion
→ Report completion and resume /next execution
```
