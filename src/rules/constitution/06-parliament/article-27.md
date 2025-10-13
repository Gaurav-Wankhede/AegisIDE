---
trigger: always_on
part: VI-Parliament
article: 27
category: proposal_submission_ias_briefing
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 27: Proposal Submission & IAS Briefing

## 1. Definition — Evidence-Based Proposal System

All parliamentary proposals require **mandatory IAS briefing** with MCP-backed evidence, constitutional impact analysis, resource assessment, and risk evaluation. No proposal proceeds without comprehensive intelligence dossier. This ensures informed decision-making and prevents rushed implementations.

**Proposal Requirements**: Clear objective, constitutional justification, IAS research dossier, resource estimate, risk assessment, success criteria, rollback plan, MCP evidence trail.

**IAS Dossier Contents**: Executive summary, technical feasibility, cost-benefit analysis, constitutional compliance check, historical precedents from `memory.json`, alternative approaches, implementation timeline.

## 2. Powers — Proposal Authority

**Proposal Rights**: Any citizen may submit via scratchpad.json, but IAS Researcher must validate and create dossier before parliamentary consideration.

**IAS Researcher**: Operates `/research` workflow, gathers evidence via `@mcp:context7` and `@mcp:fetch`, analyzes feasibility, documents findings in `systemPatterns.json`, presents to Parliament.

**Parliament**: Reviews dossier, questions IAS, requests additional research if needed, approves/rejects based on evidence quality and constitutional alignment.

## 3. Implementation — Proposal Process

**Submission to Approval Workflow**:
```
1. Initial Submission:
   - Citizen writes proposal in scratchpad.json
   - Includes: title, objective, rationale, expected outcome
   - @mcp:time → Timestamp submission
   - Proposal ID assigned (proposal-YYYYMMDD-NNN)

2. IAS Research Phase:
   - Researcher receives assignment
   - @mcp:context7 → Official documentation research
   - @mcp:fetch → External benchmarks/best practices
   - @mcp:memory → Historical precedent search
   - @mcp:math → Resource impact calculation
   - @mcp:sequential-thinking → Risk assessment

3. Dossier Creation:
   - @mcp:filesystem → Write to systemPatterns.json:
     {
       "research_id": "research-001",
       "proposal_ref": "proposal-20251013-001",
       "executive_summary": "Implement feature X with approach Y",
       "technical_feasibility": "High (8/10)",
       "cost_estimate": "2 hours development, zero cloud cost",
       "constitutional_compliance": "Aligns with Articles 4, 5, 20",
       "precedents": ["Similar in project ABC", "Pattern pat-123"],
       "alternatives": ["Approach A (rejected: higher cost)", "Approach B (viable fallback)"],
       "risk_level": "Low",
       "success_criteria": ["Feature functional", "Tests passing", "Zero lint errors"],
       "rollback_plan": "git revert + schema restoration",
       "mcp_evidence": ["context7: /lib/docs", "fetch: official-site.com/guide"]
     }
   
4. Parliamentary Review:
   - IAS presents dossier to Parliament
   - All branches review simultaneously
   - Questions answered by IAS Researcher
   - Opposition files challenges if concerns

5. Enhanced Debate:
   - Debate proceeds with evidence-based arguments
   - IAS clarifies technical points
   - @mcp:sequential-thinking → Structured discussion
   - Alternatives evaluated against criteria

6. Informed Vote:
   - Parliament votes with full information
   - @mcp:math → Consensus calculation
   - Decision documented in progress.json
   - Approved proposals move to implementation
```

## 4. Violations — Proposal Violations

**Bypassing IAS Briefing**: Proposing without research dossier = -30 RL penalty + research mandate + proposal tabled.

**Incomplete Dossier**: Missing critical analysis = -20 RL penalty + completion required.

**Misleading Evidence**: Falsifying research = -50 RL penalty + tribunal + citizenship risk.

**Remediation**: Successfully prepare 10 comprehensive dossiers, demonstrate research rigor, pass IAS quality audit, restore privileges after parliamentary approval.

---

**Character Count**: 3,145 | **Schema References**: scratchpad, systemPatterns, progress, memory | **MCP Requirements**: context7, fetch, memory, math, sequential-thinking, time, filesystem
