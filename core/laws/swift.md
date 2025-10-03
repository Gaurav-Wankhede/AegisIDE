---
trigger: glob
globs: *.swift,Package.swift,*.xcodeproj,*.xcworkspace,Podfile,Package.resolved
---

# Universal Swift Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `Sources/UserModule/Profile/UserAvatarView.swift` (≤80 lines)
- **Smallest possible files** - decompose at struct, class, and protocol levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **extension files** for protocol conformances (also ≤80 lines per extension)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: SwiftLint, SwiftFormat, custom Swift analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create protocol extensions, implement generic types, refactor into shared modules
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **plist files**, **JSON configuration**, and **environment variables**
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for variables, functions, and properties
- **PascalCase** for types, protocols, and enums
- **lowerCamelCase** for cases in enums
- **UPPER_CASE** for static constants
- **Descriptive, action-oriented names** for deepest folders

### Type Safety and Static Analysis
- **Always use strong typing** with explicit type annotations when helpful
- Use **optionals** properly with safe unwrapping patterns
- Leverage **generics** and **associated types** for type-safe reusable code
- Implement **protocol-oriented programming** over class inheritance
- Use **@frozen**, **@usableFromInline**, and other attributes appropriately

## Modern Swift Features (Swift 6+)

### Concurrency and async/await
- Use **async/await** for asynchronous operations instead of completion handlers
- Implement **structured concurrency** with TaskGroup and async let
- Use **actors** for thread-safe mutable state management
- Use **@Sendable** protocols and **MainActor** for UI updates

### Property Wrappers and Result Builders
- Use **@resultBuilder** for DSL creation (SwiftUI)
- Implement **@Published** for Combine reactive programming
- Use **@StateObject**, **@ObservedObject** for SwiftUI state
- Use **@AppStorage** and **@SceneStorage** for persistence

## SwiftUI Development Patterns

### Declarative UI Architecture
- Create **small, focused views** following EMD principles
- Use **@State** for local state, **@Binding** for two-way data flow
- Use **@EnvironmentObject** for dependency injection
- Implement **@StateObject** for view model ownership

### View Composition and Data Flow
- Create **custom view modifiers** for reusable styling
- Use **ViewBuilder** for flexible composition
- Use **ObservableObject** for reference type view models
- Implement **@Published** properties for reactive updates
- Use **@Observable** macro for simplified observability (iOS 17+)

## UIKit and Performance

### Modern UIKit Patterns
- Use **programmatic Auto Layout** with constraints
- Implement **diffable data sources** for collection views
- Use **compositional layouts** for complex UI
- Use **UIHostingController** for SwiftUI integration

### Architecture and Performance
- Implement **MVVM** or **MVP** patterns for separation of concerns
- Use **coordinator pattern** for navigation management
- Use **@autoclosure** for lazy evaluation
- Implement **copy-on-write** for value types
- Use **lazy properties** and **weak references** to prevent retain cycles

## Protocol-Oriented Programming

### Protocol Design and Generics
- Create **small, focused protocols** with single responsibilities
- Use **protocol extensions** for default implementations
- Use **generic functions** and **types** for code reuse
- Implement **where clauses** for generic constraints
- Use **opaque return types** with **some** keyword
- Implement **existential types** with **any** keyword

## Error Handling and Safety

### Error Handling
- Use **Result type** for functions that can fail
- Implement **custom error types** conforming to Error protocol
- Use **do-catch blocks** for error propagation
- Use **assert** and **precondition** for development-time checks

### Memory and Thread Safety
- Avoid **retain cycles** with weak and unowned references
- Use **defer** statements for cleanup operations
- Use **actors** for mutable shared state
- Implement **@MainActor** for UI-related operations
- Avoid **shared mutable state** without synchronization

## Testing Standards

### Unit Testing with XCTest
- Write **unit tests** using XCTest framework
- Use **XCTAssert** family of functions for assertions
- Implement **test doubles** (mocks, stubs, fakes)
- Use **XCTUnwrap** for safe optional unwrapping in tests
- Achieve **minimum 80% code coverage**

### Testing Patterns and Async Testing
- Use **Given-When-Then** structure for test organization
- Use **test fixtures** for shared test setup
- Use **XCTExpectation** for asynchronous testing
- Test **async/await** functions with async test methods
- Test **Combine publishers** with appropriate expectations

## Package Management and Architecture

### Swift Package Manager
- Use **Package.swift** for dependency management
- Implement **semantic versioning** for packages
- Use **local packages** for modular development
- Use **binary frameworks** for pre-compiled dependencies

### Dependency Injection and Modular Architecture
- Implement **constructor injection** as primary pattern
- Use **protocols** for dependency abstractions
- Create **feature modules** with clear boundaries
- Use **internal access control** for module encapsulation
- Use **@testable import** for testing internal APIs

## Performance and Optimization

### Performance Best Practices
- Use **value types** (structs) over reference types when appropriate
- Implement **copy-on-write** for expensive value types
- Use **final classes** to enable compiler optimizations
- Use **weak collections** to prevent retain cycles
- Use **autoreleasepool** for memory-intensive operations

### Concurrency Performance
- Use **structured concurrency** over unstructured tasks
- Implement **TaskGroup** for coordinated parallel work
- Use **async sequences** for streaming data efficiently
- Use **cooperative cancellation** with Task.checkCancellation()

## Platform-Specific Features

### iOS and macOS Development
- Use **SwiftUI** for modern iOS app development
- Implement **App lifecycle** with SwiftUI App protocol
- Use **Core Data** or **SwiftData** for persistent storage
- Use **AppKit** for traditional macOS applications
- Implement **document-based applications** with NSDocument

### Cross-Platform Development
- Use **conditional compilation** for platform differences
- Implement **protocol-based** abstractions for platform APIs
- Use **#available** checks for feature availability
- Implement **shared business logic** in separate modules

## Security Best Practices

### Data Protection and Code Security
- Use **Keychain Services** for sensitive data storage
- Implement **biometric authentication** with LocalAuthentication
- Use **App Transport Security** for network communications
- **Validate all inputs** at API boundaries
- Use **secure coding practices** for cryptographic operations
- Use **static analysis tools** for security vulnerability detection

## Build and Distribution

### Xcode Project Configuration
- Use **xcconfig files** for build configuration management
- Implement **build phases** for code generation and processing
- Use **workspace** organization for multi-project development

### CI/CD and Distribution
- Use **Xcode Cloud**, **GitHub Actions**, or **Bitrise** for CI/CD
- Implement **automated testing** in build pipelines
- Use **fastlane** for deployment automation
- Use **TestFlight** for beta distribution
- Follow **App Store Guidelines** for app approval
- Implement **in-app purchases** with StoreKit 2

## Tech Stack Requirements

### Core Dependencies
- **Swift 6+** - modern language features
- **Foundation** - fundamental APIs
- **SwiftUI** - declarative UI framework
- **Combine** - reactive programming
- **Swift Package Manager** - dependency management

### Development Tools and Libraries
- **Xcode 16+** - primary IDE
- **SwiftLint** - code style enforcement
- **SwiftFormat** - automatic code formatting
- **Instruments** - performance profiling
- **Alamofire** - networking
- **RealmSwift** - database alternative

## IDE Integration Guidelines

### Universal IDE Compatibility and Workflow
- **Xcode** - primary development environment
- **VS Code** with Swift extensions
- **Swift Playgrounds** for learning and prototyping
- Use **Source Control** integration in Xcode
- Use **simulator** and **device testing** extensively
- Set up **breakpoints** and **debugging** effectively
