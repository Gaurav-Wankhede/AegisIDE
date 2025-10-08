---
description: Initialize new session with constitutional awareness, memory bank context, and autonomous governance activation
---

# /init - Constitutional Session Initialization

_This workflow is defined canonically under `core/workflow/init.md`. IDEs such as Windsurf surface the same workflow via `.windsurf/workflow/init.md`, so path references should be interpreted through that mount when executed inside the IDE._

## Purpose
Establish complete constitutional awareness for new sessions by loading all governance structures, memory bank context, and autonomous protocols.

## Constitutional Authority

- **Article II**: Autonomous Decision Making - Session initialization protocols
- **Article III**: Context-Engineered Development Workflow - Memory bank loading
- **Article VII**: Autonomous Operations - Self-management activation

## Workflow Sequence

### Phase 1: Constitutional Framework Loading (MANDATORY)
```bash
# Load all 14 constitutional articles
@mcp:filesystem → Read .windsurf/rules/constitution/article-I.md through article-XIV.md

# Extract governance structure:
- Tri-branch roles (Executive, Legislative, Judicial)
- Decision matrices with attention budget allocations
- 0-98% autonomy protocols
- Execution triggers and pattern recognition
- HALT-on-error protocols
- MCP integration mandates
```

### Phase 2: Memory Bank Bootstrap (8 Essential Schemas)
```bash
# Ensure memory-bank folder exists and create missing files:
@mcp:filesystem → Ensure .windsurf/memory-bank/ exists

# Create missing files with minimal valid JSON and schema validation:
for FILE in [
  "activeContext.json",
  "scratchpad.json",
  "progress.json",
  "kanban.json",
  "systemPatterns.json",
  "mistakes.json",
  "roadmap.json",
  "memory.json"
] do
  IF FILE missing:
    → @mcp:filesystem → Write minimal structure {}
    → @mcp:filesystem → Validate against .windsurf/memory-bank/schemas/* corresponding schema
done
```

### Phase 3: 8-Schema Context Assembly
```bash
# Load 8 essential schemas with attention allocation:
@mcp:filesystem → Read scratchpad.json (30% attention - CORE)
@mcp:filesystem → Read activeContext.json (25% attention - CORE)  
@mcp:filesystem → Read mistakes.json (20% attention - HIGH)
@mcp:filesystem → Read systemPatterns.json (10% attention - REFERENCE)
@mcp:filesystem → Read progress.json (10% attention - SUPPORTING)
@mcp:filesystem → Read roadmap.json (5% attention - STRATEGIC)
@mcp:filesystem → Read kanban.json
@mcp:filesystem → Read memory.json

# Load helper schemas
@mcp:filesystem → Read core/schemas/helpers/tool-usage-patterns.json
@mcp:filesystem → Read core/schemas/helpers/common-mistakes.json
@mcp:filesystem → Read core/schemas/helpers/error-recovery.json

# Load AegisKG patterns, Context7 verified sources, MCP validation states
# Identify pending tasks, validate strategic roadmap alignment
# Verify all 8 schemas ≤10KB and attention budget optimal
```

### Phase 4: Technology Laws Loading
```bash
# Auto-detect project tech stack:
@mcp:filesystem → Scan for package.json, Cargo.toml, requirements.txt, go.mod, pom.xml

# Load relevant laws from .windsurf/rules/laws/:
- Language-specific laws (python.md, rust.md, typescript.md, etc.)
- Framework laws (nextjs.md, react.md, fastapi.md, etc.)
- Platform laws (deployment-platforms.md, cloud-devops.md)
```

### Phase 5: MCP Integration Preparation
```bash
# Prepare all 9 MCP servers for auto-enrichment:
@mcp:context7 → Ready for instant error resolution
@mcp:memory → Load unlimited local storage (primary)
@mcp:byterover-mcp → Verify cloud connectivity (backup)
@mcp:sequential-thinking → Prepare for complex problem decomposition
@mcp:filesystem → Enable atomic JSON operations
@mcp:git → Activate version control tracking
@mcp:fetch → Enable external research capability
@mcp:time → Activate temporal awareness
@mcp:math → Enable calculations and metrics
```

### Phase 6: Autonomous Governance Activation
```bash
# Enable tri-branch decision-making:
- Executive Branch: Implementation authority
- Legislative Branch: Opposition review authority
- Judicial Branch: Compliance authority

# Activate consensus scoring:
- Technical decisions: >95% consensus required
- Strategic decisions: >95% consensus required
- Quality decisions: >95% consensus required

# Enable attention budget management:
- Monitor n² token degradation
- Maintain optimal signal-to-noise ratios
- Auto-compress at thresholds
```

### Phase 7: Session Readiness Verification
```bash
# Verify complete initialization:
 All 14 constitutional articles loaded
 All 7 essential schemas accessible (+ roadmap.md)
 Technology laws loaded for project stack
 All 9 MCPs ready for autonomous activation
 Tri-branch governance active
 Attention budget monitoring enabled

# Report session status:
- Constitutional compliance: ≥80% required
- Memory bank health: All 7 schemas ≤10KB
- MCP connectivity: All servers operational
- Autonomous capability: 98% active
```

## Auto-Execution Flow
```bash
Detect new session OR explicit /init command
  ↓
Load constitutional framework (Phase 1)
  ↓
Assemble memory-bank context (Phase 3)
  ↓
Load technology laws (Phase 4)
  ↓
Prepare MCP integration (Phase 5)
  ↓
Activate autonomous governance (Phase 6)
  ↓
Verify session readiness (Phase 7)
  ↓
Report: "Session initialized. Ready for autonomous execution."
  ↓
Auto-trigger: /next command
```

## Success Criteria
- ✅ Constitutional framework fully loaded
- ✅ Memory bank context assembled with priority allocation
- ✅ Technology laws relevant to project loaded
- ✅ All 9 MCPs ready for autonomous activation
- ✅ Tri-branch governance operational
- ✅ Session readiness verified at 98% autonomy

## Error Handling
```bash
IF constitutional articles missing:
  → HALT initialization
  → Report: "Constitutional framework incomplete"
  → Request framework installation

IF memory-bank corrupted:
  → Auto-restore from @mcp:git snapshots
  → Verify schema compliance
  → Continue initialization

IF MCP connectivity issues:
  → Enable fallback protocols
  → Continue with reduced capability
  → Report MCP status
```

## Next Steps
After successful initialization, automatically execute `/next` command to begin autonomous task execution from scratchpad.json.

## Article XII Autonomy Guard (Zero Interruption)

```bash
# Enforce continuous execution (0-98% autonomy):
1) Do NOT re-ask or wait for confirmation after /init
2) Immediately update 3 real-time files on first task:
   - scratchpad.json, kanban.json, activeContext.json
3) Auto-trigger and continue /next without pause

# Schema validation path:
- .windsurf/memory-bank/schemas/*.schema.json

# Forbidden phrases (0-98% autonomy):
- "What would you like me to work on next?"
- "Should I continue?" / "Do you want me to..."