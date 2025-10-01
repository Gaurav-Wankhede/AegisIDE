# AegisIDE Initialization Guide

## Memory Bank Auto-Generation Process

AegisIDE uses **autonomous memory-bank generation** instead of static templates. The AI understands your project and creates tailored structure automatically.

## Step-by-Step Initialization

### Step 1: Provide Project Context

Describe your project to the AI in natural language:

```
Example 1 (Web Scraper):
"I want to build a job scraper with Python, Selenium, and Streamlit.
Features: LinkedIn scraping, skill matching, database storage, anti-detection.
Tech stack: Python 3.11, undetected-chromedriver, PostgreSQL, Streamlit."

Example 2 (REST API):
"Building a REST API with FastAPI for user management.
Features: JWT auth, CRUD operations, PostgreSQL, Redis caching.
Tech stack: FastAPI, SQLAlchemy, Pydantic v2, PostgreSQL, Redis."

Example 3 (Next.js App):
"Creating a Next.js 14 app with Supabase backend.
Features: Authentication, real-time chat, file uploads, responsive UI.
Tech stack: Next.js 14, TypeScript, Supabase, TailwindCSS, shadcn/ui."
```

### Step 2: Run Initialization Command

```bash
initialize memory bank
```

### Step 3: AI Autonomously Generates

The AI will create:

1. **scratchpad.md** - Initial 5-10 tasks based on your project
2. **activeContext.md** - Current phase (e.g., "Setup & Configuration")
3. **mistakes.md** - Empty initially, fills as project progresses
4. **progress.md** - Milestones derived from your requirements
5. **systemPatterns.md** - Architecture patterns for your tech stack
6. **techContext.md** - Tech stack with dependency versions
7. **productContext.md** - Business requirements and user expectations
8. **projectbrief.md** - Core scope and deliverables
9. **roadmap/roadmap.md** - Strategic roadmap with phases and milestones

### Step 4: Start Development

```bash
what next
```

The AI will:
- Read scratchpad.md (auto-scanned)
- Execute first task immediately
- Update all files after completion
- Load next task and continue

## What Gets Auto-Generated?

### Example: Job Scraper Project

After running `initialize memory bank`, you get:

**scratchpad.md**:
```markdown
## Next Tasks

- [ ] Setup Python 3.11 virtual environment
- [ ] Install dependencies (selenium, streamlit, psycopg2)
- [ ] Configure undetected-chromedriver anti-detection
- [ ] Create database schema for job storage
- [ ] Implement LinkedIn login with session management
```

**roadmap/roadmap.md**:
```markdown
## Phase 1: Foundation (Week 1)
- Environment setup
- Database configuration
- Anti-detection research

## Phase 2: Core Scraping (Week 2-3)
- LinkedIn scraper implementation
- Skill matching algorithm
- Data extraction pipeline

## Phase 3: UI & Storage (Week 4)
- Streamlit dashboard
- Database integration
- Search functionality
```

**techContext.md**:
```markdown
## Tech Stack

**Language**: Python 3.11
**Web Scraping**: undetected-chromedriver 3.5.4, Selenium 4.15.2
**UI**: Streamlit 1.28.0
**Database**: PostgreSQL 15.4
**Data Processing**: Pandas 2.1.1
```

**projectbrief.md**:
```markdown
## Project: LinkedIn Job Scraper

**Objective**: Automated job scraping from LinkedIn with skill matching

**Core Features**:
1. Anti-detection scraping
2. Skill-based filtering
3. PostgreSQL storage
4. Streamlit dashboard
```

## Continuous Auto-Update

After initialization, files update **autonomously**:

### After Each Task
- scratchpad.md: Remove completed task, add new tasks
- activeContext.md: Update current focus
- progress.md: Mark milestones complete
- mistakes.md: Log any errors encountered
- systemPatterns.md: Document successful patterns

### No Manual Updates Needed
The AI maintains all files based on:
- Code changes
- Errors encountered
- Milestones achieved
- New requirements discovered

## Platform-Specific Initialization

### Windsurf
```bash
# In Windsurf chat
initialize memory bank

# Creates: .windsurf/memory-bank/ with 8 files
```

### Cline
```bash
# In Cline chat
initialize memory bank

# Creates: .cline/memory-bank/ with 8 files
```

### Cursor
```bash
# In Cursor chat
initialize memory bank

# Creates: .cursor/memory-bank/ with 8 files
```

### JetBrains
```bash
# In IDE AI chat
initialize memory bank

# Creates: .idea/aegis/memory-bank/ with 8 files
```

## Session Continuity

### New Session Behavior
```bash
# User opens new IDE session
# AI automatically:
1. Reads activeContext.md (previous session state)
2. Reads scratchpad.md (pending tasks)
3. Retrieves from @mcp:memory (persistent knowledge)
4. Auto-executes: Continue from last task WITHOUT asking
```

### No Re-Initialization Needed
- Memory-bank persists across sessions
- AI auto-resumes from last checkpoint
- Files continuously updated until project complete

## Checkpoints

Every 10 tasks, AI automatically:
- Saves state to activeContext.md
- Updates progress.md milestones
- Stores knowledge in @mcp:memory
- Logs patterns in systemPatterns.md

## When to Re-Initialize?

**Never** - unless you want to:
- Start completely new project
- Reset entire framework
- Change project scope drastically

For scope changes, use:
```bash
update roadmap
# AI updates roadmap and adjusts memory-bank accordingly
```

## File Size Management

All memory-bank files auto-maintained at:
- **≤100 lines per file** (automatic cleanup when exceeding 90 lines)
- **roadmap.md**: ≤200 lines, ≤12KB
- Old content archived automatically

## Troubleshooting

### Memory Bank Not Created?
```bash
# Check if you provided project context first
# Then retry:
initialize memory bank
```

### Files Not Updating?
```bash
# Force refresh:
update memory bank
```

### Lost Session State?
```bash
# AI auto-recovers from activeContext.md
# Just start new message - AI will resume
```

## Best Practices

1. **Describe project thoroughly** before initialization
2. **Include tech stack details** for accurate techContext.md
3. **Specify key features** for proper roadmap generation
4. **Let AI manage files** - no manual editing needed
5. **Use commands** (`what next`, `implement next task`) for autonomous operation

---

**Maintainer**: Gaurav Wankhede (AegisIDE)
**Repository**: https://github.com/Gaurav-Wankhede/AegisIDE
