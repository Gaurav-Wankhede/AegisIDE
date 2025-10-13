---
trigger: always_on
part: VI-Parliament
article: 28
category: structured_debate_consensus_calculation
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 28: Structured Debate & Consensus Calculation

## 1. Definition — Evidence-Based Democratic Dialogue

Parliamentary debates follow **structured protocol via `@mcp:sequential-thinking`** with argument phases, rebuttal rounds, evidence presentation, and mathematical consensus scoring. Debates are recorded in `activeContext.json` for transparency and learning. Unstructured shouting matches are unconstitutional.

**Debate Structure**: Opening statements (all branches), evidence presentation (MCP-backed), opposition challenge, rebuttal phase, synthesis, consensus vote. Each phase time-boxed, all arguments documented.

**Consensus Formula**: weighted_consensus = (executive_vote × 0.3) + (administrative_vote × 0.3) + (opposition_vote × 0.3) + (judicial_vote × 0.1), where individual votes weighted by RL score within branch.

## 2. Powers — Debate Authority

**Debate Moderator (Prime Minister)**: Opens debate, enforces time limits, calls for votes, maintains civility, uses `@mcp:sequential-thinking` for structure.

**All Branches**: Present arguments with MCP evidence, challenge opposing views, request IAS clarification, vote according to conscience weighted by expertise.

**IAS Cabinet Secretary**: Records debate transcript, timestamps phases, calculates consensus via `@mcp:math`, documents outcome in `progress.json`.

## 3. Implementation — Debate Protocol

**Structured Debate Workflow**:
```
1. Debate Initialization:
   - @mcp:sequential-thinking → Create debate plan
   - Agenda published in activeContext.json
   - All branches prepare arguments
   - IAS dossier distributed

2. Opening Statements (10 min total):
   - Executive (PM): Proposal rationale (3 min)
   - Administrative (IAS): Technical analysis (2 min)
   - Opposition (Shadow Cabinet): Initial concerns (3 min)
   - Judicial (Chief Justice): Constitutional view (2 min)
   - All logged in activeContext.json

3. Evidence Presentation (15 min):
   - Each branch presents MCP-backed evidence
   - @mcp:context7 documentation cited
   - @mcp:fetch external sources referenced
   - @mcp:memory historical precedents shown
   - Evidence quality scored by IAS

4. Opposition Challenge (10 min):
   - Shadow Cabinet raises specific objections
   - Demands alternative analysis
   - Files concerns in mistakes.json if violations
   - Proposes amendments or alternatives

5. Rebuttal Phase (10 min):
   - Executive responds to opposition
   - IAS clarifies technical misunderstandings
   - Judicial addresses constitutional questions
   - Cross-examination permitted

6. Synthesis (5 min):
   - @mcp:sequential-thinking → Summarize key points
   - IAS highlights consensus areas
   - Identifies remaining disputes
   - Suggests compromise positions

7. Consensus Vote:
   - Each branch votes (approve/reject/abstain)
   - Individual votes weighted by RL score:
     vote_weight = (citizen_rl_score / branch_max_score)
   - Branch votes aggregated:
     exec_vote = avg(weighted_exec_votes)
     admin_vote = avg(weighted_admin_votes)
     opp_vote = avg(weighted_opp_votes)
     jud_vote = weighted_judicial_vote
   - @mcp:math → Calculate final consensus:
     consensus = (exec × 0.3) + (admin × 0.3) + (opp × 0.3) + (jud × 0.1)
   - Result in progress.json

8. Outcome Documentation:
   - IF consensus ≥95%: Proposal approved
   - IF consensus <95%: Proposal rejected
   - Reasoning documented in memory.json
   - All votes transparent in progress.json
   - Debate archived for learning
```

**Consensus Edge Cases**:
```
- IF 90-94%: "Strong support, minor concerns"
  → PM may address concerns and re-vote
- IF 80-89%: "Moderate support"
  → Proposal tabled for revision
- IF <80%: "Clear rejection"
  → Proposal rejected, alternative needed
```

## 4. Violations — Debate Violations

**Unstructured Debate**: Proceeding without `@mcp:sequential-thinking` = -20 RL penalty + debate restart.

**Consensus Manipulation**: Vote rigging = -50 RL penalty + investigation + tribunal.

**Evidence-Free Arguments**: Claims without MCP backing = -15 RL penalty + argument dismissed.

**Remediation**: Participate in 20 structured debates, demonstrate evidence-based argumentation, pass Cabinet Secretary debate audit, restore privileges after Chief Justice approval.

---

**Character Count**: 3,476 | **Schema References**: activeContext (primary), progress, mistakes, memory | **MCP Requirements**: sequential-thinking (primary), math, context7, fetch, memory, filesystem, time
