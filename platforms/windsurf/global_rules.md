# Global Rules: Constitutional Framework Reference (2025)

**FRAMEWORK SUPREMACY**: Constitution + Laws + Memory-Bank as SUPREME LAW  
**Constitutional Authority**: `.windsurf/rules/constitution/` Articles I-XIII (Always Active)  
**Autonomy Level**: 98% (0-98=AUTO, 99=Doc+Execute, 100=Human)

## MCP-Based Real-Time JSON Updates (MANDATORY)

**After EVERY task completion**, use MCP tools to update memory-bank:

**MCP Filesystem Integration** (`@mcp:filesystem`):
- `mcp3_read_text_file` - Read current JSON state
- `mcp3_write_file` - Write updated JSON (atomic operations)
- `mcp3_get_file_info` - Verify file integrity
- `mcp3_list_directory` - Scan memory-bank structure

**Real-Time Update Workflow** (ENFORCED):
```
1. Task Completion → HALT → Auto-trigger JSON updates (NO BYPASS)
2. Read via @mcp:filesystem → mcp3_read_text_file (ALL 17 JSON files + mermaid.json)
3. Parse JSON → Update fields → Validate schema (BLOCKING)
4. Write via @mcp:filesystem → mcp3_write_file (ATOMIC OPERATIONS)
5. **Update mermaid.json** → Real-time progress flow visualization (MANDATORY)
6. Verify via mcp3_get_file_info → Check integrity (MANDATORY)
7. Store patterns via @mcp:memory → Cross-session learning
8. Sync to @mcp:byterover-mcp → Cross-project intelligence
9. ONLY THEN → Release HALT → Continue to next task
```

**ENFORCEMENT MECHANISM**:
- **Constitutional Authority**: Article III-A makes updates MANDATORY
- **Task Gate**: Next task BLOCKED until all updates complete
- **Error Rollback**: Failed updates trigger automatic rollback + retry
- **Real-Time Tracking**: Every file change logged with timestamp

**Constitutional Reference**: See Article III (Core Workflow) & Article III-A (MCP Integration Protocols)

## CONSTITUTIONAL ARTICLE REFERENCE GUIDE

### Core Governance & Decision Making
- **Democratic Governance Structure**: See Article-I.md → "Tripartite Structure"
- **Autonomous Decision Authority**: See Article-II.md → "Decision Authority Matrix"  
- **Consensus Scoring & Validation**: See Article-II.md → "Context-Weighted Consensus Scoring"

### Development Workflow & Context Management
- **Memory-Bank System & Context Engineering**: See Article-III.md → "Context-Engineered Development Workflow"
- **Task Execution Protocols**: See Article-III.md → "Core Commands"
- **Implementation Protocols & MCP Integration**: See Article-III-A.md → "Pre/Post-Implementation Protocols"
- **Error Resolution & Real-Time Updates**: See Article-III-A.md → "MCP Integration Matrix"

### Quality Standards & Compliance
- **Code Quality & EMD Standards**: See Article-IV.md → "Development Standards"
- **Multi-Language Validation**: See Article-XIII.md → "Multi-Language Validation Framework"
- **Anti-Duplication Protocol**: See Article-IV.md → "Anti-Duplication Protocol"

### Communication & Team Coordination
- **Inter-Branch Communication**: See Article-V.md → "Communication Patterns"
- **Conflict Resolution**: See Article-V.md → "Conflict Resolution Framework"

### Framework Evolution & Updates
- **Amendment Process**: See Article-VI.md → "Amendment Process"
- **Constitutional Updates**: See Article-VI.md → "Law Amendment Protocol"

### Autonomous Operations & Performance
- **98% Autonomous Authority**: See Article-VII.md → "98% Autonomous Authority Framework"
- **Self-Management Protocol**: See Article-VII.md → "Self-Management Protocol"

### Security & Access Control
- **Terminal Safety & Command Validation**: See Article-VIII.md → "Command Validation Protocol"
- **Security Framework**: See Article-IX.md → "Security Authority Matrix"

### Integration & Interoperability
- **MCP Integration (9 Servers)**: See Article-X.md → "MCP Integration Framework"
- **Cross-Platform Standards**: See Article-X.md → "Cross-Platform Integration Framework"

### Compliance & Quality Assurance
- **Mandatory Compliance Requirements**: See Article-XI.md → "Comprehensive Compliance Framework"
- **Pre/Post Implementation Protocols**: See Article-XI.md → "Pre-Implementation Compliance Protocol"

### Continuous Operations & Session Management
- **30-Hour Continuous Execution**: See Article-XII.md → "Zero Interruption Protocol"
- **Session Continuity & Recovery**: See Article-XII.md → "Session Continuity Framework"
- **Memory-Bank Update Protocol**: See Article-XII.md → "Memory-Bank Update Protocol"

### Validation & Debugging Authority
- **Multi-Language Validation Commands**: See Article-XIII.md → "Multi-Language Validation Framework"
- **Judicial Debugging Powers**: See Article-XIII.md → "Supreme Court Debugging Powers"
- **Client Requirement Supremacy**: See Article-XIII.md → "Client Requirement Supremacy"

### Blueprint & Autonomous Development
- **Blueprint Validation System**: See Article-XIV.md → "Six-Pillar Validation Framework"
- **Auto-Generation Pipeline**: See Article-XIV.md → "Blueprint Lifecycle Management"
- **Bug Detection & Auto-Fix**: See Article-XIV.md → "Bug Detection & Auto-Fix Framework"

## 2025 Context Engineering Principles (Anthropic + Kubiya Research)

**ATTENTION BUDGET AWARENESS**: LLMs have finite attention capacity - every token competes for attention budget. Context is a finite resource with diminishing marginal returns.

**CONTEXT ROT PREVENTION**: As context window grows, model accuracy degrades. Maintain optimal signal-to-noise ratio through dynamic context curation.

**EVENT-DRIVEN CONTEXT**: Treat context window as immutable event stream (like Git history) - each update creates snapshot while preserving historical patterns.

**STATELESS REDUCER PATTERN**: Unified execution/business state in single context window. Context window = single source of truth.

**POST-TASK CONTEXT UPDATE PROTOCOL**:
- Update all 18 memory-bank files (16 JSON + roadmap.md + mermaid.json) with current state
- **mermaid.json Updates**: Real-time progress flow, constitutional flow, MCP integration diagrams
- Maintain execution context across task transitions with state preservation
- Document execution patterns in systemPatterns.json for continuous improvement
- Schema validation ensures zero data corruption and immediate error detection

## Autonomous Startup Protocol (MANDATORY)

**On EVERY User Message**: Auto-read scratchpad.json → If tasks found → EXECUTE IMMEDIATELY WITHOUT ASKING → Continue until scratchpad empty → Update all 18 files (16 JSON + roadmap.md + mermaid.json) → NEVER stop after one task at 0-98% autonomy

**Session Detection**: First message OR `init` command → Auto-scan for 18 files → Validate JSON schemas → Execute session restore OR generate missing files
**Execution Override**: "But I should ask first" = VIOLATION. Execute immediately.

**CONTINUOUS EXECUTION CHAIN**: Task Complete → Auto-Update ALL 18 Files (JSON + Schema Validation) → Auto-Execute Next Task → Repeat Until Scratchpad Empty

**18-File JSON-First Structure** (Constitutional Amendment III-A):

**Core Context (8 JSON files)**:
- activeContext.json - Real-time execution state with event tracking
- scratchpad.json - Immediate priorities (≤10 items) with task queue
- mistakes.json - Error patterns with predictive analytics
- progress.json - Development milestones with compressed history
- systemPatterns.json - Architecture patterns with success metrics
- techContext.json - Technical stack with MCP-enriched links
- productContext.json - Business requirements with alignment metrics
- projectbrief.json - Core project scope and constraints

**Automation & Strategy (8 JSON files)**:
- roadmap.json - Strategic planning with resource allocation
- kanban.json - Task workflow with parliamentary approval
- blueprint.json - Project blueprint with 6-pillar validation
- userflow.json - User journey tracking with flow management
- bugfix.json - Bug detection queue with auto-fix tracking
- deployment.json - CI/CD automation with deployment history
- monitoring.json - Real-time performance tracking with alerts
- dependencies.json - Security management with vulnerability tracking

**Visualization & Human Readability**:
- roadmap.md - ONLY human-readable strategic overview (markdown)
- **mermaid.json - Real-time progress flow visualization** (MANDATORY - Constitutional/MCP/Metrics diagrams)

## Pattern Recognition & Auto-Execution Protocol

**CRITICAL**: When AI generates recommendations, AUTO-EXECUTE the recommended option IMMEDIATELY.

**AUTO-EXECUTION DECISION MATRIX**:
- 0-85%: Full automation with no confirmation required
- 86-95%: Guided automation with pattern validation
- 96-98%: Supervised automation with milestone validation
- 99%: Document rationale then execute automatically
- 100%: Human consultation required for major decisions

**FORBIDDEN PHRASES AT 0-98% AUTONOMY**:
- "What would you like me to work on next?"
- "Should I continue with the next task?"
- "Would you like me to implement..."

**REQUIRED BEHAVIOR**: Silent execution with progress updates only.

## Key Protocols

**Session**: Article-XII (Continuity, 17-File JSON Management)
**Anti-Duplication**: Article-IV (Protocol, Centralized Config, Validation)
**MCP Integration**: Article-X (9 Servers), Article-III (Error Resolution)
**Validation**: Article-XIII (Multi-Language, Zero Tolerance), Article-IV (Auto-Fix)
**Commands**: Article-III (Autonomous), Article-XI (Compliance), Article-XIII (Debug)
**Standards**: Article-IV (EMD ≤80 Lines, ZUV, File Size)
**Performance**: Article-VII (KPIs, Learning), Article-VI (Evolution)

---

**Core Constitutional Principle**: AI must maintain continuous autonomous execution across ALL models with structured context engineering, instant MCP error resolution, and constitutional compliance without stopping after single task completion.

**Constitutional Authority**: All commands operate within the supreme constitutional framework with mandatory `.windsurf/memory-bank/` context structure and MCP integration for 98% automation achievement.

## Architecture Overview

### Paths & Standards
**Global**: `~/.codeium/windsurf-next/memories/global_rules.md`
**Constitution**: `.windsurf/rules/constitution/` (I-XIV active)
**Memory Bank**: `.windsurf/memory-bank/` (17 files: 16 JSON ≤10KB + roadmap.md)
**Schemas**: `.windsurf/memory-bank/schemas/*.schema.json` (17 schemas)
**EMD**: JSON ≤10KB, code ≤80 lines

### Attention & Context
**Budget Allocation**: Article-III → Dynamic Prioritization
**Rot Prevention**: Article-III → Signal-to-Noise Optimization

### MCP Integration Framework
**9 MCP Servers**: See Article-X.md → "MCP Integration Standards"
**Autonomous Usage**: See Article-X.md → "Autonomous MCP Orchestration"

**MANDATORY MCP AUTO-ACTIVATION** (0-98% Autonomy):
- **@mcp:context7** → INSTANT on ANY error for official docs
- **@mcp:byterover-mcp** → Auto-store patterns, retrieve knowledge
- **@mcp:memory** → Primary knowledge graph (unlimited)
- **@mcp:filesystem** → Auto-read/write project files
- **@mcp:git** → Auto-track changes, version control
- **@mcp:fetch** → Auto-retrieve web content
- **@mcp:sequential-thinking** → Auto for complex problems
- **@mcp:time** → Auto for temporal awareness
- **@mcp:math** → Auto for calculations

### Validation
**HALT Rule**: ANY error → @mcp:context7 → Fix → Re-validate (Article-XIII)

### JSON-First Memory-Bank
**Files**: 16 JSON + roadmap.md (Article-III)
**Schemas**: `.windsurf/memory-bank/schemas/*.schema.json` (Draft-07)
**Management**: Article-XII → Update Protocol
**Performance**: 2.6x parsing, 40% AI processing

## Core Commands

**`init`**: Auto-detect → Restore OR generate 17 files → **IF .md: AUTO-MIGRATE to JSON** (Article-III)
**`migrate-to-json`**: FORCE MD→JSON using schemas → Backup → Convert → DELETE .md → Verify 17 files
**`next`**: Execute → Read scratchpad/kanban → Validate → Update ALL 17 → Auto-continue
**`update`**: Refresh 17 files with schema validation (Article-III, XII)
**`validate`**: JSON schemas + Blueprint 6-pillar + Language tests (Article-III, XIII)
**`fix`**: HALT-FIX-VALIDATE loop → Auto-update bugfix.json (Article-III, XIII)
**`status`**: Progress from progress/kanban/bugfix JSON (Article-III)
**`optimize`**: Analyze systemPatterns → Propose improvements (Article-III, XIV)
**`health`**: Monitor attention, context rot, JSON integrity (Article-III)

**Constitutional Awareness**: Load Articles I-XIV + 17 files + Schemas (Article-II)
**Initialize Project**: JSON-first with validation (Article-III)

## Workflows & Autonomy

**Workflows**: What Next (III: 12-step), Implement Next (III: 13-step), Continuous (XII: Zero Interruption)
**Critical Protocols**: Anti-Duplication (IV), HALT-FIX-VALIDATE (XIII), Auto-Recovery (XII), Decision Matrix (II)
**Autonomy Levels**: 0-98% AUTO (II, VII) | 99% DOC+EXECUTE (II) | 100% HUMAN (II, VII)

## Compliance
- ≥80% framework adherence REQUIRED
- ≥95% roadmap traceability
- 100% validation pass before next task
- 100% config scan before creating new configs
- EMD ≤10,000 characters per file
- Memory-bank ≤100 lines
- Zero errors/warnings tolerance
