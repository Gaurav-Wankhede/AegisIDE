---
description: Initializes a new session with constitutional awareness and memory bank context.
---

# /init – Constitutional Session Initialization

## Purpose
On the authority of the **Prime Minister**, the **Administrative Service (IAS)** executes this workflow to establish constitutional awareness for new sessions. It loads the governance framework, bootstraps or validates the 18-file memory-bank, and activates autonomous protocols.

## Constitutional Authority
- **Article I**: Mandates the IAS to manage the memory-bank and ensure constitutional order.
- **Article II**: Governs the session initialization and autonomous decision-making process.
- **Article III & III-A**: Define the 18-file memory-bank structure and its bootstrap/validation requirements.
- **Article XIV**: Mandates the blueprint generation process for new or uninitialized projects.

## MCP Role Map
- `@mcp:context7`: Loads constitutional articles and validates schema definitions.
- `@mcp:fetch`: Retrieves upstream schema advisories if local versions are outdated.
- `@mcp:filesystem`: Inspects, creates, and reads all 18 memory-bank files.
- `@mcp:git`: Snapshots the initialization state for auditability.
- `@mcp:memory`: Preloads the knowledge graph and stores the initialization event.
- `@mcp:sequential-thinking`: Plans the initialization phases and orchestrates remediation for missing files.
- `@mcp:time`: Timestamps the session start and measures initialization latency.
- `@mcp:math`: Computes schema compliance and readiness scores.

## Workflow Sequence

### Phase 1: Constitutional & Memory Bank Bootstrap
*The IAS Cabinet Secretary oversees the structural integrity of the memory-bank.*
```bash
# // turbo
# Load the constitution and check for the 18 required files
@mcp:filesystem → Read .windsurf/rules/constitution/article-*.md
@mcp:filesystem → List .windsurf/memory-bank/

# If memory bank is missing or incomplete, trigger the appropriate workflow
@mcp:sequential-thinking → 
  IF .windsurf/memory-bank/ is missing:
    → Trigger /blueprint create "New Project Initialization"
  ELSE:
    → Trigger /bootstrap to create any missing files
```

### Phase 2: Context Assembly & Law Loading
*IAS Field Officers assemble the operational context.*
```bash
# // turbo
# Load all 18 memory-bank files with constitutional attention allocation
@mcp:filesystem → Read all files in .windsurf/memory-bank/

# Auto-detect tech stack and load relevant laws
@mcp:filesystem → Scan for package.json, Cargo.toml, etc.
@mcp:filesystem → Load relevant laws from .windsurf/rules/laws/
```

### Phase 3: MCP & Governance Activation
*The full government machinery is brought online.*
```bash
# // turbo
# Prepare all MCP servers for auto-enrichment
@mcp:memory → Load local knowledge graph
# ... verify other MCPs

# Activate tri-branch governance, consensus scoring, and attention budget monitoring
```

### Phase 4: Session Readiness & Auto-Execution
*The Prime Minister authorizes the start of autonomous operations.*
```bash
# // turbo
# IAS verifies the initialization checklist: All articles, schemas, and laws loaded; MCPs ready; governance active.

# Report session status and auto-trigger /next
Report: "Session initialized under constitutional authority. Commencing autonomous execution."
/next
```