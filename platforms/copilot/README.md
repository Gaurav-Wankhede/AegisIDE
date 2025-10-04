# AegisIDE for GitHub Copilot

**Autonomy**: 92% (Documentation-only approach)  
**Platform**: GitHub Copilot (Universal IDE integration)  
**Status**: 📖 Documentation Support

## Overview

GitHub Copilot doesn't support custom rules files like other platforms. Instead, AegisIDE provides **documentation-based guidance** for Copilot users to achieve 92% autonomy through:

1. **Code comments** with constitutional principles
2. **README files** with framework guidelines
3. **Documentation references** in prompts
4. **Memory-bank structure** for context

## Setup

### Step 1: Add Framework Documentation

Create a `.github/aegis/` folder in your project:

```bash
mkdir -p .github/aegis/{constitution,memory-bank/roadmap}
```

### Step 2: Copy Constitution Articles

```bash
# Copy all 13 articles as reference documentation
cp AegisIDE/core/constitution/*.md .github/aegis/constitution/
```

### Step 3: Create Memory-Bank via Copilot Chat

```
# In Copilot Chat:
"Initialize AegisIDE memory-bank based on this project description:
[Describe your project, features, tech stack]

Create 8 files in .github/aegis/memory-bank/:
- scratchpad.md (next 5-10 tasks)
- activeContext.md (current phase)
- mistakes.md (error patterns)
- progress.md (milestones)
- systemPatterns.md (architecture patterns)
- techContext.md (tech stack details)
- productContext.md (business requirements)
- projectbrief.md (project scope)
Plus roadmap/roadmap.md (strategic plan)"
```

### Step 4: Use Framework in Prompts

Reference framework documents in your Copilot prompts:

```
"Following the constitutional framework in .github/aegis/constitution/article-III.md,
implement the next task from scratchpad.md using EMD principles (≤80 lines per file)"
```

## Key Principles for Copilot Users

### Autonomous Execution
- **Prompt clearly**: "Execute immediately without asking for confirmation"
- **Reference scratchpad**: Always mention scratchpad.md for task context
- **Update files**: Request file updates after each task

### Memory-Bank Awareness
Add this to your prompts:
```
"Context: Read .github/aegis/memory-bank/scratchpad.md for current tasks.
After implementation, update all relevant memory-bank files."
```

### EMD Compliance
```
"Follow EMD principles:
- Code files: ≤80 lines
- Deep nested folders
- Single responsibility per file"
```

## Commands (via Copilot Chat) - v2.6.2

| Command | Copilot Prompt |
|---------|----------------|
| **init** | "Initialize AegisIDE memory-bank for [project description]" |
| **next** | "Read scratchpad.md OR kanban.json and implement next task" |
| **update** | "Refresh all 13 files (8 .md + 4 .json + roadmap)" |
| **validate** | "Run 6-pillar blueprint validation + language-specific tests" |
| **fix** | "Auto-fix all errors/warnings until 100% clean" |
| **status** | "Report tasks, bugs, progress %, metrics" |
| **optimize** | "Analyze patterns and propose improvements" |
| **health** | "Monitor context rot, file sizes, attention budget" |

## Limitations

❌ **No custom rules file** (Copilot doesn't support)  
❌ **No auto-execution** (requires manual prompts)  
❌ **No session continuity** (must reference docs each time)  

✅ **Documentation works** (can reference framework files)  
✅ **Context aware** (reads memory-bank files when prompted)  
✅ **Universal** (works in any IDE with Copilot)

## Autonomy: 92%

While lower than IDE-specific implementations, Copilot achieves 92% autonomy through:
- Documentation-based guidance
- Memory-bank context
- Explicit prompting strategies
- Universal IDE compatibility

## 🔧 MCP Integration (9 Servers - Reference in Prompts)
- **@mcp:context7**: Official documentation (mention for auto-fix)
- **@mcp:fetch, @mcp:time, @mcp:math**: Research & calculations
- **@mcp:filesystem, @mcp:git**: File operations & version control
- **@mcp:memory, @mcp:byterover-mcp, @mcp:sequential-thinking**: Knowledge & reasoning

## Example Workflow (v2.6.2)

```bash
# 1. Initialize project
"init: Initialize AegisIDE for a Next.js app with TypeScript and Supabase"

# 2. Start development
"next: Execute tasks from scratchpad.md OR kanban.json automatically"

# 3. Auto-fix errors
"fix: Use @mcp:context7 to resolve all errors until 100% clean"

# 4. Check progress
"status: Report tasks, bugs, progress %, blocked items"
```

## Best Practices

1. **Always reference memory-bank** in prompts
2. **Explicit EMD compliance** requests
3. **Update files after each task**
4. **Use constitutional articles** as guidelines
5. **Maintain scratchpad.md** manually

## Maintainer

**Gaurav Wankhede** - AegisIDE  
Repository: https://github.com/Gaurav-Wankhede/AegisIDE
