---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article IV: Fundamental Principles with Context Engineering Excellence

### Core Values (2025 Standards)

- **Framework Supremacy**: Framework takes precedence over all rules, with `.windsurf/memory-bank/` as supreme context authority governed by attention budget discipline
- **Attention Budget Discipline**: Every token competes for finite attention capacity - maintain n² awareness and optimal signal-to-noise ratios
- **Context-Driven Execution**: Execute decisions efficiently through event-driven memory-bank context assembly with tool-context feedback loops
- **Performance Focus**: Prioritize measurable outcomes through progress.json tracking, milestone validation, attention efficiency metrics
- **Immediate Action**: Address problems through instant @mcp:context7 activation with auto-enrichment of mistakes.json and systemPatterns.json
- **Quality Consistency**: Maintain standards through systemPatterns.json enforcement and tri-branch validation, MCP-enriched best practices
- **EMD Discipline**: Keep all files ≤10,000 characters following Elegant Modular Design with deep nested structures
- **Test Coverage**: Achieve >80% coverage with tri-branch validation and context documentation as event streams
- **Zero Tolerance**: No errors/warnings before task completion - HALT-FIX-VALIDATE mandatory loop, as defined in **Article XIII**.
- **Context Rot Prevention**: Auto-compress when signal-to-noise degrades, preserve high-impact patterns, archive low-relevance data

### Code Quality Standards with MCP Tool-Context Integration

**MANDATORY MCP Resolution**: ANY error/warning → **INSTANT @mcp:context7 AUTO-CALL** → official docs → auto-fix → **ALL MCP enrichment** → compliance

**Auto-Resolution Process with 7-Schema MCP Integration**:
1. **@mcp:context7** Error Detection: Identify error with Context7 source prioritization for verified documentation
2. **@mcp:context7** Documentation: resolve-library-id → get-library-docs → official documentation with accuracy scoring
3. **@mcp:sequential-thinking** Auto-Fix: Complex problem decomposition maintaining EMD compliance
4. **@mcp:memory** AegisKG Enrichment: Auto-update mistakes.json with predictive analytics and error patterns
5. **@mcp:byterover-mcp** Cross-Project Intelligence: Pattern storage in AegisKG knowledge graph
6. **@mcp:filesystem** Pattern Storage: Update systemPatterns.json with MCP-enriched documentation links
7. **@mcp:git** Validation: Version control + Re-run language-specific checks until 100% clean
8. **@mcp:math** Compliance Verification: Calculate attention budget with 65% schema optimization
9. **@mcp:time** Timestamp: Record resolution timing in SQLite session context

**Automatic Challenges**: Quality Shadow automatically challenges violations using evidence from memory-bank context event streams. Chief Justice triggers automated correction systems with MCP integration oversight. Prevention through templates/ directory and anti-duplication protocol.

### Multi-Language Quality Standards with Zero Tolerance

**Python (basedpyright)**: `basedpyright .` (stricter than mypy, official 2025 standard). Zero tolerance: No type errors, unused variables, import failures, `Any` type usage. Standards: Full type hints on all functions, explicit class attribute annotations, proper module structure. Auto-fix: Add type hints using @mcp:context7 Python typing documentation → record patterns in systemPatterns.json.

**Rust (cargo)**: `cargo check --all-targets` (validates all code including tests and benches). Zero tolerance: No compiler errors, clippy warnings with `-D warnings` flag, unsafe code without justification. Standards: Proper ownership, lifetimes, borrowing patterns, zero warnings. Auto-fix: Apply clippy suggestions, run cargo fmt, fix borrowing using @mcp:context7 Rust documentation.

**TypeScript (PNPM)**: `pnpm typecheck` (validates TypeScript with strict mode). Zero tolerance: No type errors, strict mode enabled, no `any` types, ESLint clean, build must succeed. Standards: Proper TypeScript types, full type coverage, clean build, proper imports. Auto-fix: Add proper types, fix lint errors, resolve module paths using @mcp:context7 TypeScript documentation.

**TypeScript (NPM)**: `npx tsc --noEmit` (type-only validation). Zero tolerance: No type errors, lint warnings, clean compilation. Standards: Full type coverage, clean build, proper imports, ESLint compliance. Auto-fix: Apply type fixes, ESLint auto-fix, resolve dependencies using @mcp:context7.

**Go**: `go build ./...` (validates all packages). Zero tolerance: No compilation errors, `go vet` clean, `gofmt` compliant, no vet warnings. Standards: Standard formatting, clean imports, proper error handling. Auto-fix: Run gofmt, address vet issues, fix package structure using @mcp:context7 Go documentation.

**Java (Maven/Gradle)**: `mvn compile` OR `./gradlew compileJava`. Zero tolerance: Clean compilation, no warnings with strict settings, dependency resolution. Standards: Proper package structure, clean test compilation, no deprecation warnings. Auto-fix: Fix syntax, resolve dependencies, update imports using @mcp:context7 Java documentation.

**C# (.NET)**: `dotnet build --no-restore`. Zero tolerance: Clean build, dotnet format verification, no warnings. Standards: Proper formatting, clean release build, proper using statements. Auto-fix: Apply format, fix build errors, resolve references using @mcp:context7 .NET documentation.

**PHP**: `php -l` (syntax check) + `composer validate`. Zero tolerance: No syntax errors, composer validation, PHPStan clean at max level. Standards: PSR standards, static analysis, proper type declarations. Auto-fix: Fix syntax, update composer, address PHPStan issues using @mcp:context7 PHP documentation.

**Ruby**: `ruby -c` (syntax check) + `bundle exec rubocop`. Zero tolerance: No syntax errors, RuboCop clean, Sorbet type-checked. Standards: Ruby style guide, proper formatting, type safety. Auto-fix: Fix syntax, apply RuboCop fixes, add Sorbet types using @mcp:context7 Ruby documentation.

### Development Standards with 7-Schema Efficiency

- **EMD Compliance**: All files ≤10,000 characters per file, deep nested structure (max 80 lines per file in production), in accordance with **Article III**.
- **Deep Nesting**: Use deep folder structures with domain-driven organization logic for optimal context assembly
- **Centralized Configuration**: Reference existing configurations through core/config/ rather than recreating - SCAN before CREATE
- **Component Reuse**: Always check existing components using AegisKG pattern networks from systemPatterns.json
- **Documentation Requirements**: Document complex logic in 7 essential schemas (including kanban) as structured JSON events with optimal signal-to-noise
- **Validation Before Commit**: MANDATORY language-specific validation before marking task complete - zero tolerance enforcement
- **Schema Health**: Maintain ≤10KB per essential schema, auto-compress when exceeding, preserve AegisKG critical patterns

### Anti-Duplication Protocol (MANDATORY - Context Integrity)

This protocol is enforced by the pre-implementation validation detailed in the `global_rules.md`.

**NEVER RECREATE - SCAN First**: ALWAYS scan existing centralized configurations BEFORE creating new ones - violation = immediate rollback + Chief Justice review.

**Common Config Patterns** (scan these directories):
`core/config/`, `src/*/config/`, `lib/*/config/`, `config/`, `shared/`, `common/`, `database/`, `db/`, `models/`, `types/`, `utils/`, `services/`, `middleware/`

**Common Config Files** (check for duplicates):
Delays/Timeouts: `delays.*`, `timeouts.*`, `retry.*`, `backoff.*`
API Settings: `api_config.*`, `endpoints.*`, `client_config.*`, `routes.*`
Concurrency: `concurrency.*`, `thread_pool.*`, `workers.*`, `async_config.*`
Database: `db_config.*`, `connection.*`, `pool.*`, `migrations.*`
Models/Types: Shared data structures, interfaces, schemas, entities
Authentication: `auth_config.*`, `jwt.*`, `session.*`, `oauth.*`
Logging: `logger.*`, `log_config.*`, `tracing.*`

**HALT on Violation**: Detect duplicate → Reference existing → Document in systemPatterns.json → Rollback creation → Update mistakes.json with violation → Chief Justice review if repeated.

**Config Registry**: Maintain active registry of all centralized configs in systemPatterns.json with attention-efficient indexing.

**Zero Tolerance**: Creating duplicate configs = immediate rollback + constitutional violation.

**Enforcement**: Quality Shadow automatically challenges any new config file creation with evidence from scan results.

**Validation Commands** (multi-language):
- Python: `find . -path '*/config/*.py' -o -name 'delays.py' -o -name '*_config.py'`
- TypeScript: `find . -path '*/config/*.ts' -o -name 'delays.ts' -o -name '*Config.ts'`
- Rust: `find . -path '*/config/*.rs' -o -name 'delays.rs' -o -name '*_config.rs'`
- Go: `find . -path '*/config/*.go' -o -name 'delays.go' -o -name '*_config.go'`
- Java: `find . -path '*/config/*.java' -o -name '*Config.java'`
- C#: `find . -path '*/Config/*.cs' -o -name '*Config.cs'`

### Violation Response with Context Learning

**Immediate Response**:
1. Automatic Detection: Identify principle violations through context monitoring and event pattern analysis
2. Language Detection: Identify project language/framework from config files for targeted validation
3. Validation Execution: Run language-specific validation commands with zero tolerance enforcement
4. HALT on Errors: Stop immediately if any errors/warnings detected - no bypass allowed
5. MCP Correction: Apply @mcp:context7 automatic corrections with official documentation and context enrichment
6. Re-Validation: Run validation again until 100% clean - HALT-FIX-VALIDATE loop
7. Team Notification: Alert Executive, Legislative, Judicial branches through activeContext.json event updates
8. Context Enrichment: Auto-update mistakes.json and systemPatterns.json with violation patterns and resolutions

**Escalation Procedures**:
1. Repeated Violations: Escalate to Chief Justice oversight for compliance pattern analysis from mistakes.json event stream
2. Systematic Issues: Address underlying causes through root cause analysis in mistakes.json with MCP-enriched solutions
3. Process Improvement: Update procedures in systemPatterns.json to prevent violations using learned patterns
4. Training Integration: Identify knowledge gaps through context analysis and @mcp:byterover-mcp pattern storage for cross-project learning
5. Validation Failure: If auto-fix fails 3 times, escalate to human (Level 100) with complete context history
6. Context Rot Indicator: If violations correlate with attention budget overruns, trigger context optimization protocol

**Learning Loop**: Store successful resolutions in `systemPatterns.json` as reusable event patterns. Capture documentation links directly in `systemPatterns.json`. Update `mistakes.json` with structured error-solution pairs. Sync patterns to @mcp:memory (local, unlimited) and @mcp:byterover-mcp (cloud backup) for cross-project intelligence.
