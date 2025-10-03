---
trigger: glob
globs: *.rs,Cargo.toml,Cargo.lock,src/**/*.rs,axum,actix-web
---

# Universal Rust Web Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/handlers/user/profile/avatar_handler.rs` (≤80 lines)
- **Smallest possible files** - decompose at handler, middleware, and service levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **module system** with `mod.rs` files for organization (also ≤80 lines per module)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: Clippy, cargo-machete, custom Rust analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create traits, implement generics, refactor into crates
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **configuration files** for all parameters
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **snake_case** for variables, functions, and file names
- **PascalCase** for types, structs, enums, and traits
- **UPPER_CASE** for constants and static variables
- **descriptive_action_oriented_names** for deepest modules

### Type Safety and Static Analysis
- **Always use explicit types** when helpful for readability
- Use **Result<T, E>** for error handling instead of panicking
- Leverage **Option<T>** for nullable values with proper handling
- Implement **custom error types** with proper error propagation
- Use **Clippy** extensively for code quality and performance hints

## Modern Rust Web Frameworks (2025)

### Axum Framework (Recommended)
- Use **Axum 0.8+** for ergonomic and modular web applications
- Built on **Tokio**, **Tower**, and **Hyper** for excellent performance
- Implement **extractors** for request parsing: `Path`, `Query`, `Json`, `State`
- Use **middleware** with Tower's layer system for cross-cutting concerns
- Leverage **typed routing** with compile-time validation

### Actix-web Framework (High Performance)
- Use **Actix-web 4+** for maximum performance web applications
- Implement **handlers** as async functions with proper extractors
- Use **middleware** for authentication, logging, and CORS
- Leverage **application state** for shared data across handlers
- Implement **custom error handling** with proper HTTP status codes

### Framework-Agnostic Patterns
- Use **async/await** consistently throughout the application
- Implement **proper error handling** with custom error types
- Use **dependency injection** through application state or DI containers
- Leverage **traits** for abstraction and testability
- Implement **graceful shutdown** handling for production deployments

## Request Handling and Routing

### Axum Request Handling
- Use **handler functions** with proper extractor parameters
- Implement **Path** extractor for URL parameters: `Path(id): Path<u64>`
- Use **Query** extractor for query parameters: `Query(params): Query<SearchParams>`
- Leverage **Json** extractor for request bodies: `Json(payload): Json<CreateUser>`
- Implement **State** extractor for shared application state

### Actix-web Request Handling
- Use **handler functions** with `HttpRequest` and extractors
- Implement **Path** extractor: `web::Path<u64>` for URL parameters
- Use **Query** extractor: `web::Query<SearchParams>` for query parameters
- Leverage **Json** extractor: `web::Json<CreateUser>` for request bodies
- Use **Data** extractor for shared application state

### Response Generation
- Return **proper HTTP status codes** with typed responses
- Use **JSON responses** with serializable structs
- Implement **streaming responses** for large data sets
- Use **custom response types** for consistent API responses
- Handle **content negotiation** for different response formats

## Middleware and Error Handling

### Middleware Implementation
- Use **Tower middleware** for Axum applications
- Implement **Actix-web middleware** for cross-cutting concerns
- Create **custom middleware** for authentication and authorization
- Use **tracing middleware** for observability and debugging
- Implement **CORS middleware** for cross-origin requests

### Error Handling Patterns
- Create **custom error types** implementing `std::error::Error`
- Use **thiserror** crate for error type generation
- Implement **error conversion** with `From` trait implementations
- Use **anyhow** for error propagation in application logic
- Create **error response mapping** for proper HTTP error responses

### Logging and Observability
- Use **tracing** crate for structured logging
- Implement **request tracing** with correlation IDs
- Use **metrics** collection with prometheus or similar
- Implement **health check endpoints** for monitoring
- Use **distributed tracing** for microservices architectures

## Database Integration

### Database Abstraction
- Use **SQLx** for compile-time verified SQL queries
- Implement **Sea-ORM** or **Diesel** for ORM-based development
- Use **connection pooling** with proper configuration
- Implement **database migrations** with version control
- Use **transactions** for data consistency

### Query Patterns
- Write **type-safe queries** with compile-time validation
- Use **prepared statements** to prevent SQL injection
- Implement **proper error handling** for database operations
- Use **async database operations** throughout the application
- Implement **database health checks** for monitoring

### Cache Integration
- Use **Redis** integration with `redis-rs` or `fred`
- Implement **in-memory caching** with `moka` or similar
- Use **distributed caching** for scalable applications
- Implement **cache invalidation** strategies
- Use **cache-aside** and **write-through** patterns appropriately

## Authentication and Security

### Authentication Patterns
- Implement **JWT authentication** with proper token validation
- Use **session-based authentication** with secure session storage
- Implement **OAuth2** integration with external providers
- Use **API key authentication** for service-to-service communication
- Implement **multi-factor authentication** where appropriate

### Security Best Practices
- **Validate all inputs** at API boundaries with proper sanitization
- Use **HTTPS only** for all production environments
- Implement **rate limiting** to prevent abuse
- Use **secure headers** with helmet-like middleware
- Implement **CSRF protection** for state-changing operations

### Authorization Patterns
- Implement **role-based access control** (RBAC)
- Use **attribute-based access control** (ABAC) for complex scenarios
- Implement **resource-based permissions** where appropriate
- Use **middleware** for authorization checks
- Implement **audit logging** for security events

## Testing Standards

### Unit Testing
- Write **unit tests** using Rust's built-in test framework
- Use **mock objects** with `mockall` or similar crates
- Implement **property-based testing** with `proptest`
- Test **error conditions** and edge cases thoroughly
- Achieve **minimum 80% code coverage**

### Integration Testing
- Write **integration tests** for API endpoints
- Use **test containers** with `testcontainers-rs` for database testing
- Implement **end-to-end testing** for critical user journeys
- Test **concurrent scenarios** and race conditions
- Use **test fixtures** for consistent test data

### Testing Best Practices
- Use **test-driven development** (TDD) where appropriate
- Implement **parallel test execution** for faster feedback
- Use **test helpers** and utilities for common test patterns
- Test **both success and failure scenarios**
- Implement **performance testing** for critical paths

## Performance Optimization

### Rust Performance Best Practices
- Use **zero-cost abstractions** effectively
- Avoid **unnecessary allocations** and cloning
- Use **borrowing** and **references** instead of owned data where possible
- Implement **lazy evaluation** with `std::sync::LazyLock`
- Use **SIMD** optimizations where appropriate

### Web Application Performance
- Implement **connection pooling** for databases and external services
- Use **async I/O** throughout the application stack
- Implement **request/response compression** with appropriate middleware
- Use **CDN** for static assets and appropriate caching headers
- Implement **database query optimization** and indexing

### Concurrency and Scalability
- Use **Tokio** runtime for async applications
- Implement **proper task spawning** and management
- Use **channels** for inter-task communication
- Implement **backpressure** handling for high-load scenarios
- Use **load balancing** and horizontal scaling strategies

## Production Deployment

### Build and Packaging
- Use **multi-stage Docker builds** for minimal production images
- Implement **static linking** for standalone binaries
- Use **cargo-chef** for optimized Docker build caching
- Implement **health checks** in container configurations
- Use **distroless** or **scratch** base images for security

### Configuration Management
- Use **environment variables** for configuration
- Implement **configuration validation** at startup
- Use **secrets management** for sensitive configuration
- Implement **feature flags** for gradual rollouts
- Use **structured configuration** with `serde` and `config` crates

### Monitoring and Observability
- Implement **metrics collection** with Prometheus
- Use **distributed tracing** with OpenTelemetry
- Implement **structured logging** with JSON output
- Use **health check endpoints** for load balancer integration
- Implement **graceful shutdown** handling

## Tech Stack Requirements

### Core Dependencies
- **Tokio** (1.0+) - async runtime
- **Axum** (0.8+) or **Actix-web** (4.0+) - web framework
- **Serde** (1.0+) - serialization/deserialization
- **SQLx** or **Sea-ORM** - database integration
- **Tracing** - logging and observability

### Popular Crates
- **thiserror** and **anyhow** - error handling
- **uuid** - unique identifier generation
- **chrono** - date and time handling
- **reqwest** - HTTP client
- **redis** - Redis integration

### Development Tools
- **cargo-watch** - file watching and auto-rebuild
- **cargo-nextest** - faster test runner
- **cargo-clippy** - linting
- **cargo-audit** - security vulnerability scanning
- **cargo-tarpaulin** - code coverage

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Rust Analyzer extension
- **IntelliJ IDEA** with Rust plugin
- **Vim/Neovim** with rust-analyzer LSP
- **Emacs** with rust-analyzer integration

### Development Workflow
- Use **Rust Analyzer** for IDE integration and IntelliSense
- Implement **debugging** with IDE debugger integration
- Use **version control** with Git pre-commit hooks
- Set up **automated testing** with cargo test integration
- Use **code formatting** with rustfmt integration
