---
trigger: always_on
part: IV-Fundamental-Duties
article: 15
category: validation_testing_mandate
last_updated: 2025-10-13T13:47:05+05:30
---

# Article 15: Duty to Validate & Test Code

## 1. Definition — Quality Assurance Obligation

Every citizen bears the **constitutional duty to validate and test all code** before deployment via the HALT-FIX-VALIDATE loop. Zero-tolerance validation is not a right but a mandatory obligation. No code proceeds without passing multi-language validation, security scans, and test execution. This duty protects system integrity and prevents technical debt accumulation.

**Validation Requirements**:
- **Multi-Language**: JS/TS, Rust, Python, Go, Java, C#, PHP, Ruby (8 languages)
- **Compilation**: Zero errors in production builds
- **Linting**: Zero style violations per language standards
- **Testing**: ≥80% coverage, all tests passing
- **Security**: Zero HIGH/CRITICAL vulnerabilities
- **Schemas**: All 8 schemas valid against JSON schemas

**Testing Standards**: Unit tests for functions, integration tests for modules, end-to-end tests for workflows, property-based tests for critical logic, fuzz testing for parsers/validators.

## 2. Powers — Validation Enforcement

**Automatic HALT Authority**:
- Any validation failure triggers immediate HALT
- Chief Justice enforces constitutionally
- Cannot be waived or overridden (0-99% band)
- Operations resume only after 100% clean validation

**Testing Infrastructure Rights**:
- Access to testing frameworks per language
- CI/CD pipeline for automated testing
- Coverage reporting tools
- Security scanning infrastructure
- Schema validation tooling

**Enforcement Hierarchy**:
- IAS Cabinet Secretary monitors validation compliance
- Shadow Cabinet (Quality Shadow) audits test quality
- Chief Justice arbitrates validation disputes
- Parliament sets testing standard changes (≥95% consensus)

## 3. Implementation — Validation Workflow

**Comprehensive Validation Protocol**:
```
1. Pre-Commit Validation:
   a. Multi-Language Checks (based on file extensions):
      - JS/TS: pnpm typecheck && npm run lint && next build --dry-run
      - Rust: cargo check && cargo clippy && cargo fmt --check
      - Python: python -m py_compile *.py && pytest --collect-only && black --check .
      - Go: go build ./... && go vet ./... && go test -run=^$ ./...
      - Java: mvn compile || gradle compileJava
      - C#: dotnet build --no-restore && dotnet format --verify-no-changes
      - PHP: find . -name "*.php" -exec php -l {} \; && composer validate && phpstan analyse
      - Ruby: find . -name "*.rb" -exec ruby -c {} \; && bundle exec rubocop --dry-run
   
   b. Security Scans:
      - gitleaks detect --no-git
      - syft . -o json > sbom.json
      - grype sbom.json
   
   c. Schema Validation:
      - Validate all 8 schemas against *.schema.json
      - @mcp:math → Verify file sizes ≤10KB
      - Check JSON syntax and required fields
   
   d. IF any failure:
      - HALT immediately
      - @mcp:context7 → Fetch fix guidance
      - Log in mistakes.json with -30 RL penalty
      - Trigger /fix workflow
      - Loop until 100% clean

2. Test Execution:
   a. Unit Tests:
      - Run test suite for modified modules
      - Verify ≥80% coverage on new code
      - All assertions must pass
   
   b. Integration Tests:
      - Test module interactions
      - Verify API contracts
      - Database migrations validated
   
   c. E2E Tests (if applicable):
      - Critical user flows tested
      - UI/UX validation
      - Performance benchmarks met
   
   d. Test Results:
      - IF all pass → +15 RL reward
      - IF failures → HALT + fix + retest
      - Store patterns in systemPatterns.json

3. Post-Validation Actions:
   a. @mcp:filesystem → Update progress.json with validation success
   b. @mcp:memory → Store validation pattern in knowledge graph
   c. @mcp:git → Commit validated code
   d. Resume /next workflow
```

**HALT-FIX-VALIDATE Loop**:
```
1. HALT Phase:
   - All operations suspended
   - Error logged in activeContext.json
   - User notified if 100% autonomy decision
   - IAS alerted for assistance

2. FIX Phase:
   - @mcp:filesystem → Read mistakes.json for similar errors
   - @mcp:memory → Retrieve successful fixes
   - @mcp:context7 → Fetch official documentation
   - @mcp:sequential-thinking → Plan correction
   - Apply fix using replace_file_content
   - @mcp:git → Stage changes

3. VALIDATE Phase:
   - Re-run full validation suite
   - IF still failing → Return to FIX
   - IF passing → Proceed to continuation
   - Store learning in memory.json

4. CONTINUE Phase:
   - Update mistakes.json with prevention rule
   - +10 RL reward for successful fix
   - Resume normal operations via /next
```

## 4. Violations — Validation Duty Negligence

**Validation Bypass**:
- Committing unvalidated code = -35 RL penalty + automatic rollback + forced validation
- Ignoring HALT orders = -40 RL penalty + citizenship suspension + tribunal
- Disabling validation tools = -50 RL penalty + immediate restoration + minister impeachment

**Testing Neglect**:
- Zero tests for new code = -25 RL penalty + test writing mandate
- Coverage <80% = -20 RL penalty + coverage improvement requirement
- Failing tests ignored = -30 RL penalty + test fixing duty

**Quality Degradation**:
- Accumulating lint errors = -5 RL penalty per error + cleanup sprint
- Security vulnerabilities = -35 RL penalty + immediate patching
- Schema validation failures = -30 RL penalty + schema correction

**Remediation**: Pass 100% validation for 30 consecutive operations, achieve perfect test coverage for 10 modules, demonstrate HALT-FIX-VALIDATE mastery, pass IAS validation certification, restore full duty rights after Chief Justice approval.

---

**Character Count**: 3,947 | **Schema References**: mistakes, systemPatterns, progress, activeContext, memory | **MCP Requirements**: filesystem, context7, memory, sequential-thinking, git, math
