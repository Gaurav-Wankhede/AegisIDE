# Real-Time Memory Bank Update Enforcement

## How It Works (Mechanical Implementation)

### 1. **Automatic Trigger System**
Every AI task completion automatically triggers the update sequence:

```javascript
// Conceptual Implementation Flow
taskComplete() {
    HALT_ALL_OPERATIONS();
    
    // MANDATORY UPDATE SEQUENCE
    const updateResult = await enforceMemoryBankUpdate();
    
    if (!updateResult.success) {
        ROLLBACK_TASK();
        RETRY_UPDATE();
        return; // BLOCK next task
    }
    
    RELEASE_HALT();
    loadNextTask(); // Only after successful update
}
```

### 2. **MCP Filesystem Integration** 
Using the configured MCP servers from your `mcp_config.json`:

```bash
# Your Active MCP Configuration:
"filesystem": {
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-filesystem", "/mnt/windows_d/Gauravs-Files-and-Folders/"]
}
```

**Real-Time Update Process**:
```python
def update_memory_bank_forceful():
    files = [
        "scratchpad.json", "activeContext.json", "mistakes.json", 
        "progress.json", "systemPatterns.json", "techContext.json",
        "productContext.json", "projectbrief.json", "roadmap.json",
        "kanban.json", "blueprint.json", "userflow.json", 
        "bugfix.json", "deployment.json", "monitoring.json", 
        "dependencies.json"
    ]
    
    for file in files:
        # 1. Read current state
        current_data = mcp3_read_text_file(f".windsurf/memory-bank/{file}")
        
        # 2. Update with new information
        updated_data = append_task_information(current_data, task_results)
        
        # 3. Validate against schema
        validate_json_schema(updated_data, f".windsurf/memory-bank/schemas/{file}.schema.json")
        
        # 4. Atomic write
        mcp3_write_file(f".windsurf/memory-bank/{file}", updated_data)
        
        # 5. Verify write success
        verify_result = mcp3_get_file_info(f".windsurf/memory-bank/{file}")
        if not verify_result.success:
            HALT_AND_ROLLBACK()
    
    # 6. Update roadmap.md (human-readable)
    update_roadmap_md()
```

### 3. **Constitutional Enforcement Hooks**

**Pre-Task Hook**:
```
BEFORE any task execution:
1. Verify all 17 files exist and are valid
2. Load current context from memory-bank
3. Proceed only if integrity check passes
```

**Post-Task Hook** (MANDATORY):
```
AFTER every task completion:
1. HALT all operations immediately
2. Extract task results and learnings
3. Update ALL 17 files via MCP operations
4. Validate schema compliance
5. Store patterns in @mcp:memory
6. Sync to @mcp:byterover-mcp
7. ONLY THEN release HALT and continue
```

### 4. **Real-Time Information Tracking**

**What Gets Tracked**:
- **Task Completion**: Add to scratchpad.json completion log
- **Errors Encountered**: Append to mistakes.json with solutions
- **Context Changes**: Update activeContext.json with current state
- **Progress Milestones**: Log in progress.json with timestamps
- **Technical Decisions**: Document in techContext.json
- **System Patterns**: Store successful approaches in systemPatterns.json

**Example Real-Time Update**:
```json
// scratchpad.json - BEFORE task
{
  "current_tasks": [
    {"id": "task_001", "status": "pending", "description": "Fix compilation errors"}
  ]
}

// scratchpad.json - AFTER task (Auto-updated via MCP)
{
  "current_tasks": [],
  "completed_tasks": [
    {
      "id": "task_001", 
      "status": "completed", 
      "description": "Fix compilation errors",
      "completion_time": "2025-10-04T20:10:00+05:30",
      "solution": "Added missing imports via @mcp:context7",
      "files_modified": ["src/main.rs", "src/lib.rs"]
    }
  ]
}
```

## Enforcement Mechanisms

### 1. **Constitutional Authority**
- **Article III-A** makes updates MANDATORY
- **Constitutional violation** to skip updates
- **Chief Justice** can HALT operations for non-compliance

### 2. **Task Gating System**
```
Current Task Complete → HALT → MCP Updates → Validation → RELEASE → Next Task
```
**NO BYPASS ALLOWED** - Next task blocked until updates succeed

### 3. **Error Recovery**
```
Update Failure → Auto-Rollback → Retry (3 attempts) → Human Escalation (if all fail)
```

### 4. **Real-Time Validation**
- **Schema Validation**: Every JSON write validated against `.windsurf/memory-bank/schemas/`
- **Integrity Checks**: File corruption detection and recovery
- **Size Limits**: Auto-compression if files exceed 10KB

## Practical Implementation Commands

### For AI Agents:
```bash
# These commands are automatically called after every task:
mcp3_read_text_file({path: ".windsurf/memory-bank/scratchpad.json"})
mcp3_write_file({path: ".windsurf/memory-bank/scratchpad.json", content: updated_data})
mcp3_get_file_info({path: ".windsurf/memory-bank/scratchpad.json"}) # Verify success
```

### For Users (Manual Override):
```bash
# Force immediate update (emergency use):
update memory bank

# Check update status:
check memory status

# Validate all files:
validate project
```

## Benefits of Forceful Updates

1. **Zero Information Loss**: Every decision, error, solution tracked
2. **Real-Time Context**: Always current project state
3. **Cross-Session Continuity**: Perfect session restoration
4. **Pattern Learning**: Automatic improvement via @mcp:memory
5. **Constitutional Compliance**: Maintains governance structure

## Constitutional Guarantee

**Article III-A Authority**: Updates are constitutionally MANDATORY - no AI agent can bypass this requirement. Task execution is constitutionally HALTED until memory-bank updates complete successfully.
