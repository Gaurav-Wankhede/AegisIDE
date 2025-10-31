#!/bin/bash
# JSON Tool Enforcement Validator
# Blocks violations of JQ-ONLY, MCP-ONLY, TARGETED-QUERY rules
# Called by: pre-execution.sh hook, manual validation
# Usage: bash json-tool-enforcement.sh "$COMMAND"

COMMAND="$1"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# ═══════════════════════════════════════════════════════════════
# Rule 1: JQ-ONLY for .aegiside/*.json (p=0.5)
# ═══════════════════════════════════════════════════════════════
if echo "$COMMAND" | grep -E '\.aegiside/.*\.json' | grep -vE '^jq|^gojq|@mcp:json-jq' | grep -E 'cat|read_file|edit|sed|awk|echo|bat|less|more'; then
  echo -e "${RED}❌ VIOLATION: JQ-ONLY rule (p=0.5)${NC}" >&2
  echo "BANNED: cat/read_file/edit/sed/awk on .aegiside/*.json files" >&2
  echo "" >&2
  
  FILE=$(echo "$COMMAND" | grep -oP '\.aegiside/\S+\.json' | head -1)
  
  if echo "$COMMAND" | grep -qE 'cat|read_file|bat|less|more'; then
    echo -e "${GREEN}✅ USE INSTEAD:${NC}" >&2
    echo "   jq '.' $FILE                          # Full content" >&2
    echo "   jq 'keys' $FILE                       # Index" >&2
    echo "   jq '.specific.path' $FILE             # Targeted query" >&2
  elif echo "$COMMAND" | grep -qE 'edit|sed|awk|echo'; then
    echo -e "${GREEN}✅ USE INSTEAD:${NC}" >&2
    echo "   jq '.key = \"value\"' $FILE | sponge $FILE" >&2
    echo "   jq '.array += [{...}]' $FILE | sponge $FILE" >&2
    echo "   jq 'del(.path)' $FILE | sponge $FILE" >&2
  fi
  
  exit 1
fi

# ═══════════════════════════════════════════════════════════════
# Rule 2: MCP-ONLY for memory-bank/memory/*.json (p=0.5)
# ═══════════════════════════════════════════════════════════════
if echo "$COMMAND" | grep -E 'memory-bank/memory/.*\.json' | grep -vE '@mcp:json-jq'; then
  echo -e "${RED}❌ VIOLATION: MCP-ONLY rule (p=0.5)${NC}" >&2
  echo "BANNED: Direct jq/cat/edit on memory-bank files" >&2
  echo "" >&2
  
  FILE=$(echo "$COMMAND" | grep -oP 'memory-bank/memory/\S+\.json' | head -1 | sed 's|.*/||')
  
  echo -e "${GREEN}✅ USE INSTEAD:${NC}" >&2
  echo "   @mcp:json-jq query '.path' from '$FILE'" >&2
  echo "   @mcp:json-jq update '$FILE' with '.key = value'" >&2
  
  exit 1
fi

# ═══════════════════════════════════════════════════════════════
# Rule 3: TARGETED-QUERY warning (p=0.3)
# ═══════════════════════════════════════════════════════════════
if echo "$COMMAND" | grep -E "jq '\.' " | grep -E '\.aegiside'; then
  echo -e "${YELLOW}⚠  WARNING: TARGETED-QUERY recommendation (p=0.3)${NC}" >&2
  echo "Full dumps (jq '.') are inefficient for large files" >&2
  echo "" >&2
  echo -e "${GREEN}✅ PREFER:${NC}" >&2
  echo "   jq 'keys'                    # Index only" >&2
  echo "   jq '.specific.path'          # Targeted extraction" >&2
  echo "" >&2
  # Don't block, just warn
fi

# ═══════════════════════════════════════════════════════════════
# Rule 4: INDEX-FIRST check (p=0.3)
# ═══════════════════════════════════════════════════════════════
if echo "$COMMAND" | grep -E 'jq.*\.aegiside' | grep -vE 'context-router\.json'; then
  if [ ! -f /tmp/aegiside_index_loaded ]; then
    echo -e "${YELLOW}⚠  WARNING: INDEX-FIRST recommendation (p=0.3)${NC}" >&2
    echo "Load context-router index before querying framework" >&2
    echo "" >&2
    echo -e "${GREEN}✅ RUN FIRST:${NC}" >&2
    echo "   jq 'keys' .aegiside/routers/context-router.json" >&2
    echo "" >&2
  fi
fi

# ═══════════════════════════════════════════════════════════════
# Rule 5: Unbounded tree command (p=0.4)
# ═══════════════════════════════════════════════════════════════
if echo "$COMMAND" | grep -E '^tree\s' | grep -vE '-L\s+[0-9]'; then
  echo -e "${RED}❌ VIOLATION: Unbounded tree command (p=0.4)${NC}" >&2
  echo "BANNED: tree without depth limit" >&2
  echo "" >&2
  echo -e "${GREEN}✅ USE INSTEAD:${NC}" >&2
  echo "   tree -L 2 .aegiside/         # Limit depth" >&2
  echo "   fd -e json .aegiside/        # Flat list" >&2
  echo "   ls -1F .aegiside/            # Simple list" >&2
  
  exit 1
fi

# All checks passed
echo -e "${GREEN}✅ JSON tool enforcement: PASSED${NC}"
exit 0
