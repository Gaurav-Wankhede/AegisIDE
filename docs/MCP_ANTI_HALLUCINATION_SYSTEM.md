# Mandatory 8 MCP Servers with Context7/Fetch Anti-Hallucination System

## Overview

AegisIDE enforces a **mandatory 8 MCP server architecture** with **AegisKG (Aegis Knowledge Graph)** - a custom local knowledge graph system inspired by [Archon](https://github.com/coleam00/Archon) - to eliminate hallucinations, ensure constitutional governance, and provide zero-cost local intelligence. All IDE connections must validate the presence and functionality of these servers before enabling advanced features.

### AegisKG: Custom Archon-Inspired Knowledge Graph

**AegisKG** is our proprietary local knowledge graph implementation that incorporates the best practices and architectural patterns from the [Archon project](https://github.com/coleam00/Archon), specifically designed for:
- **Zero External Dependencies**: Fully local operation with no cloud services
- **Constitutional Governance**: Democratic tri-branch decision making integrated into knowledge storage
- **Anti-Hallucination Focus**: Mandatory verification chains with Context7 and Fetch MCP servers
- **Multi-IDE Coordination**: Real-time knowledge synchronization across development environments

## Mandatory MCP Server Architecture

### Anti-Hallucination Core (Priority 1)
**Context7 MCP Server**
- **Purpose**: Official documentation lookup and verification
- **Auto-Trigger**: ANY technical query, error resolution, or implementation guidance
- **Validation**: Resolve library IDs before fetching docs, prioritize trust scores ≥7
- **Integration**: Links stored in systemPatterns.json, mistakes.json source prioritization

**Fetch MCP Server**  
- **Purpose**: Real-time web content verification and cross-referencing
- **Auto-Trigger**: External information needs, best practices research, security advisories
- **Validation**: Authoritative source verification, citation tracking, accuracy scoring
- **Integration**: Verified URLs stored in link storage system, governance decision support

### Local Intelligence Core (Priority 1)
**Memory MCP Server (AegisKG Core)**
- **Purpose**: AegisKG local knowledge graph with unlimited storage capacity, inspired by Archon's knowledge management patterns
- **Auto-Trigger**: Pattern storage, cross-project learning, decision precedent tracking, relationship inference
- **Validation**: Tag sources as 'auto'/'user', scope to workspace, semantic relationship mapping, knowledge entity linking
- **Integration**: Primary intelligence source for AegisKG, constitutional precedent storage, cross-IDE knowledge synchronization
- **Archon Integration**: Implements entity-relationship models, knowledge graph traversal, and intelligent pattern recognition based on Archon's proven architecture


### Development Infrastructure (Priority 2)
**Filesystem MCP Server**
- **Purpose**: Project file access with permission management and schema validation
- **Auto-Trigger**: JSON memory bank operations, configuration scanning, file structure analysis
- **Validation**: Workspace boundaries, schema compliance, integrity verification
- **Integration**: All JSON memory bank operations, SQLite session file correlation

**Git MCP Server**
- **Purpose**: Version control with constitutional governance integration
- **Auto-Trigger**: Commit tracking, branch strategy, governance decision versioning
- **Validation**: Tri-branch approval workflows, audit trail maintenance, rollback capability
- **Integration**: Constitutional decision versioning, change tracking, session correlation

### Intelligence Enhancement (Priority 3)
**Sequential-Thinking MCP Server**
- **Purpose**: Multi-step problem decomposition with reasoning chains
- **Auto-Trigger**: Complex implementation tasks, architectural decisions, debugging workflows
- **Validation**: Logic verification, step-by-step validation, constitutional compliance checking
- **Integration**: Complex task breakdown, governance decision analysis, pattern recognition

**Time MCP Server**
- **Purpose**: Temporal awareness with timezone intelligence and scheduling
- **Auto-Trigger**: Milestone tracking, session timestamps, governance decision timing
- **Validation**: Timezone consistency, scheduling coordination, temporal relationship tracking
- **Integration**: Session management timestamps, milestone correlation, decision chronology

**Math MCP Server**
- **Purpose**: Mathematical calculations with performance metrics and scoring
- **Auto-Trigger**: Consensus calculations, compliance scoring, performance analytics
- **Validation**: Calculation accuracy, metric consistency, statistical analysis
- **Integration**: Constitutional compliance scoring, performance analytics, consensus mathematics

## Anti-Hallucination Workflow

### Technical Query Resolution
```
1. Query Detection → Auto-trigger Context7 MCP
2. Library ID Resolution → Official documentation retrieval
3. Cross-Reference → Fetch MCP verification with authoritative sources
4. Pattern Storage → Memory MCP local storage + Byterover-MCP backup
5. Link Registration → systemPatterns.json enriched documentation links
6. Governance Validation → Constitutional compliance verification
7. Implementation → Zero-hallucination technical implementation
```

### Error Resolution Protocol
```
1. Error Detection → mistakes.json pattern analysis
2. Context7 Auto-Trigger → Official documentation lookup (NO ASKING)
3. Solution Verification → Fetch MCP authoritative source cross-check
4. Pattern Learning → Memory MCP error-solution relationship storage
5. Cross-Project Sharing → Memory MCP pattern distribution
6. Constitutional Validation → Tri-branch error resolution approval
7. Implementation Fix → Verified solution application with audit trail
```

### Information Verification Chain (AegisKG Enhanced)
```
1. Information Request → Dual verification (Context7 + Fetch)
2. Source Authority Check → Trust score validation (≥7 for Context7)
3. Cross-Reference Validation → Multiple authoritative source confirmation
4. AegisKG Pattern Recognition → Knowledge graph traversal and relationship inference
5. Archon-Inspired Entity Linking → Semantic knowledge entity relationships and contextual understanding
6. Constitutional Review → Judicial branch information accuracy validation with knowledge graph precedent analysis
7. AegisKG Storage Decision → Knowledge graph storage with entity relationships and link storage system registration
8. Implementation → Verified information integration with audit trail and knowledge graph enhancement
```

## MCP Server Validation Requirements

### Connection Health Monitoring
**Startup Validation:**
- All 8 MCP servers must respond within 5 seconds of IDE connection
- Health check endpoints must return successful status
- Capability verification for required operations (resolve-library-id, get-library-docs, etc.)

**Runtime Monitoring:**
- Continuous health monitoring every 30 seconds
- Automatic failover to backup servers when available
- Graceful degradation with user notification for critical failures

**Performance Metrics:**
- Response time tracking per MCP server
- Success rate analytics with trend analysis
- Resource utilization monitoring and optimization

### Anti-Hallucination Effectiveness Tracking

**Context7 Verification Metrics:**
- Official documentation retrieval success rate (target: >95%)
- Library ID resolution accuracy (target: >98%)
- Trust score adherence compliance (target: 100% for scores ≥7)

**Fetch Cross-Reference Metrics:**
- Authoritative source verification accuracy (target: >95%)
- Cross-reference consistency rate (target: >90%)
- False information detection and blocking (tracked in mistakes.json)

**Combined Anti-Hallucination Score:**
- Weighted average of Context7 and Fetch effectiveness
- Historical accuracy tracking with trend analysis
- Pattern learning improvement over time

## Constitutional Governance Integration with AegisKG

### Tri-Branch MCP Coordination (AegisKG Enhanced)

**Executive Branch MCP Usage:**
- Context7: Technical implementation guidance with official documentation and AegisKG knowledge correlation
- Filesystem: JSON memory bank operations and AegisKG knowledge graph storage management
- Git: Implementation versioning and change tracking with knowledge graph evolution history
- AegisKG Memory: Executive decision pattern storage and implementation knowledge graphs

**Legislative Branch MCP Usage:**
- Fetch: Best practices research and alternative solution investigation with AegisKG cross-referencing
- AegisKG Memory: Historical precedent analysis, constitutional pattern recognition, and governance knowledge graphs
- Sequential-Thinking: Complex policy analysis and decision decomposition with knowledge graph traversal

**Judicial Branch MCP Usage:**
- Context7: Official standards validation and compliance verification with AegisKG authority correlation
- Math: Consensus scoring and compliance metrics calculation with knowledge graph analytics
- Time: Decision timing and constitutional precedent chronology with AegisKG temporal relationship tracking
- AegisKG Memory: Constitutional interpretation precedent storage and judicial knowledge graph management

### Decision Support System

**MCP-Enriched Evidence Requirements:**
- All governance proposals must include Context7 official documentation support
- Legislative challenges require Fetch-verified alternative research
- Judicial reviews must include Memory MCP precedent analysis
- Consensus calculations use Math MCP for accuracy and consistency

**Constitutional Compliance Verification:**
- Sequential-Thinking MCP analyzes constitutional adherence complexity
- Time MCP tracks decision chronology for precedent establishment
- Memory MCP maintains constitutional interpretation precedent storage

## Link Storage System Integration

### Verified Documentation Repository

**Context7 Link Storage:**
- Official documentation URLs with trust scores
- Library-specific documentation sections with deep linking
- Version-specific documentation with update tracking
- Integration with systemPatterns.json enriched links field

**Fetch Link Repository:**
- Authoritative source URLs with verification timestamps
- Cross-reference validation status and accuracy scores
- Source reliability ratings with historical performance
- Integration with mistakes.json source prioritization system

**Link Verification Workflow:**
```
1. Documentation Request → Context7 library resolution
2. Official Link Retrieval → Trust score validation and storage
3. Cross-Reference Check → Fetch authoritative source verification
4. Link Registration → systemPatterns.json enriched documentation links
5. Accessibility Validation → Regular link health monitoring
6. Version Tracking → Documentation update detection and re-verification
7. Dashboard Integration → Centralized link management interface
```

## Implementation Phases

### Phase 1: Core Anti-Hallucination (Weeks 1-2)
- Context7 and Fetch MCP integration with auto-trigger workflows
- Basic verification chain implementation
- Link storage foundation with systemPatterns.json integration

### Phase 2: Local Intelligence (Weeks 3-4)  
- Memory MCP integration with comprehensive pattern storage
- Cross-project learning capabilities
- Constitutional precedent storage system

### Phase 3: Infrastructure Integration (Weeks 5-6)
- Filesystem and Git MCP integration with session management
- JSON memory bank operations through MCP validation
- Version control with constitutional governance

### Phase 4: Advanced Intelligence (Weeks 7-8)
- Sequential-Thinking, Time, and Math MCP integration
- Complex problem decomposition capabilities
- Advanced constitutional governance with mathematical consensus validation

### Phase 5: Dashboard and Monitoring (Weeks 9-10)
- Link storage dashboard with verification status
- MCP health monitoring and performance analytics
- Anti-hallucination effectiveness tracking and reporting

## Security and Compliance

### MCP Server Security
- Local server deployment with no external dependencies
- Encrypted communication between IDE and MCP servers
- Access control and permission validation per server
- Audit logging for all MCP operations with constitutional oversight

### Anti-Hallucination Compliance
- Zero tolerance for unverified information in implementation
- Mandatory verification chain for all technical guidance
- Constitutional governance oversight of information accuracy
- Regular audit of anti-hallucination effectiveness with improvement recommendations

This mandatory 8 MCP server architecture with **AegisKG (Aegis Knowledge Graph)** - our custom Archon-inspired local knowledge graph system - ensures AegisIDE maintains the highest standards of information accuracy, constitutional governance, and zero-cost local intelligence while eliminating the risk of AI hallucinations in development workflows.

## AegisKG Implementation References

**Archon Project Inspiration**: [https://github.com/coleam00/Archon](https://github.com/coleam00/Archon)
- **Knowledge Graph Architecture**: Entity-relationship modeling and semantic knowledge storage
- **Local-First Design**: Zero external dependencies with distributed synchronization capabilities
- **Pattern Recognition**: Intelligent knowledge inference and relationship discovery
- **Constitutional Integration**: Democratic governance patterns applied to knowledge management

**AegisKG Enhancements Over Standard Archon**:
- **Constitutional Governance**: Tri-branch democratic validation integrated into knowledge graph operations
- **Multi-IDE Coordination**: Real-time knowledge synchronization across development environments
- **Anti-Hallucination Focus**: Mandatory verification chains with Context7 and Fetch integration
- **Session Isolation**: Workspace-specific knowledge graphs with cross-session pattern sharing
