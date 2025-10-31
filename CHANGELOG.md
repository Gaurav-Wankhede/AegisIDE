# Changelog (Minimalist Version)

*[Keep a Changelog](https://keepachangelog.com) • [Semantic Versioning](https://semver.org)*

## [4.0.0] - 2025-10-30

### Breaking: 3-Tier Hierarchical Architecture

- Restructured: core (500) → runtime (1-3K) → knowledge (0-5K)
- Token savings: 91% measured (138 → 104 files)
- Tier-1: main-router + context-orchestrator
- Tier-2: ace/governance/architecture routers (800-1.2K)
- Tier-3: ACE (13) + memory (27) + constitution (11) + enforcement (27)
- memory-bank/ → runtime/memory/ (active/history/schemas)
- Semantic suites: validation, error-recovery, state
- Tier-aware tool enforcement (jq vs @mcp:json-jq)

### Deprecated
- Flat paths: routers/, memory-bank/, workflows/

---

## [3.5.0] - 2025-10-29

- Autonomous setup: `curl | bash` one-line install
- GitHub-first: 123 files → 0 local files (always fresh)
- Router consolidation: 17→2 files (88%, context-router + skills)
- 8 runtime schemas (memory-bank local persistence)
- 43 constitutional articles (9 categories)
- 18 workflows + 6 MCPs + 19 schemas
- relation.json anti-hallucination graph (84 files, 11 relations)
- NLU/NLP routing + mandatory research protocol
- Pre-commit hooks + file count verification

## [3.4.0] - 2025-10-25

- 182-line Mermaid architecture diagram + DIFF-FIRST verification (global_rules.md, mcp_servers.json)
- 6 mandatory MCPs (json-jq, sequential-thinking, git, context7, exa, fetch)
- Session-based loading (architecture once, lazy load routers via context-router.json)

## [3.3.0] - 2025-10-20

- 2 installation methods (CURL / System Prompt-Only)
- 4-scenario bootstrap with git diff verification
- 43 JSON constitutional articles download

## [3.2.2] - 2025-10-18

- Fixed 404 errors + diff verification before updates
- README simplification for non-technical users

## [3.2.1] - 2025-10-18

- Y/N permission prompts + mcp_servers.json management (R/A/N)
- 6 mandatory MCPs corrected + @mcp:json-jq mandate strengthened

## [3.2.0] - 2025-10-18

- NLU/NLP intent recognition + auto-workflow triggers
- 0-99% autonomy enforced (no permission prompts)

## [3.1.2] - 2025-10-18

- Fixed @mcp:filesystem false claim + 34 workflow violations
- Hybrid architecture: MCPs + CLI pipeline

## [3.1.1] - 2025-10-17

- Cleaned memory-bank + automated setup.sh
- Security: No personal data in templates

## [3.1.0] - 2025-10-17

- Constitutional mappings + helper schema docs
- Fixed 14 documentation gaps

## [3.0.0] - 2025-10-13

- RL system (PPO+GAE, +5 to +50 rewards, -5 to -50 penalties)
- Top-append strategy (65% faster) + selective loading (80% faster)
- 91% error reduction

## [2.8.8] - 2025-10-09

- Documentation rewritten for non-technical users
- AI autonomy strengthened (never asks permission)

## [2.8.7] - 2025-10-09

- Single .aegiside/ for 20+ IDEs
- Setup time: 15min → 2min

## [2.8.6] - 2025-10-08

- 2.6x faster JSON parsing
- 40% faster processing + 91% error reduction

## [2.8.5] - 2025-10-08

- 8th schema: memory.json (knowledge graph)
- 7-schema → 8-schema architecture

## [2.8.4] - 2025-10-07

- Ajv schema validator + CI integration

## [2.8.3] - 2025-10-06

- Slash-command workflows (/init, /next, /fix, /validate, /update, /status)

## [2.8.2] - 2025-10-05

- 3-tier update system
- 82% fewer file ops + 74% faster per task

## [2.8.1] - 2025-10-05

- Fixed MCP callability + @mcp:context7 retrieval

## [2.8.0] - 2025-10-05

- Dashboard UI improvements
- Browser memory: 50MB → 40MB, load: 500ms → 300ms

## [2.7.0] - 2025-10-04

- Real-time dashboard (visualize/dashboard.html)
- Markdown → JSON migration + 2.6x faster parsing

## [2.6.2] - 2025-10-04

- Commands: 40+ → 8 unified

## [2.6.1] - 2025-10-04

- 6-pillar validation framework
- Adapt existing project workflow

## [2.6.0] - 2025-10-01

- Multi-language validation (8 languages)
- HALT-FIX-VALIDATE loop + zero-tolerance

## [2.5.0] - 2025-10-01

- Auto-execution + 8 platform configs (93-98% autonomy)

## [2.1.0] - 2025-09-28

- Democratic governance (3-branch, >95% consensus)
- Autonomy: 95% → 99%

## [2.0.0] - 2025-09-25

- Universal constitutional framework
- Cross-platform compatibility

## [1.5.0] - 2025-09-22

- Language-specific rules

## [1.2.0] - 2025-09-05

- Standardized constitution.md structure

## [1.1.0] - 2025-09-04

- Constitutional commands

## [1.0.0] - 2025-09-03

- Initial release
