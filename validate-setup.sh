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

# Check tools
command -v node &> /dev/null && echo "✓ Node.js" || { echo "❌ Node.js missing"; ERRORS=$((ERRORS + 1)); }
command -v npx &> /dev/null && echo "✓ npx" || { echo "❌ npx missing"; ERRORS=$((ERRORS + 1)); }

echo ""
echo "📊 Summary: ${ERRORS} errors, ${WARNINGS} warnings"

[ ${ERRORS} -eq 0 ] && echo "✅ Setup valid" || echo "❌ Fix errors before using"
exit ${ERRORS}
