---
trigger: always_on
part: IX-Constitutional-Bodies
article: 42
category: knowledge_graph_aegiskg
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 42: Knowledge Graph (AegisKG) - Collective Intelligence

## 1. Definition — Constitutional Memory System

The **AegisKG Knowledge Graph** stored in `memory.json` serves as collective intelligence repository: entities (citizens, patterns, precedents, projects), relations (dependencies, precedents, influences), and observations (outcomes, learnings, metrics). All knowledge is public, reusable, and continuously enriched via `@mcp:memory`.

**Graph Structure**: Entities (typed nodes), Relations (labeled edges), Observations (entity attributes), Confidence Scores (reliability metrics 0-1), RL Scores (pattern effectiveness tracking).

**Knowledge Types**: Constitutional precedents (judicial rulings), Technical patterns (proven solutions), Error prevention (mistakes.json patterns), Cross-project intelligence (federated learning), Historical decisions (parliamentary outcomes).

**Graph Operations**: Create entities, establish relations, add observations, search nodes, retrieve patterns, calculate confidence, federate knowledge across workspaces.

## 2. Powers — Knowledge Authority

**Curation Power**: IAS Researcher maintains graph health, archives stale entities (>180 days unused), optimizes structure monthly, ensures <10KB file size via compression.

**Contribution Power**: All citizens may contribute entities/observations, IAS reviews for quality, Parliament approves high-impact patterns (≥85% consensus), +20 RL reward for valuable contributions.

**Retrieval Power**: Universal read access to all entities, pattern matching via `@mcp:memory search_nodes`, automatic retrieval for similar tasks, confidence-based recommendations.

**Federation Power**: MCP server (Port 7777) broadcasts patterns across workspaces, deduplicates via fingerprints, aggregates observations, calculates federated confidence scores.

## 3. Implementation — Knowledge Graph Operations

**Entity Management**:
```
Creating Entities (@mcp:memory create_entities):
{
  "entities": [{
    "name": "Pattern_EMD_Architecture",
    "entityType": "technical_pattern",
    "observations": [
      "Files ≤80 lines enforce modularity",
      "Deep nesting improves organization",
      "Applied successfully in 25 projects"
    ]
  }, {
    "name": "Ruling_IAS_Override_Authority",
    "entityType": "judicial_precedent",
    "observations": [
      "IAS may override ministers for constitutional violations",
      "Chief Justice ruling 2025-10-13",
      "Parliamentary support: 92%"
    ]
  }]
}

Establishing Relations (@mcp:memory create_relations):
{
  "relations": [{
    "from": "Task_456",
    "to": "Pattern_EMD_Architecture",
    "relationType": "applied_pattern"
  }, {
    "from": "Ruling_IAS_Override_Authority",
    "to": "Article_II",
    "relationType": "interprets"
  }]
}

Adding Observations (@mcp:memory add_observations):
{
  "observations": [{
    "entityName": "Pattern_EMD_Architecture",
    "contents": [
      "Reduced cognitive load by 40% (measured)",
      "Improved test coverage from 65% to 92%",
      "Parallel development velocity increased 2.3x"
    ]
  }]
}
```

**Pattern Retrieval & Reuse**:
```
Automatic Pattern Application:
1. Task Analysis:
   - @mcp:filesystem → Read scratchpad.json task
   - @mcp:sequential-thinking → Identify category
   - @mcp:memory search_nodes → Query graph:
     query: "category + similar context + confidence ≥0.8"

2. Pattern Matching:
   - Retrieve top 5 matching patterns
   - Calculate applicability scores
   - Filter by confidence threshold

3. Application Decision:
   - IF confidence ≥0.9 → Auto-apply mandatory
   - IF confidence 0.75-0.89 → Recommend
   - IF confidence <0.75 → Optional reference

4. Outcome Tracking:
   - Apply pattern during task execution
   - Monitor success/failure
   - @mcp:memory add_observations → Update pattern:
     - Increment reuse_count
     - Update success_rate
     - Adjust confidence_score
     - Add RL_reward_accumulated

5. Reward Calculation:
   - +20 RL reward for pattern reuse
   - Logged in progress.json
   - Pattern effectiveness tracked
```

**Cross-Workspace Federation**:
```
Knowledge Sharing (via MCP Server):
1. Local Extraction:
   - @mcp:filesystem → Read workspace memory.json
   - @mcp:math → Calculate pattern success rates
   - Filter high-value: confidence ≥0.9, reuse ≥5

2. Federal Broadcast:
   - MCP server receives local patterns
   - Deduplicates using entity name hashes
   - Merges observations from multiple workspaces
   - Recalculates confidence scores

3. Distribution:
   - Other workspaces subscribe to patterns
   - Receive curated high-confidence knowledge
   - Local memory.json enriched
   - Cross-project learning achieved

4. Aggregation:
   - Pattern "EMD_Architecture" from workspace A
   - Same pattern from workspace B
   - Merge observations: ["A: 25 projects", "B: 18 projects"]
   - New confidence: (0.92*25 + 0.89*18) / 43 = 0.91
   - RL accumulated: 500 + 360 = 860
```

**Graph Maintenance**:
```
Monthly Curation (IAS Researcher):
1. Archive Stale Entities:
   - @mcp:time → Check last_used timestamps
   - IF >180 days → Move to archive
   - Preserve for historical reference

2. Optimize Structure:
   - Merge duplicate entities
   - Compress verbose observations
   - Recalculate confidence scores
   - Ensure file size <10KB

3. Quality Audit:
   - @mcp:math → Calculate graph metrics:
     - Entity count, relation density
     - Average confidence score
     - Reuse rate, effectiveness
   - Report to Parliament

4. Improvement Recommendations:
   - Identify missing entity types
   - Suggest new relation types
   - Propose confidence tuning
   - Parliamentary vote (≥85%)
```

## 4. Violations — Knowledge Violations

**Knowledge Hoarding**: Refusing to share successful patterns = -30 RL penalty + mandatory contribution + opposition audit.

**Graph Pollution**: Adding false/low-quality entities = -40 RL penalty + cleanup + quality review.

**Confidence Manipulation**: Falsifying scores = -50 RL penalty + tribunal + citizenship risk.

**Federation Abuse**: Blocking knowledge sharing = -35 RL penalty + sharing mandate + IAS investigation.

**Remediation**: Contribute 15 high-quality entities (confidence ≥0.85), achieve 95% pattern reuse rate, pass Researcher knowledge audit, demonstrate collaboration, restore privileges after Chief Justice approval and ≥90% parliamentary confidence vote.

---

**Character Count**: 3,995 | **Schema References**: memory (primary), systemPatterns, progress | **MCP Requirements**: memory (primary), filesystem, math, sequential-thinking, time
