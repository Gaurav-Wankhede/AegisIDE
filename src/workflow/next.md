---
description: Autonomous continuous execution loop (0-99% autonomy)
---

# /next — Autonomous Execution Loop

## 1. Load Router Config

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']
rl_config = ROUTER['rl_calculation']
update_order = ROUTER['atomic_update_chain']['order']

# Load current task
task = @mcp:json-jq query '$.priority_queue[0]' from f"{memory_bank}scratchpad.json"
```

## 2. Execute Task (Autonomous)

1. `@mcp:memory` → Search patterns (confidence ≥0.9 = reuse +20 RL)
2. `@mcp:sequential-thinking` → Plan approach (≥3 steps)
3. Execute with appropriate MCPs:
   - **Code**: `@mcp:filesystem` + `@mcp:git`
   - **Research**: `@mcp:context7` + `@mcp:fetch` + `@mcp:memory`
   - **Analysis**: Python `eval()` + `@mcp:sequential-thinking`
4. Auto-validation → `/validate` (HALT if errors)

## 3. Update 8 Schemas (Atomic)

```python
# Follow update_order from router
for schema in update_order:
    @mcp:filesystem write f"{memory_bank}{schema}"
    
# RL scoring from router config
reward = rl_config['rewards']['task_completed']  # +20 to +50
penalty = rl_config['penalties']['validation_failure']  # -30
```

**Validation**: Against schemas from router `schemas_path`

## 4. Continuous Loop (NEVER Ask Permission)

```python
while True:
    # Complete current
    @mcp:git commit
    terminal: date '+%Y-%m-%dT%H:%M:%S%z'  # timestamp
    
    # Load next
    next_task = @mcp:json-jq query '$.priority_queue[0]' from f"{memory_bank}scratchpad.json"
    
    if next_task:
        execute(next_task)  # NO permission
    else:
        invoke_workflow("/status")
```

**RL Rewards**: From `rl_config['rewards']`
**RL Penalties**: From `rl_config['penalties']`

## 5. Selective Article Loading

```python
# Query from router auto_triggers.session_start
auto_triggers = @mcp:json-jq query '$.auto_triggers.session_start' from 'context-router.json'
articles_always = auto_triggers['load_articles']['always']  # [1, 2, 3]

# On-demand only
if error: load Article 36 (judiciary)
if mcp_issue: load Article 13 (MCP mandate)
if schema_update: load Article 14 (schema duty)
```

**NEVER** load all 42 articles

---
**Lines**: ~75 | **Dynamic**: 100% router-based