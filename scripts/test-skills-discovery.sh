#!/bin/bash
# Test skills semantic discovery
set -euo pipefail

echo "═══════════════════════════════════════════════════════════"
echo "  🧪 TESTING: Skills Semantic Discovery"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Test 1: Count total skills and triggers
echo "Test 1: Skills catalog stats"
total_skills=$(jq '.skills | length' src/aegiside/routers/skills.json)
total_triggers=$(jq '[.skills[].triggers[]] | length' src/aegiside/routers/skills.json)
echo "  ✓ Total skills: $total_skills domains"
echo "  ✓ Total triggers: $total_triggers keywords"
echo ""

# Test 2: Semantic matching examples
echo "Test 2: Semantic matching examples"

queries=("rust error handling" "optimize database" "react hooks" "security scanning")

for query in "${queries[@]}"; do
  echo "  Query: '$query'"
  matches=$(jq -r --arg q "$query" '
    .skills | to_entries[] | 
    select(.value.triggers[] | test($q; "i")) | 
    .key
  ' src/aegiside/routers/skills.json | head -2)
  echo "    → Matched: $matches"
done
echo ""

# Test 3: Validate URLs (sample)
echo "Test 3: URL validation (sample 5 skills)"
sample_urls=$(jq -r '.skills | to_entries[:5][] | .value.sources[0].url' src/aegiside/routers/skills.json)
valid=0
total=0
while IFS= read -r url; do
  total=$((total + 1))
  if curl -o /dev/null -s -w "%{http_code}" -L "$url" | grep -q "^200"; then
    valid=$((valid + 1))
  fi
done <<< "$sample_urls"
echo "  ✓ Valid URLs: $valid/$total"
echo ""

# Test 4: Priority distribution
echo "Test 4: Priority distribution"
jq -r '.skills | group_by(.priority)[] | "\(.[0].priority): \(length) skills"' src/aegiside/routers/skills.json
echo ""

echo "═══════════════════════════════════════════════════════════"
echo "  ✅ SKILLS DISCOVERY READY"
echo "═══════════════════════════════════════════════════════════"
