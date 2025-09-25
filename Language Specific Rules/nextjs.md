# Universal Next.js Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── app/
  │   ├── dashboard/
  │   │   ├── components/
  │   │   │   ├── user_card.tsx        (≤80 lines)
  │   │   │   ├── data_table.tsx       (≤80 lines)
  │   │   │   └── chart.tsx            (≤80 lines)
  ```
- **Smallest possible files** - decompose at component, hook, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.ts` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy of the same functionalities
- **Use automated duplicate detection tools** before every commit and deployment:
  - **PMD CPD (Copy/Paste Detector)** for fast command-line duplicate detection
  - **ESLint** with duplicate code detection plugins
  - **jscpd** for cross-language duplicate detection including TypeScript
  - **Custom npm scripts** using AST parsing for project-specific duplicate detection
- **If any duplicacy found**, optimize immediately without disturbing the system:
  - **Extract common functionality** into shared modules following deep subfolder patterns
  - **Create reusable hooks** and components for common operations
  - **Implement generic functions** using TypeScript generics
  - **Refactor similar async patterns** into common utilities in `shared/hooks/` subfolder
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
- Use **environment variables** and **runtime configuration** for all parameters
- Derive parameters from historical data and performance metrics stored in databases
- Calculate timeout values, retry intervals, and connection limits based on observed performance
- Implement dynamic parameter adjustment based on real-time system load and metrics

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** at appropriate places within functionality or **remove entirely**
- Ensure every declared variable serves specific purpose: computation, logging, error handling, or state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- Use **descriptive variable names** that convey intent: `userIsAuthenticated`, `responseHasCompleted`
- **camelCase** for variables and functions
- **PascalCase** for components and types
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Safety and Static Analysis
- **Always use TypeScript** for type definitions in components, hooks, and utilities
- Use **tsconfig.json** with strict mode enabled for type checking
- Leverage **generics** and **utility types** for reusable code
- Define **interfaces** and **types** for props, state, and API responses
- Implement **type guards** for runtime type checking

## Async Programming Standards

### Promise and Async Management
- Use **async/await** syntax for handling asynchronous operations
- Implement **proper error propagation** using try/catch blocks
- Leverage **Promise.all()** for concurrent promise resolution
- Use **Suspense** and **Error Boundaries** for async data fetching
- Favor **React hooks** like `use` for async data loading in Next.js 15+

### Concurrency Patterns
- **AbortController** for cancelling async requests
- **React Query** or **SWR** for data fetching and caching
- **useEffect** with cleanup functions for managing side effects
- **Memoization** with `useMemo` and `useCallback` for performance
- Use **server actions** for server-side async operations

### Async Operations
- Implement **retry mechanisms** with exponential backoff for API calls
- Use **fetch** with proper caching directives
- Implement **loading states** using Suspense boundaries
- Handle **race conditions** in concurrent operations

## Error Handling and Safety

### Error Management
- Create **custom error boundaries** using React components
- Use **specific error types** with discriminated unions
- Implement **global error handling** with Next.js error pages
- Handle errors and edge cases early with appropriate fallbacks

### Logging and Monitoring
- Use **structured logging** with console or dedicated libraries
- Implement **correlation IDs** for request tracing
- Use **appropriate log levels**: debug, info, warn, error
- Implement **circuit breaker patterns** for external service calls

## Next.js Framework Patterns

### Application Structure
- Use **App Router** for all new projects with `app/` directory
- Structure routes using folder hierarchy for URL segments
- Implement **layouts** for shared UI across routes
- Use **page.tsx** for route components
- Leverage **server components** by default, client components when needed

### Component Patterns
- Organize components by **feature modules**
- Use **server actions** for form handling and mutations
- Implement **dynamic routes** with generateStaticParams
- Use **middleware** for authentication and redirects
- Leverage **parallel routes** and **intercepting routes** for complex UIs

### Data Fetching Patterns
- Use **server-side fetching** in server components
- Implement **static rendering** where possible for performance
- Use **dynamic rendering** for personalized content
- Handle **revalidation** with time-based or on-demand strategies

## Performance Optimization

### Build Optimization
- Use **automatic code splitting** and **lazy loading**
- Implement **image optimization** with next/image
- Leverage **font optimization** with next/font
- Use **static exports** for appropriate routes

### Runtime Optimization
- Memoize components and computations
- Implement **caching** at multiple levels (data, pages, requests)
- Use **incremental static regeneration** for dynamic static pages
- Optimize **bundle size** with tree shaking and minification

## Testing Requirements

### Testing Standards
- Write **unit tests** using Jest for components and utilities
- Use **React Testing Library** for component testing
- Implement **end-to-end tests** with Playwright or Cypress
- Use **mocks** for API and database interactions
- Achieve **minimum 80% code coverage** with meaningful tests

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **parametrized tests** for multiple scenarios
- Implement **fixtures** for reusable test setup
- Test **both server and client** components

## Database and External Service Patterns

### Database Integration
- Use **async database clients** like Prisma or Drizzle
- Implement **connection pooling** in serverless environments
- Use **migrations** for schema management
- Implement **query optimization** and caching

### External Service Integration
- Use **fetch** or **axios** for API calls
- Implement **retry mechanisms** with exponential backoff
- Use **circuit breaker patterns** for fault tolerance
- Implement **rate limiting** client-side

## Tech Stack Requirements

### Core Dependencies
- **next** - core framework
- **react** and **react-dom** - UI library
- **typescript** - type safety
- **eslint** - linting
- **prettier** - formatting

### Development Dependencies
- **jest** and **@testing-library/react** - testing
- **husky** - git hooks
- **lint-staged** - pre-commit linting
- **tailwindcss** or similar - styling
- **react-query** - data fetching

## Documentation Standards

### Code Documentation
- Use **JSDoc** comments for functions and components
- Include **type definitions** in all exports
- Document **complex logic** and side effects
- Use **Storybook** for component documentation

### Documentation Awareness Protocol (Next.js-Specific)
- **Project Documentation Review**: Before implementing new Next.js components or API routes, review project-specific Next.js documentation in the active IDE's `docs/` directory (e.g., `.windsurf/docs/`, `.cursor/docs/`, `.clinerules/docs/`) for component patterns, routing conventions, and performance optimization strategies.
- **Framework-Specific Guides**: Consult the IDE's `guide/` directory for Next.js-specific deployment procedures, build optimizations, and integration patterns that may extend these universal rules.
- **Component Library Sync**: When implementing new UI components or updating existing ones, document the design system patterns and reusability guidelines in the project's memory-bank system, ensuring consistent component architecture across the application.
- **Performance Metrics Documentation**: Document bundle size optimizations, Core Web Vitals improvements, and rendering strategy decisions in the project's documentation system, linking back to the Data-Driven Programming (DDP) principle for measurable performance outcomes.

### API Documentation
- Generate **OpenAPI** specs for API routes
- Provide **usage examples** in comments
- Document **props** and **state** for components
- Include **performance notes** for critical paths

## File Organization Rules

### Module Structure
- Separate concerns into logical modules with clear boundaries
- Use **folders** for route segments and features
- Maintain **consistent depth levels** across similar functionalities
- Follow **microservices decomposition** at every level of the application hierarchy

### Project Layout
```
src/
├── app/            # Route definitions and pages
├── components/     # Reusable UI components
├── hooks/          # Custom React hooks
├── lib/            # Utilities and data fetching
├── types/          # TypeScript type definitions
├── styles/         # Global styles and themes
├── public/         # Static assets
└── tests/          # Test files
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **TypeScript** integration for all major IDEs
- **ESLint** and **Prettier** extensions for code quality
- **React Developer Tools** for debugging
- **Next.js** specific plugins for routing visualization

### Development Workflow
- Use **pre-commit hooks** for code quality enforcement
- Implement **monorepo** structure if needed with Turborepo
- Use **package.json scripts** for common tasks
- Set up **continuous integration** with comprehensive testing

## Security and Best Practices

### Security Guidelines
- **Never hardcode secrets** - use environment variables
- Validate **all input data** on server-side
- Implement **proper authentication** with NextAuth or similar
- Use **HTTPS** and secure headers
- Protect against **common vulnerabilities** like XSS and CSRF

### Code Quality
- Follow **consistent coding style** with ESLint rules
- Use **arrow functions** for components
- Implement **proper cleanup** in effects
- Use **context** for state sharing
- Avoid **unnecessary re-renders** with memoization

## Package Management and Deployment

### Dependency Management
- Use **pnpm** or **yarn** for faster installs
- Pin **exact versions** in production
- Use **workspaces** for monorepos
- Implement **dependency scanning** for security

### Deployment Patterns
- Use **Vercel** for optimal Next.js deployment
- Implement **preview deployments** for branches
- Use **environment variables** for configuration
- Enable **automatic optimizations** like image processing