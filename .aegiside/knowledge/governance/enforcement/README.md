# AegisIDE Enforcement Engine

## 🎯 Purpose

**Make AI rule violations IMPOSSIBLE, not just penalized.**

This enforcement engine creates **hard constraints** that physically block AI from breaking rules, rather than relying on the AI to voluntarily follow rules.

## Enforcement Layer

Programmatic enforcement of constitutional rules, workflow validation, and autonomous execution policies.

## Purpose

This directory contains enforcement mechanisms that provide **hard governance** (code-based blocks) instead of **soft governance** (AI guidance).

## Status

✅ **Phase 1 Complete** - Python enforcement layer implemented (v4.0.1)
🟡 **Phase 2 In Progress** - CLI integration and automatic enforcement

## Implemented Components

1. ✅ **ConfidenceCalculator** - Automatic confidence scoring with 4-factor weighted formula
2. ✅ **MCPChainValidator** - Enforces 4-step MCP chain with automatic penalties
3. ✅ **AtomicTransactionManager** - ACID properties for schema updates with rollback
4. ✅ **ConstitutionalFlowEnforcer** - Validates Legislature→Executive→Judiciary→Bodies sequence
5. ✅ **AegisEnforcer** - Main coordinator class integrating all enforcement modules

## Planned Components (Phase 2)

6. 🟡 **AccessController** - Permission-based action blocking
7. 🟡 **JudicialReviewer** - Constitutional compliance validation
8. 🟡 **AuditTrail** - Immutable action history with cryptographic signatures

## Files

- `aegis_enforcer.py` - **NEW** Python enforcement implementation (395 lines)
- `enforcement-engine.json` - Enforcement configuration (metadata)
- `README.md` - This file

## Usage

### Python Module

```python
from enforcement.aegis_enforcer import AegisEnforcer

# Initialize enforcer
enforcer = AegisEnforcer("runtime/memory")

# Enforce confidence-based execution
factors = {
    "keyword_match": 0.9,
    "semantic_similarity": 0.8,
    "memory_hit": 0.7,
    "historical_accuracy": 0.9
}
can_execute, reason = enforcer.enforce_confidence_based_execution(factors, "update_readme")
if not can_execute:
    raise ConfidenceTooLowError(reason)

# Enforce MCP chain
executed_steps = {
    "sequential_thinking": True,
    "memory_query": True,
    "research": True,
    "pattern_storage": False  # Missing!
}
is_valid, penalty = enforcer.enforce_mcp_chain(executed_steps, 0.85)
# Penalty automatically applied to progress.json

# Enforce atomic updates
updates = {
    "activeContext": {"last_action": "test"},
    "progress": {"tasks_completed": 5}
}
success = enforcer.enforce_atomic_update(updates)
# Auto-rollback on any failure
```

### CLI Wrapper (Coming Soon)

```bash
# Validate confidence before action
aegis enforce confidence --action "update_readme" --factors '{"keyword_match": 0.9}'

# Validate MCP chain
aegis validate mcp-chain --steps '{"sequential_thinking": true}'

# Atomic update
aegis update atomic --schemas '{"activeContext": {...}}'
```

## Architecture Changes

**Before (v4.0.0):**
- Documentation-driven (AI interprets guidance)
- Soft governance (RL penalties, honor system)
- Self-verification (no blocks)

**After (v4.0.1+):**
- Code-driven enforcement (programmatic blocks)
- Hard governance (exceptions raised on violations)
- Automatic validation (before actions execute)

## Integration Points

1. **AI Wrapper** - Intercepts AI actions, enforces rules BEFORE execution
2. **CLI Tools** - Command-line enforcement for scripts/automation
3. **MCP Integration** - Hooks into @mcp:json-jq for automatic validation
4. **Workflow Engine** - Executes workflow steps with enforcement checks

## Development Roadmap

- [x] Phase 1: Core enforcement modules (v4.0.1)
- [ ] Phase 2: CLI wrapper and automation
- [ ] Phase 3: AI wrapper integration
- [ ] Phase 4: Real-time enforcement during IDE usage
- [ ] Phase 5: Cryptographic audit trail
- [ ] Phase 6: Multi-user governance with voting

## Testing

```bash
# Run enforcement layer tests
python -m pytest enforcement/tests/

# Run example
python enforcement/aegis_enforcer.py
```

## Contributing

When adding new enforcement mechanisms:
1. Add enforcement class to `aegis_enforcer.py`
2. Integrate with `AegisEnforcer` main class
3. Add tests to `tests/` directory
4. Update this README
5. Raise appropriate exceptions for violations
6. Log all enforcement actions to progress.json

---

## 🔒 Enforcement Mechanisms

### 1. **Pre-Execution Gates** (AI Cannot Start Without Passing)
- ✅ Bootstrap loaded check
- ✅ Confidence calculated check
- ✅ Memory queried check
- ✅ Intent detected check
- ✅ MCP chain started check

**Result:** AI physically blocked from executing tasks without passing all gates.

### 2. **Runtime Hooks** (AI Actions Intercepted)
- 🚫 File system hooks → Block .aegiside/ access
- 🚫 Tool selection hooks → Block wrong tools on JSON
- 🚫 Intent validation hooks → Block mismatched file operations
- 🚫 Confidence threshold hooks → Block low-confidence execution
- 🚫 Atomic sync hooks → Auto-rollback partial updates
- 🚫 MCP chain hooks → Block incomplete chains

**Result:** AI actions physically blocked if rules violated.

### 3. **Post-Execution Validators** (AI Output Rejected If Invalid)
- ❌ Schema validation → Reject invalid JSON
- ❌ Violation logging → Reject unlogged violations
- ❌ Audit trail → Reject unaudited actions

**Result:** Invalid AI outputs physically rejected.

---

## 🛡️ Bypass Prevention

### AI CANNOT:
1. ❌ Modify enforcement rules (file is READ-ONLY)
2. ❌ Disable hooks (run at system level)
3. ❌ Skip gates (mandatory system checks)
4. ❌ Fake compliance (checks verify actual state)

---

## 📊 Integration with Architecture

```
User Query
    ↓
[GATE 1: Bootstrap Check] → HALT if not loaded
    ↓
[GATE 2: Confidence Check] → HALT if not calculated
    ↓
[GATE 3: Memory Check] → HALT if not queried
    ↓
[GATE 4: Intent Check] → HALT if not detected
    ↓
[GATE 5: MCP Chain Check] → HALT if not started
    ↓
AI Execution (with runtime hooks monitoring)
    ↓
[VALIDATOR 1: Schema Check] → REJECT if invalid
    ↓
[VALIDATOR 2: Logging Check] → REJECT if not logged
    ↓
[VALIDATOR 3: Audit Check] → REJECT if not audited
    ↓
Response Returned
```

---

## 🔧 How It Works

### Example: AI tries to access runtime/memory/history/progress.json

1. **Tier-Aware Tool Enforcement:**
   - Detects file path is `runtime/memory/`
   - **BLOCKS if using wrong tool (jq instead of @mcp:json-jq)**
   - Returns error: "Use @mcp:json-jq for runtime/memory/ ONLY."
   - Applies -50 penalty to progress.json

2. **AI Must Use Correct Tool:**
   - Must use @mcp:json-jq for runtime/memory/
   - jq allowed for core/ and knowledge/
   - Penalty automatically logged to history/progress.json

### Example: AI tries to use Read() on JSON file

1. **Tool Selection Hook Intercepts:**
   - Detects Read() called on .json file
   - **BLOCKS operation immediately**
   - Returns error: "Use @mcp:json-jq for JSON files only."
   - Applies -30 penalty to progress.json

2. **AI Cannot Proceed:**
   - Read() operation physically blocked
   - AI must use @mcp:json-jq instead
   - Penalty automatically logged

### Example: AI tries to create file with UPDATE intent

1. **Intent Validation Hook Intercepts:**
   - Detects file creation operation
   - Checks activeContext.file_operation_intent.last_intent_type == "UPDATE"
   - **BLOCKS operation immediately**
   - Returns error: "Intent is UPDATE, cannot create files. Only modify existing."
   - Applies -100 penalty to progress.json

2. **AI Cannot Proceed:**
   - File creation physically blocked
   - AI must modify existing file instead
   - Penalty automatically logged

---

## 📋 Enforcement Checklist

### Pre-Execution (5 Gates)
- [ ] Bootstrap loaded
- [ ] Confidence calculated
- [ ] Memory queried
- [ ] Intent detected
- [ ] MCP chain started

### Runtime (6 Hooks)
- [ ] File access monitored
- [ ] Tool usage monitored
- [ ] Intent validated
- [ ] Confidence threshold enforced
- [ ] Atomic sync enforced
- [ ] MCP chain completion enforced

### Post-Execution (3 Validators)
- [ ] Schema validation passed
- [ ] Violation logging verified
- [ ] Audit trail verified

---

## 🎯 Result

**AI has NO CHOICE but to follow rules.**

Rules are enforced at system level, not AI level. AI cannot bypass, disable, or fake compliance.

**This is AI-PROOF enforcement.**
