# Universal Python Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── core/
  │   ├── processing/
  │   │   ├── validation/
  │   │   │   ├── input_validator.py   (≤80 lines)
  │   │   │   ├── format_checker.py    (≤80 lines)
  │   │   │   └── schema_validator.py  (≤80 lines)
  ```
- **Smallest possible files** - decompose at function, class, and logic levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `__init__.py` files solely for imports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy of the same functionalities
- **Use automated duplicate detection tools** before every commit and deployment:
  - **PMD CPD (Copy/Paste Detector)** for fast command-line duplicate detection
  - **pylint** with duplicate code detection enabled
  - **jscpd** for cross-language duplicate detection including Python
  - **Custom Python scripts** using AST parsing for project-specific duplicate detection
- **If any duplicacy found**, optimize immediately without disturbing the system:
  - **Extract common functionality** into shared modules following deep subfolder patterns
  - **Create reusable classes** and functions for common operations
  - **Implement generic functions** using type hints and generics
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
- Use **environment variables** and **configuration files** for all parameters
- Derive parameters from historical data and performance metrics stored in databases
- Calculate timeout values, retry intervals, and connection limits based on observed performance
- Implement dynamic parameter adjustment based on real-time system load and metrics

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** at appropriate places within functionality or **remove entirely**
- Ensure every declared variable serves specific purpose: computation, logging, error handling, or state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions (PEP 8 Compliance)
- Use **descriptive variable names** that convey intent: `connection_is_healthy`, `request_has_completed`
- **snake_case** for variables, functions, and module names
- **PascalCase** for class names
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Hints and Static Analysis
- **Always use type hints** for function parameters, return values, and class attributes
- Use **mypy** for static type checking across the entire codebase
- Leverage **typing** module for complex types: `Union`, `Optional`, `List`, `Dict`, `Protocol`
- Use **dataclasses** or **pydantic** models for structured data
- Implement **generic types** where appropriate for reusable components

## Async Programming Standards

### AsyncIO Runtime Management
- Use **asyncio** as async runtime for handling asynchronous tasks and I/O operations
- Implement **async def** syntax with proper error propagation using try/except blocks
- Leverage **asyncio.create_task()** for task spawning and parallel processing
- Use **asyncio.gather()** for concurrent execution of multiple coroutines
- Favor **async context managers** for resource management and cleanup

### Concurrency Patterns
- **asyncio.Queue** for asynchronous producer-consumer patterns
- **asyncio.Event** and **asyncio.Condition** for coordination between coroutines
- **asyncio.Semaphore** for limiting concurrent access to resources
- **asyncio.Lock** for protecting shared state in async contexts
- Use **asyncio.timeout()** (Python 3.11+) or **asyncio.wait_for()** for timeout handling

### Async Operations
- Implement **retry mechanisms** with exponential backoff for external services
- Use **aiohttp** for async HTTP requests with session management
- Use **asyncio.sleep()** for non-blocking delays
- Implement **graceful shutdown** patterns with signal handling

## Error Handling and Safety

### Exception Management
- Create **custom exception hierarchies** inheriting from appropriate base exceptions
- Use **specific exception types** rather than generic Exception catching
- Implement **proper exception chaining** using `raise ... from ...`
- Handle errors and edge cases early with appropriate exception raising

### Logging and Monitoring
- Use **structured logging** with Python's logging module
- Implement **correlation IDs** for request tracing across microservices
- Use **appropriate log levels**: DEBUG, INFO, WARNING, ERROR, CRITICAL
- Implement **circuit breaker patterns** for external service calls with proper fallback strategies

## Web Framework Patterns (FastAPI/Django/Flask)

### API Design and Organization
- Structure applications using **dependency injection** patterns
- Use **Pydantic models** for request/response validation and serialization
- Implement **middleware** for cross-cutting concerns like authentication and logging
- Use **appropriate HTTP status codes** and error responses
- Structure **route handlers** as small, focused async functions

### FastAPI Specific Patterns
- Use **FastAPI dependency injection** system for shared resources
- Leverage **automatic OpenAPI documentation** generation
- Implement **background tasks** for non-blocking operations
- Use **SQLAlchemy** with async support for database operations

### Django Specific Patterns
- Use **Django REST framework** for API development
- Implement **async views** where appropriate (Django 4.1+)
- Use **Django ORM** with async support for database operations
- Leverage **Django middleware** for request processing

## Performance Optimization

### Runtime Optimization
- Use **appropriate data structures**: `set` for membership tests, `collections.deque` for queues
- Implement **lazy evaluation** where possible using generators and iterators
- Use **list comprehensions** and **generator expressions** for efficient data processing
- Leverage **multiprocessing** for CPU-intensive tasks, **asyncio** for I/O-bound tasks

### Memory Management
- Use **context managers** for proper resource cleanup
- Implement **object pooling** for expensive-to-create objects
- Use **slots** in classes to reduce memory overhead when appropriate
- Monitor and optimize **garbage collection** patterns

## Testing Requirements

### Testing Standards
- Write **unit tests** using **pytest** with async support
- Use **pytest-asyncio** for testing async functions
- Implement **integration tests** to validate system behavior
- Use **unittest.mock** or **pytest-mock** for mocking external dependencies
- Achieve **minimum 80% code coverage** with meaningful tests

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **parametrized tests** for testing multiple scenarios
- Implement **fixtures** for reusable test setup
- Use **factory patterns** for test data generation

## Database and External Service Patterns

### Database Integration
- Use **async database drivers**: `asyncpg` for PostgreSQL, `aiomysql` for MySQL
- Implement **connection pooling** with appropriate pool sizes
- Use **database migrations** for schema management
- Implement **query optimization** and **indexing strategies**

### External Service Integration
- Use **aiohttp** or **httpx** for async HTTP client operations
- Implement **retry mechanisms** with exponential backoff
- Use **circuit breaker patterns** for fault tolerance
- Implement **rate limiting** to respect API quotas

## Tech Stack Requirements

### Core Dependencies
- **asyncio** - async runtime and concurrency
- **pydantic** - data validation and serialization
- **aiohttp** or **httpx** - async HTTP client
- **sqlalchemy** - database ORM with async support
- **pytest** and **pytest-asyncio** - testing framework

### Development Dependencies
- **mypy** - static type checking
- **black** - code formatting
- **isort** - import sorting
- **pylint** or **flake8** - linting
- **bandit** - security vulnerability scanning

## Documentation Standards

### Code Documentation
- Use **docstrings** following Google or NumPy style conventions
- Include **type hints** in all function signatures
- Document **complex algorithms** and **business logic**
- Use **sphinx** for generating API documentation

### API Documentation
- Generate **OpenAPI/Swagger** documentation automatically
- Provide **usage examples** in docstrings
- Document **error conditions** and **expected behaviors**
- Include **performance characteristics** for critical functions

## File Organization Rules

### Module Structure
- Separate concerns into logical modules with clear boundaries
- Use **packages** (directories with `__init__.py`) for grouping related modules
- Maintain **consistent depth levels** across similar functionalities
- Follow **microservices decomposition** at every level of the application hierarchy

### Project Layout
```
src/
├── core/           # Core business logic
├── api/            # API handlers and routing
├── database/       # Database models and operations
├── services/       # External service integrations
├── utils/          # Shared utilities
├── shared/         # Common types and classes
└── tests/          # Test modules mirroring src structure
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **Python Language Server** integration for all major IDEs
- **Pylsp**, **Pyright**, or **Jedi** for code intelligence
- **Black** and **isort** integration for automatic formatting
- **Mypy** integration for real-time type checking

### Development Workflow
- Use **pre-commit hooks** for code quality enforcement
- Implement **virtual environments** for dependency isolation
- Use **requirements.txt** or **pyproject.toml** for dependency management
- Set up **continuous integration** with comprehensive testing

## Security and Best Practices

### Security Guidelines
- **Never hardcode secrets** - use environment variables or secret management systems
- Validate **all input data** using Pydantic or similar validation libraries
- Use **parameterized queries** to prevent SQL injection
- Implement **proper authentication** and **authorization** patterns
- Use **HTTPS** for all external communications

### Code Quality
- Follow **PEP 8** style guidelines consistently
- Use **f-strings** for string formatting (Python 3.6+)
- Implement **proper exception handling** without bare except clauses
- Use **context managers** for resource management
- Avoid **global variables** and **mutable default arguments**

## Package Management and Deployment

### Dependency Management
- Use **poetry** or **pipenv** for advanced dependency management
- Pin **exact versions** in production requirements
- Use **virtual environments** for development isolation
- Implement **security scanning** for dependencies

### Deployment Patterns
- Use **Docker** for containerized deployments
- Implement **health checks** for monitoring application status
- Use **gunicorn** with **uvicorn workers** for ASGI applications
- Implement **graceful shutdown** handling for production deployments