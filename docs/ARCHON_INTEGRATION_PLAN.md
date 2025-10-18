# AegisIDE Knowledge Management Platform

**Architecture**: Tauri Desktop + SQLite Sessions + JSON Memory Bank + 9 Mandatory MCPs

## Vision: Anti-Hallucination Knowledge Platform

AegisIDE eliminates AI hallucinations through mandatory Context7 and Fetch MCP integration, providing verified documentation access and intelligent knowledge management for multi-IDE environments.

**Core Philosophy**: 
- SQLite for session management (fastest local database)
- JSON memory bank for real-time state (6 essential files)
- Mandatory 9 MCPs for anti-hallucination
- Link storage dashboard for documentation access
- Constitutional governance for quality assurance

## Architecture Overview

Single Tauri desktop application with embedded MCP server on Port 7777, supporting simultaneous connections from Claude Desktop, Windsurf, VS Code, Cursor, and JetBrains IDEs.

### **Unified Project Structure**
```
AegisIDE/
├── Cargo.toml                     # Workspace root
├── src-tauri/                     # 🦀 Tauri Rust Backend + Frontend (Tailwind CSS + UI Library)
│   ├── src/
│   │   ├── main.rs               # Unified app entry point
│   │   ├── mcp_server.rs         # Integrated MCP server
│   │   ├── constitutional.rs     # Constitutional framework
│   │   ├── database.rs           # Auto SQLite management
│   │   └── ui/                   # Native Rust UI modules
│   │       ├── dashboard.rs      # Dashboard UI components
│   │       ├── menu.rs           # Native menu system
│   │       └── events.rs         # UI event handlers
│   ├── Cargo.toml               # Rust dependencies
│   └── tauri.conf.json          # Desktop app configuration
├── core/                          # Constitutional Framework
│   ├── constitution/             # Constitutional articles
│   ├── laws/                     # Platform-specific laws
│   └── schemas/                  # JSON schemas for validation
├── data/                         # Auto-generated data (runtime)
│   ├── constitutional.db         # SQLite database (auto-created)
│   ├── memory-bank/              # JSON files (auto-updated)
│   └── mcp-logs/                 # MCP call logs
├── global-rules/                 # LLM Behavior Control
│   ├── core-behavior.md          # Fundamental LLM behavior rules
│   ├── mcp-calling-rules.md      # MCP tool calling protocols
│   └── constitutional-rules.md   # Constitutional compliance rules
└── README.md                     # Setup and usage guide
```

## 🚀 Core Features

### 1. **Auto-Start MCP Server**
The desktop application automatically starts the MCP server on launch, scanning for available ports between 7700-7799 range, with port 7777 as the primary target. The constitutional framework initializes alongside the MCP server to provide autonomous LLM governance.

### 2. **Native Rust Dashboard**
The dashboard is built entirely in Rust using Tauri's native UI capabilities. It displays real-time MCP call logs, constitutional decisions, database operations, and port management - all through native Rust components without web technologies.

### 3. **Auto-Database Creation**
The application automatically creates and manages a SQLite database on first launch. The constitutional database stores project states, governance decisions, MCP call history, and memory-bank snapshots. Database schema is embedded within the application and deployed automatically.

### 4. **IDE Integration Configuration**
When AegisIDE desktop app starts, it automatically provides IDE integration configurations for all supported IDEs. Users can copy the generated configuration into their IDE's MCP settings to connect to the centralized port 7777.

**Supported IDE Configurations**:
- **Claude Desktop**: MCP server endpoint at http://localhost:7777/mcp with HTTP transport
- **Windsurf**: Server configuration pointing to http://localhost:7777/mcp 
- **VS Code**: MCP extension configured for localhost:7777
- **JetBrains IDEs**: Plugin configuration for port 7777 MCP server

## 🎛️ Desktop Application Flow

### Application Startup Sequence
1. **Tauri App Launches** → Native Rust UI initializes
2. **Auto-Start MCP Server** → Find available port (7700-7799, prefer 7777)
3. **Initialize Constitutional Framework** → Load constitutional articles and laws
4. **Setup SQLite Database** → Auto-create constitutional database
5. **Create Memory-Bank JSON** → Auto-generate 18 JSON file structure
6. **Load Global Rules** → Apply LLM behavior and constitutional rules
7. **Dashboard Ready** → Native Rust dashboard displays system status

### Native Dashboard Features
- **MCP Call Monitor**: Real-time display of all MCP tool calls and responses
- **Constitutional Decisions**: Live tracking of tri-branch democratic decisions
- **Port Management**: Current server port status and IDE connection monitoring
- **Database Operations**: SQLite operations and JSON memory-bank updates
- **Global Rules Status**: Active LLM behavior rules and compliance metrics
- **IDE Connections**: Connected IDE list with usage statistics
## 🛠️ Global Rules Engine

The desktop app replaces manual rule configuration with an intelligent Global Rules system:

### Global Rules Structure
```
global-rules/
├── core-behavior.md              # Fundamental LLM behavior
├── mcp-calling-rules.md          # MCP tool calling protocols  
├── constitutional-rules.md       # Constitutional compliance
└── platform-specific/
    ├── claude-rules.md          # Claude Desktop specific
    ├── windsurf-rules.md        # Windsurf specific
    └── vscode-rules.md          # VS Code specific
```

## Data Architecture (Archon-Inspired Best Practices)

### SQLite Session Management
**Primary Database**: SQLite for session state, user preferences, IDE connections, and workspace isolation. Fastest local database for real-time multi-IDE session handling.

### JSON Memory Bank (6 Essential Files)
**Real-time State Management**:
- `activeContext.json` - Current execution state and branch status
- `scratchpad.json` - Priority task queue with user control
- `kanban.json` - Drag-drop task workflow with constitutional approval
- `systemPatterns.json` - Architecture patterns and technical context
- `mistakes.json` - Error patterns and learning history
- `roadmap.json` - Strategic planning and consolidated project context

### Knowledge Graph (Memory MCP)
**Local Intelligence Storage**: Unlimited local pattern storage via @mcp:memory, cross-project learning, and decision history tracking without external service costs.

## Anti-Hallucination System

### Mandatory 9 MCP Servers
**Always Active MCPs** (Cannot be disabled):
- **context7**: Official documentation lookup for verified information
- **fetch**: Web content retrieval with intelligent caching
- **filesystem**: Project file access and manipulation
- **git**: Version control integration
- **memory**: Local knowledge graph storage
- **byterover-mcp**: Cross-project pattern sharing
- **sequential-thinking**: Complex problem decomposition
- **time**: Temporal awareness and scheduling
- **math**: Mathematical calculations and metrics

### Context7 + Fetch Integration
**Hallucination Prevention**: Every technical question automatically triggers Context7 for official documentation before AI response. Mistakes.json patterns inform which documentation sources to prioritize.

### Link Storage Dashboard
**Documentation Management**: Users add documentation links to dashboard. Context7 and Fetch automatically access these verified sources for framework-specific best practices, ensuring accurate implementation guidance.

## Implementation Strategy

### Phase 1: Core Infrastructure (Week 1)
**Foundation Setup**:
- Tauri desktop application with embedded MCP server (Port 7777)
- SQLite database for session management and workspace isolation
- 6-file JSON memory bank with schema validation (≤10KB each)
- Constitutional tri-branch governance framework
- Real-time file watching and atomic updates

### Phase 2: Anti-Hallucination Integration (Week 2)
**MCP Integration**:
- Deploy 9 mandatory MCP servers with auto-configuration
- Context7 integration for official documentation access
- Fetch MCP for verified web content retrieval
- Link storage dashboard for documentation management
- Mistakes.json pattern analysis for Context7 source prioritization

### Phase 3: Knowledge & UI Systems (Week 3)
**Advanced Features**:
- Memory MCP knowledge graph with local pattern storage
- Native Rust drag-and-drop kanban interface
- Real-time task synchronization across IDE sessions
- Cross-IDE learning and pattern recognition
- User-driven task management with constitutional validation

## Key Features

### Multi-IDE Session Management
**Concurrent Support**: Simultaneous connections from Claude Desktop, Windsurf, VS Code, Cursor, JetBrains IDEs with workspace isolation and shared constitutional governance.

### Real-time Kanban Dashboard
**Native Interface**: Drag-and-drop task management with cross-IDE synchronization, user-driven task creation, and constitutional approval workflow.

### Anti-Hallucination Protection
**Verified Information**: Automatic Context7 documentation lookup, Fetch web verification, and mistakes.json pattern analysis ensure accurate AI responses.

### Constitutional Governance
**Quality Assurance**: Tri-branch democratic system (Executive, Legislative, Judicial) validates all implementations with zero-tolerance error policy.

## Benefits

### For Developers
- **Hallucination-Free**: Mandatory Context7/Fetch verification prevents incorrect AI responses
- **Multi-IDE Support**: Universal compatibility across all major development environments
- **Local Intelligence**: Zero external service costs with unlimited local knowledge storage
- **Constitutional Quality**: Democratic governance ensures production-ready code

### For Teams
- **Shared Knowledge**: Cross-project pattern recognition and team learning
- **Collaborative Governance**: Tri-branch decision-making for consistent quality
- **Documentation Integration**: Centralized link storage for team documentation access
- **Session Isolation**: Independent workspaces with shared governance framework

### For Enterprises
- **Security**: Local data storage with no external transmission
- **Auditability**: Complete governance decision trails and constitutional compliance
- **Self-Contained**: No external dependencies or ongoing service fees
- **Scalability**: Handle hundreds of concurrent IDE connections with SQLite performance

## AegisKG Implementation Strategy

### Phase 1: AegisKG Foundation (Archon-Inspired)
**Timeline**: Weeks 1-2
- **AegisKG Core Deployment**: Local Memory MCP server with Archon-inspired knowledge graph capabilities
- **AegisKG Implementation of Archon Best Practices:**
- **Knowledge Entity Storage**: Structured storage of development patterns, error solutions, and architectural decisions using Archon's entity framework
- **Relationship Inference**: Intelligent correlation between related knowledge entities across projects, implementing Archon's semantic relationship algorithms
- **Cross-Project Intelligence**: Local knowledge base with workspace isolation and collaboration patterns, inspired by Archon's distributed architecture
- **Version Control Integration**: Knowledge graph evolution tracking with Git-based versioning, extending Archon's versioning concepts with constitutional governance

### Phase 2: Anti-Hallucination Integration (Week 2)
**MCP Integration**:
- Deploy 9 mandatory MCP servers with auto-configuration
- Context7 integration for official documentation access
- Fetch MCP for verified web content retrieval
- Link storage dashboard for documentation management
- Mistakes.json pattern analysis for Context7 source prioritization

### Phase 3: Knowledge & UI Systems (Week 3)
**Advanced Features**:
- Memory MCP knowledge graph with local pattern storage
- Native Rust drag-and-drop kanban interface
- Real-time task synchronization across IDE sessions
- Cross-IDE learning and pattern recognition
- User-driven task management with constitutional validation

## AegisKG: Archon Integration References

**Archon Project Source**: [https://github.com/coleam00/Archon](https://github.com/coleam00/Archon)

**Key Archon Concepts Integrated into AegisKG:**
- **Distributed Knowledge Architecture**: Local-first design with cross-session synchronization capabilities
- **Entity-Relationship Modeling**: Semantic knowledge storage with intelligent pattern recognition
- **Knowledge Graph Traversal**: Efficient relationship inference and contextual knowledge retrieval
- **Pattern-Based Intelligence**: Automated pattern discovery and cross-project knowledge sharing

**AegisKG Enhancements Over Standard Archon:**
- **Constitutional Governance**: Democratic tri-branch validation integrated into all knowledge operations
- **Multi-IDE Coordination**: Real-time knowledge synchronization across multiple development environments
- **Anti-Hallucination Integration**: Mandatory Context7/Fetch verification chains for all stored knowledge
- **Session-Aware Intelligence**: Workspace-specific knowledge graphs with constitutional isolation policies

## Next Steps

1. **Week 1**: Set up Rust project with rmcp dependencies + basic MCP server
2. **Week 2**: Implement core constitutional middleware and Archon HTTP client  
3. **Week 3-4**: Build tri-branch governance system with consensus engine
4. **Week 5-6**: Integrate 18-file memory bank system with constitutional updates
5. **Week 7-8**: Test with all target IDEs and performance optimization

## Conclusion

This Rust MCP server approach provides the best of both worlds: Archon's proven knowledge management capabilities combined with AegisIDE's constitutional governance framework, delivered through Rust's performance and safety guarantees. The result is a production-ready, democratically-governed AI development tool that works universally across all MCP-compatible IDEs.

## Success Metrics

### Phase 1-2 Success Criteria
- ✅ Rust MCP server compiles and runs with stdio transport
- ✅ Basic MCP tools (init, next, fix, validate) operational
- ✅ HTTP integration with Archon FastAPI services working
- ✅ Constitutional middleware processing all requests

### Phase 3-4 Success Criteria
- ✅ Tri-branch governance system fully implemented
- ✅ >95% consensus calculation working across proposal types
- ✅ 18-file memory bank system operational
- ✅ Integration with Claude Desktop, Windsurf, VS Code confirmed

### Performance Targets
- **Response Time**: <100ms for basic MCP operations
- **Throughput**: Handle 1000+ concurrent IDE connections
- **Memory Usage**: <50MB baseline memory footprint
- **Consensus Calculation**: <10ms for democratic decision-making

## Deployment Strategy

### Local Development
```bash
# Install and run locally
cargo build --release
./target/release/aegis-mcp-server --config config/server.toml
```

### Docker Deployment
```dockerfile
FROM rust:1.75 as builder
WORKDIR /app
COPY . .
RUN cargo build --release

FROM debian:bookworm-slim
RUN apt-get update && apt-get install -y ca-certificates
COPY --from=builder /app/target/release/aegis-mcp-server /usr/local/bin/
CMD ["aegis-mcp-server", "--config", "/config/server.toml"]
```

### Production Scaling
- **Load Balancing**: Multiple Rust MCP server instances
- **Service Discovery**: Integration with existing Archon infrastructure
- **Health Monitoring**: Prometheus metrics + health checks
- **Configuration Management**: Environment-based config with secrets

## Risk Mitigation

### Technical Risks
- **MCP Protocol Changes**: Use official rmcp SDK with version pinning
- **Archon API Changes**: Implement versioned API client with fallbacks
- **Performance Bottlenecks**: Rust's async runtime with connection pooling

### Governance Risks  
- **Consensus Deadlocks**: Emergency protocols for <95% scenarios
- **Constitutional Violations**: Judicial override with audit logging
- **Memory Bank Corruption**: Atomic file operations with rollback

### Integration Risks
- **IDE Compatibility**: Extensive testing across all supported IDEs
- **Transport Issues**: Both stdio and SSE transport support
- **Migration Path**: Gradual rollout with fallback to existing systems

## AegisKG: Custom Archon-Inspired Knowledge Graph

## Overview

This document outlines **AegisKG (Aegis Knowledge Graph)** - our custom local knowledge graph system inspired by the [Archon project](https://github.com/coleam00/Archon). AegisKG incorporates Archon's proven distributed intelligence architecture while maintaining zero external dependencies, constitutional governance, and enhanced anti-hallucination capabilities specifically designed for multi-IDE development environments.

## AegisKG: Archon-Inspired Knowledge Graph Architecture

### Local Memory MCP Knowledge Graph (AegisKG Core)

**Core Architecture Based on Archon Patterns:**
- **Memory MCP Server**: Primary AegisKG storage with unlimited capacity, implementing Archon's entity-relationship models
- **Archon-Inspired Entity-Relationship Modeling**: Semantic knowledge storage with intelligent relationship inference following Archon's proven patterns
- **Pattern Recognition**: Automated pattern discovery and cross-project knowledge sharing using Archon's knowledge graph traversal algorithms
- **Constitutional Integration**: Democratic governance applied to knowledge graph operations, extending Archon's architecture with tri-branch validation

## Benefits

### For Developers
- **Hallucination-Free**: Mandatory Context7/Fetch verification prevents incorrect AI responses
- **Multi-IDE Support**: Universal compatibility across all major development environments
- **Local Intelligence**: Zero external service costs with unlimited local knowledge storage
- **Constitutional Quality**: Democratic governance ensures production-ready code

### For Teams
- **Shared Knowledge**: Cross-project pattern recognition and team learning
- **Collaborative Governance**: Tri-branch decision-making for consistent quality
- **Documentation Integration**: Centralized link storage for team documentation access
- **Session Isolation**: Independent workspaces with shared governance framework

### For Enterprises
- **Security**: Local data storage with no external transmission
- **Auditability**: Complete governance decision trails and constitutional compliance
- **Self-Contained**: No external dependencies or ongoing service fees
- **Scalability**: Handle hundreds of concurrent IDE connections with SQLite performance

## Logging and Observability
```rust
use tracing::{info, warn, error, instrument};

#[instrument(skip(self))]
pub async fn execute_democratic_consensus(&self, proposal: &Proposal) -> Result<Consensus> {
    info!("Starting democratic consensus calculation");
    
    let result = self.consensus_engine.calculate(proposal).await
        .context("Consensus calculation failed")?;
    
    info!(score = %result.score, passed = %result.passed, "Consensus calculated");
    
    Ok(result)
}
