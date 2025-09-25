# Universal JavaScript Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── core/
  │   ├── utilities/
  │   │   ├── string/
  │   │   │   ├── formatString.js      (≤80 lines)
  │   │   │   ├── validateString.js    (≤80 lines)
  │   │   │   └── parseString.js       (≤80 lines)
  ```
- **Smallest possible files** - decompose at function, module, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.js` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy of the same functionalities
- **Use automated duplicate detection tools** before every commit and deployment:
  - **PMD CPD (Copy/Paste Detector)** for fast command-line duplicate detection
  - **ESLint** with duplicate code detection plugins
  - **jscpd** for cross-language duplicate detection including JavaScript
  - **Custom npm scripts** using AST parsing for project-specific duplicate detection
- **If any duplicacy found**, optimize immediately without disturbing the system:
  - **Extract common functionality** into shared modules following deep subfolder patterns
  - **Create reusable functions** for common operations
  - **Implement higher-order functions** for repeated patterns
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
- **PascalCase** for constructor functions and classes
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Modern JavaScript Usage
- **Always use let/const** instead of var
- Prefer **arrow functions** for concise syntax
- Use **template literals** for string interpolation
- Leverage **destructuring** and **spread/rest** operators
- Implement **modules** with import/export

## Async Programming Standards

### Promise and Async Management
- Use **async/await** syntax for handling asynchronous operations
- Implement **proper error propagation** using try/catch blocks
- Leverage **Promise.all()** and **Promise.allSettled()** for concurrent promises
- Use **async generators** for streaming data
- Favor **top-level await** in supported environments

### Concurrency Patterns
- **AbortController** for cancelling async operations
- **async/await** with proper error handling
- **Promise chaining** only when necessary; prefer await
- **Throttle** and **debounce** for rate limiting
- Use **Web Workers** for CPU-intensive tasks

### Async Operations
- Implement **retry mechanisms** with exponential backoff
- Use **fetch** for HTTP requests
- Handle **race conditions** with cancellation tokens
- Implement **timeout wrappers** for promises

## Error Handling and Safety

### Error Management
- Create **custom error classes** extending Error
- Use **specific error checking** with instanceof
- Implement **global error handling** with try/catch
- Handle errors and edge cases early with appropriate fallbacks

### Logging and Monitoring
- Use **structured logging** with console or libraries like pino
- Implement **correlation IDs** for request tracing
- Use **appropriate log levels**: debug, info, warn, error
- Implement **circuit breaker patterns** for external calls

## JavaScript Patterns

### Functional Programming
- Use **pure functions** where possible
- Implement **immutability** with Object.freeze
- Leverage **higher-order functions** like map, filter, reduce
- Avoid **side effects** in core logic
- Use **closures** for encapsulation

### Module Patterns
- Use **ES modules** with import/export
- Implement **immediately invoked function expressions** (IIFE) when needed
- Use **revealing module pattern** for private state
- Avoid **global variables**

## Performance Optimization

### Runtime Optimization
- Use **appropriate data structures**: Map, Set, Array
- Implement **memoization** for expensive functions
- Leverage **iterators** and **generators** for efficiency
- Optimize **DOM access** in browser code

### Memory Management
- Avoid **memory leaks** by cleaning up event listeners
- Use **weak references** with WeakMap/WeakSet
- Monitor **heap usage** in performance-critical code
- Implement **object pooling** where beneficial

## Testing Requirements

### Testing Standards
- Write **unit tests** using Jest or Mocha
- Use **assertions** libraries like Chai
- Implement **integration tests** for modules
- Use **mocks** with sinon
- Achieve **minimum 80% code coverage**

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **describe** and **it** for structure
- Implement **setup/teardown** with beforeEach/afterEach
- Test **edge cases** and error handling

## Database and External Service Patterns

### Database Integration
- Use **async clients** like MongoDB driver
- Implement **connection pooling**
- Use **promises** for database operations
- Implement **query optimization**

### External Service Integration
- Use **fetch** or **axios** for API calls
- Implement **retry mechanisms**
- Use **circuit breakers**
- Implement **rate limiting**

## Tech Stack Requirements

### Core Dependencies
- **node** - runtime environment
- **eslint** - linting
- **prettier** - formatting
- **babel** - transpilation
- **webpack** - bundling

### Development Dependencies
- **jest** - testing framework
- **husky** - git hooks
- **lint-staged** - pre-commit linting
- **nodemon** - development watcher

## Documentation Standards

### Code Documentation
- Use **JSDoc** comments for functions
- Include **@param**, **@returns**, **@throws**
- Document **complex logic**
- Generate **documentation** with JSDoc tools

### API Documentation
- Use **inline comments** for clarity
- Document **function signatures**
- Include **examples** in comments
- Maintain **README** with usage

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
├── modules/        # Feature modules
├── utils/          # Shared utilities
├── tests/          # Test files
└── package.json    # Dependencies
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with JavaScript extensions
- **WebStorm** for advanced features
- **Sublime Text** with plugins
- **ESLint/Prettier** integration

### Development Workflow
- Use **pre-commit hooks**
- Implement **watch mode** for execution
- Use **npm scripts** for tasks
- Set up **CI** with linting

## Security and Best Practices

### Security Guidelines
- **Never hardcode secrets**
- Validate **all inputs**
- Implement **proper error handling**
- Use **HTTPS** for requests

### Code Quality
- Follow **Google JavaScript Style Guide**
- Use **strict mode** ('use strict')
- Implement **immutability** where possible
- Avoid **side effects** in functions

## Package Management and Deployment

### Dependency Management
- Use **npm** or **yarn**
- Pin **exact versions**
- Use **workspaces** for monorepos
- Implement **security scanning**

### Deployment Patterns
- Use **babel** for transpilation
- Implement **minification**
- Optimize **bundle size**
- Enable **source maps** for debugging