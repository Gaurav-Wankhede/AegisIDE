---
trigger: glob
globs: *.js,*.ts,*.jsx,*.tsx,astro,solid,qwik,fresh,remix,package.json
---

# Universal Modern Frontend Framework Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/components/ui/forms/inputs/text_input.tsx` (≤80 lines)
- **Smallest possible files** - decompose at component, hook, and utility levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular frontend architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: ESLint, bundler analyzers, component analyzers
- **If any duplicacy found**, optimize immediately: extract common components, create reusable hooks, implement shared utilities, refactor into packages
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

## Modern Frontend Frameworks (2025)

### Astro Framework
- Use **Astro 4+** for content-focused static sites
- Implement **partial hydration** for optimal performance
- Create **component islands** for interactive elements
- Use **multiple framework integration** (React, Vue, Svelte)
- Implement **server-side rendering** with edge deployment

### Solid.js Framework
- Use **Solid.js 1.8+** for reactive user interfaces
- Implement **fine-grained reactivity** without virtual DOM
- Create **signals** for efficient state management
- Use **stores** for complex state handling
- Implement **compile-time optimizations**

### Qwik Framework
- Use **Qwik 1.6+** for resumable applications
- Implement **progressive hydration** for instant loading
- Create **components** with automatic lazy loading
- Use **$ optimizer** for build-time optimizations
- Implement **streaming SSR** for better performance

### Fresh Framework (Deno)
- Use **Fresh 1.6+** for edge-first web applications
- Implement **islands architecture** with Preact
- Create **server-side rendering** with zero client-side JavaScript
- Use **TypeScript-first** development
- Implement **edge deployment** with Deno Deploy

## Component Architecture Patterns

### Component Design Principles
- Create **single-responsibility components** with clear purpose
- Implement **composition over inheritance** patterns
- Use **props interface** design for type safety
- Create **reusable component** libraries
- Implement **accessibility standards** in all components

### State Management Patterns
- **Astro**: Use **Nanostores** for client-side state
- **Solid**: Implement **signals** and **stores** for reactivity
- **Qwik**: Use **useStore** and **useSignal** for state
- **Fresh**: Leverage **islands** with minimal client state
- Create **state persistence** strategies where needed

### Performance Optimization
- Use **lazy loading** for non-critical components
- Implement **code splitting** at component boundaries
- Create **bundle analysis** for optimization insights
- Use **tree shaking** for unused code elimination
- Implement **preloading strategies** for critical resources

## Server-Side Rendering and Hydration

### SSR Implementation
- Implement **universal rendering** for SEO optimization
- Use **streaming SSR** for faster initial page loads
- Create **progressive enhancement** strategies
- Implement **meta tag management** for SEO
- Use **canonical URL** handling for duplicate content

### Hydration Strategies
- **Astro**: Use **partial hydration** with client directives
- **Solid**: Implement **isomorphic rendering** with hydration
- **Qwik**: Use **resumable** applications without hydration
- **Fresh**: Leverage **island hydration** for interactive elements
- Create **hydration error** handling and debugging

### Edge Computing Integration
- Deploy on **Vercel Edge**, **Netlify Edge**, **Cloudflare Workers**
- Implement **edge-side rendering** for global performance
- Use **edge caching** strategies for static content
- Create **regional deployment** for reduced latency
- Implement **edge API** routes for backend functionality

## Build Tools and Development Experience

### Modern Build Systems
- **Astro**: Use **Vite** with Astro's build system
- **Solid**: Implement **Vite** or **Webpack** with Solid plugin
- **Qwik**: Use **Qwik City** with built-in build system
- **Fresh**: Leverage **Deno** native bundling
- Create **build optimization** configurations

### Development Tools
- Use **TypeScript** for type safety across all frameworks
- Implement **ESLint** with framework-specific rules
- Create **Prettier** configuration for code formatting
- Use **Husky** for git hooks and pre-commit validation
- Implement **Storybook** for component development

### Hot Module Replacement
- Configure **HMR** for rapid development cycles
- Implement **state preservation** during development
- Create **error boundaries** for development debugging
- Use **development middleware** for enhanced DX
- Implement **source maps** for debugging

## Styling and Design Systems

### CSS-in-JS and Styling Solutions
- **Astro**: Use **Styled Components** or **CSS Modules**
- **Solid**: Implement **Solid Styled Components** or **Vanilla Extract**
- **Qwik**: Use **Styled Vanilla Extract** or **CSS Modules**
- **Fresh**: Leverage **Twind** for utility-first CSS
- Create **design tokens** for consistent theming

### Component Libraries Integration
- Integrate **Headless UI** libraries for accessible components
- Use **Radix UI**, **Ark UI**, or **Kobalte** for primitives
- Implement **custom design systems** with consistent patterns
- Create **theme providers** for dark/light mode
- Use **CSS custom properties** for dynamic theming

### Responsive Design
- Implement **mobile-first** design principles
- Use **CSS Grid** and **Flexbox** for layouts
- Create **responsive breakpoints** with consistent naming
- Implement **container queries** for component-based responsiveness
- Use **viewport-based units** for scalable designs

## API Integration and Data Fetching

### Data Fetching Patterns
- **Astro**: Use **fetch** in component scripts or **Astro.props**
- **Solid**: Implement **createResource** for reactive data
- **Qwik**: Use **routeLoader$** for server-side data loading
- **Fresh**: Leverage **handlers** for server-side data fetching
- Create **error handling** and **loading states**

### API Client Integration
- Use **tRPC** for type-safe API communication
- Implement **GraphQL** with **urql** or **Apollo Client**
- Create **REST API** clients with **ky** or **axios**
- Use **SWR** or **TanStack Query** for caching strategies
- Implement **optimistic updates** for better UX

### Authentication Integration
- Implement **JWT-based** authentication
- Use **OAuth providers** (Google, GitHub, Auth0)
- Create **session management** with secure cookies
- Implement **role-based access control**
- Use **authentication guards** for protected routes

## Testing Strategies

### Unit Testing
- Use **Vitest** for fast unit testing
- Implement **@testing-library** for component testing
- Create **mock strategies** for external dependencies
- Use **MSW** for API mocking
- Achieve **minimum 80% code coverage**

### Integration Testing
- Use **Playwright** for end-to-end testing
- Implement **visual regression** testing
- Create **accessibility testing** with **axe-core**
- Use **performance testing** with **Lighthouse CI**
- Implement **cross-browser testing**

### Framework-Specific Testing
- **Astro**: Test **component islands** and **SSR output**
- **Solid**: Use **@solidjs/testing-library** for reactive testing
- **Qwik**: Implement **Qwik testing** with specialized tools
- **Fresh**: Test **islands** and **server-side functionality**
- Create **integration tests** for framework-specific features

## Performance and Optimization

### Core Web Vitals Optimization
- Optimize **Largest Contentful Paint** (LCP)
- Minimize **First Input Delay** (FID)
- Reduce **Cumulative Layout Shift** (CLS)
- Implement **performance monitoring** with real user metrics
- Create **performance budgets** for build-time validation

### Bundle Optimization
- Use **dynamic imports** for code splitting
- Implement **route-based** code splitting
- Create **vendor chunk** optimization
- Use **compression** (gzip, brotli) for assets
- Implement **critical CSS** extraction

### Runtime Performance
- Minimize **JavaScript bundle** sizes
- Use **native web APIs** where possible
- Implement **service workers** for caching
- Create **preloading strategies** for critical resources
- Use **intersection observers** for lazy loading

## SEO and Accessibility

### SEO Optimization
- Implement **structured data** with JSON-LD
- Use **semantic HTML** for better search indexing
- Create **meta tag management** for social sharing
- Implement **sitemap generation** for search engines
- Use **canonical URLs** for duplicate content handling

### Accessibility Standards
- Follow **WCAG 2.1** guidelines for accessibility
- Implement **keyboard navigation** support
- Use **ARIA attributes** for screen readers
- Create **focus management** for interactive elements
- Test with **accessibility tools** and **screen readers**

### Progressive Enhancement
- Design for **no-JavaScript** scenarios
- Use **progressive disclosure** for complex interfaces
- Implement **graceful degradation** for older browsers
- Create **fallback strategies** for modern features
- Use **feature detection** over browser detection

## Tech Stack Requirements

### Astro Stack
- **Astro** (4+) - static site generator
- **Vite** - build tool
- **TypeScript** - type safety
- **Nanostores** - client state management
- **Tailwind CSS** - utility-first styling

### Solid.js Stack
- **Solid.js** (1.8+) - reactive framework
- **Solid Router** - client-side routing
- **Solid Meta** - document head management
- **@solidjs/testing-library** - testing utilities
- **Vite** - build tool and development server

### Qwik Stack
- **Qwik** (1.6+) - resumable framework
- **Qwik City** - meta-framework
- **Partytown** - web worker scripts
- **Styled Vanilla Extract** - type-safe CSS
- **Vitest** - testing framework

### Fresh Stack
- **Fresh** (1.6+) - Deno web framework
- **Preact** - lightweight React alternative
- **Twind** - utility-first CSS
- **Deno** - TypeScript runtime
- **Deno Deploy** - edge deployment

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with framework-specific extensions
- **WebStorm** - comprehensive JavaScript development
- **Zed** - high-performance code editor
- **Neovim** - with LSP and framework plugins

### Development Workflow
- Use **language servers** for intelligent code completion
- Implement **debugging** with source map support
- Use **version control** with framework-specific .gitignore
- Set up **automated testing** with CI/CD integration
- Use **hot reload** for rapid development cycles
