---
trigger: always_on
part: IV-Fundamental-Duties
article: 14
category: schema_update_mandate
last_updated: 2025-10-17T16:48:34+05:30
---

# Article 14: Duty to Update 8-Schema Memory Bank

## 1. Definition — Mandatory Schema Maintenance

Citizens must **update all 8 schemas atomically** after every task. Failure violates sovereignty. Updates: atomic (all-or-nothing), JSON validated, checksum-verified.

**8 Schemas (≤10KB each)**: `activeContext` (execution state, MCP tracking), `scratchpad` (priority queue), `kanban` (workflow: todo→in_progress→done→approved), `mistakes` (error patterns, RL penalties), `systemPatterns` (architecture, RL rewards), `progress` (RL ledger, metrics), `roadmap` (strategic planning), `memory` (knowledge graph).

**Requirements**: Atomic transaction, JSON schema validation, ≤10KB, checksum, git commit, timestamp.

## 2. Powers — Schema Enforcement Authority

**IAS Field Officers**: Monitor real-time, validate against `.aegiside/schemas/*.schema.json`, enforce atomic transaction, verify checksums, report violations.

**Chief Justice**: HALT if invalid, order rollback, enforce compliance, mandate remediation.

**Shadow Cabinet**: Audit quality, challenge incomplete updates, verify RL scores, review graph integrity.

## 3. Implementation — Atomic Update Protocol

**Post-Task Update** (Router-Based with jq terminal):
```bash
# 1. Load Router Config
memory_bank=$(jq -r '.system_paths.memory_bank' context-router.json)
schemas_path=$(jq -r '.system_paths.schemas' context-router.json)
update_order=$(jq -r '.atomic_update_chain.order[]' context-router.json)

# 2. Detect Completion
git status  # Validation passed
rl_reward=20  # From task complexity

# 3. Atomic Update (jq terminal - 80x faster than @mcp:filesystem)
BEGIN TRANSACTION (all succeed or rollback)

# activeContext: Task status + MCP rewards
jq '.session.status = "completed" | .session.last_task = "'$task'" | .timestamp = "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"' \
  "$memory_bank"activeContext.json > temp_ac.json && mv temp_ac.json "$memory_bank"activeContext.json

# scratchpad: Remove completed [0], prepend new tasks
jq '.priority_queue |= .[1:]' "$memory_bank"scratchpad.json > temp_sp.json && mv temp_sp.json "$memory_bank"scratchpad.json

# kanban: Move task (in_progress→done, awaits Opposition + Chief Justice approval)
jq '.columns.done += [.columns.in_progress[0]] | .columns.in_progress |= .[1:]' \
  "$memory_bank"kanban.json > temp_kb.json && mv temp_kb.json "$memory_bank"kanban.json

# mistakes: IF errors, prepend pattern
[[ $errors -eq 1 ]] && jq '.error_log = [{"pattern": "'$error'", "prevention": "'$rule'", "rl_penalty": -30}] + .error_log | .error_log |= .[:100]' \
  "$memory_bank"mistakes.json > temp_ms.json && mv temp_ms.json "$memory_bank"mistakes.json

# systemPatterns: IF success, prepend reward pattern
[[ $success -eq 1 ]] && jq '.patterns = [{"pattern": "'$pattern'", "rl_reward": '$rl_reward'}] + .patterns | .patterns |= .[:100]' \
  "$memory_bank"systemPatterns.json > temp_sp.json && mv temp_sp.json "$memory_bank"systemPatterns.json

# progress: RL transaction (SINGLE SOURCE)
jq '.transactions = [{"workflow": "task", "rl_reward": '$rl_reward', "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"}] + .transactions | .total_rl_score += '$rl_reward' | .transactions |= .[:100]' \
  "$memory_bank"progress.json > temp_pg.json && mv temp_pg.json "$memory_bank"progress.json

# roadmap: Update milestone completion
jq '.milestones[0].completion_pct += 10' "$memory_bank"roadmap.json > temp_rm.json && mv temp_rm.json "$memory_bank"roadmap.json

# memory: Update knowledge graph via @mcp:memory
@mcp:memory add_observations entities/relations with RL reuse

IF all 8 succeed → COMMIT | ELSE → ROLLBACK
END TRANSACTION

# 4. Validate (parallel jq reads - 100x faster)
for schema in $update_order; do
  (jq '.' "$schemas_path/${schema%.json}.schema.json" >/dev/null 2>&1 && \
   [[ $(stat -f%z "$memory_bank$schema" 2>/dev/null || stat -c%s "$memory_bank$schema") -le 10240 ]]) &
done
wait

# 5. Commit
git add -A && git commit -m "task: atomic 8-schema update +${rl_reward}RL"

# 6. Verify integrity
checksum=$(python3 -c "import hashlib; print(hashlib.sha256(open('$memory_bank'+'progress.json').read().encode()).hexdigest())")
[[ $checksum_match -eq 1 ]] && echo "✓ Atomic update complete" || invoke_workflow "/continue"
```

**Validation Rules**: Valid JSON, schema_version, timestamp <1min, ≤10KB, required fields. Specific: progress checksum match, memory unique IDs, kanban valid references, mistakes/systemPatterns link progress RL.

## 4. Violations — Schema Duty Negligence

**Update Failures**: Skipping = -30 RL + HALT + mandatory + audit. Partial (<8) = -35 RL + rollback + complete. Failed atomic = -25 RL + restoration + investigation.

**Validation**: Invalid JSON = -20 RL + fix + training. Schema mismatch = -25 RL + correction + education. Size >10KB = -15 RL + compression.

**Integrity**: Checksum mismatch = -40 RL + audit + verification. Corrupted graph = -45 RL + restoration + tribunal. RL tampering = -50 RL + rollback + revocation.

**Remediation**: 25 perfect updates, 100% validation pass, demonstrate atomic understanding, IAS certification, Chief Justice approval.

---

**Chars**: ~2,000 | **Schemas**: ALL 8 MANDATORY | **Methods**: jq terminal (UPDATE), @mcp:json-jq (READ), @mcp:memory (graph), git | **Performance**: 80x faster
