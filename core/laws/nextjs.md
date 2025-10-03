---
trigger: glob
globs: *.tsx,*.jsx,next.config.js,app/**/*.ts,pages/**/*.ts
---

# Universal Next.js Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/app/dashboard/components/
  ├── user_card.tsx        (≤80 lines)
  ├── data_table.tsx       (≤80 lines)
  └── chart.tsx            (≤80 lines)
  ```
- **Smallest possible files** - decompose at component, hook, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.ts` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PMD CPD, ESLint, jscpd, custom npm scripts
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable hooks/components, implement generic functions, refactor async patterns
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE integration
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and database queries**
- Use **environment variables** and **runtime configuration** for all parameters
- Derive parameters from historical data and performance metrics
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
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
- Use **specific error types** with proper error messages
- Implement **global error handling** using error boundaries
- Handle errors and edge cases early with appropriate fallbacks

### Logging and Monitoring
- Use **structured logging** with Next.js built-in logging
- Implement **correlation IDs** for request tracing
- Use **appropriate log levels**: debug, info, warn, error
- Implement **error tracking** with services like Sentry

## Next.js Patterns

### App Router Usage (Next.js 13+)
- Use **app directory** structure for new applications
- Implement **server components** by default, use **client components** only when needed
- Use **route handlers** for API endpoints in app directory
- Leverage **layout components** for shared UI patterns
- Implement **loading** and **error** pages for better UX

### Pages Router Usage (Legacy)
- Use **pages directory** for traditional Next.js applications
- Implement **API routes** in pages/api directory
- Use **getServerSideProps** and **getStaticProps** for data fetching
- Leverage **dynamic routing** with bracket notation

### Performance Optimization
- Use **Image component** for optimized image loading
- Implement **dynamic imports** for code splitting
- Use **next/font** for font optimization
- Leverage **built-in CSS support** and **CSS modules**
- Implement **middleware** for request handling

## Component Patterns

### Component Architecture
- Create **server components** for static content and data fetching
- Use **client components** for interactivity and hooks
- Implement **compound components** for complex UI patterns
- Use **render props** and **higher-order components** sparingly
- Favor **composition over inheritance**

### Hook Patterns
- Create **custom hooks** for reusable stateful logic
- Use **built-in hooks** appropriately: useState, useEffect, useContext
- Implement **data fetching hooks** with proper error handling
- Use **performance hooks**: useMemo, useCallback, useOptimistic

### State Management
- Use **React state** for local component state
- Implement **Context API** for shared state across components
- Use **Zustand** or **Redux Toolkit** for complex global state
- Leverage **server state** with React Query or SWR

## Testing Requirements

### Testing Standards
- Write **unit tests** using Jest and React Testing Library
- Use **component testing** for React components
- Implement **integration tests** for API routes
- Use **E2E tests** with Playwright or Cypress
- Achieve **minimum 80% code coverage**

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **screen queries** for component testing
- Implement **mock handlers** for API testing
- Test **accessibility** using testing-library/jest-dom

## Styling and UI Patterns

### Styling Standards
- Use **Tailwind CSS** for utility-first styling
- Implement **CSS modules** for component-scoped styles
- Use **styled-components** or **emotion** for CSS-in-JS
- Leverage **CSS variables** for theming
- Implement **responsive design** with mobile-first approach

### UI Component Libraries
- Use **Headless UI** or **Radix UI** for unstyled components
- Implement **shadcn/ui** for pre-built components
- Use **Framer Motion** for animations
- Leverage **React Hook Form** for form handling

## Database and API Patterns

### API Design
- Use **RESTful API** design principles
- Implement **GraphQL** with Apollo or similar
- Use **tRPC** for type-safe APIs
- Leverage **NextAuth.js** for authentication
- Implement **rate limiting** and **CORS**

### Database Integration
- Use **Prisma** for database ORM
- Implement **connection pooling**
- Use **database migrations** for schema management
- Implement **query optimization** strategies

## Tech Stack Requirements

### Core Dependencies
- **next** - framework
- **react** - UI library
- **typescript** - type safety
- **tailwindcss** - styling
- **@types/react** - React types

### Development Dependencies
- **jest** and **@testing-library/react** - testing
- **eslint** - linting
- **prettier** - formatting
- **husky** - git hooks

## File Organization Rules

### Project Structure (App Router)
```
src/
├── app/
│   ├── globals.css
│   ├── layout.tsx
│   ├── page.tsx
│   └── (routes)/
├── components/
├── lib/
├── hooks/
└── types/
```

### Project Structure (Pages Router)
```
src/
├── pages/
│   ├── api/
│   ├── _app.tsx
│   └── index.tsx
├── components/
├── styles/
└── lib/
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Next.js extensions
- **TypeScript** language server
- **ESLint** and **Prettier** integration
- **Tailwind CSS IntelliSense**

### Development Workflow
- Use **Next.js CLI** for project creation
- Implement **hot reloading** in development
- Use **pre-commit hooks** for code quality
- Set up **CI/CD** with Vercel or similar

## Security and Best Practices

### Security Guidelines
- **Never expose API keys** in client-side code
- Use **environment variables** for sensitive data
- Implement **CSRF protection** for forms
- Use **Content Security Policy** headers
- Validate **all inputs** on both client and server

### Performance Best Practices
- Use **Server Components** by default
- Implement **streaming** with Suspense
- Use **static generation** where possible
- Optimize **bundle size** with proper imports
- Implement **caching strategies** appropriately
