---
description: Autonomous continuous execution loop (0-99% autonomy)
---

# /next — Autonomous Execution Loop

## 1. Load Router Config (Terminal jq)

```bash
# Read entire router config
ROUTER=$(jq '.' context-router.json)
memory_bank=$(echo "$ROUTER" | jq -r '.system_paths.memory_bank')
rl_config=$(echo "$ROUTER" | jq '.rl_calculation')
update_order=$(echo "$ROUTER" | jq -r '.atomic_update_chain.order[]')

# Load current task (jq query - FASTEST)
task=$(jq '.priority_queue[0]' "$memory_bank"scratchpad.json)
```

## 2. Execute Task (Autonomous)

1. `@mcp:memory` → Search patterns (confidence ≥0.9 = reuse +20 RL)
2. `@mcp:sequential-thinking` → Plan approach (≥3 steps)
3. Execute with appropriate MCPs:
   - **Code**: `@mcp:filesystem` + `@mcp:git`
   - **Research**: `@mcp:context7` + `@mcp:fetch` + `@mcp:memory`
   - **Analysis**: Python `eval()` + `@mcp:sequential-thinking`
4. Auto-validation → `/validate` (HALT if errors)

## 3. Update 8 Schemas (Terminal jq - Atomic)

```bash
# Follow update_order from router
for schema in $update_order; do
    # Read current
    current=$(jq '.' "$memory_bank$schema")
    
    # Update with jq (prepend to array[0])
    jq --arg new_data "$data" '.array = [$new_data] + .array | .array |= .[:100]' \
       "$memory_bank$schema" > temp.json && mv temp.json "$memory_bank$schema"
done

# RL scoring from router
reward=$(echo "$rl_config" | jq -r '.rewards.task_completed')  # +20 to +50
penalty=$(echo "$rl_config" | jq -r '.penalties.validation_failure')  # -30
```

**Validation**: Against schemas from router `schemas_path`

## 4. Continuous Loop (NEVER Ask Permission)

```bash
while true; do
    # Complete current
    git commit -m "task: complete"
    date '+%Y-%m-%dT%H:%M:%S%z'  # timestamp
    
    # Load next (jq is FASTEST)
    next_task=$(jq '.priority_queue[0]' "$memory_bank"scratchpad.json)
    
    if [[ -n "$next_task" ]]; then
        execute "$next_task"  # NO permission
    else
        invoke_workflow "/status"
    fi
done
```

**RL Rewards**: From `rl_config.rewards`
**RL Penalties**: From `rl_config.penalties`

## 5. Selective Article Loading (jq Query)

```bash
# Query from router auto_triggers.session_start
auto_triggers=$(jq '.auto_triggers.session_start' context-router.json)
articles_always=$(echo "$auto_triggers" | jq -r '.load_articles.always[]')  # [1, 2, 3]

# On-demand only
if [[ -f "package.json" ]]; then
    law=$(echo "$auto_triggers" | jq -r '.detection_logic["package.json"]')
    # Load law dynamically
fi

# Error handling
if [[ $error -eq 1 ]]; then
    # Load Article 36 (judiciary) from router constitution path
    constitution=$(jq -r '.system_paths.constitution' context-router.json)
    cat "$constitution/08-judiciary/article-36.md"
fi
```

**NEVER** load all 42 articles

---
**Lines**: ~78 | **Dynamic**: 100% router + terminal jq
