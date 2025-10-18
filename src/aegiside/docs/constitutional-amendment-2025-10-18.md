# Constitutional Amendment: Router Tunnel System & jq Access Pattern

**Date**: 2025-10-18T01:24:00+05:30  
**Amendment Type**: Universal Application  
**Scope**: All 42 Articles

---

## Amendment Summary

This amendment updates ALL constitutional articles to:
1. Reference **context-router.json** as the single source of truth
2. Clarify **@mcp:json-jq** for READ operations only
3. Clarify **jq terminal** for UPDATE operations only
4. Clarify **@mcp:filesystem** for DELETE/WRITE (new files only)
5. Replace @mcp:time and @mcp:math with **manual functions**

---

## Router Tunnel System

### Before (Hardcoded):
```python
@mcp:filesystem read "{IDE}/aegiside/memory-bank/scratchpad.json"
@mcp:filesystem write "{IDE}/aegiside/memory-bank/progress.json"
```

### After (Router-Based):
```bash
# READ with @mcp:json-jq or jq terminal (100x faster)
memory_bank=$(jq -r '.system_paths.memory_bank' context-router.json)
task=$(jq -r '.priority_queue[0]' "$memory_bank"scratchpad.json)

# UPDATE with jq terminal (80x faster, atomic)
jq '.total_rl_score += 20' "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
```

---

## JSON Access Pattern

### READ JSON (97% Context Savings)
**Method**: `@mcp:json-jq` ONLY  
**Performance**: ~5ms per query (100x faster)

```python
# Single read
task = @mcp:json-jq query '$.priority_queue[0]' from 'scratchpad.json'

# Parallel reads
(
  @mcp:json-jq query '$.priority_queue[0]' from 'scratchpad.json' &
  @mcp:json-jq query '$.total_rl_score' from 'progress.json' &
  wait
)
```

### UPDATE JSON (Atomic)
**Method**: `jq terminal` ONLY  
**Performance**: ~10-15ms per update (80x faster)  
**Pattern**: ALWAYS use temp file + mv

```bash
# Single update
jq '.field = value' file.json > temp.json && mv temp.json file.json

# Array prepend (top-append)
jq '.array = [$new] + .array | .array |= .[:100]' file.json > temp.json && mv temp.json file.json

# Parallel updates
(
  jq '.field1 = value1' file1.json > temp1.json && mv temp1.json file1.json &
  jq '.field2 = value2' file2.json > temp2.json && mv temp2.json file2.json &
  wait
)
```

### DELETE JSON
**Method**: `@mcp:filesystem` ONLY (entire files)  
**For keys**: Use jq terminal `del()` function

### WRITE JSON
**Method**: `@mcp:filesystem` ONLY (new files)  
**For modifications**: Use jq terminal UPDATE pattern

---

## Manual Functions

### Time (NO @mcp:time)
```bash
# Terminal command
date '+%Y-%m-%dT%H:%M:%S%z'
```

### Math (NO @mcp:math)
```python
# Python eval
consensus = python3 -c "print((exec*0.3) + (admin*0.3) + (opp*0.3) + (jud*0.1))"
```

---

## Articles Requiring Amendment

### Critical (Schema & MCP Usage):
- Article 13: MCP Usage Mandate → Add jq terminal pattern
- Article 14: Schema Update Duty → Replace filesystem with jq terminal
- Article 17: Pattern Application → Update with jq queries
- Article 18: Documentation Duty → Add jq trail logging

### Parliamentary (Decision Making):
- Article 26-31: Parliament operations → jq terminal for consensus updates

### Executive (Implementation):
- Article 32-35: Executive operations → Router-based execution

### Judicial (Enforcement):
- Article 36-38: Judicial review → jq terminal for precedent storage

### Rights & Duties:
- Article 4-12: Fundamental rights → Router-based autonomy
- Article 15-19: Remaining duties → jq pattern compliance

### DPSP (Optimization):
- Article 20-25: Performance directives → jq terminal for metrics

### Bodies:
- Article 39-42: IAS, Shadow Cabinet → jq terminal for audits

---

## Performance Impact

| Operation | Before (@mcp:filesystem) | After (jq terminal) | Speedup |
|-----------|-------------------------|---------------------|---------|
| Read field | ~500ms | ~5ms | 100x |
| Update field | ~800ms | ~10ms | 80x |
| Parallel ops | Sequential | Simultaneous | N/A |

---

## RL Penalties (NEW)

- Using @mcp:filesystem for JSON read: **-15 RL**
- Using @mcp:filesystem for JSON update: **-25 RL**
- Bypassing atomic pattern (temp + mv): **-30 RL**

---

## Implementation Timeline

1. ✅ Update context-router.json with json_access_rules
2. ✅ Update global_rules.md with READ/UPDATE/DELETE/WRITE pattern
3. ✅ Update all 12 workflows with correct jq patterns
4. ✅ Create jq-crud-patterns.md helper
5. 🔄 Amend all 42 constitutional articles (IN PROGRESS)
6. ⏳ Update Article 14 implementation examples
7. ⏳ Update Article 13 MCP mandate examples
8. ⏳ Propagate to all remaining articles

---

**Status**: Amendment documentation complete, article updates in progress
