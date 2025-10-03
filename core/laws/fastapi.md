---
trigger: glob
globs: main.py,**/routers/*.py,**/dependencies/*.py,**/models/*.py
---

# Universal FastAPI Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/api/routers/users/endpoints/
  ├── create_user.py   (≤80 lines)
  ├── get_user.py      (≤80 lines)
  └── update_user.py   (≤80 lines)
  ```
- **Smallest possible files** - decompose at endpoint, dependency, and model levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `__init__.py` files solely for imports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PMD CPD, pylint, jscpd, custom Python AST scripts
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable dependencies, implement generic CRUD operations, refactor async patterns
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE integration
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and database queries**
- Use **environment variables** and **dependency injection** for all parameters
- Derive parameters from historical data and performance metrics
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions (PEP 8 Compliance)
- **snake_case** for variables, functions, and module names
- **PascalCase** for class names and Pydantic models
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Hints and Static Analysis
- **Always use type hints** for function parameters, return values, and Pydantic fields
- Use **mypy** for static type checking across the entire codebase
- Leverage **typing** module: `Union`, `Optional`, `List`, `Dict`, `Annotated`
- Use **Pydantic models** for all request/response data structures
- Implement **generic models** for reusable components

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
- Use **asyncio.timeout()** or **asyncio.wait_for()** for timeout handling

### Async Operations
- Implement **retry mechanisms** with exponential backoff for external services
- Use **httpx** with async support for HTTP requests
- Use **asyncio.sleep()** for non-blocking delays
- Implement **graceful shutdown** patterns with signal handling

## Error Handling and Safety

### Exception Management
- Create **custom HTTPException classes** with appropriate status codes
- Use **specific exception types** rather than generic exceptions
- Implement **global exception handlers** using FastAPI exception handlers
- Handle errors and edge cases early with appropriate HTTP responses

### Logging and Monitoring
- Use **structured logging** with FastAPI built-in logging
- Implement **correlation IDs** for request tracing across microservices
- Use **appropriate log levels**: DEBUG, INFO, WARNING, ERROR, CRITICAL
- Implement **circuit breaker patterns** for external service calls

## FastAPI Patterns

### Application Structure
- Use **APIRouter** for organizing related endpoints
- Implement **dependency injection** using FastAPI's Depends system
- Use **middleware** for cross-cutting concerns like CORS, authentication, logging
- Structure **main.py** as application factory with minimal logic
- Implement **lifespan events** for startup and shutdown procedures

### Request/Response Patterns
- Use **Pydantic models** for all request and response schemas
- Implement **response models** with proper status codes
- Use **Form**, **File**, **UploadFile** for multipart data
- Leverage **Query**, **Path**, **Header** for parameter extraction
- Implement **background tasks** for async operations

### Authentication and Security
- Use **OAuth2** with JWT tokens for authentication
- Implement **dependency injection** for authentication checks
- Use **scopes** for fine-grained permissions
- Implement **rate limiting** using slowapi or similar
- Use **HTTPS** and proper CORS configuration

### Validation and Serialization
- Use **Pydantic validators** for custom validation logic
- Implement **field validation** with Field() constraints
- Use **Config class** for Pydantic model configuration
- Implement **custom serializers** for complex data types
- Use **alias generators** for consistent API naming

## Database Integration

### ORM Patterns
- Use **SQLAlchemy** with async support for database operations
- Implement **repository pattern** for data access layer
- Use **database sessions** with dependency injection
- Implement **transaction management** with context managers
- Use **database migrations** with Alembic

### Query Optimization
- Use **lazy loading** and **eager loading** appropriately
- Implement **query result caching** with Redis or similar
- Use **database indexes** for frequently queried fields
- Implement **pagination** for large result sets
- Monitor **query performance** and optimize slow queries

## Testing Requirements

### Testing Standards
- Write **unit tests** using pytest with FastAPI test client
- Use **pytest-asyncio** for testing async endpoints
- Implement **integration tests** for database operations
- Use **test fixtures** for database setup and teardown
- Achieve **minimum 80% code coverage**

### Test Organization
- Use **TestClient** for endpoint testing
- Implement **database test fixtures** with clean state
- Use **mock dependencies** for external service testing
- Test **authentication and authorization** flows
- Implement **performance tests** for critical endpoints

## Performance Optimization

### Runtime Optimization
- Use **async/await** for I/O-bound operations
- Implement **connection pooling** for database and external services
- Use **caching** strategies with Redis or in-memory caching
- Implement **response compression** for large payloads
- Use **streaming responses** for large data transfers

### Monitoring and Observability
- Implement **health checks** for service monitoring
- Use **metrics collection** with Prometheus or similar
- Implement **distributed tracing** with OpenTelemetry
- Use **application performance monitoring** tools
- Implement **logging aggregation** for centralized monitoring

## Deployment Patterns

### Container and Orchestration
- Use **Docker** for containerization with multi-stage builds
- Implement **Kubernetes** deployments with proper resource limits
- Use **environment-specific configuration** with configmaps
- Implement **health checks** and **readiness probes**
- Use **horizontal pod autoscaling** for load management

### Production Considerations
- Use **Gunicorn** with Uvicorn workers for production deployment
- Implement **graceful shutdown** handling
- Use **reverse proxy** with Nginx for static file serving
- Implement **SSL termination** and security headers
- Use **monitoring and alerting** for production issues

## Tech Stack Requirements

### Core Dependencies
- **fastapi** - web framework
- **uvicorn** - ASGI server
- **pydantic** - data validation
- **sqlalchemy** - database ORM
- **alembic** - database migrations

### Development Dependencies
- **pytest** and **pytest-asyncio** - testing
- **mypy** - type checking
- **black** - code formatting
- **isort** - import sorting
- **pylint** - linting

## Security Best Practices

### API Security
- Implement **input validation** using Pydantic models
- Use **parameterized queries** to prevent SQL injection
- Implement **rate limiting** to prevent abuse
- Use **CORS** configuration for cross-origin requests
- Implement **request size limits** to prevent DoS attacks

### Authentication Security
- Use **secure JWT tokens** with proper expiration
- Implement **refresh token** rotation
- Use **password hashing** with bcrypt or similar
- Implement **account lockout** after failed attempts
- Use **secure cookie** settings for session management
