#!/bin/bash
# Shared constitutional display function
# Sourced by all workflows to avoid duplication
# Token cost: ~300 tokens (vs 2,100 per workflow = 27,300 total saved)

display_constitutional_rules() {
  echo "" >&2
  echo "═══════════════════════════════════════════════════════════" >&2
  echo "  🛡️  CONSTITUTIONAL MCP COMPLIANCE - MANDATORY RULES" >&2
  echo "═══════════════════════════════════════════════════════════" >&2
  echo "" >&2
  echo "📜 6 MANDATORY MCPs (Article 13):" >&2
  echo "  ✓ @mcp:sequential-thinking - Deep reasoning ≥3 steps" >&2
  echo "  ✓ @mcp:json-jq - ALL JSON reads (NEVER Read tool)" >&2
  echo "  ✓ @mcp:git - Version control (NO CLI git)" >&2
  echo "  ✓ @mcp:context7 - Official docs (IMMEDIATE on errors)" >&2
  echo "  ✓ @mcp:exa - Code research" >&2
  echo "  ✓ @mcp:fetch - Web content" >&2
  echo "" >&2
  echo "❌ VIOLATIONS & PENALTIES:" >&2
  echo "  • Read on JSON → -25 RL | Fix: @mcp:json-jq" >&2
  echo "  • Bypass Router → -30 RL | Fix: Query .aegiside/routers/" >&2
  echo "  • Partial Schema → -30 RL | Fix: Atomic 8-schema update" >&2
  echo "  • Ask Permission (0-99%) → -20 RL | Fix: Execute autonomously" >&2
  echo "" >&2
  echo "═══════════════════════════════════════════════════════════" >&2
  echo "" >&2
}
