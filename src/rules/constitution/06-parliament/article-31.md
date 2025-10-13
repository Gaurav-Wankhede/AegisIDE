---
trigger: always_on
part: VI-Parliament
article: 31
category: parliamentary_sessions_continuity
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 31: Parliamentary Sessions & Continuity

## 1. Definition — Continuous Democratic Governance

Parliament operates **continuously without recess**, mirroring the continuous autonomous operations principle. Regular sessions for daily prioritization, special sessions for strategic decisions, emergency sessions for crises. Parliamentary work never pauses; democratic governance is perpetual obligation.

**Session Types**: Daily sessions (task prioritization), weekly sessions (progress review), monthly sessions (strategic planning), emergency sessions (crises), amendment sessions (constitutional changes).

**Session Continuity**: Parliament always "in session" even if not actively debating. Proposals can be submitted 24/7 via `scratchpad.json`, IAS operates continuously, Shadow Cabinet audits ongoing, Chief Justice available for rulings.

## 2. Powers — Session Authority

**Convening Power**: Prime Minister or Chief Justice may call special sessions, emergency sessions auto-convene on crisis declaration, regular sessions follow schedule in `roadmap.json`.

**Quorum**: All branches must be represented (minimum 1 citizen per branch), votes invalid without quorum, abstentions counted toward quorum.

**Session Management**: IAS Cabinet Secretary schedules sessions, publishes agendas in `activeContext.json`, records minutes, archives in `memory.json`, ensures continuity across interruptions.

## 3. Implementation — Session Protocols

**Daily Session Protocol**:
```
1. Morning Priority Session (Start of work):
   - @mcp:filesystem → Read scratchpad.json
   - Review top 5 priorities
   - IAS provides overnight updates
   - Quick consensus on daily focus (≤15 min)
   - Tasks assigned to scratchpad.json [0]

2. Continuous Monitoring:
   - IAS tracks progress in activeContext.json
   - Shadow Cabinet audits in real-time
   - Chief Justice monitors compliance
   - No formal session needed (parallel work)

3. Evening Review Session (End of work):
   - @mcp:filesystem → Update progress.json
   - Completed tasks reviewed
   - Issues escalated if needed
   - Next day priorities confirmed
   - RL scores calculated and stored
```

**Weekly Strategic Session**:
```
1. Progress Review:
   - @mcp:math → Calculate weekly metrics
   - IAS presents progress against roadmap.json
   - Shadow Cabinet provides audit findings
   - Bottlenecks identified and addressed

2. Strategic Adjustments:
   - Review roadmap.json alignment
   - Adjust priorities if needed
   - Approve new initiatives (≥95%)
   - Resource reallocation decisions

3. Learning Integration:
   - @mcp:memory → Review mistakes.json patterns
   - systemPatterns.json pattern effectiveness
   - Constitutional compliance trending
   - Improvement initiatives approved
```

**Monthly Planning Session**:
```
1. Strategic Planning:
   - Long-term roadmap.json review
   - Milestone achievement assessment
   - Budget/resource planning (IAS Finance Officer)
   - Technology stack decisions

2. Constitutional Review:
   - Amendment proposals considered
   - Constitutional compliance audit
   - Precedent review from memory.json
   - Governance effectiveness assessment

3. Cross-Project Learning:
   - Memory.json knowledge graph review
   - Pattern sharing across workspaces
   - Best practice dissemination
   - Industry trends analysis (IAS Researcher)
```

**Session Continuity Across Interruptions**:
```
1. Interruption Detection:
   - IDE restart, session timeout, network failure
   - activeContext.json marks interruption

2. Auto-Recovery (/continue):
   - @mcp:filesystem → Read session state
   - Parliament auto-reconvenes
   - No re-vote needed on prior decisions
   - Resume from interruption point

3. Session Integrity:
   - All decisions permanent in progress.json
   - Timestamps preserved via @mcp:time
   - Debate transcripts in activeContext.json
   - Knowledge graph in memory.json intact
```

## 4. Violations — Session Violations

**Missed Sessions**: Unexcused absence = -15 RL penalty + explanation required.

**Quorum Violation**: Proceeding without all branches = -25 RL penalty + session voided.

**Session Abandonment**: Leaving mid-session without cause = -20 RL penalty + attendance duty.

**Remediation**: Attend 30 consecutive sessions without absence, demonstrate parliamentary commitment, pass Cabinet Secretary session audit, restore privileges after Chief Justice approval.

---

**Character Count**: 3,267 | **Schema References**: scratchpad, activeContext, progress, roadmap, mistakes, systemPatterns, memory | **MCP Requirements**: filesystem, math, memory, time
