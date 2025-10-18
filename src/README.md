# AegisIDE - AI Governance Framework

**AegisIDE** is a constitutional framework that transforms AI-powered development through democratic governance, persistent memory, and autonomous workflows. Pure JSON architecture for cross-IDE compatibility and MCP-first execution.

## What is AegisIDE?

AegisIDE creates a "digital republic" where AI operates under constitutional law with three branches of governance:
- **Executive**: Implements tasks and manages development
- **Legislative**: Reviews quality and challenges decisions  
- **Judicial**: Enforces validation and constitutional compliance

This ensures AI development is reliable, accountable, and maintains high quality standards.

## Core Components

```
.aegiside/                    # Single unified tree (bootstrapped per project)
├── routers/                  # 15 JSON configuration files
│   ├── context-router.json   # Master catalog
│   ├── core.json             # Operational loop
│   ├── mcps.json             # 6 MCP configurations
│   ├── skills.json           # 23 domains, 131 triggers
│   └── ... (11 more)
├── workflows/                # 8 JSON auto-triggered workflows
│   ├── auto-init.json        # Session startup
│   ├── research.json         # Auto-research via skills.json
│   ├── update.json           # Atomic 8-schema sync
│   └── ... (5 more)
├── constitution/             # 43 JSON articles (9 parts)
│   ├── 01-preamble/
│   ├── 03-fundamental-rights/
│   └── ... (7 more parts)
├── schemas/                  # 8 validation + 9 helpers
│   ├── *.schema.json         # JSON Schema validation
│   └── helpers/              # Operational patterns
├── memory-bank/              # 8 runtime schemas (gitignored)
│   ├── activeContext.json
│   ├── progress.json
│   └── ... (6 more)
└── visualize/                # Real-time dashboard
    └── dashboard.html

system-prompt.md             # IDE-wide system prompt
mcp_servers.json             # 6 MCP server configs
```

## Key Features

### 1. **Persistent AI Memory**
- **8 Core Schemas**: AI remembers everything about your project
- **Cross-Session Continuity**: Pick up exactly where you left off
- **Pattern Learning**: AI learns from mistakes and successes
- **Structured Storage**: JSON schemas ensure data integrity

### 2. **Democratic Governance** 
- **Tri-Branch System**: Executive, Legislative, Judicial oversight
- **Quality Assurance**: Opposition challenges ensure high standards
- **Constitutional Compliance**: All actions follow established rules
- **Transparent Decision-Making**: >95% consensus required for major changes

### 3. **Autonomous Workflows** 
- **8 JSON Workflows**: Auto-triggered via conditions (not manual commands)
- **Skills.json Integration**: 23 domains with official documentation URLs
- **Multi-Language Support**: Python, Rust, TypeScript, Go, Java, C#, PHP, Ruby
- **Zero-Tolerance Validation**: Automatic error detection and fixing
- **Continuous Execution**: AI works autonomously (0-99% band) without permission

### 4. **Real-Time Monitoring**
- **Live Dashboard**: See exactly what AI is thinking and doing
- **Progress Tracking**: Visual milestone and task completion
- **Error Patterns**: Learn from mistakes to prevent future issues
- **Performance Metrics**: Track development velocity and quality

### 5. **Reinforcement Learning Governance (v3.0)**
- **Self-Learning AI**: Learns from every task, mistake, and success
- **Automatic Scoring**: +5 to +50 rewards, -10 to -50 penalties
- **Pattern Recognition**: ≥90% success patterns auto-apply
- **Error Prevention**: Mistakes trigger prevention rules in `mistakes.json`
- **Checksum Validation**: RL ledger integrity verified in `progress.json`
- **Transaction Log**: Complete audit trail (max 1000 entries)
- **91% Error Reduction**: Through continuous learning and pattern extraction

### 6. **Context Engineering (v3.0)**
- **Top-Append Strategy**: Latest data always at array[0] for 65% faster retrieval
- **Selective Article Loading**: Load 3-10 articles vs all 42 (80% faster)
- **Priority Routing**: Urgent tasks in `scratchpad.json[0]`
- **No Array Scanning**: Immediate access to recent context
- **RL Tracking**: Recent rewards/penalties visible first
- **Optimized for LLM**: Efficient context window usage

### 7. **MCP Infrastructure (v3.2.1)**
- **6 Mandatory MCPs**: json-jq, sequential-thinking, git, context7, exa, fetch
- **@mcp:json-jq ALWAYS Rule**: 100x faster than Read tool, constitutional mandate
- **Hybrid Architecture**: MCPs for reliability + CLI for performance
- **Automatic Setup**: Intelligent mcp_servers.json handling (Replace/Append/No options)
- **404 Validation**: All downloads validated before installation
- **User Permission Prompts**: Y/N for system prompt modifications

## Use Cases

### 🚀 **New Project Development**
```bash
# 1. Describe your project to AI
"Build a job scraper with Python, Selenium, and Streamlit"

# 2. Initialize AegisIDE
/init

# 3. AI creates complete project structure and begins development
/next
```

**What happens:**
- AI creates 8 memory files tailored to your project
- Generates roadmap with milestones and tasks
- Sets up quality validation for your tech stack
- Begins autonomous development with oversight

### 🔧 **Existing Project Enhancement**
```bash
# 1. Point AI to your existing codebase
/init

# 2. AI analyzes and creates governance structure
# 3. Continues development with improved quality and tracking
```

**What happens:**
- AI analyzes your existing code and patterns
- Creates memory-bank reflecting current state
- Identifies technical debt and improvement opportunities
- Provides structured development going forward

### 👥 **Team Collaboration**
- **Consistent Standards**: All team members use same governance framework
- **Knowledge Sharing**: AI memory shared across team sessions
- **Quality Gates**: Automatic validation prevents broken code
- **Progress Visibility**: Real-time dashboard shows team progress

### 📈 **Long-Term Projects**
- **Context Preservation**: AI maintains project knowledge over months/years
- **Pattern Recognition**: Learns optimal approaches for your domain
- **Technical Debt Management**: Tracks and addresses code quality issues
- **Strategic Planning**: Maintains alignment with business goals

## Real-World Scenarios

### **Scenario 1: Solo Developer Building SaaS**
*Problem*: Need to build a complex application but want AI to maintain context and quality

*Solution*:
1. Initialize AegisIDE with project description
2. AI creates structured development plan
3. Autonomous development with quality gates
4. Real-time progress tracking via dashboard
5. AI remembers architecture decisions and patterns

*Result*: 40% faster development with higher code quality

### **Scenario 2: Team Refactoring Legacy Code**
*Problem*: Large codebase needs modernization with multiple developers

*Solution*:
1. AegisIDE analyzes existing codebase
2. Creates governance structure for team
3. Tracks refactoring progress and quality metrics
4. Ensures consistent patterns across team members
5. Prevents regression through validation

*Result*: Coordinated refactoring with measurable progress

### **Scenario 3: Learning New Technology**
*Problem*: Developer wants to learn Rust while building real project

*Solution*:
1. AegisIDE provides Rust-specific validation and patterns
2. AI teaches best practices through code review
3. Tracks learning progress and common mistakes
4. Provides immediate feedback on code quality
5. Builds knowledge base of Rust patterns

*Result*: Accelerated learning with production-quality code

## How It Works

### **Memory System (8 Core Schemas)**
1. **activeContext.json** - What AI is currently working on
2. **scratchpad.json** - Next 5-10 tasks in priority order
3. **kanban.json** - Project task board with workflow states
4. **mistakes.json** - Error patterns and lessons learned
5. **systemPatterns.json** - Architecture and coding standards
6. **progress.json** - Milestones and development metrics
7. **roadmap.json** - Strategic goals and business alignment
8. **memory.json** - Knowledge graph of project relationships

### **Governance Process**
1. **Proposal**: Executive branch proposes implementation
2. **Review**: Legislative branch challenges and validates
3. **Consensus**: >95% agreement required for execution
4. **Validation**: Judicial branch ensures quality compliance
5. **Execution**: Autonomous implementation with monitoring

### **Quality Assurance**
- **Multi-Language Validation**: Automatic syntax and type checking
- **Zero-Tolerance Policy**: All errors must be fixed before proceeding
- **Pattern Learning**: AI learns from mistakes to prevent repetition
- **Constitutional Compliance**: All actions follow established governance

## Getting Started

### **Prerequisites**
- Compatible IDE (Windsurf, Cursor, VS Code, etc.)
- Node.js + Python (for MCP servers)
- Project directory
- Basic understanding of your tech stack

### **Quick Setup**
1. Clone AegisIDE repository
2. Run bootstrap: `bash scripts/bootstrap.sh` (copies .aegiside/ to your project)
3. Copy `system-prompt.md` content to your IDE's system prompt settings
4. Configure MCP servers using `mcp_servers.json`
5. Restart IDE to load MCPs

### **First Workflow Triggers**
- Auto-init triggers on new session detection
- Research auto-triggers on errors (via skills.json)
- Validate auto-triggers before commits
- Update auto-triggers after task completion

## Benefits

### **For Developers**
- **Faster Development**: 40% speed increase through autonomous execution
- **Higher Quality**: Zero-tolerance validation prevents bugs
- **Better Learning**: AI teaches best practices through governance
- **Reduced Context Switching**: AI maintains full project context

### **For Teams**
- **Consistent Standards**: Shared governance ensures code quality
- **Knowledge Preservation**: Team knowledge captured in memory-bank
- **Transparent Progress**: Real-time visibility into development status
- **Reduced Onboarding**: New team members inherit project knowledge

### **For Businesses**
- **Predictable Delivery**: Structured milestones and progress tracking
- **Quality Assurance**: Constitutional governance ensures reliability
- **Technical Debt Management**: Systematic approach to code quality
- **Scalable Development**: Framework grows with team and project size

## Advanced Features

### **Constitutional Framework**
- **42 Articles**: Complete governance system for AI development
- **Democratic Process**: Tri-branch oversight with checks and balances
- **Amendment Process**: Framework evolves with project needs
- **Compliance Monitoring**: Automatic adherence to established rules

### **MCP Integration (6 Mandatory)**
- **@mcp:json-jq**: ALL JSON operations (NEVER use Read tool) - 100x faster
- **@mcp:sequential-thinking**: Deep reasoning ≥3 steps for every request
- **@mcp:git**: Version control operations (NO CLI git commands)
- **@mcp:context7**: Official documentation (IMMEDIATE on errors)
- **@mcp:exa**: Code research and real-world examples
- **@mcp:fetch**: Web content retrieval for latest information
- **Hybrid Speed**: MCPs for reliability + CLI (jq|sponge) for 267x faster writes

### **Visualization Dashboard**
- **Real-Time Monitoring**: See AI's thought process and decisions
- **Progress Tracking**: Visual representation of development milestones
- **Error Analysis**: Pattern recognition for common issues
- **Performance Metrics**: Track development velocity and quality trends

## Support & Community

- **Documentation**: Complete guides in `/workflow/` directory
- **Examples**: Real-world implementations in various languages
- **Issues**: Report problems via GitHub issues
- **Contributions**: Framework improvements welcome via pull requests

---

**AegisIDE transforms AI development from chaotic to constitutional, ensuring reliable, high-quality software delivery through democratic governance and persistent intelligence.**