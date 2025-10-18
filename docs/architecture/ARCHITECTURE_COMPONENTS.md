# AegisIDE Architecture - Components & Interactions

## Component Structure

```
{IDE}/aegiside/                          # Production (ALL IDEs)
├── context-router.json                  # ROUTER (500 chars) - Single source
├── memory-bank/                         # 8 Schemas (runtime state)
│   ├── activeContext.json              # Session + operation counter
│   ├── scratchpad.json                 # Task queue [0]=priority
│   ├── kanban.json                     # Workflow tracking
│   ├── mistakes.json                   # Error patterns + penalties
│   ├── systemPatterns.json             # Architecture + rewards
│   ├── progress.json                   # RL ledger (single source)
│   ├── roadmap.json                    # Strategic planning
│   └── memory.json                     # Knowledge graph
├── schemas/                            # JSON Schema validators
│   ├── activeContext.schema.json
│   ├── scratchpad.schema.json
│   ├── ... (8 schemas)
│   └── helpers/
│       ├── schema-integrity-validator.json
│       └── schema-evolution.json
└── visualize/                          # Dashboard (optional)
    └── dashboard.html

{IDE}/rules/                            # Constitution (lazy-load)
└── constitution/
    ├── preamble.md
    ├── article-1.md    # Always loaded (Fundamental Rights)
    ├── article-2.md
    ├── ... (42 articles)
    └── article-42.md

{IDE}/workflow/                         # Workflow logic (NOT loaded)
├── init.md         # Workflows define LOGIC
├── fix.md          # System executes by NAME: /fix
├── next.md         # NOT by loading these files
├── research.md
├── validate.md
├── optimize.md
└── ... (12 workflows)

~/.codeium/windsurf-next/memories/      # Windsurf-specific
└── global_rules.md                     # Ultra-compact (3,598 chars)
```

---

## Component Interactions (Flow Diagram)

```mermaid
graph TD
    A[User Message] --> B[NLU Intent Detection]
    B --> C[context-router.json]
    C --> D{Intent Mapping}
    
    D -->|error| E1[execute /fix]
    D -->|feature| E2[execute /research + /next]
    D -->|validate| E3[execute /validate]
    D -->|optimize| E4[execute /optimize]
    
    E1 --> F[Workflow Execution Engine]
    E2 --> F
    E3 --> F
    E4 --> F
    
    F --> G[MCP Chain PRE-EXEC-POST]
    G --> H[9 Mandatory MCPs]
    
    H --> I[@mcp:filesystem]
    H --> J[@mcp:memory]
    H --> K[@mcp:context7]
    H --> L[@mcp:git]
    H --> M[+ 5 more MCPs]
    
    I --> N[Read Summaries]
    N --> O[scratchpad[0].title]
    N --> P[activeContext[0].task_history[-10:]]
    N --> Q[progress.total_rl_score]
    
    F --> R{Need Articles?}
    R -->|Yes| S[Lazy Load Articles]
    R -->|No| T[Skip]
    
    S --> U[Load Article Summaries]
    U --> V[Article 5, 15, etc]
    
    F --> W[Update 8 Schemas Atomic]
    W --> X[activeContext.json]
    W --> Y[scratchpad.json]
    W --> Z[+ 6 more schemas]
    
    W --> AA[Git Commit]
    AA --> AB[Calculate RL Score]
    AB --> AC[progress.json]
    
    AC --> AD{operation_counter % 5 == 0?}
    AD -->|Yes| AE[Memory Anchor]
    AD -->|No| AF[Continue]
    
    AE --> N
    AF --> AG[Next Task]
    AG --> A
```

---

## Detailed Component Interactions

### 1. **Session Start**
```
User opens IDE
    ↓
Load global_rules.md (3,598 chars)
    ↓
Read context-router.json (500 chars)
    ↓
Check memory-bank exists?
    ├─ NO → execute(/init) → Create 8 schemas
    └─ YES → Continue
    ↓
Load Fundamental Rights (Articles 1-12) as SUMMARIES
    ↓
Ready for autonomous operation
```

### 2. **User Message Processing**
```
User: "Fix login error"
    ↓
NLU Engine: detect_intent() → "error"
    ↓
Router Lookup: context-router.json["error"]
    ↓
Returns: {"workflows": ["/fix"], "articles": [5, 15]}
    ↓
Execute Workflow: /fix
    ├─ PRE-FLIGHT: Load summaries (430 tokens)
    ├─ EXECUTE: MCP chain (context7 → fix → validate)
    ├─ POST-FLIGHT: Update schemas, git commit
    └─ RL Scoring: +20 RL → progress.json
    ↓
Lazy Load Articles: [5, 15] as summaries
    ↓
Generate Task Summary
    ↓
Update activeContext.task_history (keep last 10)
    ↓
operation_counter += 1
    ↓
Check: counter % 5 == 0?
    ├─ YES → Memory Anchor (reload summaries)
    └─ NO → Continue
    ↓
IMMEDIATE next task (NO pause)
```

### 3. **Memory Anchor (Every 5 Operations)**
```
operation_counter % 5 == 0
    ↓
Trigger Memory Anchor
    ↓
Load Summaries ONLY:
    ├─ scratchpad[0].title (20 tokens)
    ├─ activeContext[0].task_history[-10:] (400 tokens)
    └─ progress.total_rl_score (10 tokens)
    ↓
Total: 430 tokens (vs 5000+ before)
    ↓
Update activeContext[0].last_memory_anchor
    ↓
Continue execution
```

### 4. **Workflow Execution (Internal)**
```
execute_workflow("/fix")
    ↓
Load workflow LOGIC (not file):
    ├─ Error detection
    ├─ @mcp:context7 research
    ├─ Apply fix
    ├─ Run /validate
    └─ Update schemas
    ↓
MCP Chain:
    ├─ @mcp:filesystem (read/write)
    ├─ @mcp:context7 (research)
    ├─ @mcp:sequential-thinking (plan)
    ├─ @mcp:git (commit)
    ├─ @mcp:time (timestamp)
    └─ + 4 more MCPs
    ↓
Validation:
    ├─ Run linters
    ├─ Run tests
    └─ Check schemas
    ↓
Update 8 Schemas:
    ├─ mistakes.json (error pattern)
    ├─ systemPatterns.json (fix pattern)
    ├─ progress.json (RL +20)
    └─ + 5 more schemas
    ↓
Git Commit:
    └─ "fix: Resolved login error via context7"
    ↓
Return: success
```

### 5. **Lazy Article Loading**
```
Workflow needs constitutional guidance?
    ↓
YES: Load articles from router mapping
    ↓
Router says: articles: [5, 15]
    ↓
Load from {IDE}/rules/constitution/
    ├─ article-5.md → Load SUMMARY (~200 chars)
    └─ article-15.md → Load SUMMARY (~200 chars)
    ↓
Total: ~400 chars (not full 4000+ chars per article)
    ↓
Apply guidance to workflow
    ↓
Continue execution
```

---

## Article Storage Location

**YES - Articles are in USER's IDE:**

```
Location: {IDE}/rules/constitution/

Where {IDE} is:
- Windsurf: /home/user/.codeium/windsurf-next/
- Cursor: /home/user/.cursor/
- VS Code: /home/user/.vscode/
- JetBrains: /home/user/.idea/

Files:
- preamble.md           (Introduction)
- article-1.md          (Definition of State)
- article-2.md          (Territory)
- ...
- article-12.md         (RL & Self-Improvement)
- article-13.md         (Duty to Use MCPs)
- ...
- article-42.md         (Knowledge Graph)
```

**Loading Strategy:**
- **Always On** (Session start): Articles 1-12 (Fundamental Rights) - SUMMARIES
- **On Demand** (When needed): Articles 13-42 - LAZY LOADED as summaries
- **Emergency** (Crisis): Articles 30, 37, 38 - Full load

**Example:**
```python
# User: "Fix error"
# Router says: load articles [5, 15]

load_article(5)  # Article 5: Right to Quality
# Loads SUMMARY: "Zero-tolerance validation. HALT-FIX-VALIDATE loop. +15RL."
# NOT full 2000+ char article

load_article(15)  # Article 15: Duty to Validate  
# Loads SUMMARY: "Mandatory testing. Coverage ≥80%. Multi-language validation."
# NOT full 2000+ char article
```

---

## Component Communication

```
global_rules.md
    ↓ (references)
context-router.json
    ↓ (maps intents to)
Workflow Names: /fix, /next, /research
    ↓ (execute with)
9 MCPs: filesystem, memory, context7, etc.
    ↓ (read/write)
8 Schemas: activeContext, scratchpad, etc.
    ↓ (reference)
Constitution Articles: 1-42 (lazy-loaded)
    ↓ (guide)
Workflow Execution Logic
    ↓ (produces)
Code Changes + Git Commits + RL Scores
```

---

## Key Points

1. **Router is Single Source**: context-router.json controls everything
2. **Workflows are Logic**: /fix, /next are hardcoded logic, NOT file dependencies
3. **Articles are Lazy**: Load SUMMARIES only when needed
4. **Schemas are Runtime**: 8 schemas maintain state during execution
5. **MCPs are Tools**: 9 mandatory tools for all operations
6. **Memory is Compressed**: 430 tokens per anchor vs 5000+ before

**Result**: Self-contained, autonomous system that runs for 30+ hours without context overflow.
