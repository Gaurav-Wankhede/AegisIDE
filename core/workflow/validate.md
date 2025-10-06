---
description: Judicial System validates constitutional compliance and code quality standards
---

# /validate - Constitutional Compliance Validation

## Purpose
Judicial Branch validates implementation against constitutional framework, ensuring code quality, roadmap alignment, and zero-tolerance for errors/warnings.

## Constitutional Authority
- **Article XIII**: Judicial Debugging Authority & Multi-Language Validation
- **Article IV**: Fundamental Principles - Code quality standards
- **Article II**: Autonomous Decision Making - Validation authority

## Judicial Authority
```bash
# Chief Justice Powers:
- Ultimate debugging and validation enforcement
- Client requirement alignment (roadmap.json supremacy)
- Constitutional compliance verification
- Zero tolerance for errors/warnings
- HALT operations on validation failures
```

## Workflow Sequence

### Phase 1: Constitutional Framework Validation (7-Schema)
```bash
# Verify constitutional compliance:
@mcp:filesystem → Read all 14 constitutional articles

# Check compliance areas:
1. Tri-branch governance active
2. Democratic consensus achieved (>95%)
3. 7-Schema integrity (all essential schemas ≤10KB)
4. MCP integration operational with AegisKG
5. Attention budget optimized (65% efficiency)
6. EMD compliance (≤80 lines per file)
7. Context7 source prioritization functional

# Calculate compliance score:
@mcp:math → Compliance percentage (≥80% required)
```

### Phase 2: Multi-Language Validation
```bash
# Auto-detect project language/framework:
@mcp:filesystem → Scan for:
- package.json, pnpm-lock.yaml (TypeScript/JavaScript)
- Cargo.toml (Rust)
- requirements.txt, pyproject.toml (Python)
- go.mod (Go)
- pom.xml, build.gradle (Java)
- *.csproj, *.sln (C#/.NET)
- composer.json (PHP)
- Gemfile (Ruby)
- go.mod (Go)
- pom.xml, build.gradle (Java)
- *.csproj, *.sln (C#)
- composer.json (PHP)
- Gemfile (Ruby)

# Execute language-specific validation:
Rust: cargo check --all-targets
TypeScript (PNPM): pnpm typecheck
TypeScript (NPM): npx tsc --noEmit
Python: basedpyright .
Go: go build ./...
Java (Maven): mvn compile
Java (Gradle): ./gradlew compileJava
C#: dotnet build --no-restore
PHP: php -l && composer validate
Ruby: ruby -c && bundle exec rubocop --dry-run
```

### Phase 3: Zero Tolerance Enforcement
```bash
# Check validation results:
IF ANY errors OR warnings detected:
  → IMMEDIATE HALT
  → Report to Chief Justice
  → Trigger /fix workflow
  → Block all operations until 100% clean

IF validation passes (100% clean):
  → Document in systemPatterns.json
  → Update progress.json with validation success
  → Continue operations
```

### Phase 4: Roadmap Alignment Verification
```bash
# Verify Supreme Authority:
@mcp:filesystem → Read roadmap.json + roadmap.md

# Check alignment:
1. All implementations trace to roadmap requirements
2. No feature creep (unauthorized features)
3. Client requirements met
4. Business value delivered
5. Strategic objectives achieved

# Roadmap compliance score:
@mcp:math → Calculate alignment percentage (≥95% required)
```

### Phase 5: Code Quality Standards
```bash
# EMD Compliance Check:
@mcp:filesystem → Scan all source files
- Verify files ≤80 lines (production)
- Check deep nested folder structure
- Validate proper module organization

# ZUV Principle Check:
- All variables used meaningfully
- No suppressed warnings with underscore
- Proper error handling

# Architecture Validation:
- Centralized configuration usage
- No duplicate implementations
- Reusable component patterns
```

### Phase 6: Memory Bank Validation
```bash
# Verify memory bank health:
@mcp:filesystem → Check all 7 essential schemas

1. File size validation (≤10KB each)
2. Schema compliance against .windsurf/memory-bank/schemas/ (100%)
3. Required fields present
4. Data types correct
5. Timestamps current
6. Cross-file consistency

# Attention budget check:
@mcp:math → Calculate n² degradation
- Signal-to-noise ratios
- Context rot indicators
- Optimal allocation maintained
```

### Phase 7: Judicial Review Report
```bash
# Generate comprehensive report:

**Constitutional Compliance**: [Score]% (≥80% required)
**Code Validation**: [PASS/FAIL] (100% clean required)
**Roadmap Alignment**: [Score]% (≥95% required)
**EMD Compliance**: [PASS/FAIL]
**Memory Bank Health**: [PASS/FAIL]
**Overall Status**: [APPROVED/REJECTED]

# Store report:
@mcp:filesystem → Update progress.json
@mcp:git → Commit validation results
```

## Validation Matrix
```bash
# Critical Validations (BLOCKING):
✓ Zero errors/warnings in code
✓ Constitutional compliance ≥80%
✓ Roadmap alignment ≥95%
✓ Memory bank schema valid (7 schemas)
✓ All 7 schemas ≤10KB

# High Priority Validations:
✓ EMD compliance (≤80 lines)
✓ ZUV principle adherence
✓ MCP integration operational
✓ Git snapshots current

# Standard Validations:
✓ Documentation complete
✓ Test coverage adequate
✓ Performance acceptable
✓ Security standards met
```

## Enforcement Levels
```bash
Level 0 - Validation Failure:
  → IMMEDIATE HALT until errors/warnings resolved
  → Block all operations
  → Trigger /fix workflow
  → 100% clean required

Level 1 - Advisory:
  → Flag potential misalignment
  → Recommend corrections
  → Allow continued operation with monitoring

Level 2 - Warning:
  → Formal notice of roadmap deviation
  → Correction deadline set
  → Legislative review triggered

Level 3 - Halt:
  → Implementation STOPPED
  → Roadmap alignment required
  → Executive must demonstrate compliance

Level 4 - Rollback:
  → Revert non-compliant work
  → Restart from roadmap
  → Document lessons in mistakes.json

Level 5 - Escalation:
  → Human consultation required (100% autonomy)
  → Roadmap ambiguity or validation impossible
  → Constitutional interpretation needed
```

## Tri-Branch Validation Process
```bash
# Executive Response:
1. Acknowledge validation results
2. Fix errors if any
3. Validate clean (100%)
4. Analyze roadmap alignment
5. Plan corrections
6. Execute fixes
7. Re-validate
8. Report compliance

# Legislative Review:
Quality Shadow:
  → Ensures validation passes
  → Challenges quality issues
  → Verifies testing coverage

Innovation Shadow:
  → Reviews alternative approaches
  → Suggests best practices via @mcp:context7
  → Evaluates technical decisions

Analytics Shadow:
  → Validates metrics accuracy
  → Assesses performance impact
  → Tracks compliance trends

# Judicial Decision:
Chief Justice:
  → Final validation authority
  → Constitutional interpretation
  → Enforcement of zero tolerance
  → Veto power over non-compliance
```

## Success Criteria
- ✅ Zero errors/warnings (100% clean code)
- ✅ Constitutional compliance ≥80%
- ✅ Roadmap alignment ≥95%
- ✅ EMD compliance verified
- ✅ Memory bank health confirmed
- ✅ All validations passed
- ✅ Judicial approval granted

## Validation Commands
```bash
# Language-specific commands:
validate-rust: cargo check && cargo clippy -- -D warnings
validate-typescript: pnpm typecheck && pnpm lint
validate-python: basedpyright . && pytest --collect-only
validate-go: go build ./... && go vet ./...
validate-java: mvn compile && mvn test-compile
validate-csharp: dotnet build --no-restore
validate-php: php -l && composer validate
validate-ruby: ruby -c && bundle exec rubocop

# Constitutional commands:
validate-constitution: Check all 14 articles loaded
validate-memory-bank: Verify all 18 files compliant
validate-roadmap: Check alignment with requirements
validate-governance: Verify tri-branch operational
```

## Error Handling
```bash
IF validation fails:
  → HALT all operations immediately
  → Report failures to Chief Justice
  → Trigger /fix workflow automatically
  → Monitor fix progress
  → Re-validate after fixes
  → ONLY continue after 100% clean

IF constitutional violation:
  → Legislative review triggered
  → Judicial investigation initiated
  → Determine root cause
  → Apply corrections
  → Update systemPatterns.json
  → Prevent future violations

IF roadmap misalignment:
  → Stop implementation
  → Review roadmap requirements
  → Realign with client needs
  → Executive must demonstrate compliance
  → Re-validate alignment
  → Continue only after approval
```

## Next Steps
After successful validation:
1. Document approval in progress.json
2. Update systemPatterns.json with validation patterns
3. Return to /next for continued execution
4. Monitor ongoing compliance
