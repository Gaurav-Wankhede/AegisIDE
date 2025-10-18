#!/bin/bash
# Weekly RL feedback loop - Adjust trigger sensitivity based on effectiveness
set -euo pipefail

echo "→ RL FEEDBACK: Weekly trigger sensitivity adjustment" >&2

memory_bank="${1:-.aegiside/memory-bank}"

# 1. Aggregate article_selection_history from past week
week_ago=$(date -d '7 days ago' '+%Y-%m-%dT%H:%M:%S%z' 2>/dev/null || date -v-7d '+%Y-%m-%dT%H:%M:%S%z')

echo "→ ANALYZE: Article selections since $week_ago" >&2

# 2. Calculate per-article effectiveness
jq --arg week_ago "$week_ago" '
# Filter selections from past week
(.article_selection_history // []) as $history |
($history | map(select(.timestamp >= $week_ago))) as $recent |

# Calculate effectiveness per article
($recent | group_by(.articles_loaded[]) | 
 map({
   article: .[0].articles_loaded[0],
   invocations: length,
   successful: map(select(.outcome == "success")) | length,
   effectiveness: (map(select(.outcome == "success")) | length) / length,
   avg_accuracy: (map(.selection_accuracy // 0) | add / length)
 })) as $metrics |

# Update article_effectiveness
.article_effectiveness = ($metrics | map({(.article): {
  invocations: .invocations,
  successful_applications: .successful,
  effectiveness: .effectiveness,
  last_updated: now | todate
}}) | add // {}) |

# Adjust trigger_sensitivity based on effectiveness
.trigger_sensitivity = {
  autonomy: (
    if ($metrics | map(select(.article | startswith("article-4") or startswith("article-6"))) | .[0].effectiveness // 0.7) < 0.6 
    then (.trigger_sensitivity.autonomy - 0.1) 
    elif (($metrics | map(select(.article | startswith("article-4"))) | .[0].effectiveness // 0.7) > 0.85)
    then (.trigger_sensitivity.autonomy + 0.05)
    else .trigger_sensitivity.autonomy end
  ) | if . < 0.5 then 0.5 elif . > 0.95 then 0.95 else . end,
  
  validation: (
    if ($metrics | map(select(.article | startswith("article-5") or startswith("article-15"))) | .[0].effectiveness // 0.8) < 0.6
    then (.trigger_sensitivity.validation - 0.1)
    elif (($metrics | map(select(.article | startswith("article-5"))) | .[0].effectiveness // 0.8) > 0.85)
    then (.trigger_sensitivity.validation + 0.05)
    else .trigger_sensitivity.validation end
  ) | if . < 0.5 then 0.5 elif . > 0.95 then 0.95 else . end,
  
  mcp_usage: (.trigger_sensitivity.mcp_usage),
  memory: (.trigger_sensitivity.memory),
  governance: (.trigger_sensitivity.governance),
  quality: (.trigger_sensitivity.quality)
}
' "$memory_bank/progress.json" | sponge "$memory_bank/progress.json"

echo "→ ADJUSTED: Trigger sensitivity updated" >&2

# 3. Generate adjustment report
jq -r '
"RL Feedback Report - " + (now | todate) + "
===================================

Trigger Sensitivity:
- Autonomy: \(.trigger_sensitivity.autonomy)
- Validation: \(.trigger_sensitivity.validation)  
- MCP Usage: \(.trigger_sensitivity.mcp_usage)
- Memory: \(.trigger_sensitivity.memory)
- Governance: \(.trigger_sensitivity.governance)
- Quality: \(.trigger_sensitivity.quality)

Article Effectiveness (Top 5):
" + (
  [.article_effectiveness | to_entries[] | 
   {article: .key, eff: .value.effectiveness, count: .value.invocations}] |
  sort_by(-.eff) | .[:5] |
  map("  \(.article): \(.eff) (\(.count) uses)") | join("\n")
)
' "$memory_bank/progress.json" >&2

echo "✅ RL FEEDBACK: Weekly adjustment complete" >&2
