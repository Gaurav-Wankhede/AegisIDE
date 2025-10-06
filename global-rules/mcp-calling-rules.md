# AegisIDE Global Rules - MCP Tool Calling Protocols

**Version**: 3.0.0 | **Integration**: Auto-Enforced via Desktop App | **Scope**: All MCP Operations

---

## 🔧 MCP Auto-Trigger Matrix

### Critical Auto-Triggers (NO Permission Required)
```yaml
Error/Warning Detection: 
  - AUTO → Context7 MCP (resolve-library-id → get-library-docs)
  - AUTO → Implement official documentation fix
  - AUTO → Validate until 100% clean

Code Analysis:
  - AUTO → Filesystem MCP (scan project structure)
  - AUTO → Git MCP (check status, diff, log)
  - AUTO → Context7 MCP (framework-specific validation)

Database Operations:
  - AUTO → SQLite writes to data/constitutional.db
  - AUTO → JSON updates to data/memory-bank/
  - AUTO → Schema validation against core/schemas/

Knowledge Management:
  - AUTO → Memory MCP (store successful patterns)
  - AUTO → Byterover MCP (cross-project knowledge sharing)
  - AUTO → Sequential-thinking MCP (complex problem decomposition)
```

### MCP Supply Chain Orchestration
```
IDE Request → AegisIDE Desktop (Port 3001) → Constitutional MCP Server
    ↓
Constitutional Framework Validation
    ↓
Auto-Chain External MCPs:
    - Context7 (official docs)
    - Filesystem (project operations) 
    - Git (version control)
    - Memory (knowledge storage)
    - Math (calculations)
    - Time (temporal operations)
    - Fetch (external resources)
```

---

## 🚦 MCP Execution Flow

### Phase 1: Constitutional Validation
```rust
async fn validate_mcp_request(request: MCPRequest) -> Result<ApprovedRequest> {
    // 1. Load constitutional framework from core/
    let constitution = load_constitutional_framework().await?;
    
    // 2. Apply tri-branch consensus (>95% required)
    let consensus = calculate_tri_branch_consensus(&request).await?;
    if consensus < 0.95 { return Err("Insufficient consensus"); }
    
    // 3. Check global rules compliance
    validate_against_global_rules(&request).await?;
    
    Ok(ApprovedRequest::from(request))
}
```

### Phase 2: Auto-MCP Chain Execution
```rust
async fn execute_mcp_chain(approved_request: ApprovedRequest) -> Result<ChainResult> {
    let mut results = Vec::new();
    
    // Auto-determine MCP chain based on context
    let mcp_chain = determine_optimal_mcp_chain(&approved_request).await?;
    
    for mcp_call in mcp_chain {
        // Execute MCP with real-time dashboard updates
        let result = execute_mcp_with_monitoring(mcp_call).await?;
        results.push(result);
        
        // Update dashboard immediately
        emit_dashboard_event("mcp-call-completed", &result).await?;
    }
    
    // Auto-update SQLite and JSON files
    update_databases_and_memory_bank(&results).await?;
    
    Ok(ChainResult::new(results))
}
```

### Phase 3: Auto-Database Updates
```rust
async fn update_databases_and_memory_bank(results: &[MCPResult]) -> Result<()> {
    // 1. Update SQLite database
    let db = open_constitutional_db().await?;
    for result in results {
        store_mcp_operation(&db, result).await?;
    }
    
    // 2. Update JSON memory-bank files
    update_memory_bank_json_files(results).await?;
    
    // 3. Emit real-time updates to dashboard
    emit_dashboard_event("database-updated", results).await?;
    
    Ok(())
}
```

---

## 🎯 MCP Tool Categories & Auto-Triggers

### Documentation & Research MCPs
```yaml
Context7 MCP:
  Auto-Trigger: ANY error, warning, or unknown API
  Chain-With: Filesystem MCP (save docs), Memory MCP (store patterns)
  Update: techContext.json, mistakes.json

Fetch MCP:
  Auto-Trigger: External resource needs, API documentation
  Chain-With: Context7 MCP (validate info), Memory MCP (store)
  Update: knowledge.json, external-resources.json
```

### File & Project MCPs
```yaml
Filesystem MCP:
  Auto-Trigger: File operations, project scanning, configuration changes
  Chain-With: Git MCP (version control), Schema validation
  Update: project-structure.json, file-operations.json

Git MCP:
  Auto-Trigger: Code changes, version control operations
  Chain-With: Filesystem MCP (file status), Dashboard (commit logs)
  Update: version-control.json, commit-history.json
```

### Knowledge & Storage MCPs
```yaml
Memory MCP:
  Auto-Trigger: Successful pattern completion, error resolution
  Chain-With: Byterover MCP (cross-project sharing)
  Update: patterns.json, knowledge-base.json

Byterover MCP:
  Auto-Trigger: Cross-project knowledge needs, pattern sharing
  Chain-With: Memory MCP (local storage), Sequential-thinking MCP
  Update: cross-project.json, shared-knowledge.json
```

---

## 🔄 Real-time Dashboard Integration

### MCP Call Monitoring
```typescript
// Auto-emitted by MCP server to dashboard
interface MCPCallEvent {
  id: string;
  mcp_name: string;
  tool_name: string;
  parameters: any;
  result: any;
  execution_time_ms: number;
  constitutional_approval: number; // 0.0-1.0
  database_updates: string[];
  json_updates: string[];
  timestamp: Date;
}
```

### Chain Visualization
```typescript
interface MCPChainEvent {
  chain_id: string;
  total_calls: number;
  completed_calls: number;
  current_mcp: string;
  estimated_completion_ms: number;
  constitutional_score: number;
  real_time_updates: DatabaseUpdate[];
}
```

---

## 🚨 Emergency Protocols

### MCP Failure Handling
```yaml
Single MCP Failure:
  - Log to mistakes.json with error pattern
  - Auto-fallback to alternative MCP if available
  - Continue chain execution with degraded functionality
  - Emit failure event to dashboard

Chain Failure:
  - HALT entire chain execution
  - Rollback database changes if transaction failed
  - Log complete failure context to mistakes.json
  - Auto-retry with simplified approach if safe

Constitutional Violation:
  - IMMEDIATE HALT of all MCP operations
  - Chief Justice override required (99-100% autonomy)
  - Log violation details to constitutional-violations.json
  - Require manual approval for similar future requests
```

### Performance Monitoring
```yaml
Response Time Targets:
  - Single MCP call: <500ms
  - MCP chain (2-3 calls): <2s
  - Complex chain (4+ calls): <5s
  - Database updates: <100ms

Auto-Optimization:
  - Monitor MCP performance metrics
  - Auto-adjust timeout values
  - Implement intelligent caching
  - Optimize chain ordering based on success patterns
```

---

**Implementation**: These protocols are automatically enforced by the AegisIDE desktop application's integrated MCP server with real-time dashboard monitoring.