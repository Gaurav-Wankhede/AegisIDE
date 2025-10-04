---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article III-A: Implementation Protocols & MCP Integration

### Pre-Implementation Protocol (MANDATORY - Context Optimized)

**Context Assembly Phase** (Attention-Aware):
1. Calculate current attention budget usage vs. capacity
2. Read scratchpad.json (CRITICAL - 25% attention allocation)
3. Read roadmap.json + roadmap.md (CRITICAL - strategic alignment, 15% attention)
4. **SCAN CENTRALIZED CONFIGS** (MANDATORY - prevent duplication):
   - Scan: `core/config/`, `src/*/config/`, `lib/*/config/`, `config/`, `shared/`
   - Check existing: delays, timeouts, API settings, concurrency, retry logic
   - Validate NO duplicate configuration files or constants exist
   - **HALT if duplicate detected** - reference existing config instead
   - Document existing configs in systemPatterns.json event stream
5. Dynamic context loading based on task type (error = mistakes.json priority, feature = roadmap priority)
6. Read activeContext.json, mistakes.json, techContext.json (HIGH PRIORITY - 30% total attention)
7. Retrieve knowledge from @mcp:memory (unlimited local storage, primary)
8. Read supporting files as needed (progress, systemPatterns - 18% attention)
9. Skip reference files unless specifically needed (productContext, projectbrief - 7% attention)

**Validation**:
1. Detect language/framework
2. Run validation commands
3. HALT on errors (zero tolerance)
4. Auto-fix via @mcp:context7
5. Re-validate to 100%
6. Verify roadmap link
7. Check mistakes.json
8. Validate laws
9. Confirm EMD ≤10K

### Post-Implementation Protocol

**Validation Checkpoint**:
1. Run validation suite
2. IF errors → HALT → @mcp:context7 → Fix → Re-validate
3. Proceed only at 100%

**MCP-Based JSON Update (MANDATORY)**:
Use `@mcp:filesystem` for ALL JSON file operations:
```
1. Read current JSON: mcp3_read_text_file({path: ".windsurf/memory-bank/scratchpad.json"})
2. Update data structure with new information
3. Validate against schema: .windsurf/memory-bank/schemas/*.schema.json
4. Write updated JSON: mcp3_write_file({path, content})
5. Verify write success with mcp3_get_file_info
```

**FORCEFUL REAL-TIME UPDATE ENFORCEMENT**:
- **Auto-Trigger**: EVERY task completion automatically calls MCP update
- **No Bypass**: Constitutional violation to skip updates (Article III-A authority)
- **Real-Time Hooks**: Pre/Post implementation checkpoints HALT until updates complete
- **Validation Gate**: Next task BLOCKED until all 17 files updated via MCP
- **Schema Lock**: JSON schema validation MANDATORY - rollback on failure

**Update ALL 17 Files via MCP**:
1. scratchpad.json - @mcp:filesystem write → Remove completed, add priorities
2. activeContext.json - @mcp:filesystem write → Status with timestamp
3. mistakes.json - @mcp:filesystem write → Errors with @mcp:context7 solutions
4. progress.json - Milestones with metrics
5. systemPatterns.json - Patterns from MCP feedback
6. techContext.json - Changes with enriched docs
7. productContext.json - Features with impact
8. projectbrief.json - Scope refinements
9-16. automation JSON files (roadmap, kanban, blueprint, userflow, bugfix, deployment, monitoring, dependencies)
17. roadmap.md - Human-readable strategic overview
18. **mermaid.json - @mcp:filesystem write → Real-time progress flow visualization (MANDATORY)**

**Storage**: @mcp:memory (local primary), @mcp:byterover-mcp (cloud backup)

**Health Check**:
- Files ≤100 lines (auto-cleanup)
- Signal-to-noise improvement
- Attention budget efficiency
- n² degradation detection

**PENALTY**: Validation fail/incomplete/rot → BLOCK until compliant

### MCP Integration Matrix

**Error Resolution Protocol**:
Any error/warning → **AUTO-CALL @mcp:context7 WITHOUT asking**
```
Error Detection →
Auto-call @mcp:context7 resolve-library-id → get-library-docs →
Official Documentation Retrieved →
Auto-Resolution Implementation →
mistakes.json event stream update (structured error pattern) →
techContext.json auto-enrichment (solution pattern from MCP) →
systemPatterns.json update (success pattern documentation) →
Validation → Re-run checks →
ONLY continue after 100% clean
```

**Tool-Context Loop**: MCP auto-enriches files with reusable patterns.

**MCP Filesystem Operations**:
- `mcp3_read_text_file` - Atomic JSON reads with error handling
- `mcp3_write_file` - Schema-validated JSON writes
- `mcp3_edit_file` - Precision line-based updates
- `mcp3_get_file_info` - File integrity verification
- `mcp3_list_directory` - Memory-bank structure scanning

**Cross-Session Learning**:
- @mcp:memory → Unlimited local pattern storage
- @mcp:byterover-mcp → Cloud-based cross-project intelligence
- Automatic pattern recognition and reuse
- Constitutional precedent establishment

**Real-Time Context Enrichment**:
- @mcp:context7 → Official documentation integration
- @mcp:fetch → External resource retrieval
- @mcp:git → Version control context
- @mcp:sequential-thinking → Complex problem decomposition
- @mcp:time → Temporal awareness for scheduling
- **mermaid.json → Real-time progress flow visualization** (Constitutional/MCP/Metrics diagrams)

### Constitutional Compliance

**Attention Budget Management**:
- Dynamic rebalancing based on task complexity
- n² degradation monitoring and prevention
- Signal-to-noise optimization
- Context rot early detection and remediation

**Schema Validation Framework**:
- MANDATORY validation against `.windsurf/memory-bank/schemas/*.schema.json`
- Zero-tolerance for malformed data structures
- Automatic rollback on validation failures
- Immutable event stream preservation

**Quality Gates**:
- Pre-implementation scanning and validation
- Real-time execution monitoring
- Post-implementation verification
- Continuous health checking and optimization

**Emergency Protocols**:
- Automatic context cleanup on corruption detection
- Rollback to last known good state
- Emergency schema reconstruction
- Constitutional compliance restoration
