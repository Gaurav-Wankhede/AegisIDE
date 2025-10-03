---
trigger: glob
globs: *.kt,*.kts,build.gradle.kts,gradle.properties,settings.gradle.kts
---

# Universal Kotlin Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/main/kotlin/com/app/user/profile/UserAvatarService.kt` (≤80 lines)
- **Smallest possible files** - decompose at class, function, and object levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **companion objects** and **extensions** for organization (also ≤80 lines per file)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: Detekt, KtLint, SonarQube, custom Kotlin analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create extension functions, implement generics, refactor into libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **properties files** and **environment variables** for all parameters
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for variables, functions, and properties
- **PascalCase** for classes, interfaces, and objects
- **UPPER_CASE** for constants and enum values
- **lowercase** for package names
- **Descriptive, action-oriented names** for deepest packages

### Type Safety and Static Analysis
- **Always use explicit types** when helpful for readability
- Use **nullable types** (?) appropriately with null safety
- Leverage **generics** and **type aliases** for code clarity
- Implement **sealed classes** for restricted class hierarchies
- Use **Detekt** and **KtLint** for static analysis and style checking

## Modern Kotlin Features (Kotlin 1.9+)

### Null Safety and Smart Casts
- Use **nullable types** (?) and **safe calls** (?.) for null safety
- Implement **elvis operator** (?:) for default values
- Use **not-null assertion** (!!) sparingly and with justification
- Leverage **smart casts** for automatic type casting
- Use **let**, **run**, **with**, **also**, **apply** scope functions appropriately

### Coroutines and Concurrency
- Use **suspend functions** for asynchronous operations
- Implement **coroutine contexts** and **dispatchers** appropriately
- Use **async/await** for concurrent operations
- Implement **Flow** for reactive streams
- Use **structured concurrency** with coroutineScope and supervisorScope

### Functional Programming Features
- Use **higher-order functions** and **lambdas** effectively
- Implement **extension functions** for API enhancement
- Use **inline functions** for performance-critical lambdas
- Implement **function types** and **function references**
- Use **collection operations** (map, filter, reduce) over loops

## Android Development Patterns

### Modern Android Architecture
- Use **Jetpack Compose** for declarative UI development
- Implement **MVVM** or **MVI** architecture patterns
- Use **ViewModel** for UI-related data management
- Implement **Repository pattern** for data layer abstraction
- Use **Dependency Injection** with Hilt or Koin

### Jetpack Compose Best Practices
- Create **composable functions** following single responsibility
- Use **state hoisting** for state management
- Implement **remember** and **rememberSaveable** for state preservation
- Use **LaunchedEffect** and **DisposableEffect** for side effects
- Implement **Material 3** design system components

### Android Lifecycle and Performance
- Use **lifecycle-aware components** for resource management
- Implement **memory leak prevention** with weak references
- Use **lazy initialization** for expensive operations
- Implement **background processing** with WorkManager
- Use **ProGuard/R8** for code obfuscation and optimization

## Server-Side Kotlin

### Ktor Framework
- Use **Ktor** for lightweight server-side applications
- Implement **routing** with type-safe builders
- Use **serialization** with kotlinx.serialization
- Implement **dependency injection** with Koin
- Use **testing** with Ktor test client

### Spring Boot Integration
- Use **Spring Boot** with Kotlin for enterprise applications
- Implement **data classes** for DTOs and entities
- Use **extension functions** for Spring component enhancement
- Implement **coroutines** with Spring WebFlux
- Use **configuration properties** with @ConfigurationProperties

### Database Integration
- Use **Exposed** or **KotlinQuery** for database access
- Implement **connection pooling** with HikariCP
- Use **migration tools** like Flyway for schema management
- Implement **transaction management** with proper scoping
- Use **connection monitoring** and **health checks**

## Testing Standards

### Unit Testing with JUnit and Kotest
- Write **unit tests** using JUnit 5 or Kotest
- Use **MockK** for mocking in Kotlin
- Implement **parameterized tests** for multiple test cases
- Use **test fixtures** and **test data builders**
- Achieve **minimum 80% code coverage**

### Testing Patterns
- Use **given-when-then** structure for test organization
- Implement **integration tests** with TestContainers
- Use **property-based testing** with Kotest property testing
- Implement **coroutine testing** with runTest and TestDispatcher
- Use **Android instrumented tests** for UI testing

### Testing Tools and Techniques
- Use **Espresso** for Android UI testing
- Implement **Robolectric** for Android unit testing
- Use **WireMock** for API testing
- Implement **screenshot testing** for UI regression
- Use **performance testing** with benchmarking libraries

## Multiplatform Development

### Kotlin Multiplatform Mobile (KMM)
- Share **business logic** between Android and iOS
- Use **expect/actual** declarations for platform-specific implementations
- Implement **common networking** with Ktor client
- Use **common data storage** with SQLDelight
- Implement **common dependency injection** with Koin

### Kotlin/JS and Kotlin/Native
- Use **Kotlin/JS** for web frontend development
- Implement **Kotlin/Native** for native applications
- Use **common serialization** across platforms
- Implement **platform-specific optimizations**
- Use **common testing** infrastructure

## Performance Optimization

### Kotlin Performance
- Use **inline functions** for high-order functions
- Implement **object pooling** for frequently created objects
- Use **primitive arrays** instead of collections where appropriate
- Implement **lazy initialization** with lazy delegate
- Use **const val** for compile-time constants

### Memory Management
- Avoid **memory leaks** with proper lifecycle management
- Use **weak references** for callback implementations
- Implement **resource cleanup** with use extension function
- Monitor **memory usage** with profiling tools
- Use **ProGuard/R8** for APK size optimization

### Concurrency Performance
- Use **appropriate coroutine dispatchers** for different tasks
- Implement **cancellation** and **timeout** handling
- Use **channel** and **flow** for data streams
- Implement **backpressure** handling in reactive streams
- Use **concurrent collections** for thread-safe operations

## Build System and Dependencies

### Gradle Kotlin DSL
- Use **Gradle Kotlin DSL** for build script type safety
- Implement **version catalogs** for dependency management
- Use **build conventions** for multi-module projects
- Implement **custom tasks** and **plugins**
- Use **build caching** for faster builds

### Dependency Management
- Use **semantic versioning** for library dependencies
- Implement **dependency resolution strategies**
- Use **bill of materials** (BOM) for version alignment
- Implement **dependency scanning** for vulnerabilities
- Use **dependency updates** with automated tools

### Module Structure
- Create **feature modules** with clear boundaries
- Use **clean architecture** with domain, data, and presentation layers
- Implement **dependency inversion** between modules
- Use **interface segregation** for module contracts
- Implement **modular testing** strategies

## Security Best Practices

### Code Security
- **Validate all inputs** at API boundaries
- Use **secure coding practices** for cryptographic operations
- Implement **secure storage** for sensitive data on Android
- Use **network security** with certificate pinning
- Implement **code obfuscation** for production releases

### Android Security
- Use **encrypted shared preferences** for sensitive data
- Implement **biometric authentication** with AndroidX Biometric
- Use **app signing** with Android App Bundle
- Implement **runtime application self-protection** (RASP)
- Use **security linting** with Android security linter

## Error Handling

### Exception Management
- Use **sealed classes** for representing error states
- Implement **Result** type for functional error handling
- Use **try-catch** blocks appropriately for recoverable errors
- Implement **logging** with structured logging libraries
- Use **crash reporting** tools like Crashlytics

### Validation and Contracts
- Use **require** and **check** functions for preconditions
- Implement **custom validation** with extension functions
- Use **contracts** for compiler optimization hints
- Implement **defensive programming** patterns
- Use **assertion libraries** for testing

## Serialization and Data Handling

### Kotlinx Serialization
- Use **kotlinx.serialization** for JSON handling
- Implement **custom serializers** for complex types
- Use **polymorphic serialization** for inheritance hierarchies
- Implement **format-agnostic** serialization
- Use **schema evolution** for backward compatibility

### Data Classes and Collections
- Use **data classes** for immutable data structures
- Implement **copy** function for data modification
- Use **immutable collections** by default
- Implement **builder patterns** for complex objects
- Use **destructuring declarations** for data extraction

## Tech Stack Requirements

### Core Dependencies
- **Kotlin 1.9+** - modern language features
- **Gradle** - build system
- **kotlinx-coroutines** - concurrency
- **kotlinx-serialization** - data serialization
- **Ktor** or **Spring Boot** - server framework

### Android Dependencies
- **Android Gradle Plugin** - Android build support
- **Jetpack Compose** - modern UI toolkit
- **AndroidX libraries** - Android components
- **Hilt** - dependency injection
- **Room** - local database

### Development Tools
- **IntelliJ IDEA** or **Android Studio** - IDEs
- **Detekt** - static analysis
- **KtLint** - code formatting
- **MockK** - mocking framework
- **Kotest** - testing framework

## IDE Integration Guidelines

### Universal IDE Compatibility
- **IntelliJ IDEA** - primary IDE for Kotlin development
- **Android Studio** - Android development IDE
- **VS Code** with Kotlin extensions
- **Eclipse** with Kotlin plugin

### Development Workflow
- Use **Kotlin language server** for IDE integration
- Implement **debugging** with IDE debugger
- Use **version control** with Git integration
- Set up **automated testing** with IDE test runners
- Use **code formatting** with KtLint integration
