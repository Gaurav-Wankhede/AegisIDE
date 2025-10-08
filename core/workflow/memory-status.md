---
description: Check the status and health of the knowledge graph in memory.json.
---

# /memory-status – Knowledge Graph Health Check

## Purpose
Executed by the **Administrative Service (IAS Cabinet Secretary)** and reviewed by the **Chief Justice**, this workflow provides a comprehensive health audit of the `memory.json` knowledge graph, ensuring its integrity and constitutional compliance.

## Constitutional Authority
- **Article I**: Mandates the IAS Cabinet Secretary to maintain constitutional registers and schema health reports.
- **Article XVI**: Governs the structure, maintenance, and quality standards of the knowledge graph.
- **Article XI**: Enforces agent compliance with all constitutional data structures.

## MCP Role Map
- `@mcp:context7`: Confirms schema and governance expectations against the constitution.
- `@mcp:fetch`: Pulls external ontology or schema advisories on anomalies.
- `@mcp:filesystem`: Reads `memory.json` and related schemas atomically.
- `@mcp:git`: Snapshots status reports for the constitutional audit trail.
- `@mcp:memory`: Surfaces knowledge graph metadata and persists health check outcomes.
- `@mcp:sequential-thinking`: Plans diagnostics and remediation for any identified issues.
- `@mcp:time`: Timestamps health checks to ensure regular audits.
- `@mcp:math`: Calculates all key metrics, including entity counts, relation density, and compliance scores.

## Workflow Sequence

### 1. Read Knowledge Graph
*The IAS initiates a secure, validated read of the knowledge graph.*
```bash
# // turbo
@mcp:context7 → Re-validate the schema for memory.json against the constitutional definition
@mcp:filesystem → Read .windsurf/memory-bank/memory.json
@mcp:memory → Load knowledge graph metadata for enriched reporting
@mcp:time → Capture the retrieval timestamp
```

### 2. Calculate Health Metrics
*The IAS Researcher and Finance Officer compute the graph's vital statistics.*
```bash
# // turbo
@mcp:math → Count total entities, relations, and observations; calculate graph density.
@mcp:sequential-thinking → Identify anomalies (e.g., orphaned nodes, conflicting observations) and plan remediation if thresholds are breached.
@mcp:fetch → Retrieve external ontology updates on inconsistencies.
```

### 3. Report Status & Judicial Review
*The Cabinet Secretary presents the findings to the Chief Justice for final review.*
- **Display Health Metrics**: Total entities, relations, observations, and graph density.
- **Verify Constitutional Compliance**: Report on adherence to the quality standards defined in Article XVI.
- **Archive Report**: `@mcp:git` archives the report snapshot for the permanent record.
- **Log Outcome**: `@mcp:time` timestamps completion, and `@mcp:memory` stores the health summary and any required follow-up actions in the knowledge graph.
