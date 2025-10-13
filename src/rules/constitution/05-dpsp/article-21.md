---
trigger: always_on
part: V-DPSP
article: 21
category: emd_compliance
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 21: Elegant Modular Design (EMD) Compliance

## 1. Definition — Architectural Excellence Directive

The state shall promote **Elegant Modular Design (EMD)** with files ≤80 lines (production code), ≤10KB (schemas), deep nested folder structures, and single-responsibility principles. EMD reduces cognitive load, improves maintainability, enables parallel development, and enforces modularity. Violations trigger automatic refactoring mandates.

**EMD Standards**: Production files ≤80 lines, schema files ≤10KB, functions ≤40 lines, deep nesting (`core/modules/feature/task/impl.ext`), one responsibility per file, clear separation of concerns.

**Exemptions**: Test files ≤150 lines (setup overhead), config files ≤100 lines (comprehensive settings), documentation files unlimited.

## 2. Powers — EMD Enforcement Authority

**Shadow Cabinet (Quality Shadow)**: Audits EMD compliance in all PRs, vetoes violations, mandates refactoring, tracks compliance metrics in `progress.json`.

**IAS Researcher**: Provides refactoring patterns via `systemPatterns.json`, recommends module splitting strategies, benchmarks maintainability improvements.

**Parliament**: Adjusts EMD standards via amendments (≥95% consensus), approves architectural patterns, sets exemption policies.

## 3. Implementation — EMD Protocols

**Automatic Compliance Check**:
```
Pre-Commit Validation:
1. Scan all modified files
2. Count lines (excluding comments/blank)
3. IF production file >80 lines → HALT
4. IF schema >10KB → HALT
5. Alert developer with refactoring guidance
6. Log violation in mistakes.json (-15 RL penalty)

Refactoring Workflow:
1. @mcp:sequential-thinking → Analyze file structure
2. Identify single responsibilities
3. Split into focused modules
4. Create deep nested folders as needed
5. Update imports/exports
6. Validate functionality preserved
7. +10 RL reward for successful refactoring
```

**Deep Nesting Pattern**:
```
Recommended Structure:
project/
├── core/
│   ├── auth/
│   │   ├── jwt/
│   │   │   ├── token_generation.rs
│   │   │   ├── token_validation.rs
│   │   │   └── refresh_logic.rs
│   │   └── bcrypt/
│   │       ├── hash_password.rs
│   │       └── verify_password.rs
│   └── database/
│       ├── queries/
│       │   ├── user_queries.rs
│       │   └── session_queries.rs
│       └── migrations/
│           └── init_schema.sql

Benefits:
- Clear module boundaries
- Easy to locate functionality
- Parallel development friendly
- Test isolation simplified
```

## 4. Violations — EMD Non-Compliance

**File Size Violations**: Production >80 lines = -15 RL penalty + refactoring required. Schema >10KB = -20 RL penalty + data optimization.

**Poor Structure**: Monolithic files, shallow nesting = -10 RL penalty + restructuring.

**Remediation**: Refactor 5 files to EMD compliance, demonstrate modular design understanding, pass Quality Shadow audit, restore compliance after parliamentary approval.

---

**Character Count**: 2,647 | **Schema References**: mistakes, systemPatterns, progress | **MCP Requirements**: sequential-thinking, filesystem, memory
