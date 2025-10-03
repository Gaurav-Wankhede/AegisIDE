---
trigger: glob
globs: *.js,*.mjs,*.cjs,package.json,*.config.js
---

# Universal JavaScript Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/core/utilities/string/
  ├── formatString.js      (≤80 lines)
  ├── validateString.js    (≤80 lines)
  └── parseString.js       (≤80 lines)
  ```
- **Smallest possible files** - decompose at function, module, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.js` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PMD CPD, ESLint, jscpd, custom npm scripts using AST parsing
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable functions, implement higher-order functions, refactor async patterns
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE extensions
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and database queries**
- Use **environment variables** and **runtime configuration** for all parameters
- Derive parameters from historical data and performance metrics
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for variables and functions
- **PascalCase** for classes and constructors
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Modern JavaScript Features
- Use **const** and **let** instead of **var**
- Use **arrow functions** for concise syntax and lexical this
- Leverage **destructuring** for object and array manipulation
- Use **template literals** for string interpolation
- Implement **default parameters** and **rest/spread operators**

## Async Programming Standards

### Promise and Async Management
- Use **async/await** syntax for handling asynchronous operations
- Implement **proper error propagation** using try/catch blocks
- Leverage **Promise.all()** and **Promise.allSettled()** for concurrent promises
- Use **Promise.race()** for timeout implementations
- Avoid **callback hell** by using promises or async/await

### Concurrency Patterns
- **AbortController** for cancelling async operations
- **async/await** with proper error handling
- **Promise chaining** only when necessary; prefer await
- **Throttle** and **debounce** for rate limiting
- Use **Web Workers** for CPU-intensive tasks

### Async Operations
- Implement **retry mechanisms** with exponential backoff
- Use **fetch API** with proper error handling
- Handle **race conditions** with cancellation tokens
- Implement **timeout wrappers** for promises

## Error Handling and Safety

### Error Management
- Create **custom error classes** extending Error
- Use **specific error types** with meaningful messages
- Implement **global error handling** with window.onerror or similar
- Handle errors early with appropriate fallbacks

### Logging and Monitoring
- Use **structured logging** with console or external services
- Implement **correlation IDs** for request tracing
- Use **appropriate log levels**: debug, info, warn, error
- Implement **error tracking** with services like Sentry

## Module Patterns

### ES6 Modules
- Use **ES6 import/export** syntax
- Implement **named exports** for utilities
- Use **default exports** for main module functionality
- Avoid **circular dependencies**
- Use **dynamic imports** for code splitting

### CommonJS (Node.js)
- Use **require()** and **module.exports** appropriately
- Implement **proper module caching**
- Use **path.resolve()** for file paths
- Avoid **synchronous operations** in modules

## Performance Optimization

### Runtime Optimization
- Use **appropriate data structures**: Map, Set, Array
- Implement **memoization** for expensive functions
- Use **lazy evaluation** with generators
- Optimize **DOM operations** with batching
- Implement **virtual scrolling** for large lists

### Memory Management
- Avoid **memory leaks** by cleaning up event listeners
- Use **weak references** with WeakMap/WeakSet
- Monitor **heap usage** in performance-critical code
- Implement **object pooling** where beneficial

## Testing Requirements

### Testing Standards
- Write **unit tests** using Jest, Mocha, or Vitest
- Use **mocking** with libraries like sinon or jest.mock
- Implement **integration tests** for modules
- Use **snapshot testing** for component outputs
- Achieve **minimum 80% code coverage**

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **describe** and **it** for structure
- Implement **setup/teardown** with beforeEach/afterEach
- Test **edge cases** and error conditions

## Node.js Patterns

### Server-Side Development
- Use **Express.js** or **Fastify** for web servers
- Implement **middleware** for cross-cutting concerns
- Use **helmet** for security headers
- Implement **rate limiting** and **request validation**
- Use **clustering** for multi-core utilization

### File System Operations
- Use **async file operations** with fs.promises
- Implement **stream processing** for large files
- Use **path** module for cross-platform compatibility
- Implement **proper error handling** for file operations

## Browser JavaScript Patterns

### DOM Manipulation
- Use **modern DOM APIs** like querySelector
- Implement **event delegation** for dynamic content
- Use **requestAnimationFrame** for smooth animations
- Implement **intersection observer** for lazy loading
- Use **mutation observer** for DOM change detection

### Web APIs
- Use **localStorage/sessionStorage** appropriately
- Implement **service workers** for offline functionality
- Use **web workers** for background processing
- Implement **push notifications** with proper permissions
- Use **geolocation API** with user consent

## Security Best Practices

### Input Validation
- **Validate all inputs** on both client and server
- Use **sanitization** libraries for user content
- Implement **XSS protection** with proper encoding
- Use **CSRF tokens** for state-changing operations
- Validate **file uploads** with type and size checks

### Authentication and Authorization
- Use **secure cookie** settings
- Implement **JWT tokens** with proper expiration
- Use **HTTPS** for all authentication flows
- Implement **rate limiting** for login attempts
- Store **sensitive data** securely

## Package Management

### NPM/Yarn Best Practices
- Use **exact versions** for dependencies
- Implement **security auditing** with npm audit
- Use **lockfiles** for consistent installs
- Implement **dependency scanning** in CI/CD
- Use **workspaces** for monorepo management

### Dependency Management
- **Audit dependencies** regularly for vulnerabilities
- Use **minimal dependencies** to reduce attack surface
- Implement **automatic updates** with proper testing
- Use **peer dependencies** appropriately
- Document **dependency rationale** in package.json

## Build Tools and Bundling

### Modern Build Tools
- Use **Vite**, **Webpack**, or **Rollup** for bundling
- Implement **tree shaking** for dead code elimination
- Use **code splitting** for optimal loading
- Implement **hot module replacement** for development
- Use **source maps** for debugging

### Optimization Techniques
- Implement **minification** for production builds
- Use **compression** (gzip/brotli) for assets
- Implement **lazy loading** for route-based splitting
- Use **preloading** for critical resources
- Implement **caching strategies** with proper headers

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with JavaScript extensions
- **WebStorm** for advanced refactoring
- **Sublime Text** with JavaScript packages
- **Atom** with JavaScript plugins

### Development Workflow
- Use **ESLint** for linting
- Implement **Prettier** for code formatting
- Use **pre-commit hooks** for code quality
- Set up **debugging** configurations
- Use **npm scripts** for task automation
