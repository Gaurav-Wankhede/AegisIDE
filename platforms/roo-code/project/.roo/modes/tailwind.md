# Universal Tailwind CSS Development Rules for Modern IDEs (v4+)

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders** for every sub-functionality following pattern:
  ```
  src/
  ├── styles/
  │   ├── components/
  │   │   ├── button/
  │   │   │   ├── base.ts             (≤80 lines)
  │   │   │   ├── variants.ts         (≤80 lines)
  │   │   │   └── sizes.ts            (≤80 lines)
  ```
- **Smallest possible files** - decompose at utility, variant, and theme levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use `index.ts` files solely for re-exports and module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy of the same functionalities
- **Use automated duplicate detection tools** before every commit and deployment:
  - **PMD CPD (Copy/Paste Detector)** for fast command-line duplicate detection
  - **Stylelint** with duplicate rule plugins
  - **jscpd** for cross-language duplicate detection including CSS
  - **Custom npm scripts** for project-specific duplicate detection in Tailwind configs
- **If any duplicacy found**, optimize immediately without disturbing the system:
  - **Extract common functionality** into shared theme files following deep subfolder patterns
  - **Create reusable arbitrary values** and variants for common styles
  - **Implement generic utilities** using Tailwind's plugin system
  - **Refactor similar responsive patterns** into common utilities in `shared/styles/` subfolder
- **Continuous monitoring approach**:
  - Run duplicate detection in **CI/CD pipeline** before merge
  - Set up **pre-commit hooks** with duplicate detection tools
  - Schedule **weekly automated scans** with detailed reports
  - Integrate duplicate detection into **IDE workflow** with custom extensions
- **Optimization strategies**:
  - **Preserve system functionality** during refactoring - never break existing styles
  - **Use feature flags** to gradually replace duplicated styles
  - **Maintain backward compatibility** while optimizing themes
  - **Test thoroughly** after each duplicate removal to ensure visual stability

### Data-Driven Styling (DDS)
- **Never hardcode values** in class names; derive all measurements, colors, and breakpoints from theme configuration
- All numerical values, thresholds, limits, and design parameters **must be defined in tailwind.config.js** and calculated dynamically
- Use **environment variables** for theme switching and configuration
- Derive color palettes and spacing from design system metrics
- Calculate responsive breakpoints based on device data and user preferences
- Implement dynamic theme adjustment based on real-time user context and metrics

## Class and Style Quality Standards

### Zero Unused Classes (ZUC)
- **Never leave unused classes** in markup; remove them entirely
- Ensure every applied class serves specific purpose: layout, color, spacing, or state management
- When implementing stub components, use classes meaningfully through conditional rendering

### Naming Conventions
- Use **descriptive class combinations** that convey intent: `bg-primary text-white hover:bg-primary-dark`
- **kebab-case** for custom classes and arbitrary values
- **Consistent prefixes** for variants (e.g., `dark:`, `hover:`, `md:`)
- **Descriptive, action-oriented names** for deepest theme folders
- Follow **design system** principles in theme hierarchy

### Utility-First Methodology
- **Always prefer utility classes** over custom CSS; extend only when necessary via plugins
- Enable **strict mode** in tailwind.config.js for better error checking
- Leverage **arbitrary values** for one-off styles: `w-[calc(100%-2rem)]`
- Define **custom variants** for project-specific needs
- Implement **layer directives** (@apply, @layer) judiciously for components

## Responsive and State Management Standards

### Responsive Design
- Use **built-in breakpoints** (sm, md, lg, xl, 2xl) for all responsive styles
- Implement **container queries** with @container for component-level responsiveness
- Leverage **aspect ratios** and **object-fit** for media handling
- Use **fluid typography** with clamp() in arbitrary values

### State and Theme Management
- Implement **dark mode** with `dark:` variant and class strategy
- Use **group-hover** and **peer** for interactive states
- Leverage **data attributes** for custom states: `[data-state=open]`
- Handle **reduced motion** with prefers-reduced-motion media query

## Performance Optimization

### Build Optimization
- Enable **content scanning** to purge unused styles
- Use **JIT mode** for on-demand compilation
- Implement **CSS minification** in production
- Leverage **layer extraction** for better tree shaking

### Runtime Optimization
- Avoid **long class strings**; extract to components when complex
- Use **content-visibility** for performance in lists
- Optimize **animations** with will-change and reduced motion variants
- Monitor **CSS bundle size** and split if necessary

## Testing Requirements

### Testing Standards
- Write **unit tests** for components using Jest and Testing Library
- Test **responsive breakpoints** with viewport emulation
- Implement **visual regression tests** with tools like Percy
- Validate **accessibility** with axe-core
- Achieve **minimum 80% coverage** for styled components

### Test Organization
- Follow **AAA pattern**: Arrange, Act, Assert
- Use **parametrized tests** for different themes and states
- Implement **fixtures** for reusable component setups
- Test **edge cases** like reduced motion and dark mode

## Integration and Extension Patterns

### Framework Integration
- Use **@tailwind directives** in global CSS: base, components, utilities
- Implement **plugins** for custom utilities and variants
- Leverage **theme function** for dynamic values
- Handle **CSS-in-JS** integration if needed with twin.macro

### Custom Theme Patterns
- Extend **default theme** in tailwind.config.js
- Use **OKLCH colors** for modern color management
- Implement **custom fonts** with @font-face
- Define **design tokens** for consistency

## Tech Stack Requirements

### Core Dependencies
- **tailwindcss** - core framework (v4+)
- **postcss** - processor
- **autoprefixer** - vendor prefixing
- **tailwind-merge** - class merging

### Development Dependencies
- **prettier-plugin-tailwindcss** - auto-sorting
- **eslint-plugin-tailwindcss** - linting
- **stylelint** - CSS linting
- **husky** - git hooks

## Documentation Standards

### Code Documentation
- Use **comments** in tailwind.config.js for custom extensions
- Document **component props** that affect styling
- Include **usage examples** in README
- Generate **style guides** with tools like Storybook

### Theme Documentation
- Maintain **design system docs** with all tokens
- Document **custom variants** and plugins
- Include **accessibility guidelines**
- Track **browser compatibility**

## File Organization Rules

### Module Structure
- Separate concerns into logical files with clear boundaries
- Use **folders** for theme categories
- Maintain **consistent depth levels**
- Follow **microservices decomposition** for styles

### Project Layout
```
src/
├── styles/
│   ├── components/  # Extracted components
│   ├── themes/      # Custom themes
│   ├── plugins/     # Tailwind plugins
│   └── globals.css  # Main stylesheet
├── tailwind.config.js
└── postcss.config.js
```

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Tailwind IntelliSense extension
- **WebStorm** with Tailwind plugin
- **Sublime Text** with Tailwind completions
- **Auto-completion** for class names

### Development Workflow
- Use **pre-commit hooks** for sorting classes
- Implement **watch mode** for compilation
- Use **npm scripts** for build tasks
- Set up **CI** with style linting

## Security and Best Practices

### Security Guidelines
- **Avoid inline styles** for security (CSP compliance)
- Validate **user-generated classes** if dynamic
- Implement **content security policy**
- Use **subresource integrity** for CDN

### Code Quality
- Follow **utility-first** methodology
- Use **clsx** or **tailwind-merge** for conditional classes
- Implement **consistent ordering** with plugins
- Avoid **!important** unless necessary

## Package Management and Deployment

### Dependency Management
- Use **npm** or **yarn**
- Pin **exact versions**
- Use **workspaces** for monorepos
- Implement **security scanning**

### Deployment Patterns
- Enable **production purging**
- Implement **critical CSS** extraction
- Optimize **bundle size**
- Use **CDN** for delivery