---
trigger: glob
globs: tailwind.config.js,tailwind.config.ts,*.css,src/**/*.{html,js,ts,jsx,tsx,vue,svelte}
---

# Universal Tailwind CSS Development Rules for Modern IDEs (v4+)

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/styles/components/button/
  ├── base.ts             (≤80 lines)
  ├── variants.ts         (≤80 lines)
  └── sizes.ts            (≤80 lines)
  ```
- **Smallest possible files** - decompose at utility, variant, and theme levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.ts` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: PMD CPD, Stylelint, jscpd, custom npm scripts
- **If any duplicacy found**, optimize immediately: extract common functionality, create reusable arbitrary values/variants, implement generic utilities, refactor responsive patterns
- **Continuous monitoring**: CI/CD pipeline, pre-commit hooks, weekly scans, IDE extensions
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Styling (DDS)
- **Never hardcode values** in class names; derive all measurements, colors, and breakpoints from theme configuration
- All parameters **must be defined in tailwind.config.js** and calculated dynamically
- Use **environment variables** for theme switching and configuration
- Derive color palettes and spacing from design system metrics
- Implement dynamic theme adjustment based on real-time user context

## Class and Style Quality Standards

### Zero Unused Classes (ZUC)
- **Never leave unused classes** in markup; remove them entirely
- Ensure every applied class serves specific purpose: layout, color, spacing, state management
- When implementing stub components, use classes meaningfully through conditional rendering

### Naming Conventions
- Use **descriptive class combinations** that convey intent: `bg-primary text-white hover:bg-primary-dark`
- Follow **consistent ordering**: layout → spacing → sizing → colors → typography → effects
- Use **semantic color names**: primary, secondary, success, warning, error instead of raw colors
- Implement **component-based class organization** with clear separation of concerns

### Utility Organization
- Group **related utilities** together: `flex items-center justify-between`
- Use **responsive prefixes** consistently: `md:flex lg:grid xl:block`
- Implement **state variants** systematically: `hover: focus: active: disabled:`
- Use **arbitrary values** sparingly and document usage: `w-[calc(100%-2rem)]`

## Responsive Design Standards

### Mobile-First Approach
- **Always start with mobile** styles and progressively enhance
- Use **min-width breakpoints**: `sm: md: lg: xl: 2xl:`
- Implement **touch-friendly sizing** with appropriate tap targets (44px+)
- Test **across device sizes** and orientations regularly

### Breakpoint Management
- Use **standard breakpoints**: sm(640px), md(768px), lg(1024px), xl(1280px), 2xl(1536px)
- Implement **custom breakpoints** only when necessary and document rationale
- Use **container queries** for component-based responsive design
- Implement **fluid typography** with clamp() for better scaling

### Performance Optimization
- **Purge unused styles** in production builds
- Use **JIT mode** for optimal bundle sizes
- Implement **critical CSS** extraction for above-the-fold content
- Monitor **CSS bundle sizes** and optimize heavy utility usage

## Theme Configuration

### Config Structure
- Organize **theme extensions** in logical groups: colors, spacing, typography, shadows
- Use **semantic naming** for theme values: `colors.primary.500` not `colors.blue.500`
- Implement **design token** integration with external design systems
- Use **CSS custom properties** for runtime theme switching

### Color System
- Define **comprehensive color palettes** with proper contrast ratios (WCAG AA+)
- Use **HSL color space** for better manipulation and accessibility
- Implement **dark mode** support with `dark:` variant
- Use **alpha utilities** for transparency: `bg-black/20`

### Typography Scale
- Define **modular typography scale** based on design system
- Use **font-face declarations** for custom fonts with proper fallbacks
- Implement **fluid typography** for responsive text sizing
- Use **line-height** and **letter-spacing** consistently

### Spacing System
- Use **consistent spacing scale** based on 4px or 8px grid
- Implement **logical properties** for better internationalization
- Use **aspect-ratio utilities** for maintaining proportions
- Define **container widths** and **max-widths** systematically

## Component Patterns

### Class Composition
- Create **reusable class combinations** for common patterns
- Use **@apply directive** sparingly and only for true base styles
- Implement **variant-based styling** with data attributes or classes
- Use **CSS-in-JS compatibility** when needed with frameworks

### State Management
- Use **data attributes** for complex state: `data-state="open"`
- Implement **group utilities** for parent-child interactions: `group-hover:`
- Use **peer utilities** for sibling interactions: `peer-checked:`
- Implement **has: utilities** for parent state based on children

### Animation and Transitions
- Use **transition utilities** for smooth interactions
- Implement **animation utilities** for micro-interactions
- Use **reduced-motion** considerations for accessibility
- Define **custom animations** in config when needed

## Framework Integration

### React/Next.js Integration
- Use **className** prop consistently
- Implement **conditional classes** with libraries like clsx or cn
- Use **CSS modules** compatibility when needed
- Implement **component variants** with consistent API

### Vue Integration
- Use **:class bindings** for dynamic classes
- Implement **scoped styles** compatibility
- Use **v-bind** for CSS custom properties
- Implement **composition API** patterns for theme management

### Svelte Integration
- Use **class: directives** for conditional styling
- Implement **CSS custom properties** with reactive statements
- Use **global styles** appropriately with :global()
- Implement **component theming** with CSS variables

## Build and Development

### Development Workflow
- Use **Tailwind IntelliSense** for VS Code or compatible IDEs
- Implement **hot reload** with proper class detection
- Use **PostCSS plugins** for additional functionality
- Set up **linting rules** for class order and best practices

### Production Optimization
- Enable **purging** with proper content configuration
- Use **minification** and **compression** for CSS output
- Implement **critical CSS** extraction for performance
- Monitor **bundle sizes** and optimize accordingly

### Plugin Development
- Create **custom utilities** using plugin API
- Implement **component plugins** for complex patterns
- Use **variant plugins** for custom state management
- Document **plugin usage** and maintain consistency

## Accessibility Standards

### Color and Contrast
- Ensure **WCAG AA compliance** for all color combinations (4.5:1 ratio)
- Use **color-blind friendly** palettes
- Implement **high contrast mode** support
- Test with **accessibility tools** regularly

### Interactive Elements
- Use **focus-visible** utilities for keyboard navigation
- Implement **screen reader** friendly markup with proper ARIA
- Use **semantic HTML** with Tailwind styling
- Test with **keyboard navigation** and **screen readers**

### Motion and Animation
- Respect **prefers-reduced-motion** settings
- Use **motion-safe** and **motion-reduce** utilities
- Implement **skip links** for navigation
- Provide **alternative content** for animations

## Testing and Quality Assurance

### Visual Testing
- Implement **visual regression testing** with tools like Chromatic
- Test **cross-browser compatibility** including older browsers
- Use **device testing** for mobile responsiveness
- Implement **automated accessibility testing**

### Performance Testing
- Monitor **CSS bundle sizes** and loading times
- Test **paint performance** with complex layouts
- Use **Core Web Vitals** metrics for optimization
- Implement **lazy loading** for non-critical styles

### Code Quality
- Use **Stylelint** for CSS linting
- Implement **class order** enforcement with prettier-plugin-tailwindcss
- Use **automated formatting** with consistent configuration
- Set up **pre-commit hooks** for quality gates

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Tailwind CSS IntelliSense
- **WebStorm** with Tailwind CSS plugin
- **Sublime Text** with Tailwind CSS package
- **Vim/Neovim** with appropriate plugins

### Development Tools
- Use **browser DevTools** extensions for Tailwind
- Implement **design tokens** synchronization
- Use **color picker** tools for theme development
- Set up **live preview** for rapid iteration
