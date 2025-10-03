---
trigger: glob
globs: *.jsx,*.tsx,package.json,tsconfig.json,jest.config.js,src/**/*.js,src/**/*.ts
---

# Universal React Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/components/user/profile/
  ├── UserAvatar.tsx       (≤80 lines)
  ├── UserInfo.tsx         (≤80 lines)
  └── UserActions.tsx      (≤80 lines)
  ```
- **Smallest possible files** - decompose at component, hook, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.ts` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: ESLint plugins, jscpd, PMD CPD, custom React-specific checkers
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable hooks/components, implement generic patterns, refactor into shared utilities
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE integration
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **config objects** for all parameters
- Derive parameters from historical data and performance metrics
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for variables, functions, and file names
- **PascalCase** for components and types
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders
- Follow **domain-driven design** principles in folder hierarchy

### Type Safety and Static Analysis
- **Always use TypeScript** for type definitions in components and hooks
- Use **strict TypeScript configuration** with comprehensive type checking
- Leverage **React.FC** or explicit return types for components
- Define **interfaces** for props, state, and context values
- Implement **generic components** for reusable functionality

## Modern React Patterns (2025)

### React 19+ Features
- Use **React Compiler** for automatic optimization (experimental)
- Leverage **Server Components** for better performance when applicable
- Use **Actions** for form handling and mutations
- Implement **use() hook** for data fetching and async operations
- Use **React.startTransition** for non-urgent updates

### Hook Patterns
- **Custom hooks** for reusable stateful logic
- **useState** for local component state
- **useEffect** with proper cleanup functions
- **useContext** for shared state across components
- **useMemo** and **useCallback** for performance optimization
- **useRef** for DOM references and mutable values
- **useReducer** for complex state management

### State Management
- Use **React state** for local component state
- Implement **Context API** for shared state across component trees
- Use **Zustand** or **Redux Toolkit** for global application state
- Leverage **React Query** or **SWR** for server state management
- Implement **useOptimistic** for optimistic updates (React 19+)

## Component Architecture

### Component Design Principles
- Create **pure functional components** by default
- Use **composition over inheritance**
- Implement **single responsibility principle** for each component
- Use **props drilling** sparingly; prefer context for deep hierarchies
- Implement **component variants** with consistent prop APIs

### Performance Optimization
- Use **React.memo** for expensive re-renders prevention
- Implement **useMemo** for expensive calculations
- Use **useCallback** for stable function references
- Implement **lazy loading** with React.lazy for code splitting
- Use **Suspense boundaries** for loading states

### Error Handling
- Implement **Error Boundaries** for component error isolation
- Use **try-catch blocks** in async operations
- Implement **fallback UI** for graceful error handling
- Use **React DevTools** for debugging component trees
- Log errors with proper context and stack traces

## Testing Requirements

### Testing Standards
- Write **unit tests** using Jest and React Testing Library
- Use **component testing** for isolated component behavior
- Implement **integration tests** for component interactions
- Use **snapshot testing** sparingly and maintain snapshots
- Achieve **minimum 80% code coverage**

### Test Organization
- Place **test files** alongside components with `.test.tsx` suffix
- Use **test utilities** and **custom render functions**
- Implement **mock providers** for context and external dependencies
- Test **user interactions** with fireEvent or user-event
- Test **accessibility** using jest-axe or similar tools

### Testing Best Practices
- Test **behavior over implementation**
- Use **screen queries** for finding elements
- Implement **async testing** with waitFor and findBy queries
- Test **error states** and **edge cases**
- Use **MSW** (Mock Service Worker) for API mocking

## Performance and Optimization

### Bundle Optimization
- Use **tree shaking** to eliminate dead code
- Implement **code splitting** with dynamic imports
- Use **webpack-bundle-analyzer** for bundle analysis
- Optimize **image loading** with proper formats and lazy loading
- Implement **service workers** for caching strategies

### Runtime Performance
- Minimize **re-renders** with proper dependency arrays
- Use **React DevTools Profiler** for performance analysis
- Implement **virtual scrolling** for large lists
- Use **intersection observer** for lazy loading
- Optimize **CSS-in-JS** performance with static extraction

### Memory Management
- **Clean up subscriptions** in useEffect cleanup functions
- **Avoid memory leaks** by properly unmounting components
- Use **WeakMap** and **WeakSet** for object references
- Implement **proper event listener cleanup**
- Monitor **memory usage** in development

## Styling and UI Patterns

### Styling Approaches
- Use **CSS Modules** for component-scoped styles
- Implement **Tailwind CSS** for utility-first styling
- Use **styled-components** or **emotion** for CSS-in-JS
- Implement **CSS custom properties** for theming
- Use **PostCSS** for CSS processing and optimization

### Responsive Design
- Implement **mobile-first** responsive design
- Use **CSS Grid** and **Flexbox** for layouts
- Implement **container queries** for component-based responsiveness
- Use **clamp()** for fluid typography
- Test **cross-browser compatibility**

### Accessibility (a11y)
- Use **semantic HTML** elements appropriately
- Implement **ARIA attributes** for complex interactions
- Ensure **keyboard navigation** support
- Use **focus management** for modals and navigation
- Test with **screen readers** and accessibility tools

## Development Workflow

### Build Tools and Configuration
- Use **Vite** or **Create React App** for development setup
- Configure **ESLint** and **Prettier** for code quality
- Set up **TypeScript** with strict configuration
- Use **Husky** for git hooks and pre-commit validation
- Implement **automated testing** in CI/CD pipeline

### Development Environment
- Use **React Developer Tools** for debugging
- Set up **Hot Module Replacement** for fast development
- Use **Storybook** for component development and documentation
- Implement **environment variables** for configuration
- Use **absolute imports** with path mapping

### Version Control and Collaboration
- Use **conventional commits** for commit messages
- Implement **feature branches** with pull request reviews
- Use **semantic versioning** for releases
- Document **component APIs** with JSDoc or Storybook
- Maintain **changelog** for version tracking

## Tech Stack Requirements

### Core Dependencies
- **react** (19+) - core library
- **react-dom** - DOM rendering
- **typescript** - type safety
- **@types/react** - React type definitions
- **@types/react-dom** - React DOM type definitions

### Development Dependencies
- **@testing-library/react** - component testing
- **@testing-library/jest-dom** - testing utilities
- **jest** - test runner
- **eslint** - linting
- **prettier** - code formatting

### Popular Libraries
- **react-router-dom** - client-side routing
- **react-query** or **swr** - server state management
- **react-hook-form** - form handling
- **framer-motion** - animations
- **react-spring** - spring-physics animations

## Security Best Practices

### Input Validation and Sanitization
- **Validate all props** at component boundaries
- Use **DOMPurify** for sanitizing HTML content
- Implement **XSS protection** with proper escaping
- Validate **user inputs** before processing
- Use **Content Security Policy** headers

### Authentication and Authorization
- Implement **secure token storage** (httpOnly cookies)
- Use **protected routes** for authenticated content
- Implement **role-based access control**
- Use **secure HTTP headers** for API requests
- Implement **session timeout** handling

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with React extensions
- **WebStorm** with React support
- **Sublime Text** with React packages
- **Vim/Neovim** with React plugins

### Development Tools
- **React DevTools** browser extension
- **TypeScript** language server
- **ESLint** and **Prettier** integration
- **Jest** test runner integration
- **Git** version control integration
