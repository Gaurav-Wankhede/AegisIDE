---
trigger: glob
globs: *.java,pom.xml,build.gradle,application.properties,application.yml
---

# Universal Java Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/main/java/com/example/service/impl/
  ├── UserServiceImpl.java (≤80 lines)
  └── AuthServiceImpl.java (≤80 lines)
  ```
- **Smallest possible files** - decompose at method, class, and interface levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use package-private classes where appropriate for encapsulation

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PMD CPD, SonarQube, Checkstyle, custom Maven/Gradle plugins
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable interfaces/abstract classes, implement generic classes, refactor patterns into utilities
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE plugins
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and database queries**
- Use **properties files** or **Spring configuration** for all parameters
- Derive parameters from historical data and performance metrics
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use unused variables**; remove them entirely
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub methods, use variables meaningfully through logging or assertions

### Naming Conventions
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
- Leverage **CompletableFuture** for async computation chains
- Use **CountDownLatch** and **CyclicBarrier** for synchronization
- Favor **lock-free algorithms** and **atomic operations**

### Stream Processing
- Use **Stream API** for parallel processing of collections
- Implement **parallel streams** for CPU-intensive operations
- Use **reactive streams** with libraries like RxJava or Project Reactor
- Implement **backpressure handling** for stream processing
- Use **async servlet API** for non-blocking web operations

### Async Operations
- Implement **retry mechanisms** with exponential backoff
- Use **async HTTP clients** like AsyncHttpClient or WebClient
- Implement **circuit breaker patterns** for fault tolerance
- Use **async database drivers** where available

## Error Handling and Safety

### Exception Management
- Create **custom exception hierarchies** extending appropriate base exceptions
- Use **checked exceptions** for recoverable errors, **unchecked** for programming errors
- Implement **global exception handlers** using Spring @ControllerAdvice or similar
- Handle errors early with appropriate exception throwing

### Logging and Monitoring
- Use **SLF4J** with Logback or Log4j2 for structured logging
- Implement **MDC (Mapped Diagnostic Context)** for request tracing
- Use **appropriate log levels**: TRACE, DEBUG, INFO, WARN, ERROR
- Implement **circuit breaker patterns** for external service calls

## Spring Framework Patterns

### Dependency Injection
- Use **constructor injection** over field injection
- Implement **@Configuration** classes for bean definitions
- Use **@Profile** for environment-specific configurations
- Leverage **@Conditional** annotations for conditional bean creation
- Implement **custom auto-configuration** for reusable components

### Spring Boot Patterns
- Use **@SpringBootApplication** with component scanning
- Implement **@RestController** for REST API endpoints
- Use **@Service**, **@Repository**, **@Component** for layer separation
- Leverage **Spring Data JPA** for data access layer
- Implement **@Transactional** for transaction management

### Spring Security
- Implement **method-level security** with @PreAuthorize
- Use **JWT tokens** for stateless authentication
- Implement **OAuth2** for third-party authentication
- Use **CORS** configuration for cross-origin requests
- Implement **rate limiting** and **request throttling**

## Performance Optimization

### Runtime Optimization
- Use **appropriate collections**: ArrayList vs LinkedList, HashMap vs TreeMap
- Implement **object pooling** for expensive-to-create objects
- Use **lazy initialization** with synchronized blocks or locks
- Leverage **JVM optimizations** with proper garbage collection tuning
- Implement **caching strategies** with Caffeine or Redis

### Memory Management
- Use **try-with-resources** for automatic resource management
- Implement **proper equals() and hashCode()** methods
- Use **weak references** for caches to prevent memory leaks
- Monitor **heap usage** and optimize garbage collection
- Implement **flyweight pattern** for immutable objects

## Testing Requirements

### Testing Standards
- Write **unit tests** using JUnit 5 and Mockito
- Use **@SpringBootTest** for integration testing
- Implement **test slices** with @WebMvcTest, @DataJpaTest
- Use **Testcontainers** for integration testing with real databases
- Achieve **minimum 80% code coverage**

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **@ParameterizedTest** for multiple test cases
- Implement **custom assertions** for domain-specific testing
- Use **@MockBean** for mocking Spring components
- Implement **performance tests** with JMH

## Database Integration

### JPA and Hibernate
- Use **Spring Data JPA** for repository pattern implementation
- Implement **custom queries** with @Query annotation
- Use **entity relationships** appropriately: @OneToMany, @ManyToOne
- Implement **lazy loading** strategies to avoid N+1 problems
- Use **database migrations** with Flyway or Liquibase

### Transaction Management
- Use **@Transactional** with appropriate propagation and isolation
- Implement **read-only transactions** for query operations
- Use **programmatic transactions** for complex transaction logic
- Implement **distributed transactions** with JTA when needed
- Monitor **transaction performance** and optimize slow queries

## Build Tools and Dependencies

### Maven Patterns
- Use **multi-module projects** for complex applications
- Implement **dependency management** in parent POM
- Use **profiles** for environment-specific builds
- Implement **custom plugins** for build automation
- Use **Maven Wrapper** for consistent builds

### Gradle Patterns
- Use **multi-project builds** for modular applications
- Implement **dependency catalogs** for version management
- Use **custom tasks** for build automation
- Implement **build cache** for faster builds
- Use **Gradle Wrapper** for consistent builds

## Security Best Practices

### Application Security
- Validate **all inputs** using Bean Validation API
- Use **parameterized queries** to prevent SQL injection
- Implement **output encoding** to prevent XSS attacks
- Use **secure communication** with HTTPS and TLS
- Implement **secrets management** with external vaults

### Authentication and Authorization
- Use **secure password hashing** with BCrypt or Argon2
- Implement **session management** with secure cookies
- Use **role-based access control** (RBAC)
- Implement **audit logging** for security events
- Use **principle of least privilege** for permissions

## Tech Stack Requirements

### Core Dependencies
- **Spring Boot** - application framework
- **Spring Security** - security framework
- **Spring Data JPA** - data access
- **Jackson** - JSON processing
- **SLF4J + Logback** - logging

### Development Dependencies
- **JUnit 5** - testing framework
- **Mockito** - mocking framework
- **Spring Boot Test** - integration testing
- **Testcontainers** - integration testing
- **SpotBugs** - static analysis

## IDE Integration Guidelines

### Universal IDE Compatibility
- **IntelliJ IDEA** with Java plugins
- **Eclipse** with Spring Tools Suite
- **VS Code** with Java extensions
- **Maven/Gradle** integration for all IDEs

### Development Workflow
- Use **code formatting** with Google Java Format or similar
- Implement **pre-commit hooks** for code quality
- Use **static analysis** with SpotBugs, PMD, Checkstyle
- Set up **continuous integration** with comprehensive testing
