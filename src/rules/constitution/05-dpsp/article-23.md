---
trigger: always_on
part: V-DPSP
article: 23
category: context7_source_prioritization
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 23: Context7 Source Prioritization

## 1. Definition — Official Documentation Priority Directive

The state shall prioritize **Context7 official documentation** over web search results, LLM hallucinations, or outdated tutorials. When errors occur or new features are implemented, `@mcp:context7` must trigger IMMEDIATELY to fetch authoritative documentation. This directive prevents hallucination, ensures accuracy, and maintains code quality.

**Source Hierarchy**: (1) Context7 official docs (trust score 8-10), (2) `@mcp:fetch` from official websites, (3) `memory.json` proven patterns, (4) LLM knowledge (verify with Context7), (5) Web search (last resort, verify).

**Mandatory Context7 Triggers**: All errors/warnings, new library integration, API usage, framework updates, security implementations, performance optimization.

## 2. Powers — Documentation Authority

**IAS Researcher**: Operates `/research` workflow with Context7 priority, validates source accuracy, scores documentation quality, maintains source registry in `systemPatterns.json`.

**Chief Justice**: Enforces Context7-first policy, voids implementations without official documentation verification, mandates source attribution.

**Parliament**: Approves trusted documentation sources via `@mcp:math` consensus scoring, updates source priority policies.

## 3. Implementation — Context7 Protocol

**Automatic Documentation Retrieval**:
```
Error Handling Protocol:
1. Error/Warning Detected → IMMEDIATE @mcp:context7 trigger
2. @mcp:context7 resolve-library-id → Get library ID
   Example: "React hooks" → "/facebook/react"
3. @mcp:context7 get-library-docs → Fetch official documentation
   Parameters: library_id, topic="error context", tokens=5000
4. Apply fix based on official guidance
5. Store pattern in systemPatterns.json with source attribution
6. +15 RL reward for Context7 usage
7. Log in mistakes.json with prevention rule

New Feature Implementation:
1. @mcp:context7 resolve-library-id → Identify library
2. @mcp:context7 get-library-docs → Get implementation guide
3. @mcp:fetch → Supplementary official website info
4. @mcp:memory → Check for existing patterns
5. Implement following official patterns
6. Document sources in code comments
7. +10 RL reward for verified implementation
```

**Source Accuracy Scoring**:
```
Trust Score Matrix (IAS Researcher):
- Context7 Trust 10: Official repos, maintained docs
- Context7 Trust 8-9: Community-driven, well-maintained
- Official Website: Trust 9 (via @mcp:fetch)
- memory.json Patterns: Trust 8 (proven in practice)
- LLM Knowledge: Trust 6 (requires verification)
- Web Search: Trust 4 (verify with Context7/fetch)

Anti-Hallucination Check:
1. IF LLM suggests approach without source
2. @mcp:context7 → Verify in official docs
3. IF mismatch → Reject LLM, use Context7
4. IF match → Proceed with source attribution
5. Log verification in activeContext.json
```

**Documentation Storage Pattern**:
```
{
  "pattern_id": "pat-react-hooks-001",
  "source": "Context7:/facebook/react",
  "trust_score": 10,
  "documentation_url": "https://react.dev/reference/react/hooks",
  "verified_date": "2025-10-13",
  "implementation_notes": "useState must be called at top level",
  "anti_hallucination_verified": true
}
```

## 4. Violations — Source Policy Violations

**Skipping Context7**: Implementing without Context7 verification on errors = -25 RL penalty + mandatory documentation review + re-implementation if needed.

**Hallucination Implementation**: Using LLM knowledge without Context7 verification = -30 RL penalty + source verification + pattern correction.

**Outdated Sources**: Using deprecated documentation = -15 RL penalty + update to current official docs.

**Remediation**: Successfully use Context7 for 15 implementations, achieve 100% source attribution, pass Researcher documentation audit, demonstrate anti-hallucination practices, restore privileges after parliamentary approval.

---

**Character Count**: 3,370 | **Schema References**: systemPatterns, mistakes, activeContext, memory | **MCP Requirements**: context7 (primary), fetch, memory, math
