# Centralized RL Scoring System

## Overview

The **centralized RL scoring system** uses `progress.json` as the **single source of truth** for all reward/penalty tracking, with automatic validation and balance checking across the Memory Bank.

---

## Central Ledger: progress.json

### Location
```
.windsurf/aegiside/memory-bank/progress.json
```

### Structure

```json
{
  "schema_version": "1.0.0",
  "last_updated": "2025-10-13T12:30:00+05:30",
  
  "reinforcement_learning_ledger": {
    "total_score": 285,
    "session_score": 135,
    "lifetime_score": 2847,
    
    "rewards": {
      "total_earned": 450,
      "session_earned": 195,
      "lifetime_earned": 5230,
      "by_category": {
        "constitutional_compliance": 200,
        "successful_validation": 120,
        "autonomous_recovery": 80,
        "zero_duplication": 50
      }
    },
    
    "penalties": {
      "total_incurred": -165,
      "session_incurred": -60,
      "lifetime_incurred": -2383,
      "by_category": {
        "file_creation_violation": -20,
        "validation_failure": -80,
        "mcp_omission": -45,
        "unused_variables": -20
      }
    },
    
    "metrics": {
      "learning_efficiency": 73.2,
      "actions_total": 45,
      "actions_successful": 33,
      "actions_failed": 12,
      "success_rate": 73.3,
      "autonomy_level": 97.85
    },
    
    "checksum_validation": {
      "calculated_total": 285,
      "stored_total": 285,
      "is_valid": true,
      "last_validated": "2025-10-13T12:30:00+05:30"
    }
  },
  
  "transaction_log": [
    {
      "id": "tx-1697181000",
      "timestamp": "2025-10-13T12:24:00+05:30",
      "type": "reward",
      "category": "zero_duplication",
      "points": 25,
      "action": "Updated test_naukri_20_validation.py instead of creating new",
      "source_file": "mistakes.json",
      "running_total": 285,
      "verified": true
    },
    {
      "id": "tx-1697180940",
      "timestamp": "2025-10-13T12:23:00+05:30",
      "type": "penalty",
      "category": "file_creation_violation",
      "points": -10,
      "action": "Attempted to create duplicate test_naukri_unified_20.py",
      "source_file": "mistakes.json",
      "running_total": 260,
      "verified": true
    }
  ]
}
```

---

## Automatic Checks & Balances

### 1. Transaction Verification

**Every reward/penalty goes through 5-step verification:**

```python
def record_transaction(action, points, category):
    # Step 1: Validate transaction
    if not is_valid_category(category):
        raise ValidationError("Invalid category")
    
    # Step 2: Calculate new total
    new_total = current_total + points
    
    # Step 3: Cross-reference with source
    verify_in_source_file(action, category)
    
    # Step 4: Update ledger
    update_progress_json(transaction)
    
    # Step 5: Checksum validation
    validate_checksum()
```

### 2. Checksum Calculation

**Automatic validation every update:**

```json
{
  "checksum_validation": {
    "calculated_total": "sum(all_rewards) - sum(all_penalties)",
    "stored_total": "current total_score value",
    "is_valid": "calculated_total == stored_total",
    "last_validated": "ISO 8601 timestamp"
  }
}
```

**If mismatch detected**: 
- HALT all operations
- Trigger audit workflow
- Rollback to last known good state
- Log discrepancy in `mistakes.json`

### 3. Cross-File Validation

**Every transaction must have matching entry in source file:**

| Transaction Type | Source File | Validation Rule |
|-----------------|-------------|-----------------|
| Constitutional Compliance | `systemPatterns.json` | Pattern must exist with success count |
| Validation Success/Failure | `mistakes.json` | Error pattern must exist (if penalty) |
| Autonomous Recovery | `mistakes.json` | Must have `resolved: true` |
| File Creation Violation | `mistakes.json` | Must have `category: "constitutional_violation"` |
| MCP Integration | `activeContext.json` | MCP chain must be logged |
| Pattern Reuse | `memory.json` | Entity/observation must exist |

### 4. Balance Reconciliation

**Runs automatically every 10 transactions or hourly:**

```python
def reconcile_balance():
    # Aggregate from all source files
    mistakes_total = sum_penalties_from_mistakes_json()
    patterns_total = sum_rewards_from_patterns_json()
    mcp_total = sum_rewards_from_active_context()
    
    # Calculate expected total
    expected = mistakes_total + patterns_total + mcp_total
    
    # Compare with ledger
    actual = progress_json["total_score"]
    
    if expected != actual:
        trigger_audit()
        log_discrepancy()
        request_manual_review()
```

---

## Data Flow Architecture

```
┌─────────────────────────────────────────────────────┐
│                     ACTION                          │
│              (LLM makes decision)                   │
└─────────────────┬───────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────────────┐
│              OUTCOME EVALUATION                     │
│    (Constitutional compliance checked)              │
└─────────────────┬───────────────────────────────────┘
                  │
                  ▼
┌─────────────────────────────────────────────────────┐
│           REWARD/PENALTY ASSIGNMENT                 │
│         (Based on RL framework tables)              │
└─────────────────┬───────────────────────────────────┘
                  │
        ┌─────────┴─────────┐
        │                   │
        ▼                   ▼
┌──────────────┐    ┌──────────────┐
│ SOURCE FILE  │    │  PROGRESS    │
│  (Detail)    │◄──►│  (Ledger)    │
│              │    │              │
│ mistakes.json│    │ Transaction  │
│ patterns.json│    │   logged     │
│ memory.json  │    │ Checksum calc│
│ context.json │    │ Balance check│
└──────────────┘    └──────┬───────┘
                           │
                           ▼
                  ┌────────────────┐
                  │   VALIDATION   │
                  │  Cross-check   │
                  │   Reconcile    │
                  │    Verify      │
                  └────────┬───────┘
                           │
                  ┌────────┴────────┐
                  │                 │
                  ▼                 ▼
             ✅ VALID          ❌ INVALID
        (Continue ops)      (HALT + Audit)
```

---

## Storage Schema: progress.json

### Complete Schema Definition

```json
{
  "$schema": "http://json-schema.org/draft-07/schema#",
  "type": "object",
  "required": ["schema_version", "reinforcement_learning_ledger"],
  "properties": {
    "schema_version": {"type": "string"},
    "last_updated": {"type": "string", "format": "date-time"},
    
    "reinforcement_learning_ledger": {
      "type": "object",
      "required": ["total_score", "rewards", "penalties", "metrics", "checksum_validation"],
      "properties": {
        "total_score": {"type": "number"},
        "session_score": {"type": "number"},
        "lifetime_score": {"type": "number"},
        
        "rewards": {
          "type": "object",
          "properties": {
            "total_earned": {"type": "number", "minimum": 0},
            "session_earned": {"type": "number", "minimum": 0},
            "lifetime_earned": {"type": "number", "minimum": 0},
            "by_category": {
              "type": "object",
              "patternProperties": {
                "^[a-z_]+$": {"type": "number", "minimum": 0}
              }
            }
          }
        },
        
        "penalties": {
          "type": "object",
          "properties": {
            "total_incurred": {"type": "number", "maximum": 0},
            "session_incurred": {"type": "number", "maximum": 0},
            "lifetime_incurred": {"type": "number", "maximum": 0},
            "by_category": {
              "type": "object",
              "patternProperties": {
                "^[a-z_]+$": {"type": "number", "maximum": 0}
              }
            }
          }
        },
        
        "metrics": {
          "type": "object",
          "properties": {
            "learning_efficiency": {"type": "number", "minimum": 0, "maximum": 100},
            "actions_total": {"type": "integer", "minimum": 0},
            "actions_successful": {"type": "integer", "minimum": 0},
            "actions_failed": {"type": "integer", "minimum": 0},
            "success_rate": {"type": "number", "minimum": 0, "maximum": 100},
            "autonomy_level": {"type": "number", "minimum": 0, "maximum": 100}
          }
        },
        
        "checksum_validation": {
          "type": "object",
          "required": ["calculated_total", "stored_total", "is_valid"],
          "properties": {
            "calculated_total": {"type": "number"},
            "stored_total": {"type": "number"},
            "is_valid": {"type": "boolean"},
            "last_validated": {"type": "string", "format": "date-time"}
          }
        }
      }
    },
    
    "transaction_log": {
      "type": "array",
      "maxItems": 1000,
      "items": {
        "type": "object",
        "required": ["id", "timestamp", "type", "category", "points", "running_total"],
        "properties": {
          "id": {"type": "string", "pattern": "^tx-[0-9]+$"},
          "timestamp": {"type": "string", "format": "date-time"},
          "type": {"enum": ["reward", "penalty"]},
          "category": {"type": "string"},
          "points": {"type": "number"},
          "action": {"type": "string"},
          "source_file": {"type": "string"},
          "running_total": {"type": "number"},
          "verified": {"type": "boolean"}
        }
      }
    }
  }
}
```

---

## Integration with Other Memory Bank Files

### 1. mistakes.json → progress.json
```json
{
  "error_patterns": [{
    "penalty": -10,
    "occurred_at": "2025-10-13T12:23:00+05:30"
  }]
}
```
**Triggers**: Create penalty transaction in `progress.json`

### 2. systemPatterns.json → progress.json
```json
{
  "successful_patterns": [{
    "success_count": 15,
    "reward_accumulated": 375
  }]
}
```
**Triggers**: Create reward transaction in `progress.json`

### 3. memory.json → progress.json
```json
{
  "entities": [{
    "observations": ["Pattern successfully applied"]
  }]
}
```
**Triggers**: Pattern reuse reward (+20) in `progress.json`

### 4. activeContext.json → progress.json
```json
{
  "mcp_integration": {
    "calls_made": ["filesystem", "memory", "git"]
  }
}
```
**Triggers**: MCP integration reward (+10) in `progress.json`

---

## Audit Trail & Compliance

### 1. Immutable Transaction Log

Every transaction gets unique ID and cannot be modified:
```
tx-{unix_timestamp}
```

### 2. Audit Workflow

**Triggered automatically when:**
- Checksum validation fails
- Cross-file mismatch detected
- Manual audit requested
- Weekly compliance check

**Process:**
1. Freeze all scoring operations
2. Export all memory bank files
3. Recalculate from transaction log
4. Identify discrepancy source
5. Apply correction with audit entry
6. Resume operations

### 3. Compliance Reports

**Generated automatically:**
- Daily summary in `progress.json`
- Weekly report in `roadmap/roadmap.md`
- Monthly analytics in dashboard

---

## Query & Analytics API

### Get Current Score
```python
def get_current_score():
    return progress_json["reinforcement_learning_ledger"]["total_score"]
```

### Get Category Breakdown
```python
def get_category_breakdown():
    return {
        "rewards": progress_json["rewards"]["by_category"],
        "penalties": progress_json["penalties"]["by_category"]
    }
```

### Get Learning Efficiency
```python
def get_learning_efficiency():
    return progress_json["metrics"]["learning_efficiency"]
```

### Get Transaction History
```python
def get_transactions(limit=10, category=None):
    log = progress_json["transaction_log"]
    if category:
        log = [t for t in log if t["category"] == category]
    return log[-limit:]
```

---

## Visual Dashboard Integration

### Real-Time Scoring Display

```html
<div class="rl-score-widget">
  <h3>Reinforcement Learning Score</h3>
  <div class="total-score">+285</div>
  <div class="breakdown">
    <span class="rewards">+450 rewards</span>
    <span class="penalties">-165 penalties</span>
  </div>
  <div class="efficiency">73.2% learning efficiency</div>
  <div class="trend">↗ +35 this session</div>
</div>
```

**Data Source**: `progress.json` polled every 5 seconds

---

## Error Recovery

### Checksum Mismatch
```
1. HALT operations
2. Load last valid checkpoint
3. Replay transactions from checkpoint
4. Identify corrupted transaction
5. Log to mistakes.json
6. Resume with corrected state
```

### Missing Transaction
```
1. Scan all source files
2. Identify unrecorded rewards/penalties
3. Create recovery transactions
4. Validate checksums
5. Update progress.json
6. Log recovery action
```

### File Corruption
```
1. Restore from git history
2. Recalculate scores from transaction log
3. Validate against source files
4. Apply corrections
5. Create corruption incident report
```

---

## Best Practices

### 1. Single Writer Pattern
Only the RL scoring module writes to `progress.json`, preventing race conditions.

### 2. Atomic Updates
All updates wrapped in transaction to ensure consistency.

### 3. Regular Backups
`progress.json` backed up to git after every 10 transactions.

### 4. Validation First
Always validate before recording to prevent corruption.

### 5. Transparent Logging
Every change logged with timestamp and source for full traceability.

---

## Conclusion

The **centralized RL scoring system** in `progress.json` provides:

✅ **Single source of truth** for all scores  
✅ **Automatic checks & balances** via checksums  
✅ **Cross-file validation** ensuring consistency  
✅ **Immutable audit trail** for compliance  
✅ **Real-time analytics** for optimization  
✅ **Error recovery** with git integration  

**Result**: A robust, transparent, and tamper-proof system for tracking AI learning progress.
