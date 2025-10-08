# Article XV: Tool Usage & Error Prevention

## Authority
Establishes MCP-enhanced guidance system for preventing tool formatting errors, ensuring reliable code modifications, and maintaining zero-tolerance error standards across all AI operations.

## Helper Schema System

### Location & Structure
```
core/schemas/helpers/
├── tool-usage-patterns.json    # Correct tool call formats with MCP validation
├── common-mistakes.json         # Known LLM mistakes from real failures  
├── error-recovery.json          # Recovery strategies with MCP orchestration
└── validation-rules.json        # Pre-flight checks (future)
```

### Auto-Loading Protocol
- **Initialization**: @mcp:filesystem reads ALL helper schemas during `/init` workflow
- **Parallel Loading**: Loaded simultaneously with 7 core memory-bank schemas
- **Validation**: @mcp:sequential-thinking validates helper schema integrity
- **Storage**: @mcp:memory stores helper patterns in `.windsurf/memory-bank/aegis-knowledge-graph`
- **Migration**: Gradually replacing byterover-mcp with local @mcp:memory storage

## Mandatory Tool Usage Patterns

### Pre-Call Validation (MANDATORY)
```
Step 1: @mcp:sequential-thinking → Validate parameter types match tool schema
Step 2: @mcp:memory → Check if similar tool call previously failed
Step 3: @mcp:filesystem → Verify file paths exist and are absolute
Step 4: Tool Call → Execute with validated parameters
```

### Critical Rules
1. **Array Parameters**: ALWAYS pass actual arrays `[{...}]`, NEVER stringified JSON `"[{...}]"`
2. **Absolute Paths**: ALL file paths MUST be absolute, never relative
3. **Exact Matches**: TargetContent MUST match exactly including ALL whitespace
4. **Type Safety**: Parameter types MUST match tool schema exactly

### Post-Call Verification (MANDATORY)
```
Step 1: @mcp:git diff → Verify file changes applied correctly
Step 2: @mcp:filesystem → Read file to confirm content matches intent
Step 3: @mcp:time → Compare modification timestamp before/after
Step 4: @mcp:memory → Store successful pattern OR failure for learning
```

## Error Prevention Matrix

### Stringified Array Detection
- **Problem**: Passing JSON string instead of array object
- **Detection**: @mcp:sequential-thinking type validation before call
- **Prevention**: Helper schema specifies exact format with examples
- **Enforcement**: Violations logged to mistakes.json via @mcp:filesystem

### Silent Edit Failure Detection
- **Problem**: Tool claims success but changes not applied
- **Detection**: @mcp:git status immediately after EVERY edit
- **Verification**: @mcp:filesystem read content to confirm
- **Recovery**: @mcp:context7 research why edit failed, retry with corrections

### Malformed Edit Prevention
- **Problem**: "Model produced a malformed edit" error
- **Detection**: Complex TargetContent with special characters
- **Prevention**: @mcp:sequential-thinking breaks into atomic edits
- **Alternative**: Switch to mcp3_write_file for complete rewrites

### Wrong File Modification
- **Problem**: Changes applied to unexpected file
- **Detection**: @mcp:git diff --name-only shows unexpected files
- **Rollback**: @mcp:git reset --hard HEAD immediately
- **Prevention**: @mcp:filesystem list_directory for absolute paths only

## MCP Orchestration for Tool Calls

### Pre-Execution Phase
1. **@mcp:memory**: Retrieve previous patterns for this tool
2. **@mcp:sequential-thinking**: Decompose complex operations
3. **@mcp:filesystem**: Validate all paths and file existence
4. **@mcp:context7**: Research tool documentation if uncertain

### Execution Phase
5. **Tool Call**: Execute with validated parameters
6. **@mcp:time**: Track execution duration for timeout detection
7. **@mcp:git**: Monitor file system changes in real-time

### Verification Phase
8. **@mcp:git**: Diff to verify changes applied correctly
9. **@mcp:filesystem**: Read files to confirm content
10. **@mcp:memory**: Store outcome (success pattern OR failure with context)

## Error Recovery Protocols

### Severity-Based Response

**CRITICAL** (Cascade crash, data loss risk):
- @mcp:git commit emergency state immediately
- @mcp:filesystem save activeContext.json with error details
- @mcp:memory emergency knowledge dump to local graph
- Graceful shutdown and await recovery

**HIGH** (Wrong file modified, multiple failures):
- @mcp:git reset --hard HEAD (immediate rollback)
- @mcp:context7 research root cause
- @mcp:filesystem update mistakes.json with pattern
- Switch to alternative approach

**MEDIUM** (Tool timeout, single edit failed):
- @mcp:sequential-thinking decompose into smaller operations
- @mcp:memory retrieve successful similar patterns
- Retry with adjusted parameters
- Continue with task

**LOW** (Search returned no results):
- Adjust search parameters
- @mcp:memory log for pattern analysis
- Continue without blocking

## Learning Integration

### On Every Tool Call
- **Success**: @mcp:memory store pattern in local knowledge graph
- **Failure**: @mcp:filesystem append to mistakes.json with full context
- **Analysis**: @mcp:context7 research if known issue
- **Prevention**: @mcp:sequential-thinking add validation step

### Pattern Recognition
- **@mcp:math**: Calculate tool success/failure rates
- **@mcp:memory**: Cluster similar mistakes for trend analysis
- **@mcp:time**: Track if error frequency increasing/decreasing
- **Reporting**: Monthly summary for continuous improvement

## Constitutional Compliance

### Zero Tolerance Standards
- **Tool Formatting Errors**: 0% tolerance - ALL must be prevented
- **Silent Failures**: 0% tolerance - ALL must be detected and corrected
- **Validation Skipping**: 0% tolerance - Pre/post validation MANDATORY
- **Learning Failures**: 0% tolerance - ALL outcomes MUST be stored

### Enforcement Mechanisms
- **Pre-Call Gate**: @mcp:filesystem BLOCKS tool call if validation fails
- **Post-Call Gate**: BLOCKS next task until verification complete
- **Logging Requirement**: mistakes.json MUST be updated on any failure
- **Pattern Storage**: @mcp:memory MUST store outcome for future reference

### Integration with Other Articles

- **Article II** (Autonomous Decisions): Autonomous decisions are validated through the helper schemas defined here.
- **Article III** (8-Schema Context): The memory-bank is updated with tool usage patterns as part of the 8-schema system.
- **Article IV** (Quality Standards): Quality standards are enforced through the validation protocols in this article.
- **Article XIII** (Validation & Debugging): Multi-language validation is integrated with tool calls to ensure zero tolerance for errors.

## Helper Schema Maintenance

### Update Protocol
- **Monthly Review**: Analyze mistakes.json for new patterns
- **Pattern Addition**: @mcp:memory stores successful recoveries
- **Schema Evolution**: Update helper JSONs with learned patterns
- **Version Control**: @mcp:git tracks all helper schema changes

### Knowledge Migration Strategy
- **Phase 1**: Establish @mcp:memory as primary storage (current)
- **Phase 2**: Migrate byterover-mcp patterns to local memory graph
- **Phase 3**: Deprecate byterover-mcp once @mcp:memory proven stable
- **Location**: `.windsurf/memory-bank/aegis-knowledge-graph` for unlimited local storage

## Success Criteria
- **Tool Error Rate**: <1% through validation and prevention
- **Silent Failure Detection**: 100% detection rate via @mcp:git verification
- **Recovery Success**: >95% recovery without human intervention
- **Learning Effectiveness**: Error patterns decreasing over time
