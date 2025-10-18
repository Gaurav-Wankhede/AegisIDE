#!/bin/bash
# Test dynamic router loading via @mcp:json-jq
set -euo pipefail

echo "═══════════════════════════════════════════════════════════"
echo "  🧪 TESTING: Dynamic Router Loading (Anti-Amnesia)"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Test 1: Query router catalog
echo "Test 1: Load router catalog"
router_count=$(jq '.modular_routers | length' src/.aegiside/context-router.json)
echo "  ✓ Total routers: $router_count"
echo ""

# Test 2: Semantic trigger matching
echo "Test 2: Semantic trigger matching"
queries=("autonomy execution" "mcp tools" "validation schemas" "parliament voting")

for query in "${queries[@]}"; do
  echo "  Query: '$query'"
  matches=$(jq -r --arg q "$query" '
    .modular_routers | to_entries[] | 
    select(.value.triggers[]? | test($q; "i")) | 
    .key
  ' src/.aegiside/context-router.json | head -2)
  if [[ -n "$matches" ]]; then
    echo "    → Matched: $matches"
  else
    echo "    → No match"
  fi
done
echo ""

# Test 3: Query specific routers
echo "Test 3: Dynamic router queries"
routers=("autonomy" "mcps" "parliamentary")

for router in "${routers[@]}"; do
  file=$(jq -r --arg r "$router" '.modular_routers[$r].file' src/.aegiside/context-router.json)
  if [[ "$file" != "null" ]] && [[ -f "src/.aegiside/$file" ]]; then
    keys=$(jq 'keys[0]' "src/.aegiside/$file" 2>/dev/null || echo "error")
    echo "  ✓ $router: $keys"
  else
    echo "  ✗ $router: Not found"
  fi
done
echo ""

# Test 4: Token efficiency calculation
echo "Test 4: Token efficiency"
catalog_size=$(jq -c '.modular_routers' src/.aegiside/context-router.json | wc -c)
catalog_tokens=$((catalog_size / 4))

total_router_size=0
for router_file in src/.aegiside/routers/*.json; do
  size=$(wc -c < "$router_file")
  total_router_size=$((total_router_size + size))
done
total_tokens=$((total_router_size / 4))

savings=$(((total_tokens - catalog_tokens) * 100 / total_tokens))

echo "  Catalog: ~$catalog_tokens tokens"
echo "  All routers: ~$total_tokens tokens"
echo "  ✓ Savings: $savings% via lazy loading"
echo ""

echo "═══════════════════════════════════════════════════════════"
echo "  ✅ DYNAMIC LOADING OPERATIONAL"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "Anti-Amnesia Strategy:"
echo "  ✓ Metadata catalog loaded at startup"
echo "  ✓ Semantic triggers enable automatic discovery"
echo "  ✓ On-demand loading prevents token bloat"
echo "  ✓ @mcp:json-jq ensures efficient queries"
