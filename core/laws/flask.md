---
trigger: glob
globs: app.py,wsgi.py,**/views/*.py,**/models/*.py,**/forms/*.py,requirements.txt
---

# Universal Flask Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/app/blueprints/users/views/
  ├── create_user.py   (≤80 lines)
  ├── get_user.py      (≤80 lines)
  └── update_user.py   (≤80 lines)
  ```
- **Smallest possible files** - decompose at view, template, and model levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `__init__.py` files solely for imports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PMD CPD, pylint, jscpd, custom Python AST scripts
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable functions/classes, implement generic CRUD operations, refactor patterns into utilities
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE extensions
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and database queries**
- Use **environment variables** and **config objects** for all parameters
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
- **PascalCase** for class names and models
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Hints and Static Analysis
- **Always use type hints** for function parameters, return values, and class attributes
- Use **mypy** for static type checking across the entire codebase
- Leverage **typing** module: `Union`, `Optional`, `List`, `Dict`, `Annotated`
- Use **dataclasses** or **namedtuples** for structured data
- Implement **generic types** for reusable components

## Flask Application Structure

### Application Factory Pattern
- Use **application factory** pattern for creating Flask apps
- Implement **configuration classes** for different environments
- Use **blueprints** for organizing related routes and views
- Implement **error handlers** for consistent error responses
- Use **middleware** for cross-cutting concerns

### Blueprint Organization
- Create **feature-based blueprints** for logical grouping
- Use **blueprint prefixes** for URL organization
- Implement **blueprint-specific error handlers**
- Use **before_request** and **after_request** hooks appropriately
- Organize **static files** and **templates** by blueprint

### Configuration Management
- Use **environment-specific config classes**
- Implement **secure secret management** with environment variables
- Use **Flask-Env** for development environment configuration
- Implement **feature flags** for gradual rollouts
- Use **configuration validation** on startup

## Request Handling Patterns

### Route Definition
- Use **blueprint routes** instead of app routes
- Implement **RESTful URL patterns** consistently
- Use **URL parameters** and **query parameters** appropriately
- Implement **content negotiation** for different response formats
- Use **method decorators** for HTTP method handling

### Request Validation
- Use **Flask-WTF** or **marshmallow** for form validation
- Implement **request data validation** with schemas
- Use **custom validators** for business logic validation
- Implement **CSRF protection** for all forms
- Validate **file uploads** with proper size and type checks

### Response Formatting
- Use **consistent JSON response format**
- Implement **HTTP status codes** appropriately
- Use **Flask-CORS** for cross-origin resource sharing
- Implement **response compression** for large payloads
- Use **caching headers** for appropriate resources

## Database Integration

### SQLAlchemy Patterns
- Use **Flask-SQLAlchemy** for ORM operations
- Implement **database migrations** with Flask-Migrate
- Use **relationship loading** strategies appropriately
- Implement **connection pooling** and **session management**
- Use **database indexes** for performance optimization

### Model Design
- Create **base model classes** with common fields
- Use **model relationships** appropriately: foreign keys, joins
- Implement **model validation** at the database level
- Use **model serialization** with marshmallow or similar
- Implement **soft deletes** where appropriate

### Query Optimization
- Use **query optimization** techniques to avoid N+1 problems
- Implement **pagination** for large result sets
- Use **database transactions** for data consistency
- Implement **query result caching** with Redis
- Monitor **query performance** and optimize slow queries

## Authentication and Security

### User Authentication
- Use **Flask-Login** for session management
- Implement **password hashing** with bcrypt or Argon2
- Use **JWT tokens** for API authentication
- Implement **OAuth integration** with Flask-OAuthlib
- Use **two-factor authentication** for enhanced security

### Authorization Patterns
- Implement **role-based access control** (RBAC)
- Use **decorators** for route-level authorization
- Implement **permission-based access** for fine-grained control
- Use **resource-based authorization** where appropriate
- Implement **audit logging** for security events

### Security Best Practices
- Implement **input sanitization** to prevent XSS
- Use **parameterized queries** to prevent SQL injection
- Implement **rate limiting** with Flask-Limiter
- Use **secure headers** with Flask-Talisman
- Implement **HTTPS enforcement** in production

## Testing Requirements

### Testing Standards
- Write **unit tests** using pytest with Flask test client
- Use **test fixtures** for database setup and teardown
- Implement **integration tests** for complete request flows
- Use **mocking** for external service dependencies
- Achieve **minimum 80% code coverage**

### Test Organization
- Use **conftest.py** for shared test fixtures
- Implement **test database** separate from development
- Use **factory patterns** for test data creation
- Test **authentication and authorization** flows
- Implement **API endpoint testing** with proper assertions

### Performance Testing
- Implement **load testing** for critical endpoints
- Test **database query performance** under load
- Use **profiling tools** to identify bottlenecks
- Test **memory usage** and **resource consumption**
- Implement **stress testing** for high-traffic scenarios

## Template and Frontend Integration

### Template Organization
- Use **Jinja2 templates** with proper inheritance
- Implement **template caching** for performance
- Use **template macros** for reusable components
- Implement **template security** with auto-escaping
- Organize **static assets** efficiently

### Frontend Asset Management
- Use **Flask-Assets** for asset bundling and minification
- Implement **cache busting** for static assets
- Use **CDN integration** for static file serving
- Implement **responsive design** with proper breakpoints
- Use **modern CSS and JavaScript** frameworks appropriately

## Deployment Patterns

### Production Configuration
- Use **Gunicorn** or **uWSGI** for production deployment
- Implement **reverse proxy** configuration with Nginx
- Use **environment variables** for production secrets
- Implement **logging configuration** for production
- Use **monitoring and alerting** for application health

### Container Deployment
- Use **Docker** for containerization with multi-stage builds
- Implement **Docker Compose** for development environments
- Use **Kubernetes** for orchestration in production
- Implement **health checks** and **readiness probes**
- Use **horizontal scaling** strategies

## Performance Optimization

### Application Performance
- Implement **caching strategies** with Flask-Caching
- Use **database query optimization** techniques
- Implement **connection pooling** for external services
- Use **async processing** with Celery for background tasks
- Implement **content compression** and **minification**

### Monitoring and Observability
- Use **application performance monitoring** tools
- Implement **structured logging** with correlation IDs
- Use **metrics collection** with Prometheus
- Implement **distributed tracing** for request flows
- Use **error tracking** with Sentry or similar tools

## Tech Stack Requirements

### Core Dependencies
- **flask** - web framework
- **flask-sqlalchemy** - database ORM
- **flask-migrate** - database migrations
- **flask-wtf** - form handling and CSRF protection
- **flask-login** - user session management

### Development Dependencies
- **pytest** - testing framework
- **flask-testing** - Flask-specific testing utilities
- **coverage** - code coverage measurement
- **mypy** - static type checking
- **black** - code formatting

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Python and Flask extensions
- **PyCharm** with Flask support
- **Sublime Text** with Python packages
- **Vim/Neovim** with Python plugins

### Development Workflow
- Use **virtual environments** for dependency isolation
- Implement **hot reloading** in development mode
- Use **debugger integration** for development
- Set up **linting and formatting** automation
- Use **pre-commit hooks** for code quality gates
