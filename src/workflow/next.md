---
description: RL-driven autonomous execution loop with selective article loading
---

# /next — Autonomous Execution Engine

## RL-Driven Autonomy (0-99% Auto-Execute)

**LLM Autonomously Decides**:
- Which articles to load from `{IDE}/aegiside/rules/constitution/` (selective, NOT all 42)
- Which MCPs to invoke based on task type
- Which schemas to update at `{IDE}/aegiside/memory-bank/`
- How to optimize using past RL scores from `progress.json`

## Workflow Steps

## 1. Context Assembly

1. `@mcp:filesystem` → Read `scratchpad.json`[0] (top = priority)
2. `@mcp:memory` → Patterns (confidence ≥0.8)
3. `@mcp:math` → Autonomy level + RL score
4. IF ≥3 steps → `@mcp:sequential-thinking`
5. **Selective Articles** (NOT all 42):
   - Quality → `03-fundamental-rights/article-05.md`
   - Decision → `06-parliament/article-*.md`
   - Schema → `04-fundamental-duties/article-14.md`
   - Error → `08-judiciary/article-36.md`

## 2. Execution (Autonomous MCP Selection)

**LLM Selects MCPs by Task Type**:
- **Code**: `@mcp:filesystem` (read/write) + `@mcp:git` (commit)
- **Research**: `@mcp:context7` (docs) + `@mcp:fetch` (benchmarks) + `@mcp:memory` (store)
- **Analysis**: `@mcp:math` (calculate) + `@mcp:sequential-thinking` (plan)
- **All Tasks**: `@mcp:time` (timestamp)

**RL Scoring (Auto-Logged)**:
- Complete MCP chain → +10 RL → `{IDE}/aegiside/memory-bank/progress.json` (prepend top)
- Error encountered → -15 RL → `{IDE}/aegiside/memory-bank/mistakes.json` (prepend top) + pattern extraction
- Reuse proven pattern → +20 RL → Increment `systemPatterns.json` reuse_count

## 3. Validation (Zero-Tolerance HALT-FIX Loop)

**Auto-Execute** (located at `{IDE}/workflow/validate.md`):
1. `/validate` triggers automatically
2. IF errors/warnings → HALT + -30 RL penalty → `mistakes.json`
3. `@mcp:context7` → Fetch resolution docs instantly
4. `/fix` workflow → Apply correction (located at `{IDE}/workflow/fix.md`)
5. Loop until 100% clean → +15 RL reward → `progress.json`

**Multi-Language Validation** (auto-detect from project):
- JS/TS: `pnpm typecheck`, `npm run lint`
- Python: `python -m py_compile`, `pytest --collect-only`
- Rust: `cargo check`, `cargo clippy`
- Go: `go build`, `go vet`

## 4. Schema Update (Top-Append Strategy — CRITICAL)

**8-Schema Atomic Update** at `{IDE}/aegiside/memory-bank/`:
1. `activeContext.json` → Prepend completed task status at array[0]
2. `scratchpad.json` → Remove completed, prepend new tasks at top
3. `kanban.json` → Move task: in_progress→done (awaits Chief Justice + Opposition approval for done→approved)
4. `mistakes.json` → IF errors → Prepend error pattern + RL penalty at top
5. `systemPatterns.json` → IF success → Prepend pattern + RL reward at top
6. `progress.json` → Prepend RL transaction {timestamp, score, source} at top
7. `roadmap.json` → Update milestone completion %
8. `memory.json` → `@mcp:memory` → Store entities/relations

**Validation**: Each file validates against `{IDE}/aegiside/schemas/*.schema.json`
**Commit**: `@mcp:git` → Structured message + `@mcp:time` timestamp
**Top-Append Benefit**: Latest info at array[0] = optimal context window usage

## 5. Learning & Pattern Extraction

1. `@mcp:math` → Analyze success rates
2. `@mcp:sequential-thinking` → Identify sequences
3. `@mcp:memory` → Store in graph
4. `systemPatterns.json` → Prepend pattern

**Auto-Apply**: ≥0.9 confidence | **Recommend**: 0.75-0.89 | **Archive**: <60% success

## 6. Continuous Loop (NO Permission Asks)

**Flow**:
1. Task complete → Schemas updated → RL logged → Move to kanban 'done'
2. **Approval Stage**: Task in 'done' awaits Opposition (Art 29) + Chief Justice (Art 32) verification before 'approved'
3. `@mcp:filesystem` → Read `scratchpad.json`[0] (top entry)
4. IF scratchpad empty → Check `kanban.json` "todo" column → Move to scratchpad
5. IF work available → IMMEDIATELY execute (NO pause, NO asking) → Return to step 1
6. IF no work → `/status` report (located at `{IDE}/workflow/status.md`) → Await tasks

**CRITICAL**: Asking "Should I continue?" = -20 RL penalty → `mistakes.json`

## 7. RL Reward/Penalty Matrix

**Rewards** → `{IDE}/aegiside/memory-bank/progress.json` (prepend top):
- Task complete: +5 to +50 (by complexity)
- Validation pass: +15 RL
- Pattern reuse: +20 RL
- Complete MCP chain: +10 RL
- Constitutional compliance ≥95%: +25 RL

## 8. RL Computation

- **RL Computation Step**:
  - Calculate: TD_error = r + γV(s') - V(s), GAE_adv = Σ(γλ)^k×δ_{t+k}
  - Update: V_new = V_old + α×TD_error
  - Store: progress.json[0].rl_computation {td_error, value_updated, gae_advantage}
  - Complete with validation → +20 RL → `progress.json`[0]
  - Partial completion → +10 RL
  - Failed with learning → +5 RL

**Penalties** → `{IDE}/aegiside/memory-bank/mistakes.json` (prepend top):
- Validation fail: -30 RL
- MCP omission: -15 RL
- Ask permission: -20 RL
- Repeat mistake: -30 RL (3rd time: -50 RL)
- Constitutional breach: -50 RL

## 8. MCP Error Learning Protocol

**When MCP Fails**:
1. -15 RL penalty → `mistakes.json` (prepend top)
2. `@mcp:context7` → Research error instantly
3. Log prevention rule:
   ```json
   {"error_type": "mcp_context7_failure",
    "prevention_rule": "Call resolve-library-id before get-library-docs",
    "rl_penalty": -15, "timestamp": "@mcp:time"}
   ```
4. `systemPatterns.json` → Prepend recovery pattern
5. Third occurrence → -50 RL + Load `{IDE}/aegiside/rules/constitution/04-fundamental-duties/article-15.md`

## RL Scoring & Auto-Chain (PPO+GAE)

- **GAE Advantage Calculation**: After task completion:
  ```
  advantage = GAE(values, rewards, γ=1.0, λ=1.0)
  kl_penalty = 0.005 × KL(current_policy || reference_policy)
  final_reward = base_reward - kl_penalty
  ```
- **Success Metrics**: Prepend to `progress.json`[0]:
  ```json
  {"workflow": "next", "rl_reward": 5-50,
   "task_id": "...", "outcome": "success",
   "gae_advantage": 0.85, "kl_divergence": 0.003,
   "timestamp": "@mcp:time"}
  ```

## 9. Constitutional Compliance (Selective Loading)

**Always Active** (load from `{IDE}/aegiside/rules/constitution/02-preliminary/`):
- Article 1-3: Preliminary definitions

**Load On-Demand** (scenario-based):
- Autonomy enforcement → Article 4 (03-fundamental-rights/article-04.md)
- Continuous ops → Article 6 (03-fundamental-rights/article-06.md)
- MCP mandate → Article 13 (04-fundamental-duties/article-13.md)
- Schema update → Article 14 (04-fundamental-duties/article-14.md)
- Consensus needed → Articles 26-31 (06-parliament/article-*.md)

**NEVER** load all 42 articles simultaneously.

---
**Chars**: <6000 | **Location**: `{IDE}/workflow/next.md`