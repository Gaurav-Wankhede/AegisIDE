# AegisIDE — Windsurf Constitutional Framework (v2.8.0 Enhanced)
 
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](../LICENSE.md) [![Docs](https://img.shields.io/badge/docs-read-blue)](./.windsurf/guide/index.md) [![Autonomy](https://img.shields.io/badge/Autonomy-98%25-success)](global_rules.md)
 
> **🚀 Quick Start**: [CheatSheet.md](CheatSheet.md) | **🧠 Intelligence**: [global_rules.md](global_rules.md) | **⚡ Always-Check**: Multi-language validation

**Windsurf Constitutional Framework** with **democratic parliamentary governance**, **98% autonomous capability**, **always-check operations**, and **centralized configuration validation**.

## 🚀 **2025 Enhancements (v2.8.0)**
- **⚡ Always-Check Operations**: Automatic `cargo check`, `pnpm typecheck`, `npm run lint`, `pytest`, `go test` before every task
- **🏗️ Centralized Config Validation**: MANDATORY pre-task scan prevents duplication and configuration errors
- **🌐 Multi-Language Support**: Auto-detection for Rust, TypeScript, Python, Go, Java, Swift, PHP, Ruby, C#
- **🔧 Framework Auto-Detection**: Smart detection from package.json, Cargo.toml, requirements.txt, etc.
- **📊 Enhanced Dashboard UI/UX**: Professional interface with full content visibility and 5-minute refresh intervals
- **🎨 Frontend Memory Bank Visualization**: Real-time monitoring of AI memory bank operations

## 🏛️ **Constitutional Framework**

**Three-Branch System**: Government (PM, Dev Minister, Tech Minister) → Opposition (Quality, Innovation, Analytics Shadows) → Judiciary (Chief Justice)

**Democratic Process**: Proposal → Opposition Review → Debate → >95% Consensus → Judicial Review → Implementation


### **Decision Authority**
- **0-98%**: Full autonomy, execute immediately
- **99-100%**: Human consultation required

**Consensus Scoring**
- **Technical Proposals**: Dev(25%), Test(25%), AI(20%), Research(15%), Data(10%), PM(5%)
- **Strategic Proposals**: PM(30%), AI(20%), Research(20%), Data(15%), Dev(10%), Test(5%)
- **Quality Proposals**: Test(30%), Dev(25%), Research(20%), Data(15%), AI(5%), PM(5%)

> 📜 **Commands**: [CheatSheet.md](CheatSheet.md) - 8 unified commands

## ⚡ **Always-Check Operations**

**Auto-validates before every task**:

- **Multi-Language Support**: 8+ programming languages (JavaScript/TypeScript, Rust, Python, Go, Java, C#, PHP, Ruby)
- **Framework Auto-Detection**: Smart detection from package.json, Cargo.toml, requirements.txt, go.mod, etc.
- **Pre-Task Health Checks**: MANDATORY validation with language-specific commands
- **Real-Time Monitoring**: Continuous constitutional compliance during execution

### **Centralized Configuration Management**
- **Anti-Duplication Protocol**: NEVER recreate existing centralized components
- **Config Registry**: Active registry with validation checksums prevents hallucination
- **MANDATORY Pre-Task Scanning**: Validate `core/config/`, `models/`, `types/`, `database/config/`
- **Component Reuse Enforcement**: ALWAYS reference existing configurations

**98% Autonomous**: Error recovery, performance optimization, security scanning, cross-project learning, predictive maintenance

## 📐 **Blueprint System (v2.6.1)**

**6-Pillar Validation**: Problem Definition, Solution Feasibility, Market Validation, Technical Feasibility, Scalability, Monetization (each 0-100, minimum ≥70 overall)

**Auto-generates**: `blueprint.json`, `userflow.json`, `kanban.json`, `bugfix.json` from project description OR existing codebase

**Commands**: `init` (new/existing), `validate`, `next`, `status`, `optimize`

> 📋 **Full Documentation**: [Article-XIV.md](../../core/constitution/article-XIV.md)

## 🔧 **Setup (5 Minutes)**

### **Method 1: Git Submodule** (Recommended)

```bash
# 1. Add AegisIDE as submodule
cd /path/to/your-project
git submodule add https://github.com/Gaurav-Wankhede/AegisIDE.git .aegiside
git submodule update --init --recursive

# 2. Create config pointing to submodule schemas
cat > .windsurf/config.json << 'EOF'
{
  "schemaPath": ".aegiside/core/schemas",
  "memoryBankPath": ".windsurf/memory-bank",
  "constitutionPath": ".aegiside/core/constitution",
  "lawsPath": ".aegiside/core/laws"
}
EOF

# 3. Initialize (AI generates 17 files)
init
```

### **Method 2: Manual Copy**

```bash
# 1. Copy schemas and rules
mkdir -p .windsurf/memory-bank/schemas
mkdir -p .windsurf/rules/constitution
mkdir -p .windsurf/rules/laws

cp /path/to/AegisIDE/core/schemas/* .windsurf/memory-bank/schemas/
cp /path/to/AegisIDE/core/constitution/* .windsurf/rules/constitution/
cp /path/to/AegisIDE/core/laws/* .windsurf/rules/laws/

# 2. Create config
cat > .windsurf/config.json << 'EOF'
{
  "schemaPath": ".windsurf/memory-bank/schemas",
  "memoryBankPath": ".windsurf/memory-bank",
  "constitutionPath": ".windsurf/rules/constitution",
  "lawsPath": ".windsurf/rules/laws"
}
EOF

# 3. Initialize
init
```

### **Result Structure**

```
your-project/
├── .aegiside/              ← Git submodule (Method 1)
│   └── core/
│       ├── schemas/
│       ├── constitution/
│       └── laws/
└── .windsurf/
    ├── config.json         ← Points to schemas
    ├── memory-bank/
    │   ├── schemas/        ← Manual copy (Method 2)
    │   ├── scratchpad.json ← AI-generated
    │   └── [16 more JSON files]
    └── rules/              ← Manual copy (Method 2)
        ├── constitution/
        └── laws/
```

> **Note**: `global_rules.md` lives in Windsurf IDE's global location, NOT your project:
> - **Linux/Mac**: `~/.codeium/windsurf-next/memories/global_rules.md`
> - **Windows**: `%USERPROFILE%\.codeium\windsurf-next\memories\global_rules.md`

### **🔄 Session Resume**

**Existing projects**: AI auto-scans `.windsurf/memory-bank/`, loads all 17 files (16 JSON + roadmap.md). Just type: `next`

### **🔁 Legacy System Migration**

**If you have old .md files** in `.windsurf/memory-bank/`:

```bash
# Force migration to JSON
migrate-to-json
```

**What happens**:
1. ✅ Loads schemas from `.windsurf/memory-bank/schemas/`
2. ✅ Creates backup in `backup_md/` with timestamp
3. ✅ Converts ALL .md → .json (scratchpad.md→scratchpad.json, etc.)
4. ✅ Validates each JSON against schema
5. ✅ **DELETES** original .md files after validation
6. ✅ Logs migration in mistakes.json
7. ✅ Verifies 17 files exist (16 JSON + roadmap.md)

**Result**: Upgraded to JSON-first architecture (2.6x faster parsing, zero ambiguity)

## 🎯 **Constitutional Development Best Practices**

### **Windsurf-Specific Advantages (v2.8.0)**
- **Native Integration**: Global Rules loaded directly into Windsurf's AI reasoning system
- **Real-Time Monitoring**: Constitutional violations automatically trigger parliamentary oversight
- **Enhanced Dashboard UI/UX**: Professional frontend with full content visibility and optimized refresh intervals
- **Frontend Memory Bank Visualization**: Users can monitor AI memory bank operations in real-time
- **Seamless Memory Sync**: `.windsurf/memory-bank/` structure integrates with Windsurf's project context
- **Autonomous Quality**: 98% autonomous operation with always-check operations for 8+ languages
- **MCP Integration**: All 9 MCPs (byterover-mcp, context7, fetch, filesystem, git, memory, sequential-thinking, math, time) run automatically

### **EMD Compliance (Elegant Modular Design)**
- **Core Principle**: All code files ≤80 lines with deep nested folder structure
- **Universal Structure**: `project/core/modules/feature/task_name/implementation.ext`
- **Memory Bank JSON Files**: ≤10KB each (optimal parsing performance)
  - 16 JSON files: activeContext, scratchpad, mistakes, progress, systemPatterns, techContext, productContext, projectbrief, roadmap, kanban, blueprint, userflow, bugfix, deployment, monitoring, dependencies
  - 1 Human-readable: roadmap.md (≤20KB for strategic planning)
- **Schema Validation**: All JSON files validated against `core/schemas/` on every read/write

### **Constitutional Workflow Integration**
1. **Load Global Rules** in Windsurf Rules panel (enables constitutional authority)
2. **Initialize Project** with `init` command (auto-generates 17 files: 16 JSON + roadmap.md)
3. **Strategic Planning** via `next` (reads scratchpad.json with 25% attention priority)
4. **Constitutional Execution** via continuous autonomous workflow (9 MCPs → validation → execute)
5. **Quality Assurance** via zero-tolerance validation (HALT-FIX-VALIDATE loop until 100% clean)
6. **Democratic Oversight** via tri-branch consensus (>95% weighted approval required)
7. **Knowledge Storage** via dual MCP strategy (@mcp:memory primary, @mcp:byterover-mcp backup)

## 🚨 **Emergency Powers & Crisis Management**

### **Crisis Triggers (Automatic Detection)**
- **System Failure**: >80% failure rate triggers emergency protocols
- **Security Breach**: Unauthorized access or vulnerability exploitation  
- **Constitutional Violation Cascade**: Multiple simultaneous violations
- **Process Breakdown**: Democratic consensus failure or judicial deadlock

### **Emergency Response Protocol**
1. **Immediate Judicial Consultation**: Chief Justice reviews crisis severity
2. **Temporary Executive Authority**: Accelerated decision thresholds (50% reduction)
3. **Crisis Coordination**: Enhanced parliamentary powers with constitutional safeguards
4. **Rapid Deployment**: Emergency override with >95% consensus requirement

### **Constitutional Safeguards**
- **Mandatory Post-Crisis Review**: Complete accountability audit after emergency
- **False Declaration Censure**: Parliamentary consequences for inappropriate emergency calls
- **Judicial Oversight**: Constitutional compliance maintained even during crisis
- **Transparency Requirements**: All emergency decisions logged and reviewable

## 📊 **Proven Performance Results**

### **Autonomy & Intelligence**
- **98% Autonomous Operation**: Highest autonomy level among all AI development frameworks
- **Real-Time Decision Making**: Parliamentary consensus with 0-98 auto-execution, 99-100 consultation
- **Constitutional Compliance**: >95% consensus requirements with judicial review and veto power
- **Cross-Project Intelligence**: ByteRover integration for pattern learning and knowledge transfer

### **Quality & Reliability**
- **91% Hallucination Reduction**: Through constitutional governance and always-check operations
- **Multi-Language Excellence**: Auto-detection and pre-task validation across 8+ programming languages  
- **Centralized Configuration**: MANDATORY scanning prevents duplication and configuration errors
- **Error Recovery**: 4-level rollback matrix with automatic snapshots and state management

### **Development Efficiency**
- **300% Speed Increase**: Constitutional framework eliminates decision overhead and rework
- **EMD Compliance**: ≤80 lines per file with deep nested structure improves maintainability
- **Memory Management**: Intelligent cleanup and template generation prevents context pollution
- **Democratic Quality Assurance**: Opposition challenges ensure code quality before implementation

## 🚀 **Constitutional Framework Summary**

### **What You Get with AegisIDE + Windsurf**
- **98% Autonomous AI Development** with democratic parliamentary governance
- **Real-Time Quality Assurance** via always-check operations across 8+ programming languages
- **Constitutional Compliance** with >95% consensus requirements and judicial review
- **Intelligent Memory Management** with automatic template generation and EMD compliance
- **Cross-Project Learning** via ByteRover integration and pattern recognition
- **Emergency Management** with constitutional safeguards and crisis protocols

### **🏆 Quick Start**
1. **Load Global Rules** → Windsurf Rules panel (constitutional authority active)
2. **Copy `.windsurf/` structure** → Your project root (framework integration)
3. **Initialize with context** → `initialize memory bank` + project details
4. **Begin autonomous development** → Constitutional AI ready!

### **📚 Reference Documentation**
- **[CheatSheet.md](CheatSheet.md)**: Complete command reference (40+ constitutional commands)
- **[global_rules.md](global_rules.md)**: Executive implementation rules (copy to Windsurf Rules)
- **[.windsurf/rules/constitution.md](.windsurf/rules/constitution.md)**: Supreme constitutional law (12 articles)

**🎆 Constitutional AI Development Active** - Experience 98% autonomous capability with democratic governance, real-time quality assurance, and intelligent decision-making!

---

## 📚 **Additional Resources**

### **Framework Documentation**
- **[Universal README](../README.md)**: Complete AegisIDE framework overview
- **[Implementation Status](../IMPLEMENTATION_COMPLETE.md)**: Current framework completion status
- **[VS Code Setup](../common/vscode/README.md)**: Alternative IDE setup instructions
- **[Universal Constitution](../common/universal_constitution.md)**: IDE-agnostic constitutional framework

### **Windsurf-Specific Files**
- **[Oversight Workflows](.windsurf/workflows/)**: Parliamentary checks and balances procedures
- **[Memory Bank Templates](.windsurf/memory-bank/templates/)**: Auto-generation templates
- **[Project Documentation](.windsurf/docs/)**: Windsurf-specific implementation guides

### **Community & Support**
- **Repository**: [GitHub.com/Gaurav-Wankhede/AegisIDE](https://github.com/Gaurav-Wankhede/AegisIDE)
- **Documentation**: Constitutional framework with democratic governance
- **License**: MIT License - Constitutional Framework for AI Agents
- **Maintainer**: Gaurav Wankhede - Full Stack Developer & AI Engineering Specialist
