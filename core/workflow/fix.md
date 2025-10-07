---
description: Opposition party challenges errors/warnings, debate happens, then ruling party and opposition voting occurs
---

# /fix - Democratic Error Resolution Protocol

_This workflow is defined canonically under `core/workflow/fix.md`. IDEs such as Windsurf surface the same workflow via `.windsurf/workflow/fix.md`, so path references should be interpreted through that mount when executed inside the IDE._

## Purpose
Opposition-led error resolution through democratic debate and tri-branch voting process, ensuring quality through parliamentary oversight.

## Constitutional Authority
- **Article V**: Team Communication - Opposition challenge protocols
- **Article XIII**: Judicial Debugging Authority - Zero tolerance enforcement
- **Article II**: Autonomous Decision Making - Consensus scoring

## Parliamentary Structure
```bash
# Ruling Party (Government):
- Project Manager (Prime Minister)
- Development Minister
- Technology Minister

# Opposition (Shadow Cabinet):
- Quality Shadow (Lead challenger)
- Innovation Shadow
- Analytics Shadow

# Independent Judiciary:
- Chief Justice (Final authority)
```

## Workflow Sequence

### Phase 1: Error Detection & Opposition Challenge
```bash
# Auto-detect errors/warnings:
@mcp:filesystem → Run language-specific validation
- Rust: cargo check --all-targets
- TypeScript: pnpm typecheck  
- Python: basedpyright .
- Go: go build ./...
(See Article XIII for complete matrix)

# Quality Shadow challenges:
1. Identify all errors/warnings
2. Classify severity (P0-P3)
3. Document in mistakes.json
4. Formal opposition challenge:
   "I challenge the ruling party on [X] errors/warnings
   requiring immediate HALT-FIX-VALIDATE protocol."
```

### Phase 2: Structured Parliamentary Debate
```bash
# Opposition presents evidence:
Quality Shadow:
  → "Based on mistakes.json patterns, these errors violate:
     - Constitutional compliance (Article IV)
     - Zero tolerance policy (Article XIII)  
     - EMD/ZUV principles"
  → @mcp:memory → Retrieve similar error patterns
  → @mcp:byterover-mcp → Check cross-project resolutions

Innovation Shadow:
  → "I've investigated alternatives via @mcp:context7:"
  → @mcp:context7 → resolve-library-id → get-library-docs
  → Present official documentation solutions
  → Recommend best practices from industry

Analytics Shadow:
  → "Progress.json shows error impact:"
  → Calculate fix time estimates
  → Assess quality trend degradation
  → Present data-driven fix priority

# Government responds:
Development Minister:
  → Acknowledge errors
  → Propose fix approach
  → Estimate implementation time
  → Request technical support if needed

Technology Minister:
  → Assess technical feasibility
  → Review architecture impact
  → Validate fix approach
  → Suggest technical alternatives

Project Manager:
  → Coordinate fix strategy
  → Allocate resources
  → Set timeline expectations
  → Ensure roadmap alignment
```

### Phase 3: MCP-Enriched Fix Research
```bash
# Comprehensive error research:

1. @mcp:context7 → Official documentation:
   - resolve-library-id for exact library
   - get-library-docs for error context
   - Extract fix patterns

2. @mcp:sequential-thinking → Complex decomposition:
   - Break error into root causes
   - Identify dependencies
   - Plan multi-step resolution

3. @mcp:memory → Historical patterns:
   - Check local knowledge graph
   - Retrieve similar past fixes
   - Apply proven solutions

4. @mcp:byterover-mcp → Cross-project intelligence:
   - Check cloud knowledge base
   - Find similar error resolutions
   - Import successful patterns

5. @mcp:fetch → External research:
   - Search Stack Overflow patterns
   - Find GitHub issue resolutions
   - Retrieve community solutions
```

### Phase 4: Fix Implementation Proposal
```bash
# Government proposes fix:
Development Minister presents:
  1. Root cause analysis
  2. Proposed fix with code changes
  3. Testing strategy
  4. Rollback plan if needed
  5. MCP evidence supporting approach

# Legislative challenges:
Quality Shadow:
  → "Does this fix address root cause?"
  → "What about test coverage?"
  → "Have we checked for regressions?"

Innovation Shadow:
  → "Are there better alternatives?"
  → "Does this follow best practices?"
  → "Should we refactor instead?"

Analytics Shadow:
  → "What's the performance impact?"
  → "How does this affect metrics?"
  → "Is this the optimal solution?"
```

### Phase 5: Democratic Voting Process
```bash
# Weighted consensus scoring:

Executive Branch (30%):
- Project Manager: 15%
- Development Minister: 10%
- Technology Minister: 5%

Legislative Branch (45%):
- Quality Shadow: 20% (Lead on fixes)
- Innovation Shadow: 15%
- Analytics Shadow: 10%

Judicial Branch (25%):
- Chief Justice: 25% (Veto authority)

# Vote calculation:
@mcp:math → Calculate weighted consensus

Requirement: >95% approval needed

# Voting considerations:
- Fix correctness (addresses root cause)
- Code quality (EMD/ZUV compliance)
- Test coverage (prevents regression)
- Performance impact (acceptable overhead)
- Roadmap alignment (strategic value)
```

### Phase 6: Fix Execution (If Approved)
```bash
# IF consensus ≥95%:

1. HALT current operations

2. Apply fixes:
   @mcp:filesystem → Implement code changes
   @mcp:git → Track changes with version control
   
3. Validate-memory-bank: Verify 7 essential schemas compliant (`activeContext.json`, `scratchpad.json`, `kanban.json`, `mistakes.json`, `systemPatterns.json`, `progress.json`, `roadmap.json`) and validate automation files if present
   systemPatterns.json → Store successful fix pattern with AegisKG integration
   activeContext.json → Update execution state
   kanban.json → Reflect task status/progression if changed (todo → in_progress → done → approved)
   progress.json → Update milestone metrics if impacted
   roadmap.json → Ensure strategic alignment unchanged

4. Validation loop:
   Run language-specific validation
   IF errors persist:
     → Re-fix immediately
     → Re-validate
   REPEAT until 100% clean

5. Knowledge storage:
   @mcp:memory → Store fix pattern locally
   @mcp:byterover-mcp → Sync to cloud

6. Git snapshot:
   @mcp:git → Commit with message
   "Fix: [Error description] - [Fix summary]"
```

### Phase 7: Judicial Verification
```bash
# Chief Justice final validation:

1. Constitutional compliance check:
   ✓ Zero errors/warnings achieved
   ✓ EMD compliance maintained
   ✓ ZUV principle followed
   ✓ Memory bank updated correctly

2. Quality standards verification:
   ✓ Code passes all validations
   ✓ Test coverage adequate
   ✓ Documentation complete
   ✓ Roadmap alignment preserved

3. Grant approval or veto:
   IF approved:
     → Update progress.json with fix success
     → Resume /next execution
   IF vetoed:
     → Rollback changes
     → Restart fix process
     → Document veto reason
```

## Consensus Failure Protocol
```bash
IF consensus <95%:
  → Extended debate (Round 2)
  → Additional MCP research
  → Alternative approaches presented
  → Re-vote after discussion

IF still <95% after 3 rounds:
  → Escalate to human (100% autonomy)
  → Document deadlock in mistakes.json
  → Await user guidance
```

## HALT-FIX-VALIDATE Loop
```bash
# Mandatory zero-tolerance cycle:

1. HALT → Stop all operations immediately

2. FIX → Apply corrections:
   → @mcp:context7 → Official docs
   → Implement fixes
   → Update memory bank

3. VALIDATE → Re-run validation:
   → Execute language-specific checks
   → Verify 100% clean

4. REPEAT → If not clean:
   → Loop back to FIX
   → Continue until zero errors

5. CONTINUE → Only after 100% validation pass
```

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
- ✅ Knowledge synced to @mcp:byterover-mcp
- ✅ Chief Justice approval granted
- ✅ Git snapshot created

## Learning Integration
```bash
# Store fix patterns for future (7-Schema System):

mistakes.json → Error pattern + resolution with Context7 source prioritization
systemPatterns.json → Successful fix approach with AegisKG pattern networks
activeContext.json → Real-time execution state with session management
kanban.json → Updated workflow state

@mcp:memory → Local knowledge graph update
@mcp:byterover-mcp → Cross-project intelligence

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
