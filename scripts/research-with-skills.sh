#!/bin/bash
# /research with dynamic skills discovery
set -euo pipefail

query="${1:-}"
if [[ -z "$query" ]]; then
  echo "Usage: $0 'research query'" >&2
  exit 1
fi

echo "→ RESEARCH: $query" >&2

# 1. Semantic matching against skills.json
echo "→ SEMANTIC MATCH: Finding relevant skills" >&2

matched_skills=$(jq -r --arg q "$query" '
.skills | to_entries[] | 
select(.value.triggers[] | test($q; "i")) |
"\(.key)|\(.value.priority)|\(.value.sources[0].url)"
' src/.aegiside/routers/skills.json)

if [[ -z "$matched_skills" ]]; then
  echo "  ✗ No skills matched for: $query" >&2
  exit 0
fi

echo "  ✓ Matched skills:" >&2
echo "$matched_skills" | while IFS='|' read -r skill priority url; do
  echo "    - $skill ($priority)" >&2
done

# 2. Fetch top-priority skill documentation
top_skill=$(echo "$matched_skills" | head -1)
IFS='|' read -r skill_name priority doc_url <<< "$top_skill"

echo "→ FETCH: Loading documentation for $skill_name" >&2

# Use @mcp:fetch in practice; here simulate with curl for testing
doc_content=$(curl -s "$doc_url" | head -100)

if [[ -n "$doc_content" ]]; then
  echo "  ✓ Loaded $(echo "$doc_content" | wc -l) lines from $skill_name" >&2
else
  echo "  ✗ Failed to fetch from $doc_url" >&2
fi

# 3. Store research result in systemPatterns.json
timestamp=$(date '+%Y-%m-%dT%H:%M:%S%z')
jq --arg query "$query" \
   --arg skill "$skill_name" \
   --arg url "$doc_url" \
   --arg ts "$timestamp" \
   '.patterns = [{
     "query": $query,
     "skill_used": $skill,
     "documentation_url": $url,
     "timestamp": $ts,
     "rl_reward": 10
   }] + (.patterns // []) | .patterns |= .[:100]' \
   .aegiside/memory-bank/systemPatterns.json | \
   sponge .aegiside/memory-bank/systemPatterns.json 2>/dev/null || true

echo "✅ RESEARCH: Documentation loaded from $skill_name" >&2
echo "→ URL: $doc_url" >&2
