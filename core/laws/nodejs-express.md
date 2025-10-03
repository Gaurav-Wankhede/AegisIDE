---
trigger: glob
globs: *.js,*.ts,package.json,server.js,app.js,express,nodejs,node_modules
---

# Universal Node.js/Express.js Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/routes/api/users/profile/avatar_route.js` (≤80 lines)
- **Smallest possible files** - decompose at route, middleware, and service levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: ESLint, JSHint, custom Node.js analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable middleware, implement utility modules, refactor into packages
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **configuration files** for all parameters
- Implement dynamic parameter adjustment based on real-time system performance

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, request processing
- When implementing stub routes, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for variables, functions, and object properties
- **PascalCase** for classes and constructors
- **UPPER_CASE** for constants and environment variables
- **kebab-case** for file names and package names
- **Descriptive, action-oriented names** for deepest route hierarchies

## Modern Node.js Development (2025)

### Node.js Runtime Optimization
- Use **Node.js 20+** with latest LTS features
- Implement **ES modules** with import/export syntax
- Use **async/await** consistently throughout the application
- Leverage **Worker Threads** for CPU-intensive tasks
- Implement **Cluster mode** for multi-core utilization

### Express.js Framework Patterns
- Use **Express 4.18+** with modern middleware patterns
- Implement **router-level middleware** for modular route handling
- Use **application-level middleware** for cross-cutting concerns
- Leverage **error-handling middleware** with proper error propagation
- Implement **custom middleware** for authentication and authorization

### Modern JavaScript Features
- Use **destructuring assignment** for cleaner parameter handling
- Implement **template literals** for string interpolation
- Use **arrow functions** for concise callback syntax
- Leverage **optional chaining** and **nullish coalescing** operators
- Implement **modules** with proper import/export patterns

## Request Handling and Routing

### Express Router Patterns
- Use **express.Router()** for modular route organization
- Implement **route parameters** with proper validation
- Use **query parameter handling** with sanitization
- Leverage **request body parsing** with middleware
- Implement **response formatting** with consistent JSON structure

### RESTful API Design
- Follow **REST principles** for resource-based routing
- Use **HTTP methods** appropriately (GET, POST, PUT, DELETE, PATCH)
- Implement **status codes** correctly for different scenarios
- Use **resource nesting** for hierarchical data relationships
- Implement **API versioning** strategies for backward compatibility

### Request Validation and Sanitization
- Use **Joi** or **express-validator** for input validation
- Implement **schema validation** for request bodies
- Use **parameter sanitization** to prevent injection attacks
- Validate **file uploads** with proper size and type restrictions
- Implement **rate limiting** to prevent abuse

## Middleware and Error Handling

### Middleware Architecture
- Create **reusable middleware** functions for common operations
- Implement **authentication middleware** with JWT or session handling
- Use **logging middleware** with structured logging (Winston, Morgan)
- Create **CORS middleware** for cross-origin request handling
- Implement **compression middleware** for response optimization

### Error Handling Patterns
- Create **centralized error handling** middleware
- Implement **custom error classes** for different error types
- Use **async error handling** with proper promise rejection handling
- Create **error response formatting** for consistent API responses
- Implement **error logging** with appropriate log levels

### Security Middleware
- Use **helmet** for security headers
- Implement **express-rate-limit** for DoS protection
- Use **express-validator** for input sanitization
- Implement **CSRF protection** for state-changing operations
- Use **express-session** with secure session configuration

## Database Integration

### Database Connection Patterns
- Use **connection pooling** for database efficiency
- Implement **database health checks** for monitoring
- Use **environment-based configuration** for different environments
- Create **database migration** strategies for schema changes
- Implement **database seed data** for development and testing

### MongoDB Integration
- Use **Mongoose** for object document mapping
- Implement **schema validation** with Mongoose schemas
- Use **population** for document relationships
- Create **custom validators** for business logic validation
- Implement **aggregation pipelines** for complex queries

### SQL Database Integration
- Use **Sequelize** or **TypeORM** for SQL databases
- Implement **model definitions** with proper associations
- Use **migrations** for database schema management
- Create **seeds** for initial data population
- Implement **transactions** for data consistency

## Authentication and Authorization

### Authentication Strategies
- Implement **JWT authentication** with proper token management
- Use **session-based authentication** with secure session storage
- Create **OAuth integration** with external providers
- Implement **password hashing** with bcrypt or similar
- Use **refresh token** patterns for long-lived authentication

### Authorization Patterns
- Implement **role-based access control** (RBAC)
- Use **middleware-based authorization** for route protection
- Create **permission-based authorization** for granular control
- Implement **resource ownership** validation
- Use **API key authentication** for service-to-service communication

### Security Best Practices
- **Validate all inputs** at API boundaries
- Use **HTTPS only** for all production environments
- Implement **secure headers** with helmet middleware
- Use **environment variables** for sensitive configuration
- Create **audit logging** for security events

## API Documentation and Testing

### API Documentation
- Use **Swagger/OpenAPI** for API documentation
- Implement **JSDoc comments** for code documentation
- Create **Postman collections** for API testing
- Use **API documentation generators** from code
- Maintain **README** files with setup instructions

### Testing Strategies
- Write **unit tests** with Jest or Mocha
- Implement **integration tests** for API endpoints
- Use **supertest** for HTTP assertion testing
- Create **mock objects** for external dependencies
- Achieve **minimum 80% code coverage**

### Testing Best Practices
- Use **test-driven development** (TDD) where appropriate
- Implement **test fixtures** for consistent test data
- Create **test helpers** for common test operations
- Use **environment isolation** for test runs
- Implement **continuous integration** testing

## Performance Optimization

### Application Performance
- Use **caching strategies** with Redis or in-memory caching
- Implement **database query optimization** with proper indexing
- Use **connection pooling** for external services
- Create **response compression** with gzip middleware
- Implement **lazy loading** for large datasets

### Memory Management
- Monitor **memory usage** and implement cleanup
- Use **streaming** for large file processing
- Implement **garbage collection** optimization
- Create **memory leak detection** in monitoring
- Use **worker processes** for memory isolation

### Scalability Patterns
- Implement **horizontal scaling** with load balancers
- Use **microservices architecture** for large applications
- Create **API gateway** patterns for service orchestration
- Implement **event-driven architecture** with message queues
- Use **containerization** for deployment scalability

## Production Deployment

### Environment Configuration
- Use **environment variables** for configuration management
- Implement **configuration validation** at startup
- Create **different configs** for dev/staging/production
- Use **secrets management** for sensitive data
- Implement **feature flags** for gradual rollouts

### Process Management
- Use **PM2** for process management and monitoring
- Implement **graceful shutdown** handling
- Create **health check endpoints** for load balancers
- Use **log rotation** for file-based logging
- Implement **auto-restart** on failure

### Monitoring and Observability
- Implement **structured logging** with correlation IDs
- Use **application metrics** with Prometheus or similar
- Create **error monitoring** with Sentry or similar
- Implement **performance monitoring** with APM tools
- Use **distributed tracing** for microservices

## Tech Stack Requirements

### Core Dependencies
- **Node.js** (20+) - JavaScript runtime
- **Express.js** (4.18+) - web application framework
- **dotenv** - environment variable management
- **cors** - cross-origin resource sharing
- **helmet** - security middleware

### Development Dependencies
- **nodemon** - development auto-restart
- **jest** - testing framework
- **supertest** - HTTP assertion testing
- **eslint** - code linting
- **prettier** - code formatting

### Database and Utilities
- **mongoose** - MongoDB object modeling
- **sequelize** - SQL ORM
- **redis** - caching and session storage
- **winston** - logging library
- **joi** - data validation

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Node.js extensions
- **WebStorm** - comprehensive Node.js development
- **Atom** - lightweight development
- **Sublime Text** - with Node.js packages

### Development Workflow
- Use **language servers** for intelligent code completion
- Implement **debugging** with proper breakpoint support
- Use **version control** with appropriate .gitignore files
- Set up **automated testing** with CI/CD integration
- Use **code formatting** with Prettier integration
