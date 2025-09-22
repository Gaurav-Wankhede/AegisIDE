# Universal Java Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── main/
  │   ├── java/
  │   │   ├── com/
  │   │   │   ├── example/
  │   │   │   │   ├── service/
  │   │   │   │   │   ├── impl/
  │   │   │   │   │   │   ├── UserServiceImpl.java (≤80 lines)
  │   │   │   │   │   │   └── AuthServiceImpl.java (≤80 lines)
  ```
- **Smallest possible files** - decompose at method, class, and interface levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use package-private classes where appropriate for encapsulation

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy of the same functionalities
- **Use automated duplicate detection tools** before every commit and deployment:
  - **PMD CPD (Copy/Paste Detector)** for fast command-line duplicate detection
  - **SonarQube** for comprehensive code analysis including duplicates
  - **Checkstyle** with duplicate code plugins
  - **Custom Maven/Gradle plugins** for project-specific duplicate detection
- **If any duplicacy found**, optimize immediately without disturbing the system:
  - **Extract common functionality** into shared modules following deep subfolder patterns
  - **Create reusable interfaces** and abstract classes for common operations
  - **Implement generic classes** using type parameters
  - **Refactor similar patterns** into common utilities in `util/` package
- **Continuous monitoring approach**:
  - Run duplicate detection in **CI/CD pipeline** before merge
  - Set up **pre-commit hooks** with duplicate detection tools
  - Schedule **weekly automated scans** with detailed reports
  - Integrate duplicate detection into **IDE workflow** with plugins
- **Optimization strategies**:
  - **Preserve system functionality** during refactoring - never break existing APIs
  - **Use feature flags** to gradually replace duplicated functionality
  - **Maintain backward compatibility** while optimizing operations
  - **Test thoroughly** after each duplicate removal to ensure system stability

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All numerical values, thresholds, limits, and configuration parameters **must be calculated from real-world data and database queries**
- Use **properties files** or **Spring configuration** for all parameters
- Derive parameters from historical data and performance metrics stored in databases
- Calculate timeout values, retry intervals, and connection limits based on observed performance
- Implement dynamic parameter adjustment based on real-time system load and metrics

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use unused variables**; remove them entirely
- Ensure every declared variable serves specific purpose: computation, logging, error handling, or state management
- When implementing stub methods, use variables meaningfully through logging or assertions

### Naming Conventions
- Use **descriptive variable names** that convey intent: `userIsAuthenticated`, `responseHasCompleted`
- **camelCase** for variables and methods
- **PascalCase** for classes and interfaces
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest packages
- Follow **domain-driven design** principles in package hierarchy

### Type Safety and Static Analysis
- **Always use generics** for collections and custom classes
- Enable **strict null checks** and use `@NonNull` annotations
- Leverage **Optional** for potentially null values
- Define **custom exceptions** for specific error cases
- Implement **immutable classes** where appropriate

## Async Programming Standards

### Concurrency Management
- Use **java.util.concurrent** package for async operations
- Implement **ExecutorService** for thread pool management
- Leverage **CompletableFuture** for asynchronous programming
- Use **ForkJoinPool** for parallel stream processing
- Favor **structured concurrency** with virtual threads (Java 21+)

### Synchronization Patterns
- **synchronized** blocks for thread safety
- **ReentrantLock** for advanced locking scenarios
- **Atomic classes** for lock-free operations
- **CountDownLatch** and **CyclicBarrier** for coordination
- Use **ThreadLocal** for per-thread variables

### Async Operations
- Implement **timeouts** using `Future.get(timeout)`
- Use **try-with-resources** for resource management
- Handle **InterruptedException** properly
- Implement **graceful shutdown** with `ExecutorService.shutdown()`

## Error Handling and Safety

### Exception Management
- Create **custom exception hierarchies** inheriting from appropriate bases
- Use **checked exceptions** for recoverable errors
- Implement **proper exception chaining** with `initCause()`
- Handle errors early with appropriate logging and recovery

### Logging and Monitoring
- Use **SLF4J** with Logback or Log4j for structured logging
- Implement **correlation IDs** for request tracing
- Use **appropriate log levels**: TRACE, DEBUG, INFO, WARN, ERROR
- Implement **circuit breaker patterns** using Resilience4j

## Java Framework Patterns (Spring/Quarkus)

### Application Structure
- Use **dependency injection** for loose coupling
- Structure applications using **layers**: controller, service, repository
- Implement **RESTful endpoints** with proper HTTP methods
- Use **DTOs** for data transfer
- Leverage **annotations** for configuration

### Security Patterns
- Use **Spring Security** or equivalent for authentication
- Implement **role-based access control**
- Use **input validation** with Bean Validation
- Protect against **common vulnerabilities** like SQL injection

## Performance Optimization

### Runtime Optimization
- Use **appropriate collections**: HashMap, ArrayList, etc.
- Implement **lazy initialization** where possible
- Use **string concatenation** with StringBuilder
- Leverage **parallel streams** for CPU-bound tasks

### Memory Management
- Use **try-with-resources** for automatic cleanup
- Implement **object pooling** for expensive objects
- Monitor **heap usage** and optimize garbage collection
- Avoid **memory leaks** by managing references

## Testing Requirements

### Testing Standards
- Write **unit tests** using JUnit 5
- Use **Mockito** for mocking dependencies
- Implement **integration tests** with Spring Boot Test
- Use **assertions** and **parameterized tests**
- Achieve **minimum 80% code coverage**

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **@BeforeEach** for setup
- Implement **test suites** for organization
- Use **embedded databases** for testing

## Database and External Service Patterns

### Database Integration
- Use **JPA/Hibernate** for ORM
- Implement **connection pooling** with HikariCP
- Use **migrations** with Flyway or Liquibase
- Implement **query optimization** and indexing

### External Service Integration
- Use **RestTemplate** or **WebClient** for HTTP calls
- Implement **retry mechanisms** with exponential backoff
- Use **circuit breakers** for fault tolerance
- Implement **rate limiting** for API calls

## Tech Stack Requirements

### Core Dependencies
- **JDK 21+** - latest LTS version
- **Maven/Gradle** - build tools
- **Spring Boot** - application framework
- **Lombok** - boilerplate reduction
- **SLF4J** - logging facade

### Development Dependencies
- **JUnit 5** - testing framework
- **Mockito** - mocking library
- **SonarQube** - code quality analysis
- **Checkstyle** - style enforcement
- **SpotBugs** - bug detection

## Documentation Standards

### Code Documentation
- Use **Javadoc** for classes, methods, and packages
- Include **@param**, **@return**, **@throws** tags
- Document **complex algorithms** and decisions
- Generate **API docs** with Maven/Gradle plugins

### Architecture Documentation
- Maintain **README.md** with project overview
- Document **design patterns** used
- Include **diagrams** for system architecture
- Track **technical debt** and decisions

## File Organization Rules

### Package Structure
- Separate concerns into logical packages with clear boundaries
- Use **domain-based packages** (com.example.domain)
- Maintain **consistent depth levels** across similar functionalities
- Follow **microservices decomposition** at every level

### Project Layout
```
src/
├── main/
│   ├── java/       # Source code
│   ├── resources/  # Configuration files
├── test/
│   ├── java/       # Test sources
└── pom.xml         # Maven build file
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **IntelliJ IDEA** for advanced refactoring
- **Eclipse** for plugin ecosystem
- **VS Code** with Java extensions
- **NetBeans** for GUI builder

### Development Workflow
- Use **pre-commit hooks** for quality checks
- Implement **Maven/Gradle** for build automation
- Set up **continuous integration** with Jenkins/GitHub Actions
- Use **code reviews** for all changes

## Security and Best Practices

### Security Guidelines
- **Never hardcode secrets** - use environment variables
- Validate **all inputs** to prevent injection
- Implement **proper authentication** and authorization
- Use **HTTPS** for communications
- Follow **OWASP guidelines**

### Code Quality
- Follow **Google Java Style** or similar
- Use **immutable objects** where possible
- Implement **proper exception handling**
- Use **streams** for collections processing
- Avoid **checked exceptions** in APIs

## Package Management and Deployment

### Dependency Management
- Use **Maven Central** for dependencies
- Pin **exact versions** in pom.xml/build.gradle
- Implement **dependency scanning** for vulnerabilities
- Use **repositories** for artifact management

### Deployment Patterns
- Use **Docker** for containerization
- Implement **health checks** in applications
- Use **Kubernetes** for orchestration
- Enable **monitoring** with Prometheus/Grafana