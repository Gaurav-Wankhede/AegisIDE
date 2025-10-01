# Universal Flask Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── app/
  │   ├── blueprints/
  │   │   ├── users/
  │   │   │   ├── views/
  │   │   │   │   ├── create_user.py   (≤80 lines)
  │   │   │   │   ├── get_user.py      (≤80 lines)
  │   │   │   │   └── update_user.py   (≤80 lines)
  ```
- **Smallest possible files** - decompose at view, template, and model levels
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
  - **Create reusable functions** and classes for common operations
  - **Implement generic CRUD operations** using type hints and generics
  - **Refactor similar patterns** into common utilities in `shared/` subfolder
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
- Use **environment variables** and **config objects** for all parameters
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
- Use **descriptive variable names** that convey intent: `user_is_authenticated`, `response_has_completed`
- **snake_case** for variables, functions, and module names
- **PascalCase** for class names and models
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Hints and Static Analysis
- **Always use type hints** for function parameters, return values, and class attributes
- Use **mypy** for static type checking across the entire codebase
- Leverage **typing** module for complex types: `Union`, `Optional`, `List`, `Dict`, `Annotated`
- Use **dataclasses** or **namedtuples** for structured data
- Implement **generic types** where appropriate for reusable components

## Async Programming Standards

### AsyncIO Runtime Management
- Use **asyncio** as async runtime for handling asynchronous tasks and I/O operations when needed
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
- Use **aiohttp** for async HTTP requests
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

## Flask Framework Patterns

### Application Factory and Organization
- Use **application factory pattern** to create and configure the Flask app instance
- Structure applications using **Blueprints** for modular route organization
- Implement **extensions** like Flask-SQLAlchemy for database integration
- Use **Flask's config** object for application configuration
- Structure **views as functions** with clear parameter handling and template rendering

### Blueprint and View Patterns
- Organize routes into **Blueprints** grouped by feature or domain
- Use **Jinja2 templates** for HTML rendering with proper template inheritance
- Implement **form handling** with WTForms or similar libraries
- Use **Flask's error handlers** for custom error pages and responses
- Leverage **Flask extensions** for common functionality like authentication and caching

### Security Patterns
- Use **Flask-Login** or **Flask-Security** for authentication
- Implement **role-based access control** using decorators
- Use **CORS extensions** for cross-origin resource sharing
- Validate **all inputs** through form validation and request parsing

## Performance Optimization

### Runtime Optimization
- Use **appropriate data structures**: `set` for membership tests, `collections.deque` for queues
- Implement **lazy evaluation** using generators and iterators
- Use **list comprehensions** and **generator expressions** for efficient data processing
- Leverage **gevent** or **eventlet** for concurrent execution in WSGI environments

### Memory Management
- Use **context managers** for proper resource cleanup
- Implement **object pooling** for expensive-to-create objects
- Monitor and optimize **garbage collection** patterns
- Use **Flask's request context** efficiently for per-request resources

## Testing Requirements

### Testing Standards
- Write **unit tests** using **pytest** or Flask's test client
- Use **pytest-flask** for testing Flask applications
- Implement **integration tests** to validate full request cycles
- Use **unittest.mock** or **pytest-mock** for mocking dependencies
- Achieve **minimum 80% code coverage** with meaningful tests

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **parametrized tests** for testing multiple scenarios
- Implement **fixtures** for reusable test setup including app instances
- Use **factory patterns** for test data generation

## Database and External Service Patterns

### Database Integration
- Use **Flask-SQLAlchemy** for ORM operations
- Implement **database sessions** using app context
- Use **Alembic** for database migrations
- Implement **query optimization** and **indexing strategies**

### External Service Integration
- Use **requests** for HTTP client operations
- Implement **retry mechanisms** with exponential backoff
- Use **circuit breaker patterns** for fault tolerance
- Implement **rate limiting** to respect API quotas

## Tech Stack Requirements

### Core Dependencies
- **flask** - web framework for application development
- **flask-sqlalchemy** - database ORM integration
- **flask-migrate** - database migrations
- **jinja2** - template engine
- **werkzeug** - WSGI utilities

### Development Dependencies
- **pytest** and **pytest-flask** - testing framework
- **mypy** - static type checking
- **black** - code formatting
- **isort** - import sorting
- **pylint** or **flake8** - linting

## Documentation Standards

### Code Documentation
- Use **docstrings** following Google or NumPy style conventions
- Include **type hints** in all function signatures
- Document **complex algorithms** and **business logic**
- Use **sphinx** for generating API documentation

### API Documentation
- Generate **API documentation** using Flask extensions like Flask-RESTful
- Provide **usage examples** in docstrings
- Document **error conditions** and **expected behaviors**
- Include **performance characteristics** for critical views

## File Organization Rules

### Module Structure
- Separate concerns into logical modules with clear boundaries
- Use **packages** (directories with `__init__.py`) for grouping related modules
- Maintain **consistent depth levels** across similar functionalities
- Follow **microservices decomposition** at every level of the application hierarchy

### Project Layout
```
src/
├── app/
│   ├── blueprints/  # Modular route definitions
│   ├── models/     # Database models
│   ├── views/      # View functions
│   ├── templates/  # Jinja2 templates
│   ├── static/     # Static assets
│   └── extensions/ # Flask extensions setup
├── config/         # Configuration classes
├── utils/          # Shared utilities
├── shared/         # Common types and configs
└── tests/          # Test modules mirroring app structure
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
- Validate **all input data** using WTForms or similar
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
- Use **gunicorn** for production WSGI serving
- Implement **graceful shutdown** handling for production deployments