---
trigger: glob
globs: *.vue,*.js,*.ts,package.json,vite.config.js,nuxt.config.js,src/**/*.vue
---

# Universal Vue.js Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/components/user/profile/UserAvatar.vue` (≤80 lines)
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.js` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: ESLint Vue rules, vue-tsc, custom Vue analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create composables, implement reusable components, refactor into shared utilities
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
- **camelCase** for variables, methods, and computed properties
- **PascalCase** for components and composables
- **kebab-case** for component file names
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders

### Type Safety and Static Analysis
- **Always use TypeScript** with Vue 3 for enhanced type safety
- Use **defineComponent** for better TypeScript inference
- Leverage **PropType** and **generic components** for type-safe props
- Define **interfaces** for component props, emits, and composable returns
- Use **Volar** extension for Vue TypeScript support

## Vue 3 Composition API Patterns

### Script Setup Syntax (Recommended)
- Use **`<script setup>`** as the default approach for Vue 3 components
- Leverage **automatic prop declarations** with defineProps()
- Use **defineEmits()** for event declarations
- Implement **defineExpose()** for component instance exposure
- Use **compiler macros** for enhanced development experience

### Reactivity System
- Use **ref()** for primitive reactive values
- Use **reactive()** for object/array reactive state
- Leverage **computed()** for derived state with proper dependency tracking
- Use **watch()** and **watchEffect()** for side effects
- Implement **toRefs()** and **toRef()** for destructuring reactive objects

### Lifecycle Hooks
- Use **onMounted()** for component initialization
- Implement **onUnmounted()** for cleanup operations
- Use **onUpdated()** for DOM update reactions
- Leverage **onBeforeMount()** and **onBeforeUnmount()** for preparation/cleanup
- Use **provide()** and **inject()** for dependency injection

## Component Architecture

### Single File Component (SFC) Structure
- **Consistent block order**: `<template>`, `<script setup>`, `<style scoped>`
- Use **scoped styles** to prevent CSS leakage
- Implement **CSS Modules** or **CSS-in-JS** when appropriate
- Use **lang="ts"** for TypeScript support
- Implement **props validation** with runtime and compile-time checks

### Component Design Principles
- Create **pure functional components** with predictable inputs/outputs
- Use **composition over inheritance** through composables
- Implement **single responsibility principle** for each component
- Use **slots** for flexible content projection
- Implement **component variants** with consistent prop APIs

### Performance Optimization
- Use **v-memo** for expensive list rendering optimization
- Implement **defineAsyncComponent** for code splitting
- Use **Suspense** for async component loading states
- Leverage **KeepAlive** for component caching when appropriate
- Use **shallowRef** and **shallowReactive** for large objects

## State Management Patterns

### Local State Management
- Use **Composition API** for component-local state
- Implement **composables** for reusable stateful logic
- Use **provide/inject** for component tree state sharing
- Leverage **Pinia** for global application state
- Implement **state normalization** for complex data structures

### Global State with Pinia
- Create **typed stores** with proper TypeScript support
- Use **store composition** for modular state management
- Implement **store actions** for state mutations
- Use **store getters** for computed state derivations
- Leverage **store plugins** for cross-cutting concerns

### Server State Management
- Use **VueQuery** or **SWRV** for server state caching
- Implement **optimistic updates** for better UX
- Use **background refetching** for data freshness
- Implement **error boundaries** for graceful error handling
- Use **infinite queries** for paginated data

## Testing Requirements

### Testing Standards
- Write **unit tests** using Vitest and Vue Test Utils
- Use **component testing** for isolated component behavior
- Implement **integration tests** for component interactions
- Use **snapshot testing** sparingly and maintain snapshots
- Achieve **minimum 80% code coverage**

### Test Organization
- Place **test files** alongside components with `.spec.ts` suffix
- Use **test utilities** and **custom mount functions**
- Implement **mock composables** for external dependencies
- Test **user interactions** with @vue/test-utils
- Test **accessibility** using jest-axe or similar tools

### Testing Best Practices
- Test **behavior over implementation**
- Use **screen queries** for finding elements
- Implement **async testing** with proper awaiting
- Test **error states** and **edge cases**
- Use **MSW** (Mock Service Worker) for API mocking

## Routing and Navigation

### Vue Router 4 Patterns
- Implement **route guards** for authentication and authorization
- Use **dynamic routing** with parameter validation
- Implement **lazy loading** for route-based code splitting
- Use **meta fields** for route-specific data

### Performance Optimization

### Component and Bundle Optimization
- Use **v-once** directive for static content rendering
- Implement **v-memo** for expensive re-computations (Vue 3.2+)
- Use **shallowRef** and **shallowReactive** for large objects
- Implement **virtual scrolling** for large lists
- Use **tree shaking** with ES modules and proper bundler configuration
- Implement **code splitting** with dynamic imports and async components
- Use **keep-alive** component to cache inactive components
- Implement **efficient list rendering** with proper key attributes
- Use **computed properties** instead of methods in templates
- Optimize **CSS** with proper scoping and unused code removal

### Memory Management and Styling
- **Clean up subscriptions** in onUnmounted lifecycle
- **Avoid memory leaks** by properly destroying reactive references
- Implement **proper event listener cleanup**
- Use **scoped styles** in Single File Components
- Implement **CSS Modules** for component-specific styles
- Use **Tailwind CSS** with Vue-specific configurations
- Use **Vuetify** for Material Design components
- Implement **Quasar Framework** for cross-platform development
- Use **Element Plus** for enterprise-grade UI components

### Responsive Design and Accessibility
- Implement **mobile-first** responsive design
- Use **CSS Grid** and **Flexbox** for layouts
- Implement **ARIA attributes** for complex interactions
{{ ... }}
- Test with **screen readers** and accessibility tools

## Development Workflow

### Build Tools and Configuration
- Use **Vite** as the primary build tool for Vue 3 projects
- Configure **ESLint** with Vue-specific rules and Prettier integration
- Set up **TypeScript** with proper Vue type support
- Use **Husky** for git hooks and pre-commit validation
- Implement **automated testing** in CI/CD pipeline

### Development Environment
- Use **Vue DevTools** for debugging and state inspection
- Set up **Hot Module Replacement** for fast development cycles
- Use **Storybook** for component development and documentation
- Implement **environment variables** for configuration management
- Use **path aliases** for cleaner import statements

### Code Quality and Standards
- Follow **Vue Style Guide** for consistent code organization
- Use **conventional commits** for version control
- Implement **semantic versioning** for component libraries
- Document **component APIs** with JSDoc or Storybook
- Maintain **changelog** for version tracking

## Tech Stack Requirements

### Core Dependencies
- **vue** (3.4+) - core framework
- **@vue/compiler-sfc** - single file component compiler
- **typescript** - type safety
- **vite** - build tool and dev server
- **vue-router** - official routing solution

### Development Dependencies
- **@vue/test-utils** - component testing utilities
- **vitest** - fast unit test runner
- **@vue/eslint-config-typescript** - ESLint configuration
- **prettier** - code formatting
- **@vitejs/plugin-vue** - Vite Vue plugin

### Popular Ecosystem Libraries
- **pinia** - state management
- **vueuse** - composition utilities
- **vue-i18n** - internationalization
- **@tanstack/vue-query** - server state management
- **vee-validate** - form validation

## Security Best Practices

### Input Validation and Sanitization
- **Validate all props** at component boundaries using PropTypes
- Use **v-html** carefully and sanitize HTML content with DOMPurify
- Implement **XSS protection** with proper template escaping
- Validate **user inputs** in forms before processing
- Use **Content Security Policy** headers appropriately

### Authentication and Authorization
- Implement **secure token storage** using httpOnly cookies
- Use **route guards** for protecting authenticated routes
- Implement **role-based access control** in components
- Use **secure HTTP headers** for API communication
- Implement **session timeout** handling with proper cleanup

## Server-Side Rendering (SSR)

### Nuxt.js Patterns (Recommended for SSR)
- Use **Nuxt 3** for full-stack Vue applications
- Implement **universal rendering** with proper hydration
- Use **server-only** and **client-only** components appropriately
- Implement **API routes** within the Nuxt application
- Use **Nitro** server engine for optimal performance

### Custom SSR Implementation
- Use **@vue/server-renderer** for manual SSR setup
- Implement **proper hydration** with client-side state matching
- Use **async components** with **Suspense** for better loading
- Implement **streaming SSR** for improved performance
- Handle **SEO meta tags** and **social media** previews properly

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Volar extension for Vue 3 support
- **WebStorm** with built-in Vue.js support
- **Sublime Text** with Vue syntax packages
- **Vim/Neovim** with Vue plugins and LSP support

### Development Tools
- **Vue DevTools** browser extension for debugging
- **Volar** for TypeScript support in Vue SFCs
- **ESLint** and **Prettier** integration for code quality
- **Vite** integration for fast development experience
- **Git** version control with Vue-specific .gitignore patterns
