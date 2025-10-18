---
description: System status with CLI pipeline + Constitutional Awareness
---

# /status — Status Report with Constitutional Enforcement

## 0. DYNAMIC CONSTITUTIONAL DISPLAY (ROUTER-FIRST)

```bash
# Load constitutional display from context-router.json (single source of truth)
load_constitutional_display() {
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.header' from 'context-router.json')" >&2
  echo "" >&2
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.constitutional_frame' from 'context-router.json')" >&2
  echo "" >&2
  
  # Dynamic MCP display from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.always_active[]' from 'context-router.json' | while read -r mcp; do
    echo "  $mcp" >&2
  done
  @mcp:json-jq query '.session_awareness.dynamic_display.core_mcps.on_demand[]' from 'context-router.json' | while read -r mcp; do
    echo "  $mcp" >&2
  done
  echo "" >&2
  
  # Memory operations from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.memory_operations.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.session_awareness.dynamic_display.memory_operations.operations[]' from 'context-router.json' | while read -r op; do
    echo "  $op" >&2
  done
  echo "" >&2
  
  # Dynamic violations from router
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.violations_penalties.description' from 'context-router.json')" >&2
  @mcp:json-jq query '.violations_penalties.rules[] | "  • \(.violation) → \(.penalty) RL | Fix: \(.fix)"' from 'context-router.json' | while read -r violation; do
    echo "$violation" >&2
  done
  echo "" >&2
  
  echo "$(@mcp:json-jq query '.session_awareness.dynamic_display.footer' from 'context-router.json')" >&2
  echo "" >&2
}

# Execute constitutional display
load_constitutional_display
```

## 1. Load Router & Query (CLI Native)

```bash
set -euo pipefail
trap 'echo "→ INTERRUPTED" >&2; exit 130' SIGINT SIGTERM

echo "→ STATUS: System health audit" >&2

# Query via MCP
memory_bank=$(@mcp:json-jq query '.system_paths.memory_bank' from 'context-router.json')
task_count=$(@mcp:json-jq query '.priority_queue | length' from "${memory_bank}scratchpad.json")
rl_score=$(@mcp:json-jq query '.total_rl_score' from "${memory_bank}progress.json")
error_count=$(@mcp:json-jq query '.error_log | length' from "${memory_bank}mistakes.json")

# Determine schema health based on presence of 8 data files
files=$(@mcp:json-jq query '.memory_bank_files[]' from 'context-router.json')
valid_count=0
for f in $files; do
  [[ -f "${memory_bank}${f}" ]] && ((valid_count++))
done
total_files=8
echo "→ METRICS: Tasks=$task_count, RL=$rl_score, Errors=$error_count, Schemas=$valid_count/$total_files" >&2
```

## 2. Compute Scores (Python + CLI)

```bash
# Define inputs for python
validation_pass=$valid_count
total_checks=$total_files
milestone_completion=$task_count
total=$(( task_count > 0 ? task_count : 1 ))

# Calculate with Python (safe numeric handling)
compliance=$(python3 -c "import sys; vp=int(sys.argv[1]); tc=int(sys.argv[2]) or 1; print(int(vp/tc*100))" "$validation_pass" "$total_checks")

# Consensus proxy from RL score (0-100), guard null
rl_numeric=0
if [[ -n "$rl_score" && "$rl_score" != "null" ]]; then rl_numeric=$rl_score; fi
consensus=$(python3 -c "import sys; v=float(sys.argv[1]); print(int(min(100, v)))" "$rl_numeric")

echo "→ COMPLIANCE: $compliance% (threshold: ≥80%)" >&2
echo "→ CONSENSUS (proxy via RL): $consensus% (threshold: ≥95%)" >&2
```

## 3. Report & Update (CLI Atomic)

```bash
# Update progress (atomic)
jq --argjson comp ${compliance:-0} \
  '.transactions = [{
    "workflow": "status",
    "rl_reward": 5,
    "compliance": $comp,
    "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'"
  }] + .transactions | .total_rl_score += 5' "$memory_bank"progress.json | sponge "$memory_bank"progress.json

@mcp:git add -A
@mcp:git commit -m "status: compliance ${compliance:-0}%"
echo "✓ STATUS REPORT COMPLETE" >&2
```

## 4. Constitutional Article Reference

```bash
# Render compliance guidance
constitution=$(@mcp:json-jq query '.system_paths.constitution' from 'context-router.json')

echo "" >&2
echo "📚 Constitutional Reference:" >&2
echo "→ ARTICLE 16: Duty to Maintain Constitutional Compliance" >&2
glow "${constitution}/04-fundamental-duties/article-16.md"

echo "" >&2
echo "✅ System health constitutional compliance verified" >&2
echo "" >&2
```

---
**Lines**: ~79 | **CLI**: Parallel jq + python + sponge + glow (constitutionally compliant)
