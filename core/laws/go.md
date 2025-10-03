---
trigger: glob
globs: *.go,go.mod,go.sum,go.work,Makefile
---

# Universal Go Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  cmd/server/handlers/users/
  ├── create_user.go       (≤80 lines)
  ├── get_user.go          (≤80 lines)
  └── update_user.go       (≤80 lines)
  ```
- **Smallest possible files** - decompose at function, struct, and interface levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **package-level organization** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PMD CPD, golangci-lint, custom go vet checks
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable interfaces, implement generic functions, refactor patterns into utilities
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE integration
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **config structs** for all parameters
- Derive parameters from historical data and performance metrics
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or assertions

### Naming Conventions
- **camelCase** for variables and functions
- **PascalCase** for exported types and functions
- **UPPER_CASE** for constants
- **Package names**: short, lowercase, single words
- **Descriptive, action-oriented names** for deepest packages

### Type Safety and Static Analysis
- **Always use strong typing** with custom types for domain concepts
- Use **interfaces** for abstraction and testability
- Leverage **generics** (Go 1.18+) for type-safe reusable code
- Implement **error types** for structured error handling
- Use **go vet**, **golangci-lint**, and **staticcheck** for static analysis

## Concurrency and Goroutine Patterns

### Goroutine Management
- Use **goroutines** for concurrent operations with proper synchronization
- Implement **context.Context** for cancellation and timeouts
- Use **sync.WaitGroup** for coordinating multiple goroutines
- Implement **worker pools** with buffered channels for rate limiting
- Use **sync.Once** for one-time initialization in concurrent environments

### Channel Patterns
- Use **channels** for communication between goroutines
- Implement **select statements** for non-blocking channel operations
- Use **buffered channels** as counting semaphores for concurrency control
- Implement **fan-out/fan-in** patterns for parallel processing
- Use **context cancellation** for graceful goroutine shutdown

### Synchronization Primitives
- Use **sync.Mutex** for protecting shared state
- Implement **sync.RWMutex** for read-heavy workloads
- Use **atomic operations** for simple counter operations
- Implement **sync.Pool** for object reuse to reduce GC pressure
- Use **sync.Map** for concurrent map operations

## Error Handling Standards

### Error Design Patterns
- **Always handle errors explicitly** - never ignore them
- Use **custom error types** with context and structured information
- Implement **error wrapping** with `fmt.Errorf` and `%w` verb
- Use **errors.Is** and **errors.As** for error comparison and extraction
- Create **sentinel errors** for expected error conditions

### Error Propagation
- **Fail fast** and propagate errors up the call stack
- Add **context** to errors when wrapping them
- Use **defer statements** for cleanup even in error conditions
- Implement **panic recovery** only for truly exceptional situations
- Log **errors at appropriate levels** with structured logging

### Validation and Safety
- **Validate inputs** at package boundaries
- Use **type assertions** safely with comma ok idiom
- Implement **bounds checking** for slice and array access
- Use **nil checks** before dereferencing pointers
- Implement **graceful degradation** for non-critical errors

## Testing Requirements

### Testing Standards
- Write **unit tests** with the standard `testing` package
- Use **table-driven tests** for multiple test cases
- Implement **parallel tests** with `t.Parallel()` where safe
- Use **subtests** with `t.Run()` for organized test execution
- Achieve **minimum 80% code coverage**

### Test Organization
- Place **test files** alongside source files with `_test.go` suffix
- Use **test fixtures** and **helper functions** for test setup
- Implement **benchmark tests** with `testing.B` for performance
- Use **example tests** with `Example` prefix for documentation
- Test **error conditions** and **edge cases** thoroughly

### Testing Tools and Techniques
- Use **testify** for assertions and mocking when needed
- Implement **integration tests** with real dependencies
- Use **httptest** package for testing HTTP handlers
- Implement **race condition testing** with `-race` flag
- Use **fuzzing** (Go 1.18+) for property-based testing

## Web Development Patterns

### HTTP Server Patterns
- Use **net/http** for HTTP server implementation
- Implement **middleware** for cross-cutting concerns
- Use **http.Handler** interface for composable request handling
- Implement **graceful shutdown** with context cancellation
- Use **proper HTTP status codes** and **error responses**

### Routing and Middleware
- Use **router libraries** like Gorilla Mux or Chi for advanced routing
- Implement **authentication middleware** for secured endpoints
- Use **logging middleware** for request tracing
- Implement **CORS middleware** for cross-origin requests
- Use **rate limiting middleware** for API protection

### JSON and API Design
- Use **json** package tags for proper JSON serialization
- Implement **input validation** with struct tags or custom validators
- Use **content negotiation** for multiple response formats
- Implement **versioned APIs** with proper URL structure
- Use **OpenAPI/Swagger** for API documentation

## Database Integration

### Database Patterns
- Use **database/sql** package with appropriate drivers
- Implement **connection pooling** with proper configuration
- Use **prepared statements** for parameterized queries
- Implement **transaction management** with proper rollback
- Use **context** for query cancellation and timeouts

### ORM and Query Builders
- Use **GORM** or **SQLx** for enhanced database operations
- Implement **migration scripts** for schema management
- Use **query builders** for complex dynamic queries
- Implement **database seeding** for development and testing
- Use **database mocking** for unit tests

### Data Access Patterns
- Implement **repository pattern** for data access abstraction
- Use **interface segregation** for database operations
- Implement **unit of work pattern** for complex transactions
- Use **connection health checks** for monitoring
- Implement **retry logic** with exponential backoff

## Performance Optimization

### Runtime Optimization
- Use **profiling tools** (`go tool pprof`) for performance analysis
- Implement **memory pooling** to reduce garbage collection pressure
- Use **string builders** for efficient string concatenation
- Optimize **slice operations** with proper capacity allocation
- Use **benchmark tests** to measure and track performance

### Memory Management
- **Avoid memory leaks** by properly closing resources
- Use **context cancellation** to prevent goroutine leaks
- Implement **object pooling** with `sync.Pool` for expensive objects
- Use **escape analysis** to understand heap vs stack allocation
- Monitor **garbage collection** metrics and tune GOGC if needed

### Concurrency Performance
- Use **appropriate concurrency patterns** for the workload
- Implement **backpressure** handling in processing pipelines
- Use **buffered channels** appropriately to avoid blocking
- Implement **load balancing** across multiple workers
- Use **CPU profiling** to identify concurrency bottlenecks

## Deployment and Production

### Build and Configuration
- Use **Go modules** for dependency management
- Implement **build tags** for environment-specific code
- Use **ldflags** for embedding version information at build time
- Implement **configuration management** with environment variables
- Use **Docker** for containerized deployments

### Monitoring and Observability
- Implement **structured logging** with consistent formats
- Use **metrics collection** with Prometheus or similar
- Implement **distributed tracing** for complex systems
- Use **health check endpoints** for load balancer integration
- Implement **graceful shutdown** for zero-downtime deployments

### Security Best Practices
- **Validate all inputs** to prevent injection attacks
- Use **crypto/rand** for cryptographically secure random numbers
- Implement **proper TLS configuration** for HTTPS
- Use **context** for request-scoped security information
- Implement **rate limiting** and **DDoS protection**

## Tech Stack Requirements

### Core Dependencies
- **go** (1.21+) - programming language
- **go mod** - dependency management
- **golangci-lint** - comprehensive linting
- **go vet** - static analysis
- **gofmt** - code formatting

### Popular Libraries
- **gin** or **echo** - web frameworks
- **gorm** or **sqlx** - database ORM/toolkit
- **testify** - testing assertions
- **logrus** or **zap** - structured logging
- **viper** - configuration management

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Go extension
- **GoLand** by JetBrains
- **Vim/Neovim** with vim-go
- **Emacs** with go-mode

### Development Workflow
- Use **go mod tidy** for dependency cleanup
- Implement **pre-commit hooks** with linting and formatting
- Use **go generate** for code generation
- Set up **continuous integration** with comprehensive testing
- Use **go work** for multi-module development
