#!/bin/bash
# Verify AegisIDE Framework Integrity

echo "🔍 Verifying AegisIDE Framework..."

# 1. Check GitHub accessibility
curl -sf "https://raw.githubusercontent.com/Gaurav-Wankhede/AegisIDE/main/src/.aegiside/routers/context-router.json" > /dev/null || {
    echo "❌ Cannot access GitHub repository"
    exit 1
}

# 2. Verify local memory-bank structure
test -d ".aegiside/memory-bank/memory" || {
    echo "❌ Memory-bank directory missing"
    exit 1
}

# 3. Verify 8 schemas exist
for schema in activeContext progress systemPatterns scratchpad kanban mistakes roadmap memory; do
    test -f ".aegiside/memory-bank/memory/$schema.json" || {
        echo "❌ Missing schema: $schema.json"
        exit 1
    }
done

echo "✅ Framework verified successfully"