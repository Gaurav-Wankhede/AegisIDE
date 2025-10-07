---
description: Fallback command to manually update memory bank when real-time updates fail
---

# /update - 7-Schema Manual Update (Fallback)

_This workflow is defined canonically under `core/workflow/update.md`. IDEs such as Windsurf surface the same workflow via `.windsurf/workflow/update.md`, so path references should be interpreted through that mount when executed inside the IDE._

## Purpose
Manually update all 7 essential schemas when autonomous real-time updates fail or are missed. This is a fallback mechanism - real-time updates should happen automatically during /next execution.

## Constitutional Authority
- **Article III-A**: Implementation Protocols - Real-time update enforcement
- **Article VII**: Autonomous Operations - Self-management and recovery
- **Article II**: Autonomous Decision Making - Context maintenance

## When to Use
```bash
# Use /update when:
- Real-time updates missed during /next execution
- Memory bank files out of sync with actual project state
- Attention budget exceeded and files need compression
- Schema validation failures need correction
- Manual verification needed after major changes

# DO NOT use when:
- /next is running normally (uses automatic real-time updates)
- Files are already up to date
- Just for checking status (use /status instead)
```

### Phase 2.1: Cross-File Synchronization (BLOCKING)
```bash
# Use linkage keys to keep schemas in sync after updates
# Keys: proposal_id, kanban_task_id(s), roadmap_milestone_id, governance_decision_id

1. From kanban.tasks[*]:
   - If task.status changed → update progress.milestone_tracking[*].kanban_task_ids matches
     → Adjust tasks_completed / tasks_total and completion_percentage accordingly
   - If task.approved == true AND governance_decision_id present → ensure systemPatterns.governance_decisions[] has matching decision (or append)

2. From roadmap.strategic_objectives[*].milestones[*]:
   - If milestone.status or completion_percentage changed → update linked kanban tasks
     (set status to "approved" when milestone completed and decision recorded)
   - If proposal_id present and decision approved → propagate to kanban.tasks[*].parliamentary_approval.approved = true

3. From activeContext.linkage:
   - If active task completes → ensure corresponding kanban task moves from in_progress → done → approved (when governance_decision_id exists)
   - Keep linkage fields up to date (kanban_task_id, roadmap_milestone_id, proposal_id)

4. From systemPatterns.governance_decisions[]:
   - If new approved decision appears → mark linked kanban task as approved and update progress + roadmap milestones

Validation:
- Every linkage id refers to an existing entity; if missing → HALT & record in mistakes.json
- After synchronization, re-validate all 7 files against schemas before proceeding
```

## Workflow Sequence

### Phase 1: 7-Schema Health Check (JSON Awareness)
```bash
# Assess current state of 7 essential schemas:
@mcp:filesystem → Read scratchpad.json, activeContext.json, kanban.json, mistakes.json, systemPatterns.json, progress.json, roadmap.json
@mcp:math → Calculate file sizes and attention allocation (30%, 25%, 15%, 15%, 7%, 5%, 3%)

# Identify issues:
- Files >10KB (need AegisKG compression)
- Schema validation failures against `.windsurf/memory-bank/schemas/*.schema.json`
- Outdated Context7 source prioritization
- Missing files (bootstrap creation required)
- Attention budget degradation
```

### Phase 2: 7-Schema Real-Time Update (MANDATORY)
```bash
# Update ALL 7 essential schemas immediately:

1. @mcp:filesystem → Update scratchpad.json (30% attention):
   - Scan project for pending tasks
   - Remove completed items
   - Add MCP validation state
   - Validate against schema

2. @mcp:filesystem → Update activeContext.json (25% attention):
   - Real-time execution state with session management
   - Recent changes summary
   - Attention budget status

3. @mcp:filesystem → Update mistakes.json (20% attention):
   - Error patterns with Context7 source prioritization
   - Predictive analytics for error prevention
   - Anti-hallucination metrics

4. @mcp:filesystem → Update systemPatterns.json (10% attention):
   - Architecture patterns with AegisKG networks
   - MCP-enriched documentation links
   - Success pattern storage

5. @mcp:filesystem → Update progress.json (10% attention):
   - Development milestones with constitutional metrics
   - AegisKG progress correlation
   - Performance tracking

3. @mcp:filesystem → Update kanban.json (15% attention):
   - Task workflow columns (todo/in_progress/done/approved)
   - Parliamentary approval tracking
   - WIP limits and metrics

4. @mcp:filesystem → Update mistakes.json (15% attention):
   - Error patterns with Context7 source prioritization
   - Predictive analytics for error prevention
   - Anti-hallucination metrics

5. @mcp:filesystem → Update systemPatterns.json (7% attention):
   - Architecture patterns with AegisKG networks
   - MCP-enriched documentation links
   - Success pattern storage

6. @mcp:filesystem → Update progress.json (5% attention):
   - Development milestones with constitutional metrics
   - AegisKG progress correlation
   - Performance tracking

7. @mcp:filesystem → Update roadmap.json (3% attention):
   - Strategic planning alignment
   - Milestone dependencies
   - Client requirements validation
```

### Phase 3: Schema Validation & Health Verification
```bash
# Validate all 7 schemas:
@mcp:filesystem → Validate each schema against `.windsurf/memory-bank/schemas/*.schema.json`
@mcp:math → Verify file sizes ≤10KB each
@mcp:git → Create AegisKG snapshot

# Performance verification:
- 2.6x faster JSON parsing achieved
- 59% memory optimization maintained
- AegisKG knowledge graph integration active
```

### Phase 4: Bootstrap Missing Schemas (If Needed)
```bash
# Ensure the 7 essential files exist (create minimal JSON if missing):
for FILE in [activeContext.json, scratchpad.json, kanban.json, systemPatterns.json, mistakes.json, roadmap.json] do
  IF missing → create minimal {}
  → validate against corresponding schema
done
```

### Phase 5: Schema Validation
```bash
# Validate all updates:
@mcp:filesystem → Read .windsurf/memory-bank/schemas/*.schema.json

# For each updated file:
- Validate against corresponding schema
- Check required fields present
- Verify data types correct
- Ensure constitutional compliance

# IF validation fails:
  → Rollback to previous version via @mcp:git
  → Fix validation errors
  → Re-validate until pass
```

### Phase 6: Context Optimization
```bash
# Compress files if needed:
IF any file >10KB:
  → Auto-compress low-signal content
  → Preserve critical patterns
  → Archive historical data
  → Verify file ≤10KB after compression

# Rebalance attention allocation:
@mcp:math → Calculate optimal attention distribution
- CRITICAL: 45% (scratchpad, activeContext)
- HIGH: 30% (roadmap, mistakes)
- SUPPORTING: 18% (techContext, progress)
- REFERENCE: 7% (systemPatterns, productContext, projectbrief)
```

### Phase 7: Git Snapshot
```bash
# Create immutable snapshot:
@mcp:git → Commit all updated files
- Timestamp: Current datetime
- Message: "Memory bank update - manual fallback"
- Branch: Current working branch
- Verify snapshot created successfully
```

### Phase 8: Knowledge Sync
```bash
# Sync with knowledge systems:
@mcp:byterover-mcp → Store updated patterns
@mcp:memory → Update local knowledge graph

# Document update action:
- Record in systemPatterns.json
- Update activeContext.json with sync status
```

## Update Priority Matrix
```bash
# Critical (ALWAYS update):
scratchpad.json, activeContext.json, kanban.json

# High Priority (Update if >1 hour old):
roadmap.json, roadmap.md, mistakes.json

# Medium Priority (Update if >4 hours old):
techContext.json, progress.json, systemPatterns.json

# Low Priority (Update if >24 hours old):
All remaining 10 files

# On-Demand (Update only when changed):
blueprint.json, userflow.json, deployment.json
```

## Constitutional Compliance
```bash
# Tri-branch oversight:
Executive → Identifies update needs
Legislative → Validates content quality
Judicial → Ensures constitutional compliance

# Update requirements:
- All files ≤10KB (EMD compliance)
- Schema validation pass (100%)
- Attention budget optimized
- Git snapshot created
- Knowledge systems synced
```

## Success Criteria
- ✅ All 7 essential schemas updated and validated
- ✅ Schema compliance verified (100%)
- ✅ File sizes ≤10KB each
- ✅ Attention budget balanced
- ✅ Git snapshot created
- ✅ Knowledge systems synced
- ✅ No context rot detected

## Error Handling
```bash
IF schema validation fails:
  → Identify specific validation errors
  → @mcp:context7 → Check schema definitions
  → Fix data structure issues
  → Re-validate until pass

IF file size exceeds 10KB:
  → Auto-compress content
  → Archive historical data
  → Preserve only high-signal patterns
  → Verify compression successful

IF git snapshot fails:
  → Check git configuration
  → Resolve merge conflicts
  → Retry snapshot creation
  → Document failure in mistakes.json

IF MCP sync fails:
  → Enable fallback protocols
  → Use native file operations
  → Log sync failure
  → Retry on next update
```

## Performance Metrics
```bash
@mcp:math → Calculate:
- Files updated count
- Validation success rate
- Compression efficiency
- Update completion time
- Sync success rate

# Report to progress.json
```

## Post-Update Actions
```bash
# After successful update:
1. Verify all files accessible
2. Check constitutional compliance
3. Report update summary
4. Return to /next execution
5. Monitor for context rot
```

## Prevention Note
```
⚠️ This is a FALLBACK command. Real-time updates during /next 
execution should prevent the need for manual updates.

If /update is needed frequently, investigate:
- Why real-time updates are failing
- MCP filesystem connectivity issues
- Attention budget exhaustion
- Schema validation problems
```

## Next Steps
After successful update, return to /next command for continuous autonomous execution.
