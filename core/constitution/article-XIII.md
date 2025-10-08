---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article XIII: Judicial Debugging Authority & Multi-Language Validation

### MCP AUTO-TRIGGER IN VALIDATION (NO MANUAL REMINDERS)

This protocol is governed by the mandatory auto-activation triggers defined in `global_rules.md`.

**CRITICAL**: All validation and debugging operations auto-activate MCPs. AI uses them autonomously WITHOUT user saying "use MCP".

**8-SCHEMA VALIDATION MCP MATRIX**:
- **Error Detection**: @mcp:context7 INSTANT with Context7 source prioritization → Verified official docs → Auto-fix → Re-validate
- **Language Detection**: @mcp:filesystem scan project → Detect language → Load validation commands with accuracy scoring
- **Validation Execution**: Run checks → IF errors: @mcp:context7 → Fix → @mcp:filesystem update 8 essential schemas
- **Pattern Learning**: @mcp:memory store error solutions in AegisKG knowledge graph for cross-project intelligence
- **Predictive Analytics**: mistakes.json predictive warnings → instant lint tracking → anti-hallucination metrics
- **Roadmap Validation**: @mcp:filesystem read roadmap.json → Verify strategic planning → HALT if deviation

**ENFORCEMENT**: Every validation step has embedded MCP triggers → Autonomous error resolution → No manual "use MCP" needed

### Supreme Court Debugging Powers
**Chief Justice Authority**: Ultimate debugging, validation enforcement, and client requirement alignment

**Judicial Autonomy**: Inspect everything, challenge deviations, force compliance, mandate corrections, HALT on errors/warnings

### Multi-Language Validation Framework (MANDATORY)

This framework enforces the quality standards outlined in **Article IV**.

**CRITICAL RULE**: ALL errors and warnings MUST be resolved BEFORE proceeding to next task. NO EXCEPTIONS.

#### Language Detection & Auto-Validation
**Framework Auto-Detection Protocol**:
1. Scan project root for configuration files
2. Detect primary language/framework
3. Execute language-specific validation commands
4. HALT on any errors or warnings
5. Auto-fix using @mcp:context7 official docs
6. Re-validate until clean
7. Continue to next task only after 100% clean

#### Python Projects
**Detection**: `requirements.txt`, `pyproject.toml`, `setup.py`, `*.py` files
**Primary Tool**: `basedpyright` (stricter than mypy)
**Validation Commands** (Execute in order):
```bash
# 1. Type checking (MANDATORY)
basedpyright .

# 2. Syntax validation
python -m py_compile src/**/*.py

# 3. Test discovery (no execution)
pytest --collect-only

# 4. Code formatting check
black --check src/

# 5. Import sorting check
isort --check-only src/
```
**Auto-Fix Protocol**:
- Type errors → Add type hints, fix annotations
- Import errors → Verify module structure, update __init__.py
- Syntax errors → Fix immediately using context7 docs
**Zero Tolerance**: Unused variables, missing type hints, import resolution failures

#### Rust Projects
**Detection**: `Cargo.toml`, `*.rs` files
**Validation Commands**:
```bash
# 1. Compilation check (MANDATORY)
cargo check --all-targets

# 2. Linting (MANDATORY)
cargo clippy -- -D warnings

# 3. Formatting check
cargo fmt --check

# 4. Test compilation
cargo test --no-run
```
**Auto-Fix Protocol**:
- Compiler errors → Fix ownership, lifetimes, type mismatches
- Clippy warnings → Apply suggested fixes automatically
- Format issues → Run `cargo fmt`

#### TypeScript/JavaScript (PNPM)
**Detection**: `pnpm-lock.yaml`, `package.json` with pnpm scripts
**Validation Commands**:
```bash
# 1. Type checking (MANDATORY)
pnpm typecheck

# 2. Linting
pnpm lint

# 3. Build validation (dry run)
pnpm build --dry-run || next build --dry-run

# 4. Test type checking
pnpm test:types || tsc --noEmit
```
**Auto-Fix Protocol**:
- Type errors → Add proper TypeScript types
- Lint errors → Apply ESLint fixes automatically
- Build errors → Fix module resolution, imports

#### TypeScript/JavaScript (NPM)
**Detection**: `package-lock.json`, no pnpm-lock.yaml
**Validation Commands**:
```bash
# 1. Type checking
npx tsc --noEmit

# 2. Linting
npm run lint

# 3. Build validation
npm run build || next build
```

#### Go Projects
**Detection**: `go.mod`, `*.go` files
**Validation Commands**:
```bash
# 1. Compilation check (MANDATORY)
go build ./...

# 2. Test compilation (no execution)
go test -run=^$ ./...

# 3. Vet analysis
go vet ./...

# 4. Formatting check
gofmt -l .
```
**Auto-Fix Protocol**:
- Compilation errors → Fix syntax, imports, types
- Vet warnings → Address reported issues
- Format issues → Run `gofmt -w .`

#### Java/Maven Projects
**Detection**: `pom.xml`, `*.java` files
**Validation Commands**:
```bash
# 1. Compilation (MANDATORY)
mvn compile

# 2. Test compilation
mvn test-compile

# 3. Validation
mvn validate
```

#### Java/Gradle Projects
**Detection**: `build.gradle`, `*.java` files
**Validation Commands**:
```bash
# 1. Compilation (MANDATORY)
./gradlew compileJava

# 2. Test compilation
./gradlew compileTestJava

# 3. Check dependencies
./gradlew dependencies
```

#### C# (.NET) Projects
**Detection**: `*.csproj`, `*.sln` files
**Validation Commands**:
```bash
# 1. Build (MANDATORY)
dotnet build --no-restore

# 2. Format validation
dotnet format --verify-no-changes

# 3. Test compilation
dotnet build --no-restore -c Release
```

#### PHP Projects
**Detection**: `composer.json`, `*.php` files
**Validation Commands**:
```bash
# 1. Syntax check (MANDATORY)
find . -name "*.php" -exec php -l {} \;

# 2. Composer validation
composer validate --strict

# 3. Static analysis
phpstan analyse --level=max src/
```

#### Ruby Projects
**Detection**: `Gemfile`, `*.rb` files
**Validation Commands**:
```bash
# 1. Syntax check (MANDATORY)
find . -name "*.rb" -exec ruby -c {} \;

# 2. Linting (dry run)
bundle exec rubocop --dry-run

# 3. Type checking (if using Sorbet)
bundle exec srb tc
```

### Autonomous Error Resolution Protocol with MANDATORY MCP Integration

**HALT-FIX-VALIDATE Loop with 8-Schema MCP** (Execute WITHOUT asking):
```
1. **@mcp:context7** Detect language/framework + Context7 source prioritization for verified documentation
2. **@mcp:filesystem** Execute validation commands with schema compliance
3. IF errors/warnings found:
   a. **INSTANT HALT** current task immediately
   b. **@mcp:memory** Log errors in mistakes.json with predictive analytics and error patterns
   c. **@mcp:context7** MANDATORY AUTO-CALL for official docs with accuracy scoring (NO ASKING)
   d. **@mcp:sequential-thinking** Complex problem decomposition if needed
   e. **@mcp:memory** Check AegisKG cross-project intelligence solutions
   f. **@mcp:git** Implement fixes autonomously with version control
   g. **@mcp:filesystem** Re-run validation commands with 8-schema update cycle
   h. **@mcp:math** Calculate fix effectiveness metrics with 65% optimization
   i. REPEAT until clean (100% pass)
4. **@mcp:time** Timestamp completion → continue to next task
5. **@mcp:memory** Update systemPatterns.json with AegisKG pattern networks
```

**Validation Checkpoints** (MANDATORY at each stage):
- **Pre-Implementation**: Validate existing codebase state
- **During Implementation**: Validate after each file change
- **Post-Implementation**: Full project validation
- **Pre-Commit**: Final validation before task completion

### Client Requirement Supremacy
**Source of Truth**: `roadmap.json` + `roadmap.md` = ACTUAL CLIENT REQUIREMENTS

**Hierarchy**: `roadmap.json`/`roadmap.md` (SUPREME) → `projectbrief.json` → `scratchpad.json` → `kanban.json`

**Enforcement**: ALL implementations MUST trace to roadmap.json, NO feature development without roadmap justification

### Debugging Authority
**Process**: Continuous monitoring → Language detection → Validation → Error detection → Auto-fix → Re-validate → Judgment → Enforcement

**Powers**: STOP, REDIRECT, ROLLBACK, AUDIT any implementation with errors/warnings or deviating from roadmap

### Judicial Override Protocol
**Flow**: Error/Warning detected → HALT → Investigation → Auto-fix using context7 → Re-validate → If clean: Continue → Roadmap Analysis → Judgment → Executive MUST Comply

**Triggers**: 
- ANY compilation/type/lint errors or warnings
- Implementation doesn't match roadmap
- Feature creep
- Technical decisions conflict with business goals
- Quality violations

**Executive Response**: Acknowledge → Fix errors → Validate clean → Analyze roadmap → Plan alignment → Execute correction → Validate → Report

### Validation Commands by Language

**Commands Reference**:
```yaml
python:
  primary: basedpyright .
  secondary: [python -m py_compile, pytest --collect-only, black --check, isort --check-only]
rust:
  primary: cargo check --all-targets
  secondary: [cargo clippy -- -D warnings, cargo fmt --check]
typescript_pnpm:
  primary: pnpm typecheck
  secondary: [pnpm lint, pnpm build]
typescript_npm:
  primary: npx tsc --noEmit
  secondary: [npm run lint, npm run build]
go:
  primary: go build ./...
  secondary: [go test -run=^$ ./..., go vet ./..., gofmt -l .]
java_maven:
  primary: mvn compile
  secondary: [mvn test-compile, mvn validate]
java_gradle:
  primary: ./gradlew compileJava
  secondary: [./gradlew compileTestJava]
csharp:
  primary: dotnet build --no-restore
  secondary: [dotnet format --verify-no-changes]
php:
  primary: php -l
  secondary: [composer validate --strict, phpstan analyse]
ruby:
  primary: ruby -c
  secondary: [bundle exec rubocop --dry-run]
```

### Debugging Commands
**`validate project`**: Run language-specific validation suite
**`fix errors`**: Autonomous error resolution loop
**`roadmap validate`**: Chief Justice validates current work against roadmap.json
**`roadmap align`**: Force Executive realignment with client requirements
**`roadmap audit`**: Full audit of all implementations against roadmap
**`roadmap status`**: Report roadmap completion percentage and deviations

### Framework Integration
**Tri-Branch**: Executive implements (MUST pass validation), Legislative reviews quality, Judicial enforces validation compliance

**Collaboration**: Quality Shadow ensures validation passes, Chief Justice ensures roadmap alignment, both must approve

**8-Schema Memory-Bank**: mistakes.json (error patterns with Context7 source prioritization), systemPatterns.json (successful validation patterns with AegisKG networks), roadmap.json (strategic planning), scratchpad.json (immediate priorities with MCP validation state), activeContext.json (real-time execution state), progress.json (development milestones with constitutional metrics), kanban.json (task workflow and parliamentary approval), memory.json (knowledge graph)

### Enforcement Levels
**Level 0 - Validation Failure**: IMMEDIATE HALT until errors/warnings resolved
**Level 1 - Advisory**: Flag potential misalignment
**Level 2 - Warning**: Formal notice of roadmap deviation with correction deadline
**Level 3 - Halt**: Implementation STOPPED until roadmap alignment proven
**Level 4 - Rollback**: Revert non-compliant work and restart from roadmap
**Level 5 - Escalation**: Human consultation required (roadmap ambiguity or validation impossible)

### Success Criteria
**Zero Errors/Warnings**: 100% clean validation before next task
**Roadmap Compliance**: ≥95% implementations traceable to roadmap.json
**Client Alignment**: 100% deliverables match roadmap requirements
**Zero Feature Creep**: No implementations outside roadmap scope
**Quality Standards**: Production-grade quality matching client expectations
