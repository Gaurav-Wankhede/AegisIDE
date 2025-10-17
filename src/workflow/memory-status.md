---
description: Knowledge graph health audit
---

# /memory-status — Graph Audit

## 1. Load Router & Query Graph

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']

# Query metadata
metadata = @mcp:json-jq query '$' from f"{memory_bank}memory.json"
```

## 2. Health Metrics

```python
# Compute with Python eval()
entity_density = entities / total_nodes
orphaned_nodes = count(no_relations)
compliance_score = validation_pass / total_checks
```

## 3. Audit & Report

1. `@mcp:memory` → Retrieve full metadata
2. `@mcp:sequential-thinking` → Plan remediation if issues
3. `@mcp:filesystem` → Validate against schema
4. `@mcp:context7` → Fetch ontology updates if drift
5. `@mcp:git` → Commit if repairs made

**RL**: +5 healthy (≥90%) | -10 issues found

---
**Lines**: ~40 | **Threshold**: ≥80% compliance
