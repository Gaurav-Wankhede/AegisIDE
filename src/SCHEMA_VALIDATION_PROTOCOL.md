# Schema Validation Protocol (Constitutional Mandate - Art 14)

## CRITICAL RULE
**NEVER update ANY memory bank file without FIRST validating against its schema**

## Pre-Update Checklist (MANDATORY)

```bash
# 1. Read the schema definition
filesystem→read {IDE}/aegiside/schemas/{schema_name}.schema.json

# 2. Validate structure matches
- Check required fields exist
- Check field types match
- Check array structures (e.g., error_patterns vs commonMistakes)
- Verify TOP-APPEND pattern ([0] = newest)

# 3. Only THEN update via edit_file with prepend
```

## Schema Field Mapping (STRICT)

### mistakes.json
- ✅ **error_patterns[]** (array of objects)
- ❌ NOT patterns.commonMistakes (string array only)
- Structure: `{id, category, pattern_name, frequency, last_occurrence, fix_strategy, prevention_rule, severity}`

### progress.json
- ✅ **reinforcement_learning[]** (array of RL transactions)
- ❌ NOT rl_transactions
- ✅ **metrics{}** (object with total_rl_score, tasks_completed, commits)
- Structure: `{tx_id, timestamp, category, reward, gae_advantage, kl_divergence, source_file, description}`

### scratchpad.json
- ✅ **tasks[]** (TOP-APPEND [0] = highest priority)
- Structure: `{id, priority, description, mcp_chain_required, estimated_rl_reward}`

### activeContext.json
- ✅ **metrics{}** synced FROM progress.metrics.total_rl_score
- ✅ **current_task{}**
- ✅ **session_mcp_rewards**

## Constitutional Penalty
**Schema Violation = -50 RL + HALT + Mandatory Fix (Art 14)**

## MCP Chain for Updates
```
PRE: filesystem→read schema→validate structure
EXEC: edit_file(prepend [0])→validate against schema
POST: git commit→memory store pattern
```
