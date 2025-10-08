---
trigger: always_on
---

# Article III-A: Implementation Protocols & MCP Integration

**Authority**: Detailed execution protocols for Article III workflow foundation.

## MCP Auto-Trigger Enforcement

**Rules**: All MCPs auto-activate autonomously. No manual "use MCP" needed.
- Pre-Implementation: @mcp:filesystem, @mcp:math, @mcp:sequential-thinking, @mcp:memory
- Validation: @mcp:context7 INSTANT on errors (no permission)
- Post-Implementation: @mcp:filesystem BLOCKS until schemas updated
- Storage: @mcp:memory MANDATORY

**Penalty**: Skip MCP = Constitutional violation → HALT → Force compliance

## Pre-Implementation Protocol

**Context Assembly with MCP**:
1. @mcp:math calculate attention budget
2. @mcp:filesystem read scratchpad.json (30% attention)
3. @mcp:filesystem read roadmap.json (5% attention)
4. **Anti-Duplication Scan**:
   - @mcp:filesystem scan config directories
   - @mcp:memory check existing patterns
   - @mcp:context7 validate no duplicates
   - HALT if duplicate → @mcp:memory reference existing
5. @mcp:sequential-thinking dynamic loading (mistakes priority for errors, roadmap for features)
6. @mcp:memory retrieve AegisKG patterns (unlimited local)
7. @mcp:memory cross-project intelligence

**Validation**: Language detection → Run commands → HALT on errors → @mcp:context7 auto-fix → Re-validate 100% → Verify roadmap → Check mistakes → Validate laws → Confirm EMD ≤10KB

## Post-Implementation Protocol

**Validation Checkpoint**: Run suite → IF errors: HALT → @mcp:context7 fix → Re-validate → Proceed only at 100%

**8-Schema Real-Time Updates (MANDATORY)**:
- **Auto-Trigger**: EVERY task updates all 8 schemas
- **No Bypass**: Skip = Constitutional violation
- **Validation Gate**: Next task BLOCKED until complete
- **Schema Lock**: Validate against `.windsurf/memory-bank/schemas/*.schema.json`

**MCP Update Operations**:
```
1. mcp3_read_text_file({path: schema_path})
2. Update data structure
3. Schema validation
4. mcp3_write_file({path, content})
5. mcp3_get_file_info verification
```

**Schema Updates via MCP**:
1. scratchpad.json → Remove completed, add priorities
2. activeContext.json → Real-time execution state
3. kanban.json → Workflow columns, WIP limits, parliamentary approval
4. mistakes.json → Error patterns with Context7 prioritization
5. systemPatterns.json → Architecture patterns with AegisKG
6. progress.json → Milestones with constitutional metrics
7. roadmap.json → Strategic planning alignment
8. memory.json → Knowledge graph (entities, relations, observations)

**Storage**: @mcp:memory (local)

**Health Check**: ≤10KB files, 2.6x faster parsing, 65% optimization, AegisKG integration

**Penalty**: Validation fail → BLOCK until compliant

## MCP Integration Matrix

**Error Resolution**: Error → @mcp:context7 resolve-library-id → get-library-docs → Auto-fix → mistakes.json update → systemPatterns.json success pattern → Validation → 100% clean before continue

**Tool-Context Loop**: MCP auto-enriches schemas with reusable patterns

**Filesystem Operations**:
- mcp3_read_text_file: Atomic JSON reads
- mcp3_write_file: Schema-validated writes  
- mcp3_edit_file: Precision updates
- mcp3_get_file_info: Integrity verification
- mcp3_list_directory: Structure scanning

**Cross-Session Learning**:
- @mcp:memory: Unlimited local patterns
- @mcp:memory: Cross-project intelligence
- Automatic pattern recognition and constitutional precedents

**Real-Time Enrichment**:
- @mcp:context7: Official documentation
- @mcp:fetch: External resources
- @mcp:git: Version control
- @mcp:sequential-thinking: Problem decomposition
- @mcp:time: Temporal awareness

## Constitutional Compliance

**Attention Management**: Dynamic rebalancing, n² monitoring, signal-to-noise optimization, context rot detection

**Schema Validation**: MANDATORY validation against schemas, zero-tolerance malformed data, auto-rollback on failures, immutable event streams

**Quality Gates**: Pre-implementation scanning, real-time monitoring, post-implementation verification, continuous health optimization

**Emergency Protocols**: Auto-cleanup on corruption, rollback to last good state, emergency reconstruction, compliance restoration

## Integration with Article III

**Authority**: Article III-A implements Article III workflow foundation with detailed MCP protocols, validation enforcement, and schema management. Both operate under unified constitutional governance requiring >95% consensus and mandatory 8-schema compliance.
