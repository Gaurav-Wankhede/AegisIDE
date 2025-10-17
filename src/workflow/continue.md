---
description: Immediate recovery after interruption
---

# /continue — Session Recovery

## 1. Load Router & Check Integrity

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']

# Restore state
session = @mcp:json-jq query '$.session' from f"{memory_bank}activeContext.json"
queue = @mcp:json-jq query '$.priority_queue' from f"{memory_bank}scratchpad.json"
```

## 2. Validate 8 Schemas

```python
# Check integrity
for schema in ROUTER['schema_files']:
    @mcp:filesystem validate f"{memory_bank}{schema}"

# Calculate checkpoint
checkpoint = Python eval()  # Resume position
```

## 3. Reconstruct & Resume

1. `@mcp:memory` → Restore knowledge graph
2. `@mcp:git` → Verify clean working tree
3. Resume from checkpoint (NO re-execution)
4. Terminal `date` → Timestamp recovery

## 4. Auto-Chain to /next

```python
# Update activeContext
@mcp:filesystem write "resumed_from_checkpoint"

# Immediate chain (NO permission)
invoke_workflow("/next")
```

**RL**: +5 recovery (from router) | -10 if fails

---
**Lines**: ~50 | **Auto-chain**: Immediate
