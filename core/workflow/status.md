---
description: Provides comprehensive summary of memory bank status, tasks, progress, and metrics.
---

# /status – Comprehensive System Status Report

## Purpose
Executed by the **Administrative Service (IAS)**, this workflow generates a comprehensive "State of the Republic" report for the **Prime Minister** and **Parliament**. It provides a full overview of project status by analyzing all memory-bank schemas, tasks, progress, and constitutional compliance.

## Constitutional Authority
- **Article I**: Mandates the IAS to provide expert intelligence and maintain constitutional registers.
- **Article III & III-A**: Define the memory-bank structure that this workflow audits.
- **Article XI**: Enforces the compliance standards that this workflow measures.

## MCP Role Map
- `@mcp:context7`: Confirms constitutional scoring thresholds and validation rules.
- `@mcp:fetch`: Retrieves external advisories on any detected anomalies.
- `@mcp:filesystem`: Reads all memory-bank schemas and roadmap artifacts for analysis.
- `@mcp:git`: Captures the status report for the constitutional audit trail.
- `@mcp:memory`: Pulls knowledge graph insights and stores the final report summary.
- `@mcp:sequential-thinking`: Organizes diagnostics and proposes remediation plans.
- `@mcp:time`: Timestamps the report and measures data freshness.
- `@mcp:math`: Computes all quantitative metrics for the report.

## Workflow Sequence

### Phase 1: 8-Schema Health Check (IAS Cabinet Secretary)
*Audits the integrity and health of the core memory-bank.*
```bash
# // turbo
@mcp:context7 → Reconfirm schema definitions
@mcp:filesystem → Read and analyze all 8 core schemas
@mcp:math → Calculate health metrics (file sizes ≤10KB, schema validation, knowledge graph sync, attention budget)
@mcp:time → Record phase timestamps
```

### Phase 2: Task & Progress Analysis (IAS Field Officers)
*Assesses the current state of execution and progress against the roadmap.*
```bash
# // turbo
# Analyze task states from scratchpad.json & kanban.json
- Pending/in-progress/blocked tasks, priority distribution
- Milestone completion %, velocity, quality scores from progress.json
@mcp:sequential-thinking → Propose actions for any identified blockers
```

### Phase 3: Constitutional Compliance Audit (IAS Cabinet Secretary)
*Verifies adherence to the constitutional framework.*
```bash
# // turbo
@mcp:math → Calculate Framework Adherence (≥80%), Democratic Consensus (>95%), and Roadmap Alignment (≥95%)
- Check Code Quality (EMD, ZUV, validation status from Article XIII)
- Check Attention Budget (allocation, context rot, signal-to-noise)
@mcp:sequential-thinking → Recommend remediation if any thresholds are missed
```

### Phase 4: Error & Resource Analysis (IAS Home Officer & Researcher)
*Analyzes outstanding issues and system resource health.*
```bash
# // turbo
# Analyze issues from mistakes.json and current validation status
- Total errors, recurring patterns, and resolution success rate
# Analyze resource usage
- Memory-bank size, Git repo status, and MCP health
```

### Phase 5: Report Generation & Publication
*The IAS compiles and delivers the final report to Parliament.*
```bash
# // turbo
@mcp:sequential-thinking → Generate a prioritized remediation checklist
@mcp:git → Commit the full status report with the message "status: State of the Republic YYYY-MM-DD"
@mcp:memory → Store the report summary in the knowledge graph
@mcp:time → Log the completion timestamp
# The final report, including the Status Category, is presented to the Prime Minister.
```

## Status Categories
- **HEALTHY**: Zero errors, compliance ≥80%, roadmap ≥95%, all MCPs operational → Continue /next.
- **WARNING**: Minor issues, compliance 70-79%, some MCPs degraded → Run /optimize or /update.
- **BLOCKED**: Errors present, compliance <70%, validation failures, critical MCPs failed → Run /fix.
