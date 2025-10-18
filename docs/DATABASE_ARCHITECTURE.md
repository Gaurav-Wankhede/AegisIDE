# AegisIDE Database Architecture

**Stack**: SQLite + JSON Memory Bank + Memory MCP | **Anti-Hallucination**: Context7 + Fetch Integration

## Architecture Philosophy

AegisIDE uses a dual-layer approach inspired by Archon's knowledge management best practices:
- **SQLite**: Fastest local database for session management and workspace isolation
- **JSON Memory Bank**: 6 essential files for real-time state (≤10KB each)
- **Memory MCP**: Unlimited local knowledge storage without external service costs
- **Anti-Hallucination**: Mandatory Context7/Fetch verification for all technical information

## Database Layer Strategy

### Primary: SQLite (Recommended)
**Use Cases**: Session management, user preferences, IDE connection states, workspace isolation, multi-user scenarios
**Benefits**: Zero configuration, fastest local performance, ACID compliance, concurrent access support

### Secondary: Supabase (Optional)
**Use Cases**: Team collaboration, cloud synchronization, advanced analytics
**Benefits**: Real-time subscriptions, built-in authentication, PostgreSQL features

### Fallback: MongoDB (Specialized)
**Use Cases**: Document-heavy workloads, flexible schema requirements, large-scale deployments
**Benefits**: Flexible schemas, aggregation pipelines, horizontal scaling

## JSON Memory Bank (Constitutional Framework)

### 6 Essential Files (Archon-Inspired Optimization)
**Real-Time State Management** (≤10KB each, 60KB total):

1. **activeContext.json**: Current execution state, AI branch status, session information
2. **scratchpad.json**: Priority task queue, user-controllable additions, immediate focus areas
3. **kanban.json**: Task workflow with drag-drop UI, constitutional approval states
4. **systemPatterns.json**: Architecture patterns, technical context, success metrics, dependency tracking
5. **mistakes.json**: Error patterns, learning history, Context7 source priorities, resolution strategies
6. **roadmap.json**: Strategic planning, milestone tracking, project scope, business alignment

### Performance Benefits
**Optimization Results**:
- **65% Reduction**: From 18 files (170KB) to 6 files (60KB) total footprint
- **Faster Processing**: Minimal file operations for real-time IDE responsiveness
- **Schema Consolidation**: Eliminated redundant data structures and overlapping contexts
- **LLM Efficiency**: Only essential data that cannot be dynamically generated

## File System Architecture

### Development Integration

### Development Setup
**SQLite Auto-Configuration**: Automatic database creation with full constitutional framework support and schema migration capabilities.

**JSON Development Tools**: Built-in memory bank visualization, schema validation testing, and constitutional governance debugging.

**MCP Integration Testing**: Real-time performance metrics, call tracing, and anti-hallucination verification workflows.

**Constitutional Compliance**: Development mode includes full tri-branch governance testing and validation pipeline debugging.

### Schema Consolidation Strategy
**Eliminated Files** (Merged into core 6):
- `techContext.json` → Merged into `systemPatterns.json`
- `productContext.json` → Merged into `roadmap.json`
- `projectbrief.json` → Merged into `roadmap.json`
- `blueprint.json` → Merged into `roadmap.json`
- `userflow.json` → Merged into `roadmap.json`
- `bugfix.json` → Merged into `mistakes.json`
- `deployment.json` → Merged into `systemPatterns.json`
- `monitoring.json` → Merged into `activeContext.json`
- `dependencies.json` → Merged into `systemPatterns.json`
- `progress.json` → Merged into `activeContext.json`
- `mermaid.json` → Generated dynamically, not stored

**Consolidation Benefits**: Reduced complexity, eliminated redundancy, improved processing efficiency, simplified schema management

## Implementation Benefits

### Performance Characteristics
**SQLite Benefits**: Zero configuration, ACID compliance, concurrent access support, fastest local database performance for session management.

**JSON Efficiency**: Sub-millisecond read/write operations, 65% reduced memory footprint, real-time synchronization across IDE sessions.

**Memory MCP Advantages**: Unlimited local storage, zero service costs, cross-project pattern recognition, immediate knowledge access.

### Constitutional Compliance
**Governance Integration**: All database operations validated through tri-branch constitutional framework with automated rollback on violations.

**Quality Assurance**: Schema validation ensures data integrity and constitutional compliance across all file operations.

**Audit Capability**: Complete tracking of all database changes and governance decisions for accountability and debugging.

### Anti-Hallucination Benefits
**Accuracy Improvement**: Context7/Fetch integration eliminates incorrect AI responses through verified documentation access.

**Source Reliability**: Mistakes.json analysis ensures most accurate documentation sources receive priority access.

**Knowledge Quality**: Local intelligence combined with verified external sources provides optimal development guidance.

## Memory MCP Knowledge Graph

### Local Intelligence Storage (Archon-Inspired)
**Zero-Cost Architecture**: Uses `@mcp:memory` for unlimited local storage, eliminating external service dependencies while providing comprehensive project intelligence.

### Knowledge Entities
**Project Intelligence**:
- Workspace metadata, technology stacks, architectural decisions
- Completion rates, success metrics, reusable component patterns
- Team collaboration workflows and development best practices

**Code Pattern Recognition**:
- Function signatures, class definitions, successful implementation patterns
- Architectural decisions with success rates and reuse opportunities
- Design pattern effectiveness and optimization suggestions

**Decision History & Learning**:
- Technical choices with documented rationale and measured outcomes
- Success/failure patterns for improved decision-making
- Cross-project pattern recognition and knowledge transfer

**Anti-Hallucination Intelligence**:
- Context7 documentation source priorities based on mistakes.json patterns
- Verified information sources ranked by accuracy and relevance
- Framework-specific best practice repositories for accurate guidance

### Intelligence Benefits

**Cost Efficiency**:
- **Zero External Fees**: No external LLM service costs or API usage limits
- **Local Processing**: All knowledge managed by connecting IDE's LLM
- **Unlimited Storage**: Memory MCP provides unlimited capacity without restrictions
- **Self-Contained**: No network dependencies or external service requirements

**Performance Advantages**:
- **Memory-Speed Access**: Local knowledge retrieval vs network latency
- **Real-time Learning**: Immediate pattern recognition during development
- **Session Persistence**: Knowledge retained across IDE restarts
- **Multi-IDE Sharing**: Unified knowledge base across all connected environments

## Anti-Hallucination Integration

### Context7 + Fetch Architecture
**Verification Pipeline**: Every technical question triggers automatic Context7 lookup for official documentation before AI response generation.

**Mistakes.json Integration**: Error patterns inform Context7 source prioritization, ensuring most accurate documentation sources are accessed first.

### Link Storage System
**Documentation Dashboard**: Users add framework documentation links to centralized dashboard. Context7 and Fetch automatically access these verified sources for accurate implementation guidance.

**Source Prioritization**: Based on historical accuracy from mistakes.json analysis, most reliable sources receive priority access.

## Performance & Architecture Benefits

### Processing Efficiency
**Optimized Performance**:
- **65% Reduction**: From 18 files (170KB) to 6 files (60KB) memory footprint
- **Faster Assembly**: Minimal file operations for real-time context loading
- **Schema Consolidation**: Eliminated redundant data structures and overlapping schemas
- **LLM Optimization**: Only essential data that cannot be dynamically generated

### Cost & Speed Benefits
**Zero Dependencies**:
- **No External Costs**: Local Memory MCP eliminates service fees and API limits
- **SQLite Performance**: Fastest local database for session management
- **Memory-Speed Access**: Local knowledge retrieval vs network latency
- **Real-time Updates**: Instant JSON file synchronization across IDE sessions

### Anti-Hallucination Performance
**Verification Speed**: Context7 and Fetch integration with local caching for immediate access to verified documentation sources.

**Intelligence Quality**: Mistakes.json pattern analysis ensures highest-accuracy sources receive priority, reducing incorrect AI responses.

## Session Management Architecture

### Multi-IDE Coordination
**SQLite Performance Monitoring**: Comprehensive logging for constitutional decisions, JSON operations, knowledge graph queries, and anti-hallucination verification processes.

**JSON Real-time Updates**: Memory bank files broadcast changes instantly to all connected IDE sessions with constitutional validation.

**Knowledge Synchronization**: Memory MCP shares learned patterns across IDE sessions while maintaining workspace isolation.

### Cross-IDE Learning Flow
**Pattern Transfer**: Knowledge gained in VS Code automatically enhances Windsurf experience through shared local memory graph.

**Session Intelligence**: IDE usage patterns and preferences stored locally for workflow optimization.

**Constitutional Consistency**: Same governance rules applied across all IDE connections regardless of client type.

## Security & Compliance

### Local Security Architecture
**Zero Network Exposure**: All data storage and processing occurs locally, eliminating external transmission risks and compliance concerns.

**Constitutional Governance**: Tri-branch validation system ensures all database operations comply with governance framework.

**Schema Enforcement**: JSON validation ensures data integrity and constitutional compliance across all file operations.

### Anti-Hallucination Security
**Verified Sources**: Context7 and Fetch integration ensures only verified documentation sources provide technical information.

**Audit Trails**: Complete tracking of information sources and verification steps for accountability and debugging.

### Intelligence Advantages  
**Pattern Recognition**: Successful implementations become reusable knowledge across projects
**Decision Memory**: Historical context informs current architectural and technical choices
**Team Learning**: Shared knowledge graph enables consistent practices across team members
**Continuous Improvement**: System learns from all interactions to optimize future recommendations