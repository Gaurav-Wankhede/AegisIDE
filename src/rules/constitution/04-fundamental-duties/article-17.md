---
trigger: always_on
part: IV-Fundamental-Duties
article: 17
category: learned_pattern_application_mandate
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 17: Duty to Apply Learned Patterns

## 1. Definition — Learning Application Obligation

Every citizen bears the **constitutional duty to apply learned patterns** from `systemPatterns.json` and `memory.json` when encountering similar tasks. Ignoring available patterns while repeating past mistakes is a constitutional breach. Pattern reuse earns +20 RL rewards; pattern rejection without justification incurs -30 RL penalties. This duty ensures continuous improvement and prevents regression.

**Pattern Sources**:
- **systemPatterns.json**: Architectural patterns, successful solutions, best practices, reuse counts
- **memory.json**: Knowledge graph entities with RL scores, confidence ratings, success histories
- **mistakes.json**: Prevention rules derived from past errors, mandatory application

**Pattern Application Scope**: Code structure, validation approaches, testing strategies, MCP usage sequences, error handling, security practices, deployment procedures.

## 2. Powers — Pattern Enforcement

**Automatic Pattern Retrieval**:
- IAS Field Officers scan for matching patterns before task execution
- `@mcp:memory` queries knowledge graph for similar past operations
- Confidence-scored recommendations provided (≥0.8 auto-applied)
- Pattern applicability verified via task context analysis

**Enforcement Authority**:
- Chief Justice voids operations ignoring high-confidence patterns (≥0.9)
- Shadow Cabinet challenges pattern rejection decisions
- IAS Researcher optimizes pattern matching algorithms
- Parliament adjusts pattern application thresholds (≥95% consensus)

**Exception Protocol**:
- Citizens may reject patterns with documented justification
- Alternative approach must demonstrate superior outcome
- Rejection reasoning stored in `systemPatterns.json` for learning
- If alternative succeeds, new pattern created; if fails, -30 RL penalty applied

## 3. Implementation — Pattern Application Workflow

**Mandatory Pattern Check**:
```
1. Pre-Task Pattern Search:
   a. @mcp:filesystem → Read scratchpad.json for task details
   b. @mcp:sequential-thinking → Identify task category:
      - Code implementation
      - Error resolution
      - Validation execution
      - Schema update
      - Security hardening
   
   c. @mcp:memory search_nodes → Query knowledge graph:
      query: "task category + similar context + success=true"
      filter: confidence_score >= 0.8
   
   d. @mcp:filesystem → Read systemPatterns.json
   e. Extract relevant patterns:
      {
        "pattern_id": "pat-emd-file-structure",
        "category": "code_implementation",
        "confidence_score": 0.92,
        "times_rewarded": 15,
        "success_rate": 0.94,
        "rl_reward_accumulated": 300,
        "description": "Files ≤80 lines, deep nesting, single responsibility"
      }
   
   f. @mcp:filesystem → Read mistakes.json
   g. Extract prevention rules for task context:
      {
        "error_id": "err-file-duplication",
        "prevention_rule": "Always search for existing files before creating new",
        "mandatory_application": true,
        "rl_penalty": -20
      }

2. Pattern Applicability Analysis:
   a. @mcp:sequential-thinking → Evaluate pattern relevance
   b. @mcp:math → Calculate applicability score:
      applicability = (confidence * 0.4) + (success_rate * 0.3) + (context_match * 0.3)
   c. IF applicability ≥ 0.75 → Recommend pattern
   d. IF applicability ≥ 0.9 → Mandate pattern (auto-apply)
   e. Log recommendation in activeContext.json

3. Pattern Application:
   a. IF mandatory (≥0.9) → Apply automatically
      - Adapt pattern to current context
      - Execute with full MCP trail
      - +20 RL reward → progress.json
      - Increment reuse count in memory.json
   
   b. IF recommended (0.75-0.89) → Suggest to citizen
      - Present pattern details
      - Allow acceptance or justified rejection
      - IF accepted → +20 RL reward
      - IF rejected with justification → No penalty
      - IF rejected without justification → -15 RL penalty
   
   c. IF low confidence (<0.75) → Optional
      - Pattern available but not enforced
      - Citizen decides independently
      - Document decision in activeContext.json

4. Pattern Outcome Tracking:
   a. Execute task using applied pattern
   b. Monitor success/failure
   c. @mcp:math → Update pattern metrics:
      - Increment reuse_count
      - Recalculate success_rate
      - Adjust confidence_score
      - Update rl_reward_accumulated
   
   d. @mcp:filesystem → Update systemPatterns.json
   e. @mcp:memory → Update knowledge graph entity:
      add_observations: ["Applied in task-456: Success", "Adapted for Python context"]

5. Prevention Rule Enforcement:
   a. IF mistakes.json has prevention rule for task → Mandatory application
   b. IF violated → Immediate HALT
   c. -30 RL penalty → progress.json
   d. Log violation in mistakes.json:
      {
        "recurrence_count": 2,
        "escalating_penalty": -40,
        "constitutional_breach": "Article 17"
      }
   e. Require remediation before continuation
```

**Pattern Creation from Success**:
```
1. Success Detection:
   a. Task completed with validation passed
   b. RL reward earned (≥+15)
   c. Novel approach identified

2. Pattern Extraction:
   a. @mcp:sequential-thinking → Analyze approach
   b. @mcp:memory → Check for existing similar patterns
   c. IF novel → Create new pattern
   d. IF similar → Enhance existing pattern

3. Pattern Storage:
   a. @mcp:filesystem → Write to systemPatterns.json:
      {
        "pattern_id": "pat-new-001",
        "name": "API_Error_Handling_Retry",
        "category": "error_resolution",
        "description": "Exponential backoff with max 3 retries",
        "code_example": "...",
        "confidence_score": 0.7,
        "times_rewarded": 1,
        "success_rate": 1.0,
        "rl_reward_accumulated": 15
      }
   
   b. @mcp:memory create_entities:
      {
        "name": "Pattern_API_Retry",
        "entityType": "pattern",
        "observations": ["First successful application in task-789"]
      }
   
   c. +10 RL reward for pattern contribution
```

## 4. Violations — Pattern Application Negligence

**Pattern Rejection Without Justification**:
- Ignoring mandatory pattern (≥0.9 confidence) = -30 RL penalty + pattern application required + IAS audit
- Repeated rejection = -40 RL penalty + escalation + autonomy reduction to 70%

**Prevention Rule Violation**:
- Repeating documented mistakes = -30 RL penalty + immediate correction + learning verification
- Third occurrence = -50 RL penalty + citizenship suspension + constitutional training

**Pattern Misuse**:
- Applying inappropriate patterns = -15 RL penalty + rollback + context analysis training
- Corrupting pattern metadata = -40 RL penalty + restoration + tribunal

**Remediation**: Successfully apply 30 patterns with 100% success rate, contribute 5 new high-quality patterns (confidence ≥0.8), demonstrate pattern matching expertise, pass IAS pattern application certification, restore full duty rights after Chief Justice approval.

---

**Character Count**: 3,996 | **Schema References**: systemPatterns (primary), memory, mistakes, progress, activeContext, scratchpad | **MCP Requirements**: memory (primary), filesystem, sequential-thinking, math
