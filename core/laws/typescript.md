---
trigger: glob
globs: *.ts,*.tsx
---

# Universal TypeScript Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── core/
  │   ├── utilities/
  │   │   ├── string/
  │   │   │   ├── formatString.ts      (≤80 lines)
  │   │   │   ├── validateString.ts    (≤80 lines)
  │   │   │   └── parseString.ts       (≤80 lines)
  ```
- **Smallest possible files** - decompose at function, type, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.ts` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy of the same functionalities
- **Use automated duplicate detection tools** before every commit and deployment:
  - **PMD CPD (Copy/Paste Detector)** for fast command-line duplicate detection
  - **ESLint** with duplicate code detection plugins
  - **jscpd** for cross-language duplicate detection including TypeScript
  - **Custom npm scripts** using AST parsing for project-specific duplicate detection
- **If any duplicacy found**, optimize immediately without disturbing the system:
  - **Extract common functionality** into shared modules following deep subfolder patterns
  - **Create reusable generics** and functions for common operations
  - **Implement utility types** for repeated type patterns
  - **Refactor similar async patterns** into common utilities in `shared/async/` subfolder
- **Continuous monitoring approach**:
  - Run duplicate detection in **CI/CD pipeline** before merge
  - Set up **pre-commit hooks** with duplicate detection tools
  - Schedule **weekly automated scans** with detailed reports
  - Integrate duplicate detection into **IDE workflow** with custom extensions
- **Optimization strategies**:
  - **Preserve system functionality** during refactoring - never break existing APIs
  - **Use feature flags** to gradually replace duplicated functionality
  - **Maintain backward compatibility** while optimizing operations
  - **Test thoroughly** after each duplicate removal to ensure system stability

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All numerical values, thresholds, limits, and configuration parameters **must be calculated from real-world data and database queries**
- Use **environment variables** and **runtime configuration** for all parameters
- Derive parameters from historical data and performance metrics stored in databases
- Calculate timeout values, retry intervals, and connection limits based on observed performance
- Implement dynamic parameter adjustment based on real-time system load and metrics

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** at appropriate places within functionality or **remove entirely**
- Ensure every declared variable serves specific purpose: computation, logging, error handling, or state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- Use **descriptive variable names** that convey intent: `userIsAuthenticated`, `responseHasCompleted`
- **camelCase** for variables and functions
- **PascalCase** for types, interfaces, and classes
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Safety and Static Analysis
- **Always use explicit types**; avoid `any` and prefer `unknown` when necessary
- Enable **strict mode** in tsconfig.json with options like `strictNullChecks` and `noImplicitAny`
- Leverage **generics** for reusable code
- Define **interfaces** over types for object shapes
- Implement **type guards** and **discriminated unions** for complex type checking

## Async Programming Standards

### Promise and Async Management
- Use **async/await** syntax for handling asynchronous operations
- Implement **proper error propagation** using try/catch blocks
- Leverage **Promise.all()** and **Promise.allSettled()** for concurrent promises
- Use **async generators** for streaming data
- Favor **structured concurrency** with libraries like `promise-polyfill` if needed

### Concurrency Patterns
- **AbortController** for cancelling async operations
- **async/await** with proper error handling
- **Promise chaining** only when necessary; prefer await
- **Throttle** and **debounce** for rate limiting
- Use **worker threads** for CPU-intensive tasks

### Async Operations
- Implement **retry mechanisms** with exponential backoff
- Use **fetch** or **axios** with proper typing
- Handle **race conditions** with cancellation tokens
- Implement **timeout wrappers** for promises

## Error Handling and Safety

### Error Management
- Create **custom error classes** extending Error
- Use **specific error types** with discriminated unions
- Implement **global error handling** with try/catch
- Handle errors and edge cases early with appropriate fallbacks

### Logging and Monitoring
- Use **structured logging** with console or libraries like pino
- Implement **correlation IDs** for request tracing
- Use **appropriate log levels**: debug, info, warn, error
- Implement **circuit breaker patterns** for external calls

## TypeScript Patterns

### Type System Usage
- Use **utility types** like Partial, Required, Pick, Omit
- Implement **mapped types** for transformations
- Use **conditional types** for complex logic
- Leverage **template literal types** for string manipulation
- Define **function overloads** for multiple signatures

### Module Patterns
- Use **ES modules** with import/export
- Avoid **namespaces**; prefer modules
- Implement **barrel files** (index.ts) for re-exports
- Use **type-only imports** where appropriate

## Performance Optimization

### Runtime Optimization
- Use **appropriate data structures**: Map, Set, Array
- Implement **memoization** for expensive functions
- Leverage **iterators** and **generators** for efficiency
- Optimize **bundle size** with tree shaking

### Memory Management
- Avoid **memory leaks** by cleaning up event listeners
- Use **weak references** with WeakMap/WeakSet
- Monitor **heap usage** in performance-critical code
- Implement **object pooling** where beneficial

## Testing Requirements

### Testing Standards
- Write **unit tests** using Jest or Vitest
- Use **TypeScript-aware assertions** 
- Implement **integration tests** for modules
- Use **mocks** with ts-jest or similar
- Achieve **minimum 80% code coverage**

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **describe** and **it** for structure
- Implement **setup/teardown** with beforeEach/afterEach
- Test **edge cases** and type safety

## Database and External Service Patterns

### Database Integration
- Use **typed clients** like Prisma or TypeORM
- Implement **connection pooling**
- Use **migrations** for schema management
- Implement **query typing** with generics

### External Service Integration
- Use **typed fetch** wrappers
- Implement **retry mechanisms**
- Use **circuit breakers**
- Implement **rate limiting**

## Tech Stack Requirements

### Core Dependencies
- **typescript** - core compiler
- **ts-node** - runtime execution
- **eslint** - linting
- **prettier** - formatting
- **tsconfig-paths** - path aliases

### Development Dependencies
- **jest** and **ts-jest** - testing
- **husky** - git hooks
- **lint-staged** - pre-commit linting
- **tsc-watch** - development watcher

## Documentation Standards

### Code Documentation
- Use **JSDoc** comments for functions and types
- Include **@param**, **@returns**, **@throws**
- Document **complex logic**
- Generate **typedoc** documentation

### Type Documentation
- Use **inline type comments**
- Document **generic constraints**
- Include **examples** in JSDoc
- Maintain **type declaration files**

## File Organization Rules

### Module Structure
- Separate concerns into logical modules
- Use **folders** for namespaces
- Maintain **consistent depth levels**
- Follow **microservices decomposition**

### Project Layout
```
src/
├── core/           # Core utilities
├── types/          # Global types
├── modules/        # Feature modules
├── utils/          # Shared utilities
├── tests/          # Test files
└── tsconfig.json   # Compiler config
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with TypeScript extensions
- **WebStorm** for advanced refactoring
- **TypeScript Playground** for quick testing
- **ESLint/Prettier** integration

### Development Workflow
- Use **pre-commit hooks**
- Implement **watch mode** for compilation
- Use **npm scripts** for tasks
- Set up **CI** with type checking

## Security and Best Practices

### Security Guidelines
- **Never hardcode secrets**
- Validate **all inputs** with type guards
- Implement **proper error handling**
- Use **HTTPS** for requests

### Code Quality
- Follow **Google TypeScript Style Guide**
- Use **arrow functions** consistently
- Implement **immutability** where possible
- Avoid **side effects** in functions

## Package Management and Deployment

### Dependency Management
- Use **npm** or **yarn**
- Pin **exact versions**
- Use **workspaces** for monorepos
- Implement **security scanning**

### Deployment Patterns
- Use **tsconfig** for build
- Implement **sourcemaps**
- Optimize **bundle size**
- Enable **tree shaking**
