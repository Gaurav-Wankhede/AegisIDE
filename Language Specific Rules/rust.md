# Universal Rust Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── core/
  │   ├── processing/
  │   │   ├── validation/
  │   │   │   ├── input_validator.rs   (≤80 lines)
  │   │   │   ├── format_checker.rs    (≤80 lines)
  │   │   │   └── schema_validator.rs  (≤80 lines)
  ```
- **Smallest possible files** - decompose at function, logic, and data levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `mod.rs` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy of the same functionalities
- **Use automated duplicate detection tools** before every commit and deployment:
  - **PMD CPD (Copy/Paste Detector)** for fast command-line duplicate detection
  - **Rust duplicate_code crate** for parsing directories and finding duplicate segments
  - **superdiff crate** for finding duplicate and similar-enough code slices with JSON reporting
  - **Custom cargo scripts** for project-specific duplicate detection
- **If any duplicacy found**, optimize immediately without disturbing the system:
  - **Extract common functionality** into shared modules following deep subfolder patterns
  - **Create reusable traits** and implementations for common operations
  - **Implement generic functions** for database operations and API calls
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
- Derive parameters from historical data and performance metrics
- Calculate timeout values, retry intervals, and connection limits based on observed performance
- Implement dynamic parameter adjustment based on real-time system load and metrics

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** at appropriate places within functionality or **remove entirely**
- Ensure every declared variable serves specific purpose: computation, logging, error handling, or state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- Use **expressive variable names** that convey intent: `connection_is_healthy`, `request_has_completed`
- **snake_case** for variables and functions
- **PascalCase** for types and structs  
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

## Async Programming Standards

### Tokio Runtime Management
- Use **tokio** as async runtime for handling asynchronous tasks and I/O operations
- Implement **async fn** syntax with proper error propagation using `?` operator
- Leverage **tokio::spawn** for task spawning and parallel processing
- Use **tokio::select!** for managing multiple async tasks and cancellations
- Favor **structured concurrency** with scoped tasks and clean cancellation paths

### Channel Communication Patterns
- **tokio::sync::mpsc** for asynchronous, multi-producer, single-consumer channels
- **tokio::sync::broadcast** for broadcasting updates to multiple consumers
- **tokio::sync::oneshot** for one-time communication between tasks
- **Bounded channels** for backpressure; handle capacity limits gracefully
- **tokio::sync::Mutex** and **tokio::sync::RwLock** for shared state, avoiding deadlocks

### Async Operations
- Implement **timeouts, retries, and backoff strategies** for external services
- Use **tokio::join!** for parallel operations during concurrent processing
- Use **tokio::time::sleep** and **tokio::time::interval** for efficient time-based operations
- Use **tokio::task::yield_now** for cooperative multitasking in long-running operations

## Error Handling and Safety

### Result Propagation
- Embrace **Result and Option types** with custom error types using **thiserror**
- Use **?** operator to propagate errors in async functions
- Handle errors and edge cases early, returning appropriate errors

### Circuit Breaker Implementation
- Implement **circuit breaker patterns** for external service calls with proper fallback strategies
- Use **.await responsibly**, ensuring safe points for context switching
- Implement **graceful degradation patterns** when dependencies are unavailable

## Web Framework Patterns (Axum/Warp/Actix)

### Router and Handler Organization
- Structure applications using proper route organization and middleware ordering
- Use framework extractors for type-safe request handling and dependency injection
- Implement **custom middleware** for cross-cutting concerns like authentication and logging
- Use appropriate response types for flexible HTTP status code handling
- Structure **handlers as async functions** with clear parameter extraction and serialization

### Middleware Implementation
- Implement **proper request correlation** using request ID middleware with structured tracing
- Leverage framework's built-in error handling with custom error types

## Performance Optimization

### Runtime Optimization
- **Minimize async overhead**; use sync code where async is not needed
- **Avoid blocking operations** inside async functions; offload CPU-intensive processing to dedicated threads
- Optimize **data structures and algorithms** for async use, reducing contention and lock duration

### Resource Efficiency
- Use **bounded channels** for backpressure handling
- Implement **efficient time-based operations** for cleanup and monitoring tasks

## Testing Requirements

### Async Testing Standards
- Write **unit tests with tokio::test** for async tests
- Use **tokio::time::pause** for testing time-dependent code without real delays
- Implement **integration tests** to validate async behavior and concurrency
- Use **mocks and fakes** for external dependencies

## Database and External Service Patterns

### Connection Management
- Use **async database drivers** with connection pooling
- Implement **timeout handling** and **circuit breaker patterns**
- Implement **graceful degradation patterns** with fallback strategies

### External Service Integration
- Use **reqwest** with **rustls-tls** for async HTTP requests with connection pooling and retry logic
- Implement **async session management** for stateful services
- Use appropriate serialization libraries like **serde** for data interchange

## Tech Stack Requirements

### Core Dependencies
- **tokio** - async runtime and task management
- **serde** - serialization/deserialization
- **thiserror** - descriptive error types
- **reqwest** with **rustls-tls** - async HTTP client
- **tracing** - structured logging and observability

### Development Dependencies
- **duplicate_code**, **superdiff** - duplicate detection and optimization tools
- **tokio-test** - async testing utilities
- **mockito** or similar - HTTP mocking for tests

## Documentation Standards

### Code Documentation
- Ensure code is **well-documented** with inline comments and Rustdoc
- Focus documentation on **complex async patterns** and **concurrency logic**
- Document **error handling strategies** and **fallback behaviors**

### API Documentation
- Use **#[doc]** attributes for comprehensive API documentation
- Provide **examples** in documentation for complex async patterns
- Document **safety guarantees** and **panic conditions**

## File Organization Rules

### Module Structure
- Separate concerns into logical modules with clear boundaries
- Use **singular nouns** for entity modules, **plural nouns** for collections
- Maintain **consistent depth levels** across similar functionalities
- Follow **microservices decomposition** at every level of the application hierarchy

### Project Layout
```
src/
├── core/           # Core business logic
├── api/            # API handlers and routing
├── database/       # Database operations and models
├── services/       # External service integrations
├── utils/          # Shared utilities
└── shared/         # Common types and traits
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **Rust-analyzer** integration for all major IDEs (Windsurf, Cursor, Cline, etc.)
- **Cargo integration** for build, test, and package management
- **Git hooks** for automated code quality checks
- **Custom tasks** for duplicate detection and optimization

### Development Workflow
- Use **cargo fmt** for consistent code formatting
- Use **cargo clippy** for linting and best practice enforcement
- Integrate **pre-commit hooks** for code quality gates
- Set up **continuous integration** with comprehensive testing

## Security and Best Practices

### Memory Safety
- Leverage **Rust's ownership system** for memory safety guarantees
- Use **appropriate lifetimes** for borrowed data
- Implement **proper error boundaries** to prevent panics in production

### Concurrency Safety
- Use **async-safe** synchronization primitives
- Avoid **blocking operations** in async contexts
- Implement **proper cancellation** handling for long-running operations
