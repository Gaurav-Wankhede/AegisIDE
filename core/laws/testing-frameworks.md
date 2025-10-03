---
trigger: glob
globs: *.test.js,*.spec.js,*.test.ts,*.spec.ts,jest,cypress,playwright,vitest
---

# Universal Testing Framework Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `tests/unit/user/profile/avatar_service.test.js` (≤80 lines)
- **Smallest possible files** - decompose at test suite, test case, and helper levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular test architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: ESLint, test linters, coverage analyzers
- **If any duplicacy found**, optimize immediately: extract common test utilities, create reusable fixtures, implement shared mocks, refactor into test libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in test logic
- All parameters **must be calculated from real-world data and configuration**
- Use **test data factories** and **fixtures** for all parameters
- Implement dynamic parameter adjustment based on test environment

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, test assertions
- When implementing stub tests, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for test functions and variables
- **PascalCase** for test classes and page objects
- **UPPER_CASE** for test constants and environment variables
- **kebab-case** for test file names
- **Descriptive, behavior-oriented names** for test scenarios

## Modern Testing Frameworks (2025)

### Jest Testing Framework
- Use **Jest 29+** for comprehensive JavaScript/TypeScript testing
- Implement **describe/it** blocks for organized test structure
- Use **beforeEach/afterEach** for test setup and cleanup
- Leverage **mock functions** with jest.fn() and jest.mock()
- Implement **snapshot testing** for component consistency

### Vitest Testing Framework
- Use **Vitest 1+** for modern Vite-powered testing
- Implement **fast test execution** with native ESM support
- Use **TypeScript integration** out of the box
- Leverage **watch mode** for development-time testing
- Implement **parallel test execution** for performance

### Cypress E2E Testing
- Use **Cypress 13+** for end-to-end testing
- Implement **page object pattern** for maintainable tests
- Use **custom commands** for reusable test actions
- Leverage **fixture data** for test data management
- Implement **visual regression** testing with snapshots

### Playwright Testing Framework
- Use **Playwright 1.40+** for cross-browser testing
- Implement **multi-browser** test execution (Chrome, Firefox, Safari)
- Use **page object model** for scalable test architecture
- Leverage **parallel execution** across browsers
- Implement **mobile testing** with device emulation

## Unit Testing Patterns

### Test Structure Organization
- Use **AAA pattern** (Arrange, Act, Assert) for clear test structure
- Implement **single responsibility** per test case
- Create **descriptive test names** that explain behavior
- Use **test suites** to group related functionality
- Implement **test isolation** to prevent test interdependence

### Mock and Stub Patterns
- Use **dependency injection** for testable code design
- Implement **mock objects** for external dependencies
- Create **test doubles** (mocks, stubs, spies, fakes)
- Use **partial mocking** for selective behavior override
- Implement **mock verification** for interaction testing

### Assertion Strategies
- Use **specific assertions** over generic equality checks
- Implement **custom matchers** for domain-specific assertions
- Create **assertion libraries** for reusable validation
- Use **error message customization** for debugging
- Implement **async assertion** patterns for promises

## Integration Testing

### API Integration Testing
- Use **supertest** or similar for HTTP endpoint testing
- Implement **test databases** for isolated integration tests
- Create **test data seeding** for consistent test states
- Use **contract testing** for service boundaries
- Implement **authentication mocking** for secured endpoints

### Database Integration Testing
- Use **test containers** for isolated database testing
- Implement **database migrations** in test setup
- Create **test data factories** for realistic test data
- Use **transaction rollback** for test cleanup
- Implement **database seeding** strategies

### Service Integration Testing
- Use **test doubles** for external service dependencies
- Implement **contract testing** with tools like Pact
- Create **service virtualization** for complex dependencies
- Use **test environments** that mirror production
- Implement **chaos testing** for resilience validation

## End-to-End Testing

### Browser Automation
- Use **Playwright** or **Selenium** for browser automation
- Implement **page object pattern** for maintainable tests
- Create **reusable components** for common UI interactions
- Use **element locators** with proper priority (data-testid > accessibility > CSS)
- Implement **wait strategies** for dynamic content

### Mobile Testing
- Use **Appium** for mobile app testing
- Implement **device farms** for cross-device testing
- Create **responsive testing** for different screen sizes
- Use **platform-specific** test strategies (iOS/Android)
- Implement **performance testing** on mobile devices

### Visual Testing
- Use **visual regression testing** tools (Percy, Chromatic)
- Implement **screenshot comparison** for UI consistency
- Create **visual test baselines** for reference
- Use **cross-browser visual testing**
- Implement **accessibility testing** with automated tools

## Performance Testing

### Load Testing
- Use **Artillery**, **k6**, or **JMeter** for load testing
- Implement **gradual load increase** patterns
- Create **performance benchmarks** for baseline comparison
- Use **distributed load testing** for realistic simulation
- Implement **resource monitoring** during load tests

### Stress Testing
- Create **stress test scenarios** to find breaking points
- Implement **failure recovery** testing
- Use **chaos engineering** principles for resilience testing
- Create **performance degradation** analysis
- Implement **capacity planning** based on stress test results

### Frontend Performance Testing
- Use **Lighthouse** for web performance auditing
- Implement **Core Web Vitals** monitoring
- Create **bundle size analysis** for optimization
- Use **runtime performance** profiling
- Implement **network throttling** for realistic testing

## Test Data Management

### Test Data Factories
- Create **factory functions** for generating test data
- Implement **realistic data generation** with faker libraries
- Use **parameterized factories** for data variation
- Create **relationship management** for related entities
- Implement **data cleanup** strategies

### Fixture Management
- Use **JSON fixtures** for static test data
- Implement **dynamic fixture generation**
- Create **fixture inheritance** for data reuse
- Use **environment-specific** fixtures
- Implement **fixture validation** for data integrity

### Database Seeding
- Create **seed scripts** for test data population
- Implement **incremental seeding** strategies
- Use **referential integrity** in seed data
- Create **seed data versioning**
- Implement **cleanup procedures** for test isolation

## Test Automation and CI/CD

### Continuous Integration Testing
- Use **GitHub Actions**, **Jenkins**, or **GitLab CI** for automated testing
- Implement **parallel test execution** for faster feedback
- Create **test result reporting** with proper formatting
- Use **test failure analysis** and notification systems
- Implement **flaky test detection** and management

### Test Environment Management
- Create **ephemeral test environments** for isolated testing
- Implement **environment provisioning** automation
- Use **infrastructure as code** for test environments
- Create **test data provisioning** automation
- Implement **environment cleanup** procedures

### Test Reporting and Analytics
- Use **test reporting** tools for comprehensive test analysis
- Implement **code coverage** measurement and reporting
- Create **test trend analysis** for quality insights
- Use **test execution metrics** for optimization
- Implement **test failure analytics**

## Quality Gates and Metrics

### Coverage Requirements
- Achieve **minimum 80% code coverage** for critical paths
- Implement **branch coverage** analysis
- Use **mutation testing** for coverage quality validation
- Create **coverage reporting** in CI/CD pipelines
- Implement **coverage trend tracking**

### Quality Metrics
- Monitor **test execution time** trends
- Implement **test reliability** metrics (pass/fail rates)
- Create **test maintenance** cost analysis
- Use **defect detection** effectiveness metrics
- Implement **test automation** ROI measurement

### Test Strategy
- Create **test pyramids** with appropriate test distribution
- Implement **risk-based testing** for critical functionality
- Use **exploratory testing** for edge case discovery
- Create **regression test suites** for stability
- Implement **smoke tests** for deployment validation

## Tech Stack Requirements

### JavaScript/TypeScript Testing
- **Jest** (29+) - comprehensive testing framework
- **Vitest** (1+) - fast Vite-powered testing
- **@testing-library/react** - React component testing
- **@testing-library/jest-dom** - custom Jest matchers
- **msw** - API mocking for tests

### End-to-End Testing
- **Playwright** (1.40+) - cross-browser testing
- **Cypress** (13+) - developer-friendly E2E testing
- **Selenium WebDriver** - browser automation
- **Appium** - mobile app testing
- **Puppeteer** - Chrome automation

### Performance and Load Testing
- **k6** - modern load testing
- **Artillery** - performance testing toolkit
- **Lighthouse CI** - performance monitoring
- **WebPageTest** - web performance analysis
- **Apache JMeter** - comprehensive load testing

### Test Utilities
- **Faker.js** - realistic fake data generation
- **nock** - HTTP mocking for Node.js
- **Testcontainers** - integration testing with Docker
- **Storybook** - component testing and documentation
- **Chromatic** - visual testing platform

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with testing extensions
- **WebStorm** - comprehensive testing support
- **IntelliJ IDEA** - integrated test runner
- **Atom** - with testing packages

### Development Workflow
- Use **test runners** integrated with IDE
- Implement **debugging** with breakpoint support in tests
- Use **version control** with test-specific .gitignore
- Set up **automated test execution** on file changes
- Use **code coverage** visualization in IDE
