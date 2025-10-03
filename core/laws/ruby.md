---
trigger: glob
globs: *.rb,Gemfile,Gemfile.lock,Rakefile,config.ru,*.gemspec
---

# Universal Ruby Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `app/services/user/profile/avatar_service.rb` (≤80 lines)
- **Smallest possible files** - decompose at class, method, and module levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modules** for namespace organization and mixins (also ≤80 lines per module)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: RuboCop, Reek, Flog, custom Ruby analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create modules, implement metaprogramming, refactor into gems
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **YAML configuration** and **environment variables** for all parameters
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub methods, use variables meaningfully through logging or debug assertions

### Naming Conventions (Ruby Style)
- **snake_case** for variables, methods, and file names
- **PascalCase** for classes and modules
- **UPPER_CASE** for constants
- **@instance_variables** and **@@class_variables** with descriptive names
- **Descriptive, action-oriented names** for deepest directories

### Type Safety and Static Analysis
- Use **Sorbet** for gradual typing and static analysis
- Implement **YARD documentation** for method signatures
- Use **contracts** or **dry-types** for runtime type checking
- Implement **RuboCop** for style and quality enforcement
- Use **strong parameters** in Rails for input validation

## Modern Ruby Features (Ruby 3.2+)

### Pattern Matching and Syntax
- Use **pattern matching** for complex conditional logic
- Implement **endless methods** for one-liner methods
- Use **keyword arguments** for method parameter clarity
- Implement **safe navigation** operator (&.) for nil safety
- Use **hash rockets** vs **symbol notation** appropriately

### Performance and Concurrency
- Use **Ractor** for parallel processing (Ruby 3.0+)
- Implement **Fiber** for cooperative concurrency
- Use **frozen string literals** for memory optimization
- Implement **method visibility** (private, protected, public) appropriately
- Use **autoload** for lazy loading of constants

### Metaprogramming Best Practices
- Use **define_method** and **method_missing** judiciously
- Implement **attr_accessor**, **attr_reader**, **attr_writer** appropriately
- Use **class_eval** and **instance_eval** for dynamic behavior
- Implement **hooks** (included, extended, inherited) for module behavior
- Use **const_missing** for dynamic constant resolution

## Ruby on Rails Patterns

### MVC Architecture
- Follow **Convention over Configuration** principle
- Use **ActiveRecord** for model layer with proper associations
- Implement **controllers** with single responsibility principle
- Use **views** with helper methods for presentation logic
- Implement **routes** with RESTful conventions

### Rails Best Practices
- Use **strong parameters** for mass assignment protection
- Implement **before_action** callbacks for cross-cutting concerns
- Use **service objects** for complex business logic
- Implement **concerns** for shared functionality
- Use **ActiveJob** for background processing

### Database Integration
- Use **ActiveRecord migrations** for schema management
- Implement **model validations** and **callbacks** appropriately
- Use **scopes** for reusable query logic
- Implement **joins** and **includes** for query optimization
- Use **database indexes** for performance optimization

## Testing Standards

### RSpec and Testing Best Practices
- Write **behavior-driven tests** using RSpec
- Use **let** and **let!** for test setup
- Implement **shared examples** for common behavior testing
- Use **factories** (FactoryBot) instead of fixtures
- Achieve **minimum 80% code coverage** with SimpleCov

### Testing Patterns
- Use **describe** and **context** for test organization
- Implement **feature specs** with Capybara for integration testing
- Use **request specs** for API testing
- Implement **model specs** for unit testing
- Use **system specs** for full-stack testing

### Testing Tools and Techniques
- Use **VCR** for external API testing
- Implement **database cleaner** for test isolation
- Use **shoulda-matchers** for Rails-specific assertions
- Implement **parallel testing** for faster test suites
- Use **mutation testing** with Mutant for test quality

## Gem Development and Management

### Bundler and Gem Management
- Use **Gemfile** with version constraints
- Implement **Gemfile.lock** for dependency locking
- Use **bundle exec** for consistent gem versions
- Implement **gem groups** for environment-specific dependencies
- Use **git sources** for development gems

### Creating and Publishing Gems
- Create **gemspec** files with proper metadata
- Implement **semantic versioning** for gem releases
- Use **require** statements efficiently for load time
- Implement **gem structure** with lib, bin, and spec directories
- Use **rubygems.org** for gem publishing

### Dependency Management
- Use **pessimistic version constraints** (~>) for stability
- Implement **gem updates** with proper testing
- Use **bundle audit** for security vulnerability scanning
- Implement **dependency graphs** analysis
- Use **bundle outdated** for dependency updates

## Performance Optimization

### Ruby Performance
- Use **profiling tools** (ruby-prof, stackprof) for performance analysis
- Implement **memory optimization** with ObjectSpace analysis
- Use **benchmark** module for performance measurement
- Implement **caching strategies** with Rails.cache or Redis
- Use **database query optimization** with bullet gem

### Rails Performance
- Implement **eager loading** to avoid N+1 queries
- Use **counter caches** for association counts
- Implement **fragment caching** for expensive view renders
- Use **Russian doll caching** for nested cache dependencies
- Implement **background jobs** for long-running operations

### Memory and Resource Management
- Use **frozen strings** to reduce memory allocation
- Implement **object pooling** for expensive object creation
- Use **garbage collection** tuning for production
- Implement **connection pooling** for database connections
- Monitor **memory usage** with tools like Derailed Benchmarks

## Security Best Practices

### Rails Security
- Use **strong parameters** for mass assignment protection
- Implement **CSRF protection** with authenticity tokens
- Use **SQL injection** prevention with parameterized queries
- Implement **XSS protection** with proper output escaping
- Use **secure headers** with gem like secure_headers

### Authentication and Authorization
- Use **Devise** for authentication or implement custom solutions
- Implement **CanCanCan** or **Pundit** for authorization
- Use **bcrypt** for password hashing
- Implement **JWT tokens** for API authentication
- Use **OAuth** integration for third-party authentication

### General Security Measures
- Keep **gems updated** and scan for vulnerabilities with bundle-audit
- Use **HTTPS** for all production traffic
- Implement **rate limiting** with rack-attack
- Use **environment variables** for sensitive configuration
- Implement **logging** without exposing sensitive data

## API Development

### RESTful API Design
- Follow **REST conventions** with proper HTTP methods
- Use **JSON API** specification for consistent responses
- Implement **API versioning** with namespaces
- Use **serializers** (ActiveModel::Serializers or JSONAPI::Serializers)
- Implement **pagination** for large result sets

### API Security and Documentation
- Implement **token-based authentication** for APIs
- Use **CORS** configuration for browser API access
- Implement **rate limiting** and **throttling**
- Use **API documentation** with tools like Swagger or YARD
- Implement **API testing** with comprehensive test suites

## Development Environment

### Local Development Setup
- Use **rbenv** or **RVM** for Ruby version management
- Implement **Docker** for consistent development environments
- Use **foreman** or **overmind** for process management
- Implement **database seeding** with seeds.rb
- Use **Rails generators** for boilerplate code creation

### Code Quality Tools
- Use **RuboCop** for style and quality enforcement
- Implement **Reek** for code smell detection
- Use **Brakeman** for security vulnerability scanning
- Implement **SimpleCov** for code coverage analysis
- Use **Bullet** for N+1 query detection

## Deployment and Production

### Production Configuration
- Use **Puma** or **Unicorn** as application server
- Implement **Nginx** as reverse proxy
- Use **Capistrano** for deployment automation
- Implement **database migrations** in deployment pipeline
- Use **environment-specific** configuration

### Monitoring and Observability
- Implement **application monitoring** with New Relic or Datadog
- Use **error tracking** with Bugsnag or Rollbar
- Implement **logging** with structured logging (Lograge)
- Use **performance monitoring** with tools like Scout
- Implement **health checks** for load balancer integration

## Concurrency and Background Jobs

### Background Processing
- Use **Sidekiq** for background job processing
- Implement **ActiveJob** for job abstraction
- Use **Redis** for job queue storage
- Implement **job retry** and **error handling** strategies
- Use **cron jobs** with whenever gem for scheduling

### Concurrency Patterns
- Use **Thread** and **Mutex** for thread safety
- Implement **actor pattern** with Celluloid (if needed)
- Use **async/await** patterns with async gem
- Implement **queue-based** processing for scalability
- Use **connection pooling** for thread safety

## Tech Stack Requirements

### Core Dependencies
- **Ruby 3.2+** - modern language features
- **Bundler** - dependency management
- **Rails 7+** - web application framework
- **PostgreSQL** or **MySQL** - database
- **Redis** - caching and background jobs

### Popular Gems
- **devise** - authentication
- **pundit** - authorization
- **sidekiq** - background processing
- **rspec-rails** - testing
- **factory_bot_rails** - test data

### Development Tools
- **RubyMine** or **VS Code** - IDEs
- **rbenv** or **rvm** - version management
- **pry** - debugging console
- **rubocop** - code style
- **bundler-audit** - security scanning

## IDE Integration Guidelines

### Universal IDE Compatibility
- **RubyMine** - comprehensive Ruby IDE
- **VS Code** with Ruby extensions
- **Sublime Text** with Ruby packages
- **Atom** with Ruby plugins
- **Vim/Neovim** with Ruby configuration

### Development Workflow
- Use **Ruby LSP** for language server features
- Implement **debugging** with pry or byebug
- Use **version control** with Git integration
- Set up **automated testing** with guard
- Use **code formatting** with RuboCop integration
