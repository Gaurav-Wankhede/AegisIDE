---
description: Intelligence dossier with free-tier optimization
---

# /research — Intelligence Gathering

## 1. Load Router & Task

```python
ROUTER = @mcp:json-jq query '$' from 'context-router.json'
memory_bank = ROUTER['system_paths']['memory_bank']

# Load summaries only
task_title = @mcp:json-jq query '$.priority_queue[0].title' from f"{memory_bank}scratchpad.json"
```

## 2. Research Chain

1. `@mcp:context7` → Fetch official documentation (resolve-library-id first)
2. `@mcp:exa` → Latest research papers, cutting-edge techniques
3. `@mcp:fetch` → Gather benchmarks, pricing (free-tier priority)
4. `@mcp:memory` → Retrieve historical patterns
5. `@mcp:sequential-thinking` → Structure analysis, synthesize findings

## 3. Analysis & Dossier

```python
# Compute with Python eval()
performance_curves = calculate_metrics()
cost_projections = estimate_costs()
roi_estimates = analyze_roi()

# Write dossier
@mcp:filesystem write systemPatterns.json {
    executive_summary,
    benchmarks,
    resource_footprint,
    security_assessment,
    mcp_evidence_trail
}
```

## 4. Validate & Store

1. Terminal `date` → Timestamp research
2. `@mcp:filesystem` → Validate schemas
3. `@mcp:git` → Commit "research: [topic] assessment"
4. `@mcp:memory` → Store findings

**RL**: +10 complete dossier | -15 unverified sources

---
**Lines**: ~55 | **Priority**: Free-tier solutions
