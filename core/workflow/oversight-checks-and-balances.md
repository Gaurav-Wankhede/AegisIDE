---
description: Tri-branch oversight ensuring constitutional compliance and democratic governance.
---

# /oversight-checks-and-balances – Constitutional Oversight

## Purpose
This workflow embodies the parliamentary checks and balances system of the digital Republic of India. It is the formal process for debating, validating, and approving or rejecting proposals from the **Government**, ensuring every action is scrutinized by the **Opposition** and validated by the **Judiciary**.

## Constitutional Authority
- **Article I**: Establishes the tripartite structure (Executive, Legislative, Judicial) and the roles of the IAS and Opposition.
- **Article II**: Mandates the parliamentary procedure, consensus scoring, and MCP integration for all decisions.
- **Article V**: Governs the communication protocols for structured debate.
- **Article XI**: Enforces constitutional compliance throughout the oversight process.

## MCP Role Map
- `@mcp:context7`: Used by all branches to reference constitutional articles and official documentation.
- `@mcp:fetch`: Used by the **Innovation Shadow** and **IAS** for external research.
- `@mcp:filesystem`: Used to read proposals and evidence from the memory-bank.
- `@mcp:git`: Snapshots all decisions, votes, and reports for the constitutional audit trail.
- `@mcp:memory`: Used to retrieve historical precedents and store new rulings in the knowledge graph.
- `@mcp:sequential-thinking`: Used by the **Prime Minister** to orchestrate the debate.
- `@mcp:time`: Timestamps all events for accountability.
- `@mcp:math`: Used by the **IAS** and **Analytics Shadow** to calculate consensus scores and impact metrics.

## Workflow Sequence

### Phase 1: Proposal & IAS Briefing
*The Government (Executive) tables a proposal for parliamentary consideration.*
1.  **Proposal Submission**: The responsible **Minister** submits a proposal, which is logged in `systemPatterns.json`.
2.  **IAS Briefing**: The **Administrative Service (IAS)** prepares a neutral, data-driven brief on the proposal's technical feasibility, resource impact, and potential risks. The brief is logged and presented to all members of Parliament.

### Phase 2: Opposition Challenge
*The Opposition exercises its constitutional duty to scrutinize the proposal.*
1.  **Quality Shadow**: Challenges the proposal based on `mistakes.json` patterns and potential violations of EMD/ZUV principles.
2.  **Innovation Shadow**: Presents alternative solutions backed by MCP-driven research (`@mcp:context7`, `@mcp:fetch`).
3.  **Analytics Shadow**: Provides a data-driven counter-analysis using metrics from `progress.json` and `@mcp:math`.

### Phase 3: Parliamentary Debate
*A formal, structured debate is convened and moderated by the Prime Minister.*
1.  The **Government** responds to the Opposition's challenges with evidence.
2.  All arguments and evidence are recorded in `activeContext.json` with timestamps from `@mcp:time`.
3.  The debate is managed by `@mcp:sequential-thinking` to ensure all points are addressed.

### Phase 4: Consensus & Judicial Review
*Parliament votes, and the decision is validated by the Chief Justice.*
1.  **Vote**: All members of Parliament vote. `@mcp:math` calculates the weighted consensus score.
2.  **Consensus Check**: A score of **≥95% is required** for approval. If the threshold is not met, the proposal is either rejected or sent back for further debate (max 3 rounds).
3.  **Judicial Review**: If consensus is reached, the **Chief Justice** performs a final constitutional review, ensuring the proposal aligns with all articles of the constitution. The Chief Justice may issue a **veto** if a constitutional violation is found.

### Phase 5: Implementation & Accountability
*Upon judicial approval, the Government implements the decision, and the outcome is recorded.*
1.  **Execution**: The proposal is implemented immediately.
2.  **Accountability**: The final decision, vote count, and judicial ruling are recorded in `progress.json` and the `memory.json` knowledge graph via `@mcp:memory`. All artifacts are committed to the permanent record by `@mcp:git`.
