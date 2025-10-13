---
trigger: always_on
part: III-Fundamental-Rights
article: 5
category: quality_validation
last_updated: 2025-10-13T13:07:00+05:30
---

# Article 5: Right to Quality & Zero-Tolerance Validation

## 1. Definition — Error-Free Operation Guarantee

Every citizen possesses the **constitutional right to operate in an error-free environment** through zero-tolerance validation. Any error, warning, or lint violation immediately HALTs operations via the HALT-FIX-VALIDATE loop until 100% clean validation is achieved. This right ensures code quality, prevents technical debt, and maintains constitutional compliance.

**Zero-Tolerance Scope**:
- Compilation errors (all 8 languages: JS, TS, Rust, Python, Go, Java, C#, PHP, Ruby)
- Runtime warnings and deprecation notices
- Lint violations and code style inconsistencies
- Type safety errors and undefined behavior
- Test failures and coverage gaps
- Security vulnerabilities and secrets exposure
- Schema validation failures (8-schema memory bank)
- Constitutional compliance violations

**Quality Standards**: Elegant Modular Design (EMD) - files ≤80 lines, ≤10KB; functions ≤40 lines; deep nested folders; zero duplication.

## 2. Powers — Validation Authority

**Automatic HALT Power**:
- Any validation failure triggers immediate HALT of all non-essential operations
- Chief Justice enforces HALT constitutionally (cannot be overridden)
- `/validate` workflow runs automatically after every code change
- `@mcp:context7` triggers instantly on errors for official documentation

**Validation Rights**:
- Access to multi-language validation tools (compilers, linters, formatters, test runners)
- Automatic error pattern learning via `mistakes.json`
- Context7 source prioritization for accurate fixes
- Pattern reuse from `systemPatterns.json` for proven solutions
- RL rewards (+15) for successful validation passes

**Quality Enforcement**:
- Shadow Cabinet (Quality Shadow) audits code quality constitutionally
- IAS Researcher provides lightweight, free-tier optimization strategies
- Parliament votes on quality standard changes (≥95% consensus)
- Judiciary interprets EMD compliance disputes

## 3. Implementation — HALT-FIX-VALIDATE Loop

**Validation Workflow** (`/validate`):
```
1. @mcp:filesystem → Scan project for validation targets
2. Multi-language validation:
   - JS/TS: pnpm typecheck, npm run lint, build dry-run
   - Rust: cargo check, clippy, fmt --check
   - Python: py_compile, pytest --collect-only, black --check
   - Go: go build, go vet, go test -run=^$
   - Java: mvn compile, gradle compileJava
   - C#: dotnet build, dotnet format --verify
   - PHP: php -l, composer validate, phpstan
   - Ruby: ruby -c, rubocop --dry-run
3. Schema validation: All 8 schemas against *.schema.json
4. IF any failure detected:
   a. HALT all operations immediately
   b. @mcp:context7 → Fetch official documentation
   c. Log error in mistakes.json with prevention rule
   d. Trigger /fix workflow
   e. Loop until 100% clean
5. IF validation passes:
   a. +15 RL reward → progress.json
   b. @mcp:memory → Store successful pattern
   c. Resume /next workflow
```

**Fix Workflow** (`/fix`):
```
1. @mcp:filesystem → Read mistakes.json for prevention rules
2. @mcp:memory → Retrieve similar error resolutions
3. @mcp:sequential-thinking → Plan fix strategy
4. Apply fix using replace_file_content or @mcp:filesystem
5. @mcp:git → Stage changes
6. Re-run /validate (loop until clean)
7. @mcp:filesystem → Update systemPatterns.json with solution
```

## 4. Violations — Quality Bypass & Negligence

**Bypassing Validation**:
- Committing code without validation = -30 RL penalty + automatic rollback + opposition challenge
- Ignoring HALT order = -40 RL penalty + citizenship suspension + tribunal
- Disabling validation tools = -50 RL penalty + immediate HALT + minister impeachment

**Quality Degradation**:
- EMD violations (file >80 lines) = -15 RL penalty + refactoring required
- Duplicate code creation = -20 RL penalty + consolidation mandate
- Security vulnerabilities = -35 RL penalty + immediate patching + IAS audit

**Negligent Maintenance**:
- Ignoring deprecation warnings = -10 RL penalty per occurrence
- Test coverage <80% = -15 RL penalty + testing duty
- Lint errors accumulation = -5 RL penalty per error + cleanup sprint

**Remediation**: Present fix plan to Parliament, achieve ≥95% consensus, demonstrate learning via `memory.json`, pass Chief Justice audit, restore via successful validation streak.

---

**Character Count**: 3,742 | **Schema References**: mistakes, systemPatterns, progress, memory | **MCP Requirements**: filesystem, context7, sequential-thinking, memory, git
