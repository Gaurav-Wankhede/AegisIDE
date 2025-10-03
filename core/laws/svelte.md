---
trigger: glob
globs: *.svelte,*.js,*.ts,package.json,vite.config.js,svelte.config.js,src/**/*.svelte
---

# Universal Svelte Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/components/user/profile/UserAvatar.svelte` (≤80 lines)
- **Smallest possible files** - decompose at component, store, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.js` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: ESLint Svelte plugins, jscpd, custom Svelte-specific checkers
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable components/stores, implement generic patterns, refactor into shared utilities
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **config objects** for all parameters
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub functions, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for variables, functions, and stores
- **PascalCase** for components and custom elements
- **kebab-case** for component file names
- **UPPER_CASE** for constants
- **Descriptive, action-oriented names** for deepest folders

### Type Safety and Static Analysis
- **Always use TypeScript** with Svelte for enhanced type safety
- Use **lang="ts"** in script blocks for TypeScript support
- Leverage **generic types** and **interfaces** for props and store types
- Define **component props types** with proper TypeScript annotations
- Use **svelte-check** for comprehensive type checking

## Svelte 5 Runes System (Modern)

### Reactivity with Runes
- Use **$state()** for reactive local component state
- Use **$derived()** for computed values that depend on reactive state
- Implement **$effect()** for side effects that depend on reactive values
- Use **$props()** for component props with proper destructuring
- Use **$bindable()** for two-way data binding in components

### State Management and Communication
- Create **reactive objects** with $state() for complex state structures
- Use **$state.snapshot()** for non-reactive snapshots of state
- Use **shared state** in .svelte.js/.svelte.ts files for global reactivity
- Implement **event dispatching** with createEventDispatcher or custom events
- Use **context API** with setContext/getContext for dependency injection

## Traditional Svelte Patterns (Legacy Support)

### Reactive Statements and Props (Legacy)
- Use **$:** for reactive statements when not using runes
- Implement **reactive assignments** with proper dependency tracking
- Handle **array reactivity** with proper assignment patterns
- Use **export let** for component props in legacy syntax
- Implement **prop validation** with proper default values
- Use **$$props** and **$$restProps** for dynamic prop handling
- Implement **two-way binding** with bind: directives

## Store Patterns and State Management

### Built-in Stores
- Use **writable()** for mutable reactive state
- Implement **readable()** for read-only reactive values
- Use **derived()** for computed stores based on other stores
- Implement **custom stores** with subscribe/set/update methods
- Use **store subscriptions** with automatic cleanup

### Advanced Store Patterns and Global State
- Create **store factories** for reusable store patterns
- Implement **store composition** for complex state management
- Use **store context** for component-scoped state
- Implement **persistent stores** with localStorage integration
- Use **Svelte stores** for simple global state
- Implement **context API** for dependency injection
- Use **reactive modules** (.svelte.js) for shared reactivity

## Component Architecture

### Single File Component Structure
- **Consistent block order**: `<script>`, `<template>`, `<style>`
- Use **scoped styles** by default for component isolation
- Implement **CSS custom properties** for theming
- Use **lang="ts"** for TypeScript in script blocks
- Use **lang="scss"** or **lang="postcss"** for enhanced styling

### Component Design Principles
- Create **pure components** with predictable inputs/outputs
- Use **composition over inheritance** through component slots
- Implement **single responsibility principle** for each component
- Use **slots** for flexible content projection
- Implement **component variants** with consistent prop APIs

### Performance Optimization
- Use **keyed each blocks** for efficient list rendering
- Implement **component lazy loading** with dynamic imports
- Use **immutable data** for better change detection
- Leverage **Svelte's compiler optimizations** with proper patterns
- Use **transition directives** efficiently without performance impacts

## Lifecycle and Effects

### Component Lifecycle
- Use **onMount()** for component initialization
- Implement **onDestroy()** for cleanup operations
- Use **beforeUpdate()** and **afterUpdate()** for DOM sync
- Implement **tick()** for DOM update coordination
- Use **createEventDispatcher()** for component events

### Effect Management (Svelte 5)
- Use **$effect()** for reactive side effects
- Implement **$effect.pre()** for pre-DOM-update effects
- Use **$effect.tracking()** to check if code is in effect context
- Implement **effect cleanup** with return functions
- Use **effect dependencies** properly to avoid infinite loops

### Async Operations
- Handle **async/await** in reactive contexts properly
- Use **promise stores** for async state management
- Implement **loading states** with reactive variables
- Use **error boundaries** with error handling patterns
- Implement **cancellation** with AbortController

## Styling and Animation

### Styling Approaches
- Use **scoped styles** in component style blocks
- Implement **global styles** with :global() modifier
- Use **CSS custom properties** for dynamic theming
- Implement **conditional classes** with class: directives
- Use **style directives** for dynamic inline styles

### Animation and Transitions
- Use **transition directives** (in:, out:, transition:) for smooth animations
- Implement **custom transitions** with CSS and JavaScript
- Use **animate directive** for list reordering animations
- Implement **motion** with svelte/motion for physics-based animations
- Use **crossfade** for seamless element transitions

### Responsive Design
- Implement **CSS Grid** and **Flexbox** layouts
- Use **container queries** for component-based responsiveness
- Implement **mobile-first** responsive design patterns
- Use **Tailwind CSS** integration with Svelte
- Test **cross-device compatibility** thoroughly

## SvelteKit Integration

### Routing and Navigation
- Use **file-based routing** with SvelteKit directory structure
- Implement **dynamic routes** with bracket notation
- Use **route parameters** and **query strings** effectively
- Implement **nested layouts** for consistent page structure
- Use **route guards** and **hooks** for authentication

### Server-Side Rendering (SSR)
- Implement **universal components** that work on server and client
- Use **load functions** for data fetching
- Handle **hydration** properly with consistent state
- Implement **streaming** for better perceived performance
- Use **prerendering** for static content optimization

### Data Loading Patterns
- Use **page load functions** for route-specific data
- Implement **layout load functions** for shared data
- Use **server-only** modules for sensitive operations
- Implement **client-side navigation** with proper prefetching
- Handle **error states** and **loading states** gracefully

## Testing Requirements

### Testing Standards
- Write **unit tests** using Vitest and @testing-library/svelte
- Use **component testing** for isolated component behavior
- Implement **integration tests** for component interactions
- Achieve **minimum 80% code coverage**

### Test Organization and Advanced Techniques
- Place **test files** alongside components with `.test.js` suffix
- Use **test utilities** and **custom render functions**
- Implement **mock stores** and **mock context**
- Test **user interactions** with fireEvent or userEvent
- Use **Playwright** for end-to-end testing
- Test **accessibility** with jest-axe integration
- Use **component story testing** with Storybook

## Build and Development

### Development Environment and Build Optimization
- Use **Vite** as the primary build tool for Svelte projects
- Configure **SvelteKit** for full-stack development
- Set up **TypeScript** with proper Svelte type support
- Use **ESLint** with Svelte-specific rules and **Prettier** formatting
- Use **code splitting** with dynamic imports
- Implement **tree shaking** for smaller bundles
- Use **prerendering** for static content
- Implement **service workers** for offline functionality

### Development Workflow
- Use **Svelte DevTools** for debugging and state inspection
- Set up **hot module replacement** for fast development
- Use **component documentation** with Storybook
- Implement **automated testing** in development workflow

## Security Best Practices

### Input Validation and Authentication
- **Validate all props** at component boundaries
- Use **{@html}** carefully and sanitize content with DOMPurify
- Implement **XSS protection** with proper template escaping
- Validate **user inputs** before processing
- Implement **secure authentication** patterns with SvelteKit
- Use **HTTP-only cookies** for session management
- Implement **CSRF protection** for form submissions
- Use **environment variables** for sensitive configuration

## Performance Best Practices

### Bundle and Runtime Optimization
- Use **dynamic imports** for code splitting
- Implement **lazy loading** for non-critical components
- Use **Svelte's compile-time optimizations** effectively
- Minimize **runtime overhead** with proper patterns
- Use **reactive patterns** appropriately to avoid over-computation
- Implement **efficient list rendering** with proper keys
- Profile **component performance** with browser tools

## Tech Stack Requirements

### Core Dependencies
{{ ... }}
- **@sveltejs/kit** - application framework
- **vite** - build tool and dev server
- **typescript** - type safety
- **@sveltejs/adapter-auto** - deployment adapter

### Development Dependencies and Libraries
- **@testing-library/svelte** - component testing
- **vitest** - test runner
- **eslint-plugin-svelte** - Svelte-specific linting
- **prettier-plugin-svelte** - code formatting
- **svelte-check** - TypeScript checking
- **@tailwindcss/forms** - form styling
- **lucide-svelte** - icon library
- **svelte-persisted-store** - persistent state

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Svelte extension
- **WebStorm** with Svelte plugin
- **Sublime Text** with Svelte packages
- **Vim/Neovim** with Svelte syntax support

### Development Tools
- **Svelte DevTools** browser extension
- **Svelte Language Server** for IDE integration
- **TypeScript** support with svelte-check
- **ESLint** and **Prettier** integration
- **Vite** development server with HMR
