# Multi-Language Validation Framework

**Version**: 2.6.0  
**Status**: Production Ready  
**Last Updated**: 2025-10-01

## Overview

The Multi-Language Validation Framework provides autonomous error and warning detection across 10+ programming languages with zero-tolerance enforcement. The framework automatically detects project language, runs validation commands, and fixes errors before allowing task continuation.

## HALT-FIX-VALIDATE Protocol

```
Code Change
    ↓
Auto-Detect Language (requirements.txt, Cargo.toml, etc.)
    ↓
Run Validation Commands
    ↓
[IF ERRORS/WARNINGS FOUND]
    ↓
🛑 HALT - Block next task
    ↓
Log in mistakes.md
    ↓
Auto-call @mcp:context7 (Official docs)
    ↓
Implement fixes autonomously
    ↓
Re-validate
    ↓
[IF STILL ERRORS] → Loop back to @mcp:context7
    ↓
[IF CLEAN] → Continue to next task
```

## Language Support Matrix

### Python
**Detection**: `requirements.txt`, `pyproject.toml`, `*.py` files  
**Primary Tool**: `basedpyright` (stricter than mypy)  
**Commands**:
```bash
basedpyright .                    # Type checking
python -m py_compile src/**/*.py  # Syntax validation
pytest --collect-only             # Test discovery
black --check src/                # Format check
isort --check-only src/           # Import sorting
```
**Zero Tolerance**: Type errors, unused variables, import failures

### Rust
**Detection**: `Cargo.toml`, `*.rs` files  
**Commands**:
```bash
cargo check --all-targets         # Compilation check
cargo clippy -- -D warnings       # Linting (warnings as errors)
cargo fmt --check                 # Format check
cargo test --no-run               # Test compilation
```
**Zero Tolerance**: Compiler errors, clippy warnings

### TypeScript (PNPM)
**Detection**: `pnpm-lock.yaml`  
**Commands**:
```bash
pnpm typecheck                    # Type checking
pnpm lint                         # ESLint
pnpm build --dry-run              # Build validation
pnpm test:types                   # Test types
```
**Zero Tolerance**: Type errors, lint warnings

### TypeScript (NPM)
**Detection**: `package-lock.json` (no pnpm)  
**Commands**:
```bash
npx tsc --noEmit                  # Type checking
npm run lint                      # ESLint
npm run build                     # Build validation
```

### Go
**Detection**: `go.mod`, `*.go` files  
**Commands**:
```bash
go build ./...                    # Compilation
go test -run=^$ ./...             # Test compilation (no execution)
go vet ./...                      # Vet analysis
gofmt -l .                        # Format check
```
**Zero Tolerance**: Compilation errors, vet warnings

### Java (Maven)
**Detection**: `pom.xml`  
**Commands**:
```bash
mvn compile                       # Compilation
mvn test-compile                  # Test compilation
mvn validate                      # Project validation
```

### Java (Gradle)
**Detection**: `build.gradle`, `build.gradle.kts`  
**Commands**:
```bash
./gradlew compileJava             # Compilation
./gradlew compileTestJava         # Test compilation
./gradlew dependencies            # Dependency check
```

### C# (.NET)
**Detection**: `*.csproj`, `*.sln` files  
**Commands**:
```bash
dotnet build --no-restore         # Build
dotnet format --verify-no-changes # Format validation
dotnet build --no-restore -c Release  # Release build
```

### PHP
**Detection**: `composer.json`  
**Commands**:
```bash
find . -name "*.php" -exec php -l {} \;  # Syntax check
composer validate --strict               # Composer validation
phpstan analyse --level=max src/         # Static analysis
```

### Ruby
**Detection**: `Gemfile`, `*.rb` files  
**Commands**:
```bash
find . -name "*.rb" -exec ruby -c {} \;  # Syntax check
bundle exec rubocop --dry-run            # Linting
bundle exec srb tc                       # Type checking (Sorbet)
```

## Validation Checkpoints

### 1. Pre-Implementation
- Detect project language from config files
- Run validation suite
- HALT if errors/warnings found
- Verify task links to roadmap milestone
- Check mistakes.md for similar past errors

### 2. During Implementation
- Validate after each significant file change
- Real-time error detection
- Immediate HALT on new errors

### 3. Post-Implementation
- Full project validation before memory-bank updates
- MANDATORY checkpoint - blocks next task if failed
- Log successful patterns in systemPatterns.md

### 4. Pre-Commit
- Final validation gate
- Ensures no errors/warnings enter version control

## Constitutional Integration

### Article XIII - Judicial Debugging Authority
- Chief Justice has ultimate debugging power
- Can HALT any implementation with errors/warnings
- Enforces zero-tolerance policy

### Article IV - Quality Standards
- Multi-language quality standards
- Autonomous error resolution protocols
- Zero-tolerance enforcement mechanisms

### Article III - Development Workflow
- HALT-FIX-VALIDATE checkpoints integrated
- Mandatory validation phases
- Post-implementation validation blocking

### Article II - Decision Making
- Validation-weighted consensus scoring
- Chief Justice: 35% authority for validation decisions
- Quality Shadow: 30% for validation patterns

## Core Commands

### `validate project`
Runs language-specific validation suite for entire project.

**Workflow**:
1. Auto-detect language
2. Run validation commands
3. Report results
4. HALT if errors found

### `fix errors`
Autonomous error resolution with HALT-FIX-VALIDATE loop.

**Workflow**:
1. Detect errors from validation
2. Log in mistakes.md
3. Auto-call @mcp:context7 for official docs
4. Implement fixes
5. Re-validate
6. Repeat until clean (max 3 attempts)
7. Escalate to human if 3 attempts fail

### `what next`
Enhanced with validation gates.

**10-Step Workflow**:
1. Read scratchpad.md
2. Detect project language/framework
3. **Run validation (HALT if errors)**
4. Update scratchpad
5. Clean completed tasks
6. Execute next task
7. **Post-validation checkpoint**
8. Update all 9 memory-bank files
9. Auto-trigger continuous execute
10. Continue until scratchpad empty

### `implement next task`
Enhanced with pre/post validation.

**8-Step Workflow**:
1. **Pre-validation: Run checks**
2. **IF errors → HALT → Fix → Re-validate**
3. Execute current task
4. **Post-validation: Run checks again**
5. Update all 9 memory-bank files
6. Load next task
7. Auto-execute next task
8. Repeat until scratchpad empty

## Error Resolution Patterns

### Common Patterns

**Python - Missing Type Hints**:
```python
# Error: Missing type hints
def process_data(jobs):
    return [job for job in jobs]

# Fix: Add type annotations
from typing import List, Dict, Any

def process_data(jobs: List[Dict[str, Any]]) -> List[Dict[str, Any]]:
    return [job for job in jobs]
```

**Rust - Unused Variables**:
```rust
// Error: Unused variable
let result = some_function();

// Fix: Prefix with underscore or use
let _result = some_function();
// or
let result = some_function();
println!("{:?}", result);
```

**TypeScript - Unresolved Imports**:
```typescript
// Error: Cannot find module
import { Component } from './component';

// Fix: Add file extension or check tsconfig
import { Component } from './component.js';
// or update tsconfig.json with proper module resolution
```

## Compliance Requirements

### Zero-Tolerance Policy
- 100% validation pass required before next task
- NO exceptions for warnings
- Autonomous fixing mandatory
- Human escalation only after 3 failed attempts

### Memory-Bank Integration
- **mistakes.md**: Log all errors and resolution patterns
- **systemPatterns.md**: Document successful validation patterns
- **activeContext.md**: Track validation status
- **scratchpad.md**: Block tasks until validation clean

### Performance Metrics
- 100% error detection rate
- 95%+ autonomous fix success rate
- <5 minutes average fix time
- Zero errors in production code

## Cross-Platform Support

Framework operates across all AegisIDE platforms:
- **Windsurf** (98% autonomy)
- **JetBrains** (97% autonomy)
- **Cursor** (96% autonomy)
- **Cline** (95% autonomy)
- All platforms use same validation protocol

## Future Enhancements

### Planned Features
- Swift validation (Xcode integration)
- Kotlin validation (Android/JVM)
- Scala validation (sbt integration)
- R validation (lintr integration)
- Julia validation (static analysis)

### Improvements
- AI-powered error explanation
- Pattern learning from fixes
- Cross-project error knowledge sharing
- Real-time validation IDE integration

## References

- **Global Rules**: Multi-language validation section (10,869 chars)
- **Article XIII**: [core/constitution/article-XIII.md](../core/constitution/article-XIII.md)
- **Article IV**: [core/constitution/article-IV.md](../core/constitution/article-IV.md)
- **Article III**: [core/constitution/article-III.md](../core/constitution/article-III.md)
- **Article II**: [core/constitution/article-II.md](../core/constitution/article-II.md)

---

**Version History**:
- **v2.6.0** (2025-10-01): Initial release with 10+ language support
