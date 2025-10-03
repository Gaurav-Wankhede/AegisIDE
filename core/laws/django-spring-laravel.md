---
trigger: glob
globs: *.py,*.java,*.php,django,spring,laravel,requirements.txt,pom.xml,composer.json
---

# Universal Enterprise Backend Framework Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/main/java/com/app/user/profile/controller/AvatarController.java` (≤80 lines)
- **Smallest possible files** - decompose at controller, service, and repository levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **enterprise modular architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: SonarQube, ESLint, PyLint, CheckStyle
- **If any duplicacy found**, optimize immediately: extract common services, create reusable components, implement shared utilities, refactor into libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in enterprise application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **configuration files** for all parameters
- Implement dynamic parameter adjustment based on real-time system performance

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, business logic
- When implementing stub services, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **snake_case** for Python variables and functions (Django)
- **camelCase** for Java variables and methods (Spring Boot)
- **camelCase** for PHP variables and functions (Laravel)
- **PascalCase** for classes and interfaces
- **UPPER_CASE** for constants and environment variables

## Modern Enterprise Frameworks (2025)

### Django Framework (Python)
- Use **Django 5+** with latest LTS features
- Implement **Django REST Framework** for API development
- Use **Django ORM** with proper model relationships
- Leverage **Django Admin** for administrative interfaces
- Implement **Django Channels** for real-time functionality

### Spring Boot Framework (Java)
- Use **Spring Boot 3+** with Jakarta EE migration
- Implement **Spring Security** for authentication and authorization
- Use **Spring Data JPA** for database abstraction
- Leverage **Spring Cloud** for microservices patterns
- Implement **Spring WebFlux** for reactive programming

### Laravel Framework (PHP)
- Use **Laravel 11+** with modern PHP features
- Implement **Eloquent ORM** for database operations
- Use **Laravel Sanctum** for API authentication
- Leverage **Laravel Horizon** for queue management
- Implement **Laravel Octane** for performance optimization

## MVC Architecture Patterns

### Model Layer Implementation
- **Django**: Use **Django Models** with proper field types and relationships
- **Spring Boot**: Implement **JPA Entities** with annotations and relationships
- **Laravel**: Create **Eloquent Models** with proper relationships and scopes
- Use **validation rules** at the model level
- Implement **model events** and **observers** for business logic

### View Layer Patterns
- **Django**: Use **Django Templates** with proper context handling
- **Spring Boot**: Implement **Thymeleaf** or **RESTful APIs** for frontend
- **Laravel**: Use **Blade Templates** with component-based architecture
- Create **view composers** for shared data
- Implement **responsive design** with proper CSS frameworks

### Controller Layer Design
- **Django**: Implement **Class-Based Views** and **Function-Based Views**
- **Spring Boot**: Use **@RestController** and **@Controller** annotations
- **Laravel**: Create **Resource Controllers** with proper HTTP methods
- Implement **request validation** at controller level
- Use **dependency injection** for service integration

## Database Integration and ORM

### Django ORM Patterns
- Use **Model relationships** (ForeignKey, ManyToMany, OneToOne)
- Implement **QuerySets** with proper filtering and optimization
- Create **custom managers** for reusable query logic
- Use **database migrations** for schema management
- Implement **database indexes** for performance optimization

### Spring Data JPA
- Use **JPA annotations** for entity mapping
- Implement **Repository interfaces** with custom query methods
- Create **@Query** annotations for complex queries
- Use **database transactions** with @Transactional
- Implement **database connection pooling** for performance

### Laravel Eloquent ORM
- Use **Eloquent relationships** (hasOne, hasMany, belongsTo, belongsToMany)
- Implement **query scopes** for reusable query logic
- Create **database migrations** with proper rollback support
- Use **database seeders** for initial data population
- Implement **database factories** for testing data

## API Development and RESTful Services

### Django REST Framework
- Use **ViewSets** and **Generic Views** for API endpoints
- Implement **Serializers** for data validation and transformation
- Create **custom permissions** for access control
- Use **pagination** for large datasets
- Implement **API versioning** strategies

### Spring Boot REST APIs
- Use **@RestController** with proper HTTP method mappings
- Implement **@RequestBody** and **@ResponseBody** for JSON handling
- Create **custom exception handlers** with @ControllerAdvice
- Use **Spring HATEOAS** for hypermedia APIs
- Implement **API documentation** with OpenAPI/Swagger

### Laravel API Resources
- Use **API Resources** for data transformation
- Implement **Form Requests** for validation
- Create **API middleware** for authentication and rate limiting
- Use **Laravel Passport** or **Sanctum** for OAuth2/token authentication
- Implement **API versioning** with route prefixes

## Security and Authentication

### Django Security
- Use **Django's built-in authentication** system
- Implement **custom user models** with AbstractUser
- Create **permission and group** systems
- Use **CSRF protection** for forms
- Implement **SQL injection prevention** with ORM

### Spring Security
- Use **Spring Security** for comprehensive security
- Implement **JWT authentication** with proper token management
- Create **role-based access control** (RBAC)
- Use **method-level security** with @PreAuthorize
- Implement **OAuth2** integration with external providers

### Laravel Security
- Use **Laravel's authentication** scaffolding
- Implement **middleware** for route protection
- Create **policies** for authorization logic
- Use **CSRF protection** for forms
- Implement **rate limiting** for API endpoints

## Testing Strategies

### Django Testing
- Write **unit tests** with Django's TestCase
- Implement **integration tests** for API endpoints
- Use **test databases** for isolated testing
- Create **mock objects** with unittest.mock
- Achieve **minimum 80% code coverage**

### Spring Boot Testing
- Use **@SpringBootTest** for integration testing
- Implement **@WebMvcTest** for controller testing
- Create **@DataJpaTest** for repository testing
- Use **Testcontainers** for database testing
- Implement **MockMvc** for API testing

### Laravel Testing
- Write **Feature tests** for HTTP endpoints
- Implement **Unit tests** for business logic
- Use **database factories** and **seeders** for test data
- Create **mock objects** with Mockery
- Implement **API testing** with Laravel's HTTP testing

## Performance Optimization

### Caching Strategies
- **Django**: Use **Redis** or **Memcached** for caching
- **Spring Boot**: Implement **@Cacheable** annotations
- **Laravel**: Use **Cache facades** with multiple drivers
- Create **query result caching** for expensive operations
- Implement **page caching** for static content

### Database Optimization
- Use **database indexing** for frequently queried fields
- Implement **query optimization** with proper joins
- Create **database connection pooling**
- Use **read replicas** for scaling read operations
- Implement **database sharding** for large datasets

### Application Performance
- Use **lazy loading** for related objects
- Implement **pagination** for large result sets
- Create **background job processing** with queues
- Use **CDN integration** for static assets
- Implement **response compression** (gzip)

## Deployment and DevOps

### Container Deployment
- Use **Docker** for application containerization
- Create **multi-stage builds** for optimized images
- Implement **docker-compose** for local development
- Use **Kubernetes** for container orchestration
- Create **health checks** for container monitoring

### Cloud Deployment
- **Django**: Deploy on **Heroku**, **AWS**, or **Google Cloud**
- **Spring Boot**: Use **Spring Cloud** for microservices deployment
- **Laravel**: Deploy on **Laravel Forge** or cloud platforms
- Implement **auto-scaling** based on traffic
- Use **load balancers** for high availability

### CI/CD Pipeline
- Implement **automated testing** in deployment pipeline
- Use **GitHub Actions**, **Jenkins**, or **GitLab CI**
- Create **environment management** (dev/staging/prod)
- Implement **database migrations** in deployment
- Use **blue-green deployments** for zero downtime

## Monitoring and Observability

### Application Monitoring
- **Django**: Use **Django Debug Toolbar** and **Sentry**
- **Spring Boot**: Implement **Actuator** endpoints for monitoring
- **Laravel**: Use **Laravel Telescope** for debugging
- Create **performance monitoring** with APM tools
- Implement **error tracking** and alerting

### Logging and Metrics
- Implement **structured logging** with proper log levels
- Use **centralized logging** with ELK stack or similar
- Create **application metrics** with Prometheus
- Implement **distributed tracing** for microservices
- Use **dashboard monitoring** with Grafana

## Tech Stack Requirements

### Django Stack
- **Django** (5+) - web framework
- **Django REST Framework** - API development
- **Celery** - background task processing
- **Redis** - caching and message broker
- **PostgreSQL** - database

### Spring Boot Stack
- **Spring Boot** (3+) - application framework
- **Spring Security** - security framework
- **Spring Data JPA** - data access layer
- **Maven/Gradle** - build tools
- **PostgreSQL/MySQL** - database

### Laravel Stack
- **Laravel** (11+) - PHP framework
- **Composer** - dependency management
- **Laravel Sanctum** - API authentication
- **Redis** - caching and queues
- **MySQL/PostgreSQL** - database

### Development Tools
- **Docker** - containerization
- **Postman** - API testing
- **SonarQube** - code quality analysis
- **Jenkins** - continuous integration
- **Prometheus** - monitoring and metrics

## IDE Integration Guidelines

### Universal IDE Compatibility
- **PyCharm** - comprehensive Django development
- **IntelliJ IDEA** - enterprise Spring Boot development
- **PhpStorm** - professional Laravel development
- **VS Code** - multi-framework development

### Development Workflow
- Use **framework-specific extensions** for IDE support
- Implement **debugging** with proper breakpoint support
- Use **version control** with framework-specific .gitignore
- Set up **automated testing** with framework test runners
- Use **code formatting** with framework standards
