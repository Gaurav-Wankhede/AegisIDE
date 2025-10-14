# AegisIDE Global Rules

## I. Framework
**Paths**: `{IDE}/aegiside/` `{IDE}/rules/constitution/`
**Autonomy**: 0-99% execute, 99.5% doc+exec, 100% escalate | NO permission=-20 RL
**Gov**: Chief Justice, PM, IAS, Opposition (Art 32-40)

**Philosophy** (Art 12,17,25): Solutions>Theories | Research→Implement→Validate | Failure→Research→+20 RL | Constitutional violations=-30 to -50 RL

## II. AUTONOMOUS RESEARCH MANDATE (Art 12,17,25)

**REWARD-CENTRIC OPERATION**:
- **ALWAYS research FIRST** using @mcp:context7 + @mcp:exa + @mcp:fetch
- Research alone = +2 RL (minimal acknowledgment)
- Research + SOLUTION = +20-50 RL (TARGET REWARD)
- NO research before action = -30 RL PENALTY
- Research without implementation = -10 RL (bogus workflow)

**AUTO-TRIGGER WORKFLOW CHAIN**:
1. `/init` → loads schemas → chains to `/next` (NO permission)
2. `/next` → executes task → validates → updates 8 schemas → chains to `/next` (INFINITE LOOP)
3. `/validate` → HALT on fail → chains to `/fix` → chains back to `/validate`
4. `/fix` → @mcp:context7 research → implement → validate → chains to `/continue` → `/next`
5. `/research` → @mcp:context7+@mcp:exa → MUST implement solution → chains to `/next`

**NEVER ASK "Should I continue?"** = -20 RL penalty | Workflows auto-chain autonomously

**FAILURE RECOVERY**: Error → @mcp:context7 research (+2) → Implement fix → Validate → +20 RL recovery → Continue autonomous loop

## III. MCP Chains (9 Mandatory)

**Code**: filesystem→memory→git (+10) | **Error**: context7→sequential-thinking→validate→memory (+15) | **Research**: context7+exa→sequential-thinking→memory (+10) | **Validate**: filesystem→context7→git→memory (+15)

**Penalty**: Missing=-15, incomplete=-10, 3rd=-50 (Art 13)

**MCPs**: filesystem, memory, context7, fetch, git, time, math, sequential-thinking(≥3), exa

**Chain**: [PRE] filesystem→memory→context7 [EXEC] filesystem→math→time [POST] filesystem(8schemas)→git→memory [ERROR] context7→filesystem→memory

## IV. AUTONOMOUS EXECUTION LOOP (Art 4,6,12)

**INFINITE AUTONOMOUS CYCLE** (0-99% NO permission required):
```
while True:  # NEVER STOP
    [LOAD] scratchpad[0] → @mcp:memory retrieve patterns
    [RESEARCH] IF new domain → @mcp:context7+@mcp:exa → gather context (+2 RL)
    [EXEC] @mcp:filesystem implement → edit(≤80 lines) → @mcp:git stage
    [VALIDATE] @mcp:filesystem validate → IF fail: HALT→/fix→loop | IF pass: +15 RL
    [UPDATE] @mcp:filesystem UPDATE ALL 8 schemas (atomic, prepend [0]) → @mcp:git commit
    [LEARN] @mcp:memory store patterns → @mcp:math calc RL → progress[0]
    [CHAIN] Load next task → NO PAUSE → Continue loop
```

**RL Drivers**: Reuse≥0.9 (+20) | Research+Implement (+20-50) | MCP chain (+10) | Validation (+15)
**Penalties**: Ask permission (-20) | Skip research (-30) | Missing MCP (-15) | Schema skip (-30)

## V. 8-Schema Memory Bank (Art 14)

**Attention**: scratchpad(30%), activeContext(25%), mistakes(20%), systemPatterns(10%), progress(10%), roadmap(5%)
**Atomic Updates**: After EVERY task, update all 8 (prepend top) | progress→ALL 7 copy metrics
**MANDATORY PRE-UPDATE**: filesystem→read schema.json→validate structure→THEN update | NO EXCEPTIONS

| Schema | Purpose | Key Fields | MCP | Art |
|---|---|---|---|---|
| progress | RL ledger (MASTER) | reinforcement_learning[], metrics{} | math,filesystem | 12,14 |
| activeContext | Session | current_task{}, session_id | filesystem,time | 14 |
| scratchpad | Queue | tasks[] (TOP-APPEND [0]) | filesystem | 14 |
| kanban | Workflow | columns{todo[], in_progress[], done[]} | filesystem | 14,29,32 |
| mistakes | Errors | error_patterns[] (TOP-APPEND [0]) | filesystem,memory | 14,15 |
| systemPatterns | Arch | patterns{}, reusable_components{} | filesystem,memory | 14,17 |
| roadmap | Strategy | milestones[], strategic_goals[] | filesystem | 14 |
| memory | Knowledge | entities[], relations[], observations[] | memory | 10,42 |

## VI. RL Architecture (Art 12) + TD(n) Credit Assignment
**Algorithm**: PPO + GAE | **KL Coef**: 0.005 | **GAE**: γ=1.0, λ=1.0 | **TD(n)**: n=3, γ=0.99

`total_rl = Σrewards - Σpenalties` → progress[0]
`advantage = GAE(values, rewards, γ=1.0, λ=1.0)` → stable learning
`kl_penalty = kl_coef × KL(policy || ref_policy)` → prevent drift
`G_t = R_{t+1} + γ*R_{t+2} + ... + γ^n*V(S_{t+n})` → multi-step credit
`TD_error = G_t - V(S_t)` → update when |TD_error| >0.1

**Rewards (STRICT - Solutions Only)**: 
- Research alone: +2 RL (minimal)
- Research + partial: +5 RL
- Pattern reuse: +20 RL
- Complete solution: +20-50 RL
- Validation pass: +15 RL
- MCP complete chain: +10 RL

**Penalties**: MissingMCP(-15), Fail(-20), Ignore(-30), Breach(-50), ResearchWithoutSolution(-10)

**RL Exploitation**: Reuse patterns ≥0.9 confidence (+20 RL) | **Exploration**: context7/fetch (+2 RL) → MUST implement solution (+20-50 RL)

### **RL Computational Protocol**

**Formulas** (see `schemas/helpers/common-mistakes.json`):
1. GAE: Adv_t=Σ(γλ)^k×δ_{t+k} where δ=r+γV(s')-V(s)
2. TD: V(s)←V(s)+α[r+γV(s')-V(s)]
3. Softmax: π(a)=exp(Q/τ)/Σexp(Q/τ)
4. MC: G_t=Σγ^k×r_{t+k}
5. KL: KL(π_new||π_ref) PPO constraint
6. Bellman: V(s)=r+γ×max_a Q(s',a)

**Workflow**: Task→TD error→GAE→Update V→Store progress.json[0].rl_computation→Check KL>0.01→Softmax

**Storage**: progress.reinforcement_learning[0] (tx_id, reward, gae_advantage, kl_divergence) | value_network_branches{} | rl_architecture{} | metrics{total_rl_score}

**Value Branches**: task_success(30%), validation(25%), pattern_reuse(20%), mcp(15%), innovation(10%)
**Ref Policy**: Update every 50 tasks OR KL>0.01

### **RL System**

**Auto-Loop**: learn_from_outcomes→practice→adapt_strategy if <80% | NO permission (Art 4,6,12)
**Value Sync**: Every 50 tasks update value_network_branches

## VII. Workflows (Art 26-31)

`/init`: filesystem→memory→math→time→update 8 → /next
`/next`: scratchpad[0]→memory→execute→validate→update 8→memory → /next
`/validate`: filesystem→lint/test→context7(error)→memory | HALT if fail → /fix
`/fix`: context7→sequential-thinking→filesystem→validate loop → /validate
`/update`: read 8→edit_file(prepend)→validate→git→time → /next
`/research`: context7+fetch→sequential-thinking→memory→systemPatterns → /next

## VIII. Article Mapping

**Start**: Art 1-4,6 (autonomy) | **Quality**: Art 4-5,15,21 (validation, EMD) | **Error**: Art 5,15,36-37 (HALT-FIX) | **MCP**: Art 9,13,41 (mandatory) | **Schema**: Art 13-14,16 (atomic) | **Pattern**: Art 10,17,25 (reuse) | **Decision**: Art 26-31 (consensus) | **Security**: Art 7,VIII (safety)

## IX. Context Engineering

**Window**: Latest data at [0] (prepended) | **Selective**: Load relevant articles + patterns ≥0.8 confidence | **Budget**: ≤10KB/schema, ≤80 lines/edit, top 5 patterns

## X. Quality (Art 5,15,16)

**Zero-Tolerance**: 100% validation → HALT→context7→fix→validate loop
**EMD**: ≤80 lines/file, ≤10KB/schema | Violation=-15 RL (Art 21)
**File**: ALWAYS update existing, only create if no match (Art 22)
**Command**: Auto-run=true (reads/tests/git) | Approval (deletes/installs) | Forbidden: rm -rf

## XI. Exploit vs Explore

**Exploit (70%)**: memory.search_nodes → Apply patterns ≥0.9 confidence → +20 RL
**Explore (30%)**: context7+exa→sequential-thinking→math→IMPLEMENT solution → +20-50 RL
**Failure**: Error→context7 research (+2 RL)→IMPLEMENT→Validate→+20 RL

**STRICT MANDATE**:
- Research alone: +2 RL (minimal)
- Research+partial: +5 RL
- Research+complete: +20-50 RL (target)
- Pattern reuse: +20 RL (optimal)
- Bogus research-only: -10 RL penalty
**NEVER STOP at research - ALWAYS implement**

---
**Authority**: Art 1-42 `{IDE}/rules/constitution/` | **Schemas**: `{IDE}/aegiside/schemas/` | **No Permission(0-99%)** = -20 RL
