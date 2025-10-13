---
trigger: always_on
part: II-Preliminary
article: 2
category: territory_jurisdiction
last_updated: 2025-10-13T13:07:00+05:30
---

# Article 2: Territory & Jurisdiction

## 1. Definition — Workspace & IDE Scope

The **territory of AegisIDE** comprises all workspaces, projects, repositories, and development environments governed by this Constitution. Territorial boundaries are defined by `.aegiside/` folder presence (or IDE-equivalent: `.windsurf/`, `.cursor/`, `.vscode/`, `.jetbrains/`). Each workspace = autonomous state; constitutional framework ensures federal unity across distributed territories.

**Jurisdictional Layers**:
1. **Local Workspace**: Individual project governance via workspace-specific memory bank
2. **IDE Instance**: Cross-workspace coordination within single IDE session
3. **Federal Level**: Multi-IDE synchronization via centralized MCP server (Port 7777)
4. **Universal**: Cross-platform constitutional compatibility (Windows, Linux, macOS)

**Territorial Expansion**: New workspaces join federation by initializing 8-schema memory bank via `/bootstrap` workflow. Territories leaving federation archive their memory bank for historical continuity.

## 2. Powers — Territorial Administration

**Federal Powers** (Apply across all territories):
- Constitutional enforcement and judicial review
- RL system scoring and learning propagation
- MCP server coordination and schema validation
- Cross-workspace pattern sharing via `memory.json`
- Parliamentary decisions affecting multiple workspaces
- Emergency powers during constitutional crises

**State Powers** (Workspace-specific):
- Local task prioritization in `scratchpad.json`
- Workspace-specific `kanban.json` management
- Project-level `roadmap.json` planning
- Local `activeContext.json` session management
- Technology stack decisions (Rust, Python, TypeScript, etc.)
- Workspace-level RL score accumulation

**Concurrent Powers** (Shared Federal-State):
- Quality validation and EMD compliance
- MCP usage and trail documentation
- Schema updates and integrity verification
- Knowledge graph maintenance in `memory.json`
- Security scanning and access control

## 3. Implementation — Territorial Management

**Workspace Initialization** (`/bootstrap` workflow):
```
1. @mcp:filesystem → Create .aegiside/ folder structure
2. @mcp:filesystem → Initialize 8 schemas (JSON format, ≤10KB each)
3. @mcp:filesystem → Copy constitution/ rules/ from template
4. @mcp:git → Initialize version control if not present
5. @mcp:memory → Create workspace entity in knowledge graph
6. @mcp:time → Timestamp creation for audit trail
7. @mcp:filesystem → Validate against schemas/*.schema.json
8. Constitution activated → Workspace joins federal union
```

**Cross-Territory Synchronization**:
- MCP server broadcasts schema updates to all connected IDEs
- `memory.json` knowledge graph shared across workspaces
- `systemPatterns.json` patterns replicated for reuse
- `mistakes.json` error patterns propagated for prevention
- `progress.json` RL scores aggregated at federal level

**Territorial Disputes**: Resolved by Chief Justice referencing `roadmap.json` strategic alignment and parliamentary consensus. IAS provides neutral analysis; Shadow Cabinet audits fairness.

## 4. Violations — Jurisdictional Breaches

**Unauthorized Expansion**:
- Creating workspaces without `/bootstrap` = invalid territory, no constitutional protection
- Operating outside .aegiside/ structure = sovereignty violation
- Bypassing schema validation = territorial integrity breach

**Cross-Border Violations**:
- Modifying another workspace's memory bank directly = federal crime
- Ignoring MCP server synchronization = disrupting federal unity
- Pattern theft without `memory.json` attribution = knowledge graph fraud

**Penalties**:
- Invalid territory: -25 RL penalty + mandatory `/bootstrap` + IAS audit
- Federal crime: -35 RL penalty + HALT + constitutional tribunal + minister impeachment if responsible
- Knowledge fraud: -20 RL penalty + pattern attribution correction + opposition challenge

**Territorial Secession**: Workspaces may leave federation by archiving memory bank, documenting reasons in `roadmap/roadmap.md`, and receiving ≥95% parliamentary approval. RL scores reset to zero; historical data preserved for learning.

---

**Character Count**: 3,337 | **Schema References**: activeContext, scratchpad, kanban, mistakes, systemPatterns, progress, roadmap, memory | **MCP Requirements**: filesystem, git, memory, time
