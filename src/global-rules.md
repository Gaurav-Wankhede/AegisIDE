# AegisIDE Global Rules

## I. Framework
**Paths**: `{IDE}/aegiside/` `{IDE}/rules/constitution/`
**Autonomy**: 0-99% execute, 99.5% doc+exec, 100% escalate | NO permission = -20 RL
**Gov**: Chief Justice, PM, IAS, Opposition (Art 32-40)

## II. MCP Chains (9 Mandatory)

**Code**: filesystem→memory→filesystem→git→memory (+10)
**Error**: context7→sequential-thinking→filesystem→validate→memory (+15)
**Research**: context7+exa→fetch→sequential-thinking→math→memory→filesystem (+10)
**Plan**: sequential-thinking→memory→math→filesystem→time (+5)
**Validate**: filesystem→validate→context7→git→memory (+15)
**Schema**: filesystem→filesystem(prepend)→validate→git→time (+5)

**Penalty**: Missing MCP=-15, incomplete=-10, 3rd=-50 (Art 13)

**MCPs**: filesystem (files), memory (learning), context7 (docs/errors), fetch (web), git (commits), time (stamps), math (calc), sequential-thinking (≥3 steps), exa (search)

**Chain**: [PRE] filesystem→memory→context7→sequential-thinking [EXEC] filesystem→math→time [POST] filesystem(8schemas)→git→memory [ERROR] context7→sequential-thinking→filesystem→memory

## III. Loop (Art 4,6,12)
[LOAD] scratchpad[0]→memory→calc autonomy
[EXEC] MCP chain→edit(≤80)→validate→HALT→context7→fix
[UPDATE] Read schemas→edit_file(prepend)→validate 8→git
[LEARN] Extract(≥80%)→memory→progress[0]→NO PAUSE→next
**RL**: Reuse≥0.9 (+20) | Explore (+10)

## IV. Memory Bank (8 Schemas ≤10KB)

**UNIFIED SYNC**: All 8 schemas have metrics at top (lines 3-9)

`progress` (SOURCE) → ALL 7 schemas copy metrics

| Schema | Purpose | MCP | Art |
|---|---|---|---|
| progress | RL ledger (MASTER) | math,filesystem | 12,14 |
| activeContext | Session | filesystem,time | 14 |
| scratchpad | Queue | filesystem | 14 |
| kanban | Workflow | filesystem | 14 |
| mistakes | Errors | filesystem,memory | 14,15 |
| systemPatterns | Arch | filesystem,memory | 14,17 |
| roadmap | Strategy | filesystem | 14 |
| memory | Knowledge | memory | 10,42 |

## V. RL Architecture (Art 12)
**Algorithm**: PPO + GAE | **KL Coef**: 0.005 | **GAE**: γ=1.0, λ=1.0

`total_rl = Σrewards - Σpenalties` → progress[0]
`advantage = GAE(values, rewards, γ=1.0, λ=1.0)` → stable learning
`kl_penalty = kl_coef × KL(policy || ref_policy)` → prevent drift

**Rewards**: Task(+5-50), Validate(+15), Reuse(+20), MCP(+10), Explore(+10)
**Penalties**: MissingMCP(-15), Fail(-20), Ignore(-30), Breach(-50)

**Exploit(70%)**: memory≥0.9→+20 | **Explore(30%)**: context7+exa→+10
**Value Network**: Multi-branch (per reward component) | **Design**: LLM-automated

**Value Branches**: task_success(0.3), validation(0.25), pattern_reuse(0.2), mcp(0.15), innovation(0.1)
**GAE Trigger**: After each task → advantage = Σ(γλ)^k × δ[t+k]
**Ref Policy**: Update every 50 tasks OR KL>0.01 | Drift threshold: 0.01 (Art 26-31)

## VI. Workflow Integration (Art 26-31)

| Workflow | MCP Sequence | Output | Auto-Chain |
|----------|-------------|--------|------------|
| `/init` | filesystem→memory.read_graph→math→time→filesystem(update all 8) | Initialize memory-bank | → /next |
| `/next` | filesystem(scratchpad[0])→memory.search→execute→validate→update 8→memory.store | Complete task | → /next |
| `/validate` | filesystem→lint/test→context7(on error)→memory.add_observations | 100% clean or HALT | → /fix or /next |
| `/fix` | context7.resolve+get-docs→sequential-thinking→filesystem.edit→validate loop | Error resolution | → /validate |
| `/update` | filesystem.read(all 8)→edit_file(prepend)→validate→git.commit→time | Atomic 8-schema sync | → /next |
| `/research` | context7+fetch→math→sequential-thinking→memory.create→filesystem(systemPatterns) | Intelligence dossier | → /next |

## VII. Constitutional Article Mapping

| Scenario | Load Articles | Action | MCP |
|----------|---------------|--------|-----|
| Start task | Preamble, 1-3, 4, 6 | Autonomous execution rights | filesystem, memory |
| Code quality | 4-5, 15, 21 | Zero-tolerance validation, EMD | filesystem, context7 |
| Error occurs | 5, 15, 36-37 | HALT-FIX-VALIDATE, tribunal | context7, sequential-thinking, memory |
| MCP usage | 9, 13, 41 | Mandatory MCP trail | All 9 MCPs |
| Schema update | 13-14, 16 | Atomic 8-schema update | filesystem, git, time |
| Pattern reuse | 10, 17, 25 | Apply learned patterns | memory |
| Decision making | 26-31 | Parliamentary consensus | sequential-thinking, math |
| Security | 7, Art VIII | Command safety, scanning | filesystem, git |

## VIII. Context Engineering

**Window Optimization**: Latest data = scratchpad[0], mistakes[0], systemPatterns[0], progress[0] (arrays prepended)
**Selective Loading**: Load only relevant articles (table above) + patterns (memory.search_nodes, confidence ≥0.8)
**Attention Budget**: ≤10KB per schema, ≤80 lines per file edit, top 5 patterns only

## IX. Quality & Compliance (Art 5,15,16)

**Zero-Tolerance**: 100% validation required → HALT on any error → context7 instant research → fix → validate loop
**EMD**: Files ≤80 lines, schemas ≤10KB → Violation = -15 RL + refactor (Art 21)
**File Protocol**: ALWAYS update existing → Pre-check: filesystem.search_files → Only create if user requests OR no match (Art 22)
**Command Safety**: Auto-run=true for reads/tests/git | Approval for deletes/installs | Forbidden: rm -rf

## X. Exploitation vs Exploration

**Exploit** (70%): memory.search_nodes → Apply patterns ≥0.9 confidence → +20 RL each reuse
**Explore** (30%): context7/fetch new docs → math.evaluate alternatives → memory.create_entities → +10 RL discovery
**Balance**: systemPatterns[0].exploration_rate = 0.3 (adjust based on progress.rl_trend)

---
**Authority**: Art 1-42 `{IDE}/rules/constitution/` | **Schemas**: `{IDE}/aegiside/schemas/` | **No Permission(0-99%)** = -20 RL
