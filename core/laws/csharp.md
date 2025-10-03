---
trigger: glob
globs: *.cs,*.csx,*.csproj,*.sln,appsettings.json,Program.cs,Startup.cs
---

# Universal C#/.NET Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/Services/User/Management/
  ├── UserCreationService.cs   (≤80 lines)
  ├── UserValidationService.cs (≤80 lines)
  └── UserUpdateService.cs     (≤80 lines)
  ```
- **Smallest possible files** - decompose at class, method, and service levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **partial classes** for complex entities when appropriate (also ≤80 lines per partial)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: SonarQube, NDepend, dupFinder, custom Roslyn analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create base classes/interfaces, implement generic services, refactor patterns into shared libraries
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE integration
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **appsettings.json** and **IConfiguration** for all parameters
- Derive parameters from historical data and performance metrics
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management  
- When implementing stub methods, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **PascalCase** for classes, methods, properties, and namespaces
- **camelCase** for local variables and private fields
- **PascalCase** for public fields (avoid public fields, use properties)
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest namespaces

### Type Safety and Static Analysis
- **Always use strong typing** with explicit type declarations
- Use **nullable reference types** (C# 8+) for null safety
- Leverage **generics** for type-safe reusable code
- Implement **custom attributes** for metadata-driven development
- Use **analyzers** and **code fixes** for consistent code quality

## Asynchronous Programming Standards

### async/await Patterns
- Use **async/await** for all I/O-bound operations
- Implement **ConfigureAwait(false)** in library code
- Use **Task.Run()** for CPU-bound operations in appropriate contexts
- Avoid **async void** except for event handlers
- Use **ValueTask** for high-performance scenarios

### Concurrency and Threading
- Use **Task.WhenAll()** for concurrent operations
- Implement **SemaphoreSlim** for limiting concurrent access
- Use **CancellationToken** for cooperative cancellation
- Implement **async enumerable** (IAsyncEnumerable) for streaming data
- Use **Channel** for producer-consumer scenarios

### Error Handling in Async Code
- Always handle **OperationCanceledException** appropriately
- Use **try-catch** blocks around await expressions
- Implement **timeout patterns** with CancellationTokenSource
- Use **Task.FromException()** for known error states
- Implement proper **exception propagation** in async chains

## Modern C# Features (C# 12+)

### Pattern Matching and Records
- Use **record types** for immutable data transfer objects
- Implement **switch expressions** for complex conditional logic
- Use **pattern matching** with **is** expressions and **switch** statements
- Leverage **positional patterns** and **property patterns**
- Use **init-only properties** for immutable objects

### Nullable Reference Types
- Enable **nullable reference types** in all new projects
- Use **nullable annotations** (`?`, `!`) appropriately
- Implement **null guards** at method boundaries
- Use **nullable analysis attributes** for advanced scenarios
- Handle **nullable warnings** explicitly, never suppress blindly

### Performance Features
- Use **Span<T>** and **Memory<T>** for high-performance scenarios
- Implement **ref readonly** for large struct parameters
- Use **stackalloc** for small, short-lived arrays
- Leverage **string interpolation** over string concatenation
- Use **StringBuilder** for multiple string operations

## Dependency Injection and IoC

### Service Registration Patterns
- Use **built-in DI container** for ASP.NET Core applications
- Implement **service lifetimes** appropriately (Transient, Scoped, Singleton)
- Use **interface segregation** for better testability
- Implement **factory patterns** for complex object creation
- Use **options pattern** for configuration binding

### Architecture Patterns
- Implement **repository pattern** for data access abstraction
- Use **unit of work pattern** for transaction management
- Implement **mediator pattern** with MediatR for CQRS
- Use **decorator pattern** for cross-cutting concerns
- Implement **strategy pattern** for algorithmic variations

## Entity Framework Core Patterns

### DbContext Configuration
- Use **DbContext** with dependency injection
- Implement **entity configurations** with IEntityTypeConfiguration
- Use **migrations** for database schema management
- Implement **connection resiliency** with retry policies
- Use **connection pooling** for performance optimization

### Query Optimization
- Use **Include()** and **ThenInclude()** for eager loading
- Implement **projection** with Select() for performance
- Use **AsNoTracking()** for read-only queries
- Implement **query splitting** for complex includes
- Use **compiled queries** for frequently executed queries

### Advanced EF Core Features
- Implement **global query filters** for soft deletes
- Use **value converters** for custom type mapping
- Implement **shadow properties** for audit fields
- Use **owned entities** for complex value objects
- Implement **table splitting** and **entity splitting** when appropriate

## Testing Standards

### Unit Testing Patterns
- Use **xUnit**, **NUnit**, or **MSTest** for unit testing
- Implement **AAA pattern** (Arrange, Act, Assert)
- Use **FluentAssertions** for readable assertions
- Implement **test fixtures** for shared test setup
- Achieve **minimum 80% code coverage**

### Integration Testing
- Use **TestServer** and **WebApplicationFactory** for API testing
- Implement **in-memory databases** for integration tests
- Use **Docker containers** for database integration testing
- Implement **test data builders** for complex object creation
- Use **WireMock** or similar for external service mocking

### Advanced Testing Techniques
- Implement **property-based testing** with FsCheck
- Use **behavior-driven development** with SpecFlow
- Implement **performance testing** with NBomber or BenchmarkDotNet
- Use **approval testing** for complex output verification
- Implement **mutation testing** for test quality assessment

## ASP.NET Core Patterns

### Web API Development
- Use **Controller** or **Minimal APIs** based on complexity
- Implement **API versioning** with proper URL/header strategies
- Use **model binding** and **validation** with data annotations
- Implement **custom middleware** for cross-cutting concerns
- Use **action filters** for reusable logic

### Authentication and Authorization
- Implement **JWT authentication** with proper token validation
- Use **policy-based authorization** for complex scenarios
- Implement **role-based** and **claims-based** authorization
- Use **Identity framework** for user management
- Implement **OAuth2/OpenID Connect** for external authentication

### Performance and Scalability
- Use **response caching** and **output caching** appropriately
- Implement **compression** for HTTP responses
- Use **health checks** for monitoring and load balancing
- Implement **rate limiting** with AspNetCoreRateLimit
- Use **SignalR** for real-time communication

## Performance Optimization

### Memory Management
- Use **object pooling** with Microsoft.Extensions.ObjectPool
- Implement **IDisposable** and **IAsyncDisposable** correctly
- Use **weak references** for caching scenarios
- Avoid **boxing/unboxing** in performance-critical code
- Use **ArrayPool<T>** for temporary arrays

### Code Performance
- Use **BenchmarkDotNet** for micro-benchmarking
- Implement **lazy initialization** with Lazy<T>
- Use **concurrent collections** for thread-safe operations
- Optimize **LINQ queries** and avoid multiple enumeration
- Use **System.Text.Json** over Newtonsoft.Json for performance

## Build and Deployment

### Project Configuration
- Use **Directory.Build.props** for shared MSBuild properties
- Implement **multi-targeting** for library projects
- Use **package references** over packages.config
- Implement **deterministic builds** for reproducibility
- Use **source generators** for code generation

### CI/CD Integration
- Use **dotnet CLI** for cross-platform builds
- Implement **Docker multi-stage builds** for containerization
- Use **GitHub Actions**, **Azure DevOps**, or **GitLab CI**
- Implement **automated testing** in build pipelines
- Use **semantic versioning** with GitVersion

## Security Best Practices

### Code Security
- **Validate all inputs** using data annotations and custom validators
- Use **parameterized queries** to prevent SQL injection
- Implement **HTTPS** enforcement and **HSTS** headers
- Use **secure coding practices** for cryptography
- Implement **logging** without exposing sensitive data

### Authentication Security
- Use **ASP.NET Core Identity** for user management
- Implement **two-factor authentication** (2FA)
- Use **secure password policies** and **password hashing**
- Implement **account lockout** and **rate limiting**
- Use **secure cookie** settings and **CSRF protection**

## Tech Stack Requirements

### Core Dependencies
- **.NET 8+** - runtime and framework
- **Microsoft.Extensions.Hosting** - hosting abstractions
- **Microsoft.Extensions.DependencyInjection** - built-in DI
- **Microsoft.Extensions.Configuration** - configuration system
- **Microsoft.Extensions.Logging** - structured logging

### Popular Libraries
- **AutoMapper** - object-to-object mapping
- **FluentValidation** - validation library
- **Serilog** - structured logging
- **MediatR** - mediator pattern implementation
- **Polly** - resilience and fault-handling

### Development Tools
- **Visual Studio** or **Visual Studio Code** with C# extensions
- **ReSharper** or **Rider** for advanced IDE features
- **dotnet CLI** for command-line operations
- **Entity Framework Core Tools** for database operations
- **Docker** for containerization

## IDE Integration Guidelines

### Universal IDE Compatibility
- **Visual Studio 2022** with latest C# features
- **Visual Studio Code** with C# extension
- **JetBrains Rider** with comprehensive .NET support
- **Visual Studio for Mac** (being deprecated, use alternatives)

### Development Workflow
- Use **EditorConfig** for consistent formatting
- Implement **StyleCop** or **EditorConfig** for code style
- Use **Git hooks** for pre-commit validation
- Set up **continuous integration** with comprehensive testing
- Use **NuGet** for package management and distribution
