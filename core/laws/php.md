---
trigger: glob
globs: *.php,composer.json,composer.lock,.htaccess,artisan
---

# Universal PHP Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `app/Services/User/Profile/UserAvatarService.php` (≤80 lines)
- **Smallest possible files** - decompose at class, method, and service levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **PSR-4 autoloading** for namespace organization (also ≤80 lines per class)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PHPMD, PHP_CodeSniffer, PHPStan, custom PHP analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create traits, implement inheritance, refactor into packages
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **.env files** and **config arrays** for all parameters
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub methods, use variables meaningfully through logging or debug assertions

### Naming Conventions (PSR-1/PSR-12)
- **camelCase** for variables, methods, and properties
- **PascalCase** for classes, interfaces, and traits
- **UPPER_CASE** for constants
- **snake_case** for array keys and database columns
- **Descriptive, action-oriented names** for deepest namespaces

### Type Safety and Static Analysis
- **Always use type declarations** for parameters and return types (PHP 8+)
- Use **strict_types=1** declaration at the top of files
- Leverage **union types** and **nullable types** for flexibility
- Implement **attributes** for metadata-driven development
- Use **PHPStan** and **Psalm** for static analysis

## Modern PHP Features (PHP 8.3+)

### Type System and Syntax
- Use **union types** and **intersection types** for complex type definitions
- Implement **readonly properties** for immutable data
- Use **match expressions** instead of switch statements where appropriate
- Implement **named arguments** for better method readability
- Use **constructor property promotion** for concise class definitions

### Error Handling and Safety
- Use **typed exceptions** with proper exception hierarchies
- Implement **null coalescing** operators (??, ??=) for safe access
- Use **nullsafe operator** (?->) for chain safety
- Implement **str_contains**, **str_starts_with**, **str_ends_with** for string operations
- Use **array_key_first** and **array_key_last** for array operations

### Attributes and Reflection
- Use **attributes** for metadata instead of docblock annotations
- Implement **reflection** for dynamic behavior when necessary
- Use **ReflectionAttribute** for attribute processing
- Implement **custom attributes** for domain-specific metadata
- Use **attribute-driven** validation and serialization

## Framework Integration

### Laravel Patterns (Recommended)
- Use **Eloquent ORM** for database operations
- Implement **service providers** for dependency registration
- Use **facades** for clean syntax and testability
- Implement **middleware** for cross-cutting concerns
- Use **form requests** for input validation

### Symfony Components
- Use **HttpFoundation** for request/response handling
- Implement **Console Component** for CLI applications
- Use **Validator** component for data validation
- Implement **EventDispatcher** for event-driven architecture
- Use **DependencyInjection** container for IoC

### PSR Standards Compliance
- Follow **PSR-1** Basic Coding Standard
- Implement **PSR-12** Extended Coding Style
- Use **PSR-4** for autoloading
- Implement **PSR-7** for HTTP message interfaces
- Use **PSR-15** for HTTP middleware

## Database Integration

### PDO and Database Best Practices
- Use **PDO** with prepared statements for all database operations
- Implement **connection pooling** where available
- Use **transactions** for data consistency
- Implement **query builder** patterns for dynamic queries
- Use **database migrations** for schema management

### ORM Integration
- Use **Eloquent** (Laravel), **Doctrine** (Symfony), or **Cycle ORM**
- Implement **repository pattern** for data access abstraction
- Use **entity relationships** appropriately
- Implement **query optimization** with eager loading
- Use **database seeding** for development and testing

### Caching Strategies
- Implement **Redis** or **Memcached** for application caching
- Use **query result caching** for expensive operations
- Implement **object caching** for frequently accessed data
- Use **HTTP caching** headers for browser caching
- Implement **cache invalidation** strategies

## Testing Standards

### Unit Testing with PHPUnit
- Write **unit tests** using PHPUnit framework
- Use **test doubles** (mocks, stubs, spies) for isolation
- Implement **data providers** for parameterized testing
- Use **test fixtures** for shared test setup
- Achieve **minimum 80% code coverage**

### Testing Patterns
- Use **AAA pattern** (Arrange, Act, Assert) for test structure
- Implement **integration tests** with database transactions
- Use **feature tests** for end-to-end scenarios
- Implement **API testing** with HTTP assertions
- Use **pest** or **phpspec** for BDD-style testing

### Testing Tools and Techniques
- Use **Mockery** for advanced mocking scenarios
- Implement **database testing** with transactions
- Use **HTTP testing** with Guzzle or framework clients
- Implement **browser testing** with Laravel Dusk or similar
- Use **mutation testing** with Infection for test quality

## Security Best Practices

### Input Validation and Sanitization
- **Validate all inputs** using filter functions or validation libraries
- Use **htmlspecialchars** and **filter_var** for output escaping
- Implement **CSRF protection** for all forms
- Use **prepared statements** to prevent SQL injection
- Validate **file uploads** with proper type and size checking

### Authentication and Authorization
- Use **password_hash** and **password_verify** for password handling
- Implement **JWT tokens** or **session-based** authentication
- Use **role-based access control** (RBAC) patterns
- Implement **two-factor authentication** where appropriate
- Use **secure session** configuration

### General Security Measures
- Set **secure HTTP headers** (CSP, HSTS, X-Frame-Options)
- Use **HTTPS** for all production environments
- Implement **rate limiting** for API endpoints
- Use **input sanitization** and **output encoding**
- Keep **dependencies updated** and scan for vulnerabilities

## Performance Optimization

### Code Performance
- Use **opcache** for bytecode caching
- Implement **lazy loading** for expensive operations
- Use **generator functions** for memory-efficient iteration
- Implement **connection reuse** for external services
- Use **array functions** instead of loops where appropriate

### Caching and Optimization
- Implement **application-level caching** with Redis/Memcached
- Use **HTTP caching** with proper cache headers
- Implement **database query optimization**
- Use **CDN** for static assets
- Implement **image optimization** and **compression**

### Memory and Resource Management
- Use **unset()** to free memory when appropriate
- Implement **connection pooling** for database connections
- Use **streaming** for large file processing
- Implement **garbage collection** considerations
- Monitor **memory usage** and **execution time**

## API Development

### RESTful API Design
- Follow **REST principles** for API design
- Use **proper HTTP status codes** and **methods**
- Implement **resource-based URLs** with consistent naming
- Use **JSON** for data exchange with proper content types
- Implement **API versioning** strategies

### API Security and Documentation
- Implement **API authentication** with tokens or OAuth
- Use **rate limiting** and **throttling** for API protection
- Implement **input validation** and **output formatting**
- Use **OpenAPI/Swagger** for API documentation
- Implement **API testing** with automated test suites

## Package Management and Dependencies

### Composer Integration
- Use **composer.json** for dependency management
- Implement **semantic versioning** for packages
- Use **autoloading** with PSR-4 standards
- Implement **development dependencies** separation
- Use **composer scripts** for automation

### Package Development
- Create **reusable packages** with proper namespacing
- Implement **service providers** for framework integration
- Use **package discovery** for automatic registration
- Implement **configuration publishing** for customization
- Use **testing** and **documentation** for package quality

## Development Environment

### Local Development Setup
- Use **Docker** for consistent development environments
- Implement **PHP-FPM** with **Nginx** for production-like setup
- Use **Xdebug** for debugging and profiling
- Implement **hot reloading** for development efficiency
- Use **database seeding** for consistent test data

### Code Quality Tools
- Use **PHP_CodeSniffer** for coding standards
- Implement **PHPMD** for mess detection
- Use **PHPStan** or **Psalm** for static analysis
- Implement **rector** for automated refactoring
- Use **infection** for mutation testing

## Tech Stack Requirements

### Core Dependencies
- **PHP 8.3+** - modern language features
- **Composer** - dependency management
- **ext-json** - JSON processing
- **ext-pdo** - database abstraction
- **ext-mbstring** - multibyte string handling

### Popular Frameworks and Libraries
- **Laravel** - full-stack web framework
- **Symfony** - component-based framework
- **Guzzle** - HTTP client library
- **Monolog** - logging library
- **Carbon** - date manipulation

### Development Tools
- **PHPStorm** or **VS Code** - IDEs
- **Xdebug** - debugging and profiling
- **PHPUnit** - testing framework
- **Composer** - package manager
- **Docker** - containerization

## IDE Integration Guidelines

### Universal IDE Compatibility
- **PHPStorm** - comprehensive PHP IDE
- **VS Code** with PHP extensions
- **Sublime Text** with PHP packages
- **Vim/Neovim** with PHP plugins

### Development Workflow
- Use **code completion** and **type hinting**
- Implement **debugging** with Xdebug integration
- Use **version control** with Git integration
- Set up **automated testing** in IDE
- Use **code formatting** and **style checking**
