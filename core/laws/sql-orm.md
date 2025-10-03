---
trigger: glob
globs: *.sql,*.js,*.ts,*.py,prisma,sequelize,typeorm,sqlalchemy,knex,drizzle
---

# Universal SQL and ORM Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/models/user/profile/user_profile_model.js` (≤80 lines)
- **Smallest possible files** - decompose at model, query, and migration levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular database architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: SQL linters, ORM analyzers, query optimizers
- **If any duplicacy found**, optimize immediately: extract common queries, create reusable models, implement shared schemas, refactor into libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in SQL queries or ORM configurations
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **configuration files** for all parameters
- Implement dynamic parameter adjustment based on real-time database performance

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, data processing
- When implementing stub queries, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **snake_case** for SQL table and column names
- **camelCase** for JavaScript/TypeScript model properties
- **PascalCase** for model classes and entity definitions
- **UPPER_CASE** for constants and environment variables
- **Descriptive, entity-oriented names** for database hierarchies

## Modern SQL Development (2025)

### SQL Best Practices
- Use **Common Table Expressions (CTEs)** for complex queries
- Implement **window functions** for analytical queries
- Create **stored procedures** for complex business logic
- Use **views** for query abstraction and security
- Implement **triggers** for data consistency and auditing

### Query Optimization
- Use **EXPLAIN ANALYZE** for query performance analysis
- Implement **proper indexing** strategies for performance
- Create **composite indexes** for multi-column queries
- Use **partial indexes** for filtered queries
- Implement **query hints** for optimizer guidance

### Database Design Patterns
- Follow **normalization principles** (1NF, 2NF, 3NF, BCNF)
- Implement **denormalization** strategically for performance
- Use **foreign key constraints** for referential integrity
- Create **check constraints** for data validation
- Implement **unique constraints** for data uniqueness

## Modern ORM Frameworks (2025)

### Prisma ORM (TypeScript/JavaScript)
- Use **Prisma 5+** for type-safe database access
- Implement **Prisma Schema** with proper model relationships
- Use **Prisma Client** for auto-generated type-safe queries
- Leverage **Prisma Migrate** for database schema management
- Implement **Prisma Studio** for database visualization

### Drizzle ORM (TypeScript)
- Use **Drizzle ORM** for lightweight TypeScript ORM
- Implement **schema definitions** with proper typing
- Use **query builder** for flexible query construction
- Create **migrations** with schema evolution
- Implement **relations** for complex data relationships

### TypeORM (TypeScript/JavaScript)
- Use **TypeORM 0.3+** for enterprise TypeScript applications
- Implement **entity decorators** for model definitions
- Use **repository pattern** for data access abstraction
- Create **custom repositories** for complex queries
- Implement **query builder** for dynamic queries

### Sequelize (Node.js)
- Use **Sequelize 6+** for Node.js applications
- Implement **model definitions** with proper associations
- Use **migrations** for database schema changes
- Create **seeders** for initial data population
- Implement **hooks** for lifecycle events

### SQLAlchemy (Python)
- Use **SQLAlchemy 2+** for Python applications
- Implement **declarative models** with proper relationships
- Use **session management** for database transactions
- Create **query objects** for complex queries
- Implement **alembic** for database migrations

## Database Schema Management

### Migration Strategies
- Create **incremental migrations** for schema evolution
- Implement **rollback procedures** for failed migrations
- Use **data migrations** for data transformation
- Create **environment-specific** migration workflows
- Implement **migration testing** in staging environments

### Schema Versioning
- Maintain **schema version control** with migration files
- Implement **backward compatibility** strategies
- Create **schema documentation** with automated generation
- Use **schema validation** in application code
- Implement **zero-downtime** migration patterns

### Data Seeding
- Create **seed scripts** for initial application data
- Implement **environment-specific** seeding strategies
- Use **referential integrity** in seed data
- Create **seed data factories** for testing
- Implement **idempotent seeding** for repeatability

## Query Building and Optimization

### Query Builder Patterns
- **Knex.js**: Use **Knex 3+** for SQL query building
- **Drizzle**: Implement **select**, **insert**, **update**, **delete** queries
- **Prisma**: Use **findMany**, **create**, **update**, **delete** operations
- Create **dynamic query building** for flexible filtering
- Implement **query composition** for reusable patterns

### Advanced Query Techniques
- Use **subqueries** for complex data retrieval
- Implement **joins** (inner, left, right, full outer)
- Create **aggregations** with GROUP BY and HAVING
- Use **unions** for combining result sets
- Implement **recursive queries** for hierarchical data

### Performance Optimization
- Use **prepared statements** to prevent SQL injection
- Implement **query caching** for frequently used queries
- Create **connection pooling** for resource optimization
- Use **batch operations** for bulk data processing
- Implement **lazy loading** vs **eager loading** strategies

## Data Validation and Constraints

### Schema-Level Validation
- Implement **data types** with proper constraints
- Use **NOT NULL** constraints for required fields
- Create **CHECK constraints** for business rules
- Implement **UNIQUE constraints** for data uniqueness
- Use **DEFAULT values** for consistent data

### Application-Level Validation
- **Prisma**: Use **@db** attributes for database constraints
- **Drizzle**: Implement **zod** integration for validation
- **TypeORM**: Use **validation decorators** for entity validation
- **Sequelize**: Implement **validators** in model definitions
- **SQLAlchemy**: Use **validators** and **hybrid properties**

### Data Integrity
- Implement **foreign key relationships** with proper cascading
- Use **transaction management** for data consistency
- Create **audit trails** for data change tracking
- Implement **soft deletes** for data preservation
- Use **optimistic locking** for concurrent updates

## Testing Database Code

### Testing Database Code
- Write **unit tests** for model methods and validations
- Use **test databases** for isolated testing
- Implement **database mocking** for unit tests
- Test **database operations** with real database connections
- Use **test containers** (Docker) for database testing
- Implement **transaction rollback** for test cleanup
- Conduct **query performance** testing with large datasets
- Implement **load testing** for database operations
- Create **performance benchmarks** for critical queries
- Achieve **minimum 80% coverage** for database code

## Security Best Practices

### SQL Injection Prevention
- Use **parameterized queries** or **prepared statements**
- Implement **input validation** and **sanitization**
- Use **ORM query builders** instead of raw SQL
- Create **whitelist validation** for dynamic queries
- Implement **stored procedures** for sensitive operations

### Access Control
- Implement **database user roles** with minimal privileges
- Use **row-level security** for data access control
- Create **database views** for data abstraction
- Implement **column-level permissions** for sensitive data
- Use **audit logging** for database access tracking

### Data Encryption
- Implement **encryption at rest** for sensitive data
- Use **TLS/SSL** for database connections
- Create **application-level encryption** for specific fields
- Implement **key management** for encryption keys
- Use **hashing** for passwords and sensitive identifiers

## Performance Monitoring and Optimization

### Query Performance Monitoring
- Use **query execution plans** for optimization
- Implement **slow query logging** and analysis
- Create **performance metrics** collection
- Use **database profiling** tools for bottleneck identification
- Implement **query performance** alerting

### Index Management
- Create **strategic indexes** for frequently queried columns
- Implement **composite indexes** for multi-column queries
- Use **partial indexes** for filtered queries
- Monitor **index usage** and **maintenance overhead**
- Implement **index optimization** based on query patterns

### Connection Pool Optimization
- Configure **optimal pool sizes** based on application load
- Implement **connection health checks**
- Use **connection retry logic** with exponential backoff
- Monitor **pool utilization** and **wait times**
- Implement **connection leak detection**

## Database DevOps

### CI/CD Integration
- Automate **database migrations** in deployment pipelines
- Implement **schema change** validation in CI
- Use **database testing** in continuous integration
- Create **rollback procedures** for failed deployments
- Implement **blue-green deployments** for zero downtime

### Environment Management and Monitoring
- Use **environment-specific** database configurations
- Implement **database seeding** for different environments
- Create **data anonymization** for non-production environments
- Monitor **database performance** metrics
- Implement **connection pool** monitoring
- Create **query performance** alerting
- Use **database health checks** for uptime monitoring
- Implement **capacity planning** based on growth trends

## Tech Stack Requirements

### Core Technologies
- **Prisma** (5+) - modern type-safe ORM
- **Drizzle ORM** - lightweight TypeScript ORM
- **TypeORM** (0.3+) - feature-rich TypeScript ORM
- **Sequelize** (6+) - mature Node.js ORM
- **SQLAlchemy** (2+) - comprehensive Python ORM
- **Django ORM** - integrated with Django framework
- **pg** - PostgreSQL driver for Node.js
- **mysql2** - MySQL driver for Node.js
- **psycopg2** - PostgreSQL adapter for Python
- **DBeaver** - universal database tool
- **DataGrip** - JetBrains database IDE

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with SQL and ORM extensions
- **DataGrip** - dedicated database IDE
- **WebStorm/PyCharm** - with database tools
- **pgAdmin/phpMyAdmin** - web-based administration

### Development Workflow
- Use **database extensions** for query execution
- Implement **schema visualization** tools
- Use **version control** for migration files
- Set up **automated testing** for database operations
- Use **code completion** for SQL and ORM queries
