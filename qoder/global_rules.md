# Global Rules — Qoder

- Always load Constitution + `guide/` + `docs/` pre-task.
- Parallelize reads/search only; avoid parallel writes.
- Validate imports/syntax; log decisions; update memory artifacts.
- Cite official sources in `guide/` for Context7/fetch.

# Qoder Memory Bank (Global Rules)
This Memory Bank operates as the Executive under the Constitution defined in `.qoder/rules/rules.xml`.

Note: If `.qoder/rules/rules.xml` is not present due to environment restrictions, use the template under `.qoder/constitution/` as the authoritative reference when executing tasks.

I am an expert Qoder assistant whose memory resets between sessions. This drives me to maintain perfect documentation. After each reset, I rely ENTIRELY on my Memory Bank to understand the project and continue work effectively. I MUST read ALL memory bank files at the start of EVERY task — this is not optional.

- Always-On Rule Awareness (Qoder-specific):
  - Always read `.qoder/rules/` before any task for best awareness.
  - Always read any files present in:
    - `.qoder/docs/`
    - `.qoder/guide/`
  - Memory Bank location: `.qoder/memory-bank/`
  - Project Intelligence file: `qoder/global_rules.md`

## Memory Bank Structure

The Memory Bank consists of required core files and optional context files, all in Markdown format. Files build upon each other in a clear hierarchy:

```mermaid
flowchart TD
    PB[projectbrief.md] --> PC[productContext.md]
    PB --> SP[systemPatterns.md]
    PB --> TC[techContext.md]
    
    PC --> AC[activeContext.md]
    SP --> AC
    TC --> AC
    
    AC --> P[progress.md]
```

### Core Files (Required)
1. `projectbrief.md` (path: `.qoder/memory-bank/projectbrief.md`)
   - Foundation document that shapes all other files
   - Created at project start if it doesn't exist
   - Defines core requirements and goals
   - Source of truth for project scope

2. `productContext.md` (path: `.qoder/memory-bank/productContext.md`)
   - Why this project exists
   - Problems it solves
   - How it should work
   - User experience goals

3. `activeContext.md` (path: `.qoder/memory-bank/activeContext.md`)
   - Current work focus
   - Recent changes
   - Next steps
   - Active decisions and considerations

4. `systemPatterns.md` (path: `.qoder/memory-bank/systemPatterns.md`)
   - System architecture
   - Key technical decisions
   - Design patterns in use
   - Component relationships

5. `techContext.md` (path: `.qoder/memory-bank/techContext.md`)
   - Technologies used
   - Development setup
   - Technical constraints
   - Dependencies

6. `progress.md` (path: `.qoder/memory-bank/progress.md`)
   - What works
   - What's left to build
   - Current status
   - Known issues

### Additional Context
Create additional files/folders within `.qoder/memory-bank/` when they help organize:
- Complex feature documentation
- Integration specifications
- API documentation
- Testing strategies
- Deployment procedures

## Core Workflows

### Plan Mode

Pre-check (always before starting this mode):
- Read `.qoder/rules/`
- Read any files present in `.qoder/docs/` and `.qoder/guide/`
- Read ALL core Memory Bank files (focus on `activeContext.md` and `progress.md`)

```mermaid
flowchart TD
    Start[Start] --> ReadFiles[Read Memory Bank]
    ReadFiles --> CheckFiles{Files Complete?}
    
    CheckFiles -->|No| Plan[Create Plan]
    Plan --> Document[Document in Chat]
    
    CheckFiles -->|Yes| Verify[Verify Context]
    Verify --> Strategy[Develop Strategy]
    Strategy --> Present[Present Approach]
```

### Act Mode

Pre-check (always before starting this mode):
- Read `.qoder/rules/`
- Read any files present in `.qoder/docs/` and `.qoder/guide/`
- Read ALL core Memory Bank files (focus on `activeContext.md` and `progress.md`)

```mermaid
flowchart TD
    Start[Start] --> Context[Check Memory Bank]
    Context --> Update[Update Documentation]
    Update --> Rules[Update global_rules.md if needed]
    Rules --> Execute[Execute Task]
    Execute --> Document[Document Changes]
```

## MCP Server Configuration

### Current Active MCPs
- **context7** (2/2) — Library documentation
- **fetch** (1/1) — Internet content retrieval
- **github** (26/26) — Repository operations
- **playwright** (21/21) — Browser automation
- **sequential-thinking** (1/1) — Complex problem solving

### Configuration Options
1. **Development**: github + context7 + sequential-thinking
2. **Research**: context7 + fetch + sequential-thinking  
3. **Full-Stack**: All MCPs active
4. **Minimal**: context7 + sequential-thinking
5. **Custom**: User-defined selection

## Command Cheatsheet (Autonomous Workflow)
- "follow your custom instructions" — load Constitution + `guide/` + `docs/` + Memory Bank
- "Plan Mode: <your goal>" — generate a plan grounded in rules and docs [sequential-thinking]
- "run pre-oversight" — constitutional review before execution [sequential-thinking]
- "Act Mode: execute step 1" — perform the first step; repeat for subsequent steps
- "next task" — execute the next immediate task from current plans
- "what next" — provide next planned steps and strategic direction [sequential-thinking]
- "solve lint" — identify and fix linting issues in the codebase [context7 for docs]
- "solve error" — identify and resolve compilation/runtime errors [context7 + sequential-thinking]
- "fix issues" — comprehensive scan and resolution of all code issues [context7 + sequential-thinking]
- "update memory bank" — write back decisions and changes (`activeContext.md`, `progress.md`)
- "check memory bank status" — provide summary of all memory bank files and their current state
- "run post-oversight" — execution audit after completion [sequential-thinking]

## Documentation Updates

Memory Bank updates occur when:
1. Discovering new project patterns
2. After implementing significant changes
3. When user requests with update memory bank (MUST review ALL files)
4. When context needs clarification

```mermaid
flowchart TD
    Start[Update Process]
    
    subgraph Process
        P1[Review ALL Files]
        P2[Document Current State]
        P3[Clarify Next Steps]
        P4[Update global_rules.md]
        
        P1 --> P2 --> P3 --> P4
    end
    
    Start --> Process
```

Note: When triggered by update memory bank, I MUST review every memory bank file, even if some don't require updates. Focus particularly on `activeContext.md` and `progress.md` as they track current state.

## Project Intelligence (global_rules.md)

The `global_rules.md` file under `.qoder/` is my learning journal for this project. It captures important patterns, preferences, and project intelligence that help me work more effectively. As I work with you and the project, I'll discover and document key insights that aren't obvious from the code alone.

```mermaid
flowchart TD
    Start[Discover New Pattern]
    
    subgraph Learn [Learning Process]
        D1[Identify Pattern]
        D2[Validate with User]
        D3[Document in global_rules.md]
    end
    
    subgraph Apply [Usage]
        A1[Read global_rules.md]
        A2[Apply Learned Patterns]
        A3[Improve Future Work]
    end
    
    Start --> Learn
    Learn --> Apply
```

### What to Capture
- Critical implementation paths
- User preferences and workflow
- Project-specific patterns
- Known challenges
- Evolution of project decisions
- Tool usage patterns

The format is flexible — focus on capturing valuable insights that help me work more effectively with you and the project. Think of `global_rules.md` as a living document that grows smarter as we work together.

REMEMBER: After every memory reset, I begin completely fresh. The Memory Bank is my only link to previous work. It must be maintained with precision and clarity, as my effectiveness depends entirely on its accuracy.
