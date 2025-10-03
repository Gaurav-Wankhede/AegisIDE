---
trigger: glob
globs: *.sql,*.js,*.py,*.ts,prisma,mongoose,sequelize,redis,postgres,mongodb
---

# Universal Database Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/models/user/profile/avatar_model.js` (≤80 lines)
- **Smallest possible files** - decompose at model, query, and migration levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular database architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: database linters, query analyzers, schema validators
- **If any duplicacy found**, optimize immediately: extract common queries, create reusable models, implement shared schemas, refactor into libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in database logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **configuration files** for all parameters
- Implement dynamic parameter adjustment based on real-time system performance

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, data processing
- When implementing stub queries, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **snake_case** for SQL table and column names
- **camelCase** for JavaScript/TypeScript model properties
- **PascalCase** for model classes and schema definitions
- **UPPER_CASE** for constants and environment variables
- **Descriptive, entity-oriented names** for deepest database hierarchies

## Modern Database Technologies (2025)

### PostgreSQL (Relational Database)
- Use **PostgreSQL 15+** for advanced SQL features
- Implement **JSONB columns** for flexible schema design
- Use **indexes** strategically for query performance
- Leverage **triggers** for business logic enforcement
- Implement **views** for complex query simplification

### MongoDB (Document Database)
- Use **MongoDB 7+** with latest features
- Implement **document validation** with JSON Schema
- Use **aggregation pipelines** for complex data processing
- Leverage **indexes** for query optimization
- Implement **replica sets** for high availability

### Redis (In-Memory Data Store)
- Use **Redis 7+** for caching and session management
- Implement **data structures** (strings, hashes, lists, sets, sorted sets)
- Use **pub/sub** for real-time messaging
- Leverage **Redis Streams** for event sourcing
- Implement **persistence** strategies (RDB, AOF)

## Database Design Patterns

### Schema Design Best Practices
- Follow **normalization principles** for relational databases
- Implement **denormalization** strategically for performance
- Use **foreign keys** for referential integrity
- Create **composite indexes** for multi-column queries
- Implement **soft deletes** for audit trails

### Document Database Patterns
- Design **embedded documents** for one-to-few relationships
- Use **document references** for one-to-many relationships
- Implement **schema versioning** for document evolution
- Create **compound indexes** for complex queries
- Use **aggregation frameworks** for data analysis

### Caching Strategies
- Implement **cache-aside** pattern for read-heavy workloads
- Use **write-through** caching for consistency
- Create **cache invalidation** strategies
- Implement **distributed caching** with Redis Cluster
- Use **cache warming** for predictable access patterns

## ORM and Query Builder Integration

### Prisma (Modern ORM)
- Use **Prisma 5+** for type-safe database access
- Implement **Prisma Schema** with proper relationships
- Use **Prisma Client** for type-safe queries
- Leverage **Prisma Migrate** for schema management
- Implement **Prisma Studio** for database exploration

### Sequelize (Node.js ORM)
- Use **Sequelize 6+** for SQL database abstraction
- Implement **model definitions** with proper associations
- Use **migrations** for schema version control
- Create **seeds** for initial data population
- Implement **hooks** for business logic

### Mongoose (MongoDB ODM)
- Use **Mongoose 8+** for MongoDB object modeling
- Implement **schemas** with validation rules
- Use **middleware** for pre/post hooks
- Create **virtual properties** for computed fields
- Implement **population** for document references

## Query Optimization and Performance

### SQL Query Optimization
- Write **efficient queries** with proper JOIN strategies
- Use **EXPLAIN ANALYZE** for query performance analysis
- Implement **prepared statements** to prevent SQL injection
- Create **materialized views** for complex aggregations
- Use **query caching** for frequently executed queries

### NoSQL Query Optimization
- Design **efficient aggregation pipelines**
- Use **projection** to limit returned fields
- Implement **proper indexing** for query patterns
- Create **compound queries** with optimal field order
- Use **cursor-based pagination** for large result sets

### Performance Monitoring
- Implement **query performance logging**
- Use **database profiling** tools for bottleneck identification
- Create **performance benchmarks** for critical queries
- Monitor **connection pool** usage and optimization
- Implement **slow query detection** and alerting

## Data Migrations and Schema Management

### Migration Strategies
- Create **incremental migrations** for schema changes
- Implement **rollback procedures** for failed migrations
- Use **data seeding** for initial application data
- Create **environment-specific** migration workflows
- Implement **migration testing** in staging environments

### Schema Versioning
- Maintain **schema version control** with migration files
- Implement **backward compatibility** strategies
- Create **schema documentation** with automated generation
- Use **schema validation** in application code
- Implement **zero-downtime** migration strategies

### Data Integrity
- Enforce **referential integrity** with foreign keys
- Implement **check constraints** for business rules
- Use **unique constraints** for data uniqueness
- Create **audit trails** for data change tracking
- Implement **data validation** at multiple levels

## Security and Access Control

### Database Security
- Use **connection encryption** (SSL/TLS) for all environments
- Implement **role-based access control** (RBAC)
- Create **least privilege** user accounts
- Use **database firewalls** for network security
- Implement **audit logging** for security compliance

### Data Protection
- Encrypt **sensitive data** at rest and in transit
- Implement **data masking** for non-production environments
- Use **secure backup** strategies with encryption
- Create **data retention** policies for compliance
- Implement **GDPR compliance** for data privacy

### Input Validation
- **Validate all inputs** before database operations
- Use **parameterized queries** to prevent SQL injection
- Implement **input sanitization** for user data
- Create **schema validation** for document databases
- Use **whitelist validation** for acceptable input patterns

## Backup and Recovery

### Backup Strategies
- Implement **automated backup** schedules
- Create **point-in-time recovery** capabilities
- Use **incremental backups** for efficiency
- Test **backup restoration** procedures regularly
- Implement **cross-region backup** replication

### Disaster Recovery
- Create **disaster recovery** plans and procedures
- Implement **database replication** for high availability
- Use **failover mechanisms** for automatic recovery
- Create **recovery time objectives** (RTO) and **recovery point objectives** (RPO)
- Test **disaster recovery** scenarios regularly

### Monitoring and Alerting
- Monitor **database health** metrics continuously
- Implement **performance alerts** for threshold violations
- Create **capacity planning** based on growth trends
- Use **log analysis** for proactive issue detection
- Implement **uptime monitoring** with SLA tracking

## Testing Strategies

### Database Testing
- Write **unit tests** for database operations
- Implement **integration tests** for data workflows
- Use **test databases** for isolated testing
- Create **test fixtures** for consistent test data
- Achieve **minimum 80% coverage** for database code

### Performance Testing
- Conduct **load testing** for database performance
- Implement **stress testing** for capacity limits
- Use **benchmark testing** for optimization validation
- Create **performance regression** tests
- Monitor **resource utilization** during testing

### Data Quality Testing
- Implement **data validation** tests for integrity
- Create **referential integrity** tests
- Use **data consistency** checks across systems
- Implement **duplicate detection** tests
- Create **data completeness** validation

## Development Tools and Utilities

### Database Management Tools
- Use **pgAdmin** for PostgreSQL administration
- Implement **MongoDB Compass** for document database management
- Use **Redis Commander** for Redis data visualization
- Create **database documentation** with automated tools
- Implement **schema comparison** tools for environments

### Development Utilities
- Use **database seeders** for development data
- Implement **data generators** for testing
- Create **database reset** scripts for clean states
- Use **query builders** for dynamic query construction
- Implement **database connection** health checks

## Tech Stack Requirements

### PostgreSQL Stack
- **PostgreSQL** (15+) - relational database
- **pg** (Node.js) - PostgreSQL client
- **Sequelize** or **Prisma** - ORM/query builder
- **pg-promise** - advanced PostgreSQL interface
- **postgraphile** - GraphQL API generation

### MongoDB Stack
- **MongoDB** (7+) - document database
- **Mongoose** - object document modeling
- **MongoDB Atlas** - cloud database service
- **mongodb** - native MongoDB driver
- **mongo-express** - web-based admin interface

### Redis Stack
- **Redis** (7+) - in-memory data store
- **redis** (Node.js) - Redis client
- **ioredis** - robust Redis client
- **redis-commander** - web-based admin tool
- **bull** - Redis-based job queue

### Development Tools
- **Docker** - containerized database environments
- **database-js** - universal database connector
- **knex** - SQL query builder
- **typeorm** - TypeScript ORM
- **prisma** - next-generation ORM

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with database extensions
- **DataGrip** - comprehensive database IDE
- **pgAdmin** - PostgreSQL administration
- **MongoDB Compass** - MongoDB visualization

### Development Workflow
- Use **database extensions** for query execution
- Implement **schema visualization** tools
- Use **version control** for migration files
- Set up **automated testing** for database operations
- Use **code formatting** for SQL and schemas
