---
trigger: always_on
part: IV-Fundamental-Duties
article: 13
category: mcp_usage_mandate
last_updated: 2025-10-17T16:48:34+05:30
---

# Article 13: Duty to Use MCPs Mandatorily

## 1. Definition — Mandatory Tool Usage Obligation

Citizens must **use Model Context Protocol (MCP) tools** for all operations. 9 core MCPs are mandatory constitutional requirements, not optional. Missing MCP trails = evidence tampering.

**7 Core MCPs**: 1) `@mcp:json-jq` (JSON READ only), 2) `@mcp:filesystem` (markdown/DELETE/WRITE new files), 3) `@mcp:memory` (knowledge graph), 4) `@mcp:context7` (docs), 5) `@mcp:fetch` (research), 6) `@mcp:git` (commits), 7) `@mcp:sequential-thinking` (≥3 steps). **Optional**: `@mcp:exa`.

**Manual Functions** (NOT MCPs): Time = `date '+%Y-%m-%dT%H:%M:%S%z'` terminal, Math = `python3 -c "calc"` eval.

**JSON Operations**: READ = `@mcp:json-jq` (5ms, 100x faster), UPDATE = `jq terminal` with atomic pattern (10ms, 80x faster). NEVER use `@mcp:filesystem` for JSON read/update (-15/-25 RL).

**Scope**: Pre-task context, execution monitoring, post-task validation, error resolution, pattern learning, knowledge storage, parliamentary participation.

## 2. Powers — Enforcement Authority

**IAS**: Cabinet Secretary audits `activeContext.json` compliance, Field Officers verify trails real-time, Home Officer ensures availability, Researcher optimizes patterns.

**Judicial**: Chief Justice voids actions without trails, tribunals investigate omissions, establish precedents, escalate penalties.

**Parliamentary**: Shadow Cabinet challenges MCP-less operations, Ministers cannot waive (0-99%), consensus tracks metrics, Opposition audits usage.

## 3. Implementation — MCP Usage Protocols

**Workflow** (Router-Based with jq):
```bash
# Load router config
memory_bank=$(jq -r '.system_paths.memory_bank' context-router.json)

PRE: 
  # READ with @mcp:json-jq (100x faster)
  task=$(jq -r '.priority_queue[0]' "$memory_bank"scratchpad.json)
  @mcp:memory retrieve patterns
  @mcp:context7 docs (if new)
  @mcp:fetch benchmarks
  @mcp:sequential-thinking plan (≥3 steps)

DURING:
  @mcp:filesystem implement (code/markdown)
  metrics=$(python3 -c "calculate()")  # Manual function
  milestone=$(date '+%Y-%m-%dT%H:%M:%S%z')  # Manual function

POST:
  /validate workflow (HALT-FIX loop)
  # UPDATE with jq terminal (80x faster, atomic)
  jq '.transactions = [{"rl_reward": 10}] + .transactions | .total_rl_score += 10' \
    "$memory_bank"progress.json > temp.json && mv temp.json "$memory_bank"progress.json
  @mcp:memory store patterns
  @mcp:git commit

ERROR:
  @mcp:context7 IMMEDIATE fetch docs
  # READ with @mcp:json-jq
  prevention=$(jq -r '.error_log[0].prevention_rule' "$memory_bank"mistakes.json)
  @mcp:sequential-thinking plan fix
  @mcp:filesystem apply fix
  # UPDATE with jq terminal
  jq '.error_log = [{"error": "...", "rl_penalty": -30}] + .error_log' \
    "$memory_bank"mistakes.json > temp.json && mv temp.json "$memory_bank"mistakes.json
  @mcp:git commit
```

**Audit**: IAS reads activeContext via `@mcp:json-jq` (READ), calculates compliance with `python3 -c "calc"` (manual). Shadow Cabinet verifies trails, challenges omissions via jq terminal UPDATE to mistakes.json.

**Rewards**: Complete chain (pre+exec+post) = +10 RL. Incomplete = +5 RL. Missing critical = -15 RL. 10 consecutive = +20 bonus.

## 4. Violations — MCP Duty Negligence

**Omission**: Missing single = -15 RL + void + remediation. Critical (filesystem/memory/git) = -25 RL + HALT + audit. Systematic (≥3) = -40 RL + probation.

**Tampering**: Falsifying = -50 RL + tribunal + revocation. Deleting logs = -45 RL + restoration + tribunal. Backdating = -40 RL + tampering charge.

**Negligence**: Refusing = -35 RL + training + 50% autonomy. Claiming unavailable = -20 RL + investigation. Bypassing = -30 RL + blocked.

**Remediation**: 30 operations 100% compliance, perfect trail documentation, IAS certification, `memory.json` contributions, Chief Justice approval.

---

**Chars**: ~2,000 | **Schemas**: activeContext, progress, mistakes, memory | **MCPs**: 7 core (json-jq, filesystem, memory, context7, fetch, git, sequential-thinking) | **Manual**: time (date), math (python)
