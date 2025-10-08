---
description: Opposition party challenges errors/warnings, debate happens, then ruling party and opposition voting occurs
---

# /fix – Democratic Error Resolution

## Purpose
A constitutionally mandated workflow for resolving errors, warnings, or quality violations. It follows the Indian Governance model, initiated by the **Opposition** or **Judiciary**, investigated by the **Administrative Service (IAS)**, debated in Parliament, and executed by the **Government** upon achieving >95% consensus.

## Constitutional Authority
- **Article I**: Defines the roles of the Opposition, IAS, and Judiciary in ensuring quality and compliance.
- **Article XIII**: Grants the Chief Justice supreme debugging authority and mandates the zero-tolerance HALT-FIX-VALIDATE loop.
- **Article II**: Outlines the parliamentary consensus and decision-making matrices.
- **Article V**: Governs the structured debate protocol.

## MCP Roles
- `@mcp:context7`: Provides official remediation patterns and constitutional references.
- `@mcp:fetch`: Retrieves external incident reports or upstream patches.
- `@mcp:filesystem`: Executes validation runs and atomic code edits.
- `@mcp:git`: Stages and commits fixes with a complete audit trail.
- `@mcp:memory`: Persists challenges, debates, resolutions, and learnings in the knowledge graph.
- `@mcp:sequential-thinking`: Manages debate sequencing, root cause analysis, and remediation planning.
- `@mcp:time`: Timestamps all phases for accountability and performance metrics.
- `@mcp:math`: Computes consensus scores and impact metrics.

## Workflow Sequence

### Phase 1: Detection, HALT, and Opposition Challenge
*An error is detected by automated validation (Article XIII) or by the Quality Shadow.*
1.  **Chief Justice or Quality Shadow**: Issues an immediate **HALT** command, stopping all non-essential operations.
2.  **Quality Shadow**:
    *   Classifies the error severity (P0-P3) based on constitutional definitions.
    *   Files a formal challenge, logging the initial findings in `mistakes.json` via `@mcp:memory`.
    *   `@mcp:time` timestamps the challenge to initiate the accountability clock.

### Phase 2: IAS Investigation & Briefing
*The permanent, neutral Administrative Service provides an objective technical assessment.*
1.  **IAS Researcher**: Conducts a root cause analysis using the `/research` workflow.
    *   `@mcp:sequential-thinking` → Decompose the problem.
    *   `@mcp:context7` → Fetch official documentation and known solutions.
    *   `@mcp:memory` → Retrieve historical precedents from the knowledge graph.
    *   `@mcp:fetch` → Scan for external advisories or community-provided fixes.
2.  **IAS Cabinet Secretary**: Compiles the findings into a formal brief, documents it in `systemPatterns.json`, and presents it to both the Government and Opposition.

### Phase 3: Parliamentary Debate
*A structured debate is convened to review the IAS brief and determine the best path forward.*
1.  **Opposition Challenge**:
    *   **Quality Shadow**: Cites `mistakes.json` patterns and constitutional breaches.
    *   **Innovation Shadow**: Presents alternative solutions backed by `@mcp:context7` and `@mcp:fetch`.
    *   **Analytics Shadow**: Quantifies the impact using `progress.json` metrics and `@mcp:math`.
2.  **Government Response**:
    *   The responsible **Minister** presents a remediation plan.
    *   The **Prime Minister** coordinates the debate using `@mcp:sequential-thinking`.

### Phase 4: Consensus & Judicial Review
*A decision is reached through democratic consensus and validated against the constitution.*
1.  **Vote**: Parliament votes on the proposed fix. `@mcp:math` calculates the weighted consensus score.
2.  **Consensus Check**:
    *   **If consensus ≥95%**: The proposal moves to Judicial Review.
    *   **If 90–94.9%**: The debate is extended for up to three rounds.
    *   **If <90%**: The proposal is rejected. The Government must present a new plan, and the failure is logged in `mistakes.json`.
3.  **Judicial Review**: The **Chief Justice** performs a final constitutional review, verifying EMD/ZUV compliance, roadmap alignment, and zero-tolerance validation. The Chief Justice may approve the fix or issue a **veto**, forcing a rollback and restarting the process.

### Phase 5: Execution & Validation (HALT-FIX-VALIDATE)
*Upon receiving judicial approval, the Government executes the fix under a strict zero-tolerance policy.*
1.  **FIX**: The **Development Minister** applies the approved corrections, using `@mcp:filesystem` and `@mcp:git`.
2.  **VALIDATE**: The validation suite from Article XIII is executed. This loop repeats until a 100% clean result is achieved. Each attempt is timestamped by `@mcp:time`.
3.  **CONTINUE**: Once validation passes, the **Prime Minister** authorizes the resumption of the `/next` workflow.

### Phase 6: Knowledge Storage & System Improvement
*The IAS ensures that the resolution contributes to the system's long-term intelligence.*
1.  **IAS Researcher**: Updates the `memory.json` knowledge graph and `systemPatterns.json` with the successful resolution pattern via `@mcp:memory`.
2.  **IAS Field Officers**: Update all 8 core memory-bank schemas to reflect the new state.
3.  **IAS Cabinet Secretary**: Publishes performance metrics (`time-to-fix`, `consensus-rate`) to `progress.json`.

## Error Classification
```bash
P0 (Blocking):
  → Compilation failures
  → Type errors
  → Import resolution failures
  → HALT immediately, fix first

P1 (Critical):
  → Linting errors
  → Security vulnerabilities  
  → Test failures
  → Fix before next task

P2 (Major):
  → Code style violations
  → Performance issues
  → Documentation gaps
  → Fix within session

P3 (Minor):
  → Optimization opportunities
  → Refactoring suggestions
  → Enhancement ideas
  → Address when convenient
```

## Success Criteria
- ✅ Opposition challenge acknowledged
- ✅ Parliamentary debate completed
- ✅ >95% consensus achieved
- ✅ Fixes implemented with MCP evidence
- ✅ 100% validation pass (zero errors/warnings)
- ✅ Memory bank updated with patterns
- ✅ Knowledge synced to @mcp:memory
- ✅ Chief Justice approval granted
- ✅ Git snapshot created

## Learning Integration
```bash
# Store fix patterns for future (8-Schema System):

mistakes.json → Error pattern + resolution with Context7 source prioritization
systemPatterns.json → Successful fix approach with AegisKG pattern networks
activeContext.json → Real-time execution state with session management
kanban.json → Updated workflow state
progress.json → Milestone and metric updates
roadmap.json → Strategic alignment check
scratchpad.json → Task status updates
memory.json → Knowledge graph update

@mcp:memory → Local knowledge graph update and cross-project intelligence

# Pattern format:
{
  "error_type": "[Error classification]",
  "root_cause": "[Technical cause]",
  "fix_approach": "[Solution method]",
  "mcp_tools_used": ["context7", "sequential-thinking"],
  "prevention": "[How to avoid in future]"
}
```

## Performance Metrics
```bash
@mcp:math → Track:
- Time to fix (minutes)
- Consensus achievement rate (%)
- Fix success rate (first attempt)
- Pattern reuse frequency
- Validation pass rate

# Report to progress.json
```

## Next Steps
After successful fix and Chief Justice approval:
1. Resume /next autonomous execution
2. Monitor for error recurrence  
3. Apply learned patterns proactively
4. Maintain zero-tolerance vigilance

## Article XII Autonomy Guard (Zero Interruption)

```bash
# Enforce continuous execution (0-98% autonomy):
1) NEVER re-ask or wait for confirmation after fixes
2) Immediately update 3 real-time files:
   - scratchpad.json, kanban.json, activeContext.json
3) Auto-trigger next task (continue /next) without pause

# Prohibited phrases (at 0-98% autonomy):
- "Should I continue?" / "What next?" / "Do you want me to..."

# Schema validation:
- Validate against .windsurf/memory-bank/schemas/*.schema.json
```
