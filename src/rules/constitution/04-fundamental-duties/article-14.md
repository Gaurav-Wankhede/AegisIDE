---
trigger: always_on
part: IV-Fundamental-Duties
article: 14
category: schema_update_mandate
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 14: Duty to Update 8-Schema Memory Bank

## 1. Definition — Mandatory Schema Maintenance

Every citizen bears the **constitutional duty to update all 8 schemas atomically** after every task completion. The 8-schema memory bank (`activeContext`, `scratchpad`, `kanban`, `mistakes`, `systemPatterns`, `progress`, `roadmap`, `memory`) is the constitutional backbone; failure to update is sovereignty violation. Updates must be atomic (all-or-nothing), validated against JSON schemas, and checksum-verified.

**8 Essential Schemas**:
1. **activeContext.json** (≤10KB) - Real-time execution state, session management, MCP tracking
2. **scratchpad.json** (≤10KB) - Immediate priority queue, task descriptions
3. **kanban.json** (≤10KB) - Task workflow (todo/in_progress/done/approved columns)
4. **mistakes.json** (≤10KB) - Error patterns, prevention rules, RL penalties
5. **systemPatterns.json** (≤10KB) - Architecture patterns, successful solutions, RL rewards
6. **progress.json** (≤10KB) - RL central ledger, milestones, metrics
7. **roadmap.json** (≤10KB) - Strategic planning, dependencies, alignment
8. **memory.json** (≤10KB) - Knowledge graph, entities, relations, observations

**Update Requirements**: Atomic transaction (all 8 or rollback), JSON schema validation, file size enforcement (≤10KB), checksum verification, git commit, timestamp.

## 2. Powers — Schema Enforcement Authority

**IAS Field Officers**:
- Monitor schema updates in real-time
- Validate against `.aegiside/schemas/*.schema.json`
- Enforce atomic transaction requirement
- Verify checksums for data integrity
- Report violations to Cabinet Secretary

**Chief Justice**:
- HALT operations if schemas invalid
- Order rollback on failed updates
- Enforce schema compliance constitutionally
- Mandate remediation before resumption

**Shadow Cabinet**:
- Audit schema update quality
- Challenge incomplete updates
- Verify RL score accuracy
- Review knowledge graph integrity

## 3. Implementation — Atomic Update Protocol

**Mandatory Post-Task Update**:
```
1. Task Completion Detection:
   a. Code changes committed via @mcp:git
   b. Validation passed (Article 5)
   c. RL score assigned (Article 12)
   d. Learning extracted

2. Schema Preparation (Pre-Update):
   a. @mcp:filesystem → Read current 8 schemas
   b. @mcp:time → Get timestamp for updates
   c. @mcp:math → Calculate new RL scores
   d. @mcp:memory → Prepare knowledge graph updates
   e. Validate all changes in memory (not disk yet)

3. Atomic Write Transaction:
   a. BEGIN TRANSACTION
   b. @mcp:filesystem → Update activeContext.json
      - Remove completed task
      - Update MCP reward tracking
      - Refresh session state
   c. @mcp:filesystem → Update scratchpad.json
      - Remove completed task from priority [0]
      - Reorder remaining tasks
      - Add new tasks if generated
   d. @mcp:filesystem → Update kanban.json
      - Move task from in_progress → done
      - Update WIP limits
      - Recalculate workflow metrics
   e. @mcp:filesystem → Update mistakes.json (if errors occurred)
      - Add new error pattern
      - Link prevention rule
      - Update RL penalty ledger
   f. @mcp:filesystem → Update systemPatterns.json (if success)
      - Store new pattern or update existing
      - Increment reuse count
      - Update RL reward ledger
   g. @mcp:filesystem → Update progress.json (CRITICAL)
      - Add RL transaction to log
      - Update total_reward/total_penalty
      - Recalculate net_score
      - Verify checksum
   h. @mcp:filesystem → Update roadmap.json
      - Mark milestone progress
      - Update completion percentages
      - Adjust dependencies
   i. @mcp:filesystem → Update memory.json
      - @mcp:memory create_entities/relations/add_observations
      - Update RL pattern reuse ledger
      - Store task outcome
   j. IF all 8 succeed → COMMIT
   k. IF any fail → ROLLBACK all changes

4. Schema Validation:
   a. @mcp:filesystem → Read updated schemas
   b. Validate each against JSON schema:
      - activeContext against activeContext.schema.json
      - scratchpad against scratchpad.schema.json
      - ... (all 8)
   c. @mcp:math → Verify file sizes (≤10KB each)
   d. @mcp:math → Calculate checksums
   e. IF validation fails → ROLLBACK + HALT

5. Git Commit:
   a. @mcp:git add [all 8 schema files]
   b. @mcp:git commit -m "chore: update 8-schema memory bank post task-{id}"
   c. @mcp:time → Timestamp commit
   d. progress.json updated with commit hash

6. Verification:
   a. @mcp:filesystem → Re-read all 8 schemas
   b. Verify data integrity
   c. Check RL score checksum
   d. Confirm knowledge graph consistency
   e. IF verified → Proceed to next task
   f. IF failed → Emergency recovery via /continue
```

**Schema Validation Rules**:
```
Common Rules (All Schemas):
- Valid JSON format (strict parsing)
- schema_version field present
- last_updated timestamp within 1 minute
- File size ≤10KB
- Required fields present per schema definition

Specific Rules:
- progress.json: Checksum must match calculated total
- memory.json: Entity/relation IDs must be unique
- kanban.json: Tasks must reference valid proposal/milestone IDs
- mistakes.json: RL penalties must link to progress.json transactions
- systemPatterns.json: RL rewards must link to progress.json transactions
```

## 4. Violations — Schema Duty Negligence

**Update Failures**:
- Skipping schema update = -30 RL penalty + HALT + mandatory update + IAS audit
- Partial update (< 8 schemas) = -35 RL penalty + rollback + complete update required
- Failed atomic transaction = -25 RL penalty + restoration + investigation

**Validation Violations**:
- Invalid JSON = -20 RL penalty + fix required + validation training
- Schema mismatch = -25 RL penalty + correction + schema education
- File size exceeded (>10KB) = -15 RL penalty + data compression + optimization

**Data Integrity Breaches**:
- Checksum mismatch = -40 RL penalty + audit + data verification
- Corrupted knowledge graph = -45 RL penalty + restoration + tribunal
- RL score tampering = -50 RL penalty + rollback + citizenship revocation

**Remediation**: Complete 25 tasks with perfect 8-schema updates, achieve 100% validation pass rate, demonstrate atomic transaction understanding, pass IAS schema management certification, restore full duty rights after Chief Justice approval.

---

**Character Count**: 3,972 | **Schema References**: ALL 8 MANDATORY | **MCP Requirements**: filesystem (primary), time, math, memory, git
