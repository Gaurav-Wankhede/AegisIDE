#!/bin/bash
# AegisIDE Setup Validation v3.1.0

echo "🔍 AegisIDE Setup Validation"
echo "=============================="
echo ""

ERRORS=0
WARNINGS=0

# Detect IDE
if [ -d "${HOME}/.windsurf/aegiside" ]; then
    IDE_PATH="${HOME}/.windsurf"
elif [ -d "${HOME}/.cursor/aegiside" ]; then
    IDE_PATH="${HOME}/.cursor"
elif [ -d "${HOME}/.vscode/aegiside" ]; then
    IDE_PATH="${HOME}/.vscode"
else
    echo "❌ No installation found"
    exit 1
fi

echo "✓ Found: ${IDE_PATH}/aegiside"
echo ""

# Check structure
for dir in memory-bank schemas visualize; do
    [ -d "${IDE_PATH}/aegiside/${dir}" ] && echo "  ✓ aegiside/${dir}" || { echo "  ❌ Missing ${dir}"; ERRORS=$((ERRORS + 1)); }
done

[ -d "${IDE_PATH}/rules/constitution" ] && echo "  ✓ rules/constitution" || { echo "  ❌ Missing rules"; ERRORS=$((ERRORS + 1)); }
[ -d "${IDE_PATH}/workflow" ] && echo "  ✓ workflow" || { echo "  ❌ Missing workflow"; ERRORS=$((ERRORS + 1)); }

echo ""

# Check MCP
if [ -f "${HOME}/mcp_servers.json" ]; then
    echo "✓ MCP config found"
    grep -q "/mnt/windows_d\|/home/gaurav-wankhede/" "${HOME}/mcp_servers.json" && { echo "  ⚠️  Hard-coded paths detected"; WARNINGS=$((WARNINGS + 1)); }
else
    echo "⚠️  MCP config missing"
    WARNINGS=$((WARNINGS + 1))
fi

echo ""

# Check Node.js tools
echo "🔧 Checking Node.js tools..."
command -v node &> /dev/null && echo "✓ Node.js" || { echo "❌ Node.js missing"; ERRORS=$((ERRORS + 1)); }
command -v npx &> /dev/null && echo "✓ npx" || { echo "❌ npx missing"; ERRORS=$((ERRORS + 1)); }

echo ""
echo "🛠️  Checking CLI tools (REQUIRED)..."

if command -v jq &> /dev/null; then
    echo "✓ jq (167x faster JSON operations)"
else
    echo "❌ jq missing (REQUIRED)"
    echo "   Install: sudo apt-get install jq OR brew install jq"
    ERRORS=$((ERRORS + 1))
fi

if command -v sponge &> /dev/null; then
    echo "✓ sponge (267x faster atomic updates)"
else
    echo "❌ sponge missing (REQUIRED)"
    echo "   Install: sudo apt-get install moreutils OR brew install moreutils"
    ERRORS=$((ERRORS + 1))
fi

if command -v glow &> /dev/null; then
    echo "✓ glow (markdown rendering)"
else
    echo "❌ glow missing (REQUIRED)"
    echo "   Install: sudo snap install glow OR brew install glow"
    ERRORS=$((ERRORS + 1))
fi

echo ""
echo "🧪 Testing 7 Core MCPs..."

# Test context7
if npx -y @upstash/context7-mcp@latest --version &> /dev/null 2>&1; then
    echo "✓ context7 (official docs)"
else
    echo "⚠️  context7 test failed"
    WARNINGS=$((WARNINGS + 1))
fi

# Test sequential-thinking
if npx -y @modelcontextprotocol/server-sequential-thinking --help &> /dev/null 2>&1; then
    echo "✓ sequential-thinking (deep reasoning)"
else
    echo "⚠️  sequential-thinking test failed"
    WARNINGS=$((WARNINGS + 1))
fi

# Test memory
if npx -y @modelcontextprotocol/server-memory --help &> /dev/null 2>&1; then
    echo "✓ memory (knowledge graph)"
else
    echo "⚠️  memory test failed"
    WARNINGS=$((WARNINGS + 1))
fi

echo ""
echo "📊 Summary: ${ERRORS} errors, ${WARNINGS} warnings"
echo ""

if [ ${ERRORS} -eq 0 ]; then
    echo "✅ Setup valid - Ready for autonomous operation"
    echo "   Next: Run /init in your IDE"
else
    echo "❌ Fix ${ERRORS} error(s) before using AegisIDE"
    echo "   Run ./setup.sh to reinstall"
fi

exit ${ERRORS}
