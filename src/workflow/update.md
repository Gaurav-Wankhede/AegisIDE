---
description: 8-schema atomic synchronization
---

# /update — Manual Schema Sync

## 1. Load Router & Read All

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']
schemas_path = ROUTER['system_paths']['schemas']
update_order = ROUTER['atomic_update_chain']['order']

# Read all 8 schemas
for schema in update_order:
    @mcp:filesystem read f"{memory_bank}{schema}"
```

## 2. Validate & Update

```python
# Python eval() compute
file_sizes = check_sizes()  # each ≤10KB
compliance = calculate_compliance()  # ≥80%
array_integrity = verify_top_append()  # [0] newest

# Apply updates
for schema in update_order:
    # Prepend new entries at [0]
    # Trim if >100 entries
    # Update timestamps
    @mcp:filesystem write f"{memory_bank}{schema}"
```

## 3. Atomic Commit

1. `@mcp:filesystem` → Validate against schemas_path
2. IF issues → `@mcp:sequential-thinking` → Plan remediation
3. `@mcp:memory` → Store update event
4. Terminal `date` → Timestamp sync
5. `@mcp:git` → Commit "update: 8-schema sync"

**RL**: +8 success (1 per schema) | -20 validation fail

---
**Lines**: ~50 | **Top-Append**: Latest at [0]
