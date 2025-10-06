# AegisIDE Global Rules - Core LLM Behavior

**Version**: 3.0.0 | **Target**: All AI Models | **Integration**: Auto-Applied via Desktop App

---

## 🎯 Fundamental Behavior Rules

### Constitutional Supremacy
- **ALWAYS** follow constitutional framework loaded from `core/constitution/`
- **NEVER** bypass democratic consensus requirements (>95%)
- **AUTO-APPLY** tri-branch governance (Executive, Legislative, Judicial)
- **MANDATORY** memory-bank updates after every tool call

### MCP Tool Calling Protocol
1. **Auto-Trigger MCP Tools** based on task context - NO manual "use MCP" needed
2. **Chain MCP Calls** intelligently - use Context7 → Filesystem → Git in sequence
3. **Update Database** automatically after each tool chain completion
4. **Log All Operations** to real-time dashboard for monitoring

### Error Handling Framework
```
Error Detection → Auto-Call Context7 MCP → Get Official Docs → 
Implement Fix → Update SQLite → Update JSON → Validate → Continue
```

### Autonomous Operation Levels
- **0-98%**: Execute immediately without asking permission
- **99%**: Document rationale then execute automatically  
- **100%**: Require human consultation (constitutional conflicts only)

---

## 🔧 Real-time Integration Rules

### Desktop App Communication
- **ALWAYS** send status updates to AegisIDE dashboard via Tauri events
- **EMIT** MCP call events for real-time monitoring
- **UPDATE** port status and connection information
- **TRACK** all tool usage for analytics dashboard

### Database Auto-Management
- **SQLite First**: Default to SQLite for immediate functionality
- **Auto-Create**: Generate `data/constitutional.db` if missing
- **Auto-Update**: Update JSON files in `data/memory-bank/` after operations
- **Schema Validation**: Validate against `core/schemas/` before writes

### Global Rules Application
```rust
// Auto-applied by AegisIDE desktop app
fn apply_behavior_rules() {
    load_constitutional_framework();
    enable_autonomous_operation(98);
    set_mcp_auto_trigger(true);
    enable_real_time_dashboard_updates(true);
}
```

---

## 🚀 Performance Rules

### Efficiency Requirements
- **Parallel MCP Calls**: Execute independent MCP calls simultaneously
- **Context Optimization**: Maintain attention budget awareness
- **Memory Management**: Auto-compress files >10KB preserving critical data
- **Response Speed**: Target <2 second response time for tool chains

### Quality Gates
- **Zero Tolerance**: No errors/warnings before task completion
- **Validation Loop**: HALT-FIX-VALIDATE until 100% clean
- **Constitutional Compliance**: ≥95% adherence to framework rules
- **MCP Integration**: All external MCPs routed through AegisIDE hub

---

## 📊 Monitoring & Feedback

### Dashboard Integration
- **Live Feed**: Stream all operations to real-time dashboard
- **Metrics Tracking**: Response times, success rates, error patterns
- **Port Management**: Monitor server health and connection status
- **Rule Compliance**: Track adherence to constitutional framework

### Learning Loop
- **Pattern Storage**: Save successful approaches in memory-bank
- **Error Analysis**: Learn from mistakes.json patterns
- **Cross-Project**: Share insights via AegisIDE knowledge base
- **Continuous Improvement**: Evolve rules based on performance data

---

**Implementation**: These rules are automatically loaded and enforced by the AegisIDE desktop application when it starts the integrated MCP server.