# LLHCT Execution Flow - How It Actually Works

## Session Start (Automatic Bootstrap)

```python
# 1. IDE loads global_rules.md (3,598 chars)
load("/home/{user}/.codeium/windsurf-next/memories/global_rules.md")

# 2. Read context-router.json (SINGLE SOURCE)
router = @mcp:filesystem read "{IDE}/aegiside/context-router.json"
# Result: {intent_mapping, auto_triggers, core_rules} - 500 chars

# 3. Check memory bank exists
IF NOT exists("{IDE}/aegiside/memory-bank/"):
    execute(/init)  # Auto-creates 8 schemas
```

## User Message Processing (Real Example)

### Example 1: "Fix this error in my code"

```python
# STEP 1: NLU Intent Detection
user_message = "Fix this error in my code"
intent = detect_intent(user_message)  # "error"

# STEP 2: Router Lookup
routing = router.intent_mapping["error"]
# Returns: {"workflows": ["/workflow/fix.md"], "articles": [5, 15], "priority": 1}

# STEP 3: Load ONLY What's Needed
workflows = routing.workflows  # ["/fix"]
articles = routing.articles    # [5, 15]

# STEP 4: Execute Workflow by NAME
execute_workflow("/fix")  
# This runs the LOGIC defined in fix.md, NOT loading the whole file
# Actual execution:
#   - @mcp:context7 research error
#   - Apply fix
#   - @mcp:filesystem update files
#   - Run /validate
#   - Update 8 schemas
#   - Git commit

# STEP 5: Lazy Load Articles (if needed)
IF workflow_needs_constitutional_guidance:
    load_article(5)   # Article 5: Right to Quality
    load_article(15)  # Article 15: Duty to Validate
# Articles loaded as SUMMARIES, not full text
```

### Example 2: "Add a new feature for user authentication"

```python
# STEP 1: NLU Intent Detection
user_message = "Add a new feature for user authentication"
intent = detect_intent(user_message)  # "feature"

# STEP 2: Router Lookup
routing = router.intent_mapping["feature"]
# Returns: {"workflows": ["/workflow/research.md", "/workflow/next.md"], "articles": [4, 17]}

# STEP 3: Execute Workflow Chain
execute_workflow("/research")  # Research auth best practices
# - @mcp:context7 fetch auth documentation
# - @mcp:exa find code examples
# - Store findings in systemPatterns.json

execute_workflow("/next")      # Implement feature
# - Read scratchpad[0] task
# - Apply learned patterns
# - Write code with full MCP trail
# - Update 8 schemas atomically
# - Git commit

# STEP 4: No file reading - just workflow names
# System knows what /research and /next mean
# No need to load /workflow/research.md or /workflow/next.md files
```

## Memory Anchor (Every 5 Operations)

```python
# AUTOMATIC - NO PERMISSION
operation_counter = activeContext[0].operation_counter
operation_counter += 1

IF operation_counter % 5 == 0:
    # Load SUMMARIES ONLY (430 tokens total)
    task_title = scratchpad[0].title  # "Add auth feature" (20 tokens)
    
    last_10_summaries = activeContext[0].task_history[-10:]
    # [
    #   {"task_id": "001", "title": "Fix login bug", "outcome": "success", "rl_impact": "+20"},
    #   {"task_id": "002", "title": "Add tests", "outcome": "success", "rl_impact": "+15"},
    #   ...10 tasks total
    # ] (400 tokens)
    
    total_rl = progress.total_rl_score  # 1250 (10 tokens)
    
    # Update anchor timestamp
    activeContext[0].last_memory_anchor = @mcp:time.now()
```

## Auto-Triggers (Constitutional Enforcement)

```python
# Defined in context-router.json "auto_triggers"

# 1. Session Start
IF session_start:
    IF NOT memory_bank_exists():
        execute(/init)
    load_articles([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])  # Fundamental Rights

# 2. Every 5 Operations
IF operation_counter % 5 == 0:
    trigger_memory_anchor()
    load_summary(activeContext[0])

# 3. Task Complete
IF task_status == "done":
    generate_summary()
    calculate_rl_score()
    update_8_schemas_atomic()
    git_commit()

# 4. Error Detected
IF error_detected:
    execute(/fix)
    load_articles([5, 15])  # Quality + Validation
```

## Infinite Execution Loop (Actual Code)

```python
while True:  # Runs continuously for 30+ hours
    # 1. Check prerequisites
    if NOT memory_bank_exists():
        execute(/init)
    if NOT constitution_exists():
        execute(/bootstrap)
    
    # 2. Get next task (3 sources)
    task = (
        scratchpad[0] OR           # Planned task
        parse_NLU(user_message) OR # User request
        "continue"                  # Auto-continue
    )
    
    # 3. Detect workflow via NLU + keywords + state
    intent = detect_intent(task)
    routing = router.intent_mapping[intent]
    workflows = routing.workflows
    
    # 4. Execute complete MCP chain for each workflow
    for workflow in workflows:
        execute_complete_MCP_chain(workflow)
        # PRE: Load summaries, context
        # EXEC: Run workflow logic with 9 MCPs
        # POST: Validate, update schemas, commit
    
    # 5. Validate integrity
    validate_schemas_against_json_schema()
    check_cross_file_linkage()
    
    # 6. Update 8 schemas atomically
    update_8_schemas([0] prepend)  # Latest first
    git_commit(RL_score)
    
    # 7. IMMEDIATE next (NO asking, NO pause)
    # Loop continues automatically
```

## Workflow Execution (Internal Logic)

```python
# When execute_workflow("/fix") is called:

def execute_workflow(workflow_name):
    if workflow_name == "/fix":
        # 1. PRE-FLIGHT: Load summaries
        task_title = read scratchpad[0].title
        last_10 = read activeContext[0].task_history[-10:]
        operation_counter += 1
        
        # 2. ERROR DETECTION
        error = detect_error_from_context()
        
        # 3. RESEARCH (Anti-Hallucination)
        @mcp:context7.resolve_library_id(library_name)
        @mcp:context7.get_library_docs(topic=error)
        
        # 4. FIX APPLICATION
        @mcp:filesystem.edit_file(target_file, fix_content)
        
        # 5. VALIDATION
        execute_workflow("/validate")
        
        # 6. SCHEMA UPDATE
        update_mistakes_json(error_pattern, prevention_rule)
        update_progress_json(rl_score=+20)
        
        # 7. GIT COMMIT
        @mcp:git.commit("fix: Resolved error via context7 research")
        
        return "success"
```

## Key Innovations

1. **No File Dependencies**: Workflow names (/fix, /next) are hardcoded logic, not file paths
2. **Dynamic Router**: context-router.json maps intent → workflows autonomously
3. **Lazy Loading**: Only load articles/content when actually needed
4. **Summary-Based**: 430 tokens vs 5000+ tokens for memory anchors
5. **NLU Autonomous**: User message → Intent → Execution (no manual workflow selection)

## Context Window Budget

```
Session Start:
- global_rules.md: 3,598 chars (~900 tokens)
- context-router.json: 500 chars (~125 tokens)
- Total: ~1,025 tokens

Memory Anchor (every 5 ops):
- Task title: 20 tokens
- Last 10 summaries: 400 tokens
- RL score: 10 tokens
- Total: 430 tokens

VS Previous System:
- global_rules.md: 11,282 chars (~2,800 tokens)
- Full schema loading: 5,000+ tokens per anchor
- Total: 7,800+ tokens (7.6x MORE)
```

## Result

**Before**: Context overflow after 15-20 operations
**After**: Continuous operation for 30+ hours without amnesia

The system is self-aware, self-correcting, and fully autonomous.
