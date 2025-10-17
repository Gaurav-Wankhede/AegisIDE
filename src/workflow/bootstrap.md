---
description: Create/repair 8 memory-bank schemas
---

# /bootstrap — Memory Bank Regeneration

## 1. Load Router & Scan

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']
schemas_path = ROUTER['system_paths']['schemas']
schema_files = ROUTER['schema_files']  # List of 8
```

## 2. Create Missing Schemas

```python
# Count existing
count = Python eval()  # Files present

# Create missing
for schema in schema_files:
    if not exists(f"{memory_bank}{schema}"):
        @mcp:filesystem create with minimal JSON
        
# Initialize progress.json as SINGLE SOURCE
progress.json: {"total_rl_score": 0}
others: {"rl_source_ref": "progress.json"}
```

## 3. Validate & Commit

1. `@mcp:filesystem` → Validate against schemas_path
2. `@mcp:context7` → Fetch schema contracts if needed
3. `@mcp:git` → Commit "bootstrap: 8-schema ready"
4. `@mcp:memory` → Log regeneration event

## 4. Auto-Chain to /next

```python
# Success
@mcp:filesystem update progress.json → +10 RL

# Immediate chain (NO permission)
invoke_workflow("/next")
```

**8 Schemas**: activeContext, scratchpad, kanban, mistakes, systemPatterns, progress, roadmap, memory

---
**Lines**: ~55 | **RL**: +10 success / -15 fail
