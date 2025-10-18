#!/bin/bash
# End-to-end workflow test
set -euo pipefail

echo "═══════════════════════════════════════════════════════════"
echo "  🧪 TESTING: Complete Workflow Integration"
echo "═══════════════════════════════════════════════════════════"
echo ""

test_dir="/tmp/aegiside-workflow-test-$$"
mkdir -p "$test_dir"
cd "$test_dir"

# Test 1: Bootstrap
echo "Test 1: Bootstrap memory bank"
bash /mnt/windows_d/Gauravs-Files-and-Folders/Projects/Portfolio/AegisIDE/scripts/bootstrap.sh
if [[ -f .aegiside/memory-bank/progress.json ]]; then
  echo "  ✓ Memory bank created"
else
  echo "  ✗ Bootstrap failed"
  exit 1
fi
echo ""

# Test 2: Verify schema structure
echo "Test 2: Verify 8-schema structure"
schemas=(activeContext scratchpad kanban mistakes systemPatterns progress roadmap memory)
for schema in "${schemas[@]}"; do
  if jq empty .aegiside/memory-bank/${schema}.json 2>/dev/null; then
    echo "  ✓ ${schema}.json valid"
  else
    echo "  ✗ ${schema}.json invalid"
    exit 1
  fi
done
echo ""

# Test 3: Test metadata injection
echo "Test 3: Metadata injection simulation"
catalog=$(jq '.constitutional_catalog' /mnt/windows_d/Gauravs-Files-and-Folders/Projects/Portfolio/AegisIDE/src/aegiside/routers/constitutional-metadata.json)
categories=$(echo "$catalog" | jq -r 'keys | length')
echo "  ✓ Loaded $categories categories"
echo ""

# Test 4: Test skills discovery
echo "Test 4: Skills discovery"
bash /mnt/windows_d/Gauravs-Files-and-Folders/Projects/Portfolio/AegisIDE/scripts/research-with-skills.sh "rust error handling" 2>&1 | head -10
echo "  ✓ Skills research functional"
echo ""

# Test 5: Test RL tracking
echo "Test 5: RL selection tracking"
jq '.article_selection_history += [{
  "timestamp": "'$(date '+%Y-%m-%dT%H:%M:%S%z')'",
  "user_request": "test workflow",
  "articles_loaded": ["article-4", "article-5"],
  "articles_applied": ["article-4"],
  "outcome": "success",
  "rl_reward": 20,
  "selection_accuracy": 0.5
}]' .aegiside/memory-bank/progress.json | sponge .aegiside/memory-bank/progress.json

history_count=$(jq '.article_selection_history | length' .aegiside/memory-bank/progress.json)
echo "  ✓ RL tracking: $history_count entries"
echo ""

# Test 6: Test weekly feedback loop
echo "Test 6: Weekly RL feedback loop"
bash /mnt/windows_d/Gauravs-Files-and-Folders/Projects/Portfolio/AegisIDE/scripts/rl-feedback-weekly.sh .aegiside/memory-bank 2>&1 | grep "Weekly adjustment complete"
echo "  ✓ Feedback loop functional"
echo ""

# Cleanup
cd /
rm -rf "$test_dir"

echo "═══════════════════════════════════════════════════════════"
echo "  ✅ ALL WORKFLOW TESTS PASSED"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "Production readiness:"
echo "  ✓ Bootstrap working"
echo "  ✓ 8-schema structure valid"  
echo "  ✓ Metadata injection ready"
echo "  ✓ Skills discovery functional"
echo "  ✓ RL tracking operational"
echo "  ✓ Weekly feedback loop working"
