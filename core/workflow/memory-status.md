---
description: Check the status and health of the knowledge graph in memory.json
---

# /memory-status - Knowledge Graph Health Check

## Purpose
Provide a comprehensive summary of the `memory.json` knowledge graph, including key metrics on entities, relations, and overall health.

## Constitutional Authority
- **Article XVI**: Knowledge Graph Memory Management
- **Article XI**: Mandatory AI Agent Compliance

## Workflow Sequence

### 1. Read Knowledge Graph
```bash
# // turbo
@mcp:filesystem → Read .ide/memory-bank/memory.json
```

### 2. Calculate Metrics
```bash
# // turbo
@mcp:math → Count total entities
@mcp:math → Count total relations
@mcp:math → Calculate average observations per entity
@mcp:math → Calculate relation density
```

### 3. Report Status
- Display total entities, relations, and observations.
- Report on graph density and complexity.
- Check for compliance with Article XVI standards (e.g., observation length, active voice relations).
