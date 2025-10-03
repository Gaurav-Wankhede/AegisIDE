---
trigger: glob
globs: *.ts,*.html,*.scss,*.css,angular.json,package.json,tsconfig.json,*.spec.ts
---

# Universal Angular Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/app/features/user/profile/user-avatar.component.ts` (≤80 lines)
- **Smallest possible files** - decompose at component, service, and directive levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **barrel exports** (index.ts) for module organization (also ≤80 lines)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: ESLint Angular rules, SonarQube, custom Angular analyzers
- **If any duplicacy found**, optimize immediately: extract common functionality, create shared modules, implement base classes, refactor into libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment files** and **Angular configuration** for all parameters
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, state management
- When implementing stub methods, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for variables, methods, and properties
- **PascalCase** for classes, components, services, and interfaces
- **kebab-case** for component selectors and file names
- **UPPER_CASE** for constants and enums
- **Descriptive, action-oriented names** for deepest folders

### Type Safety and Static Analysis
- **Always use TypeScript** with strict mode enabled
- Use **interfaces** and **types** for all data structures
- Leverage **generics** for reusable components and services
- Implement **union types** and **literal types** for type safety
- Use **Angular ESLint** rules for consistent code quality

## Modern Angular Features (Angular 17+)

### Standalone Components and Signals
- Use **standalone: true** for all new components
- Import **only required dependencies** in component imports array
- Avoid **NgModules** for new feature development
- Use **bootstrapApplication** instead of **bootstrapModule**
- Use **signal()** for reactive state management
- Implement **computed()** for derived state calculations
- Use **effect()** for side effects based on signal changes

### Control Flow Syntax (@if, @for, @switch)
- Use **@if** instead of **\*ngIf** for conditional rendering
- Use **@for** instead of **\*ngFor** for list rendering with track expressions
- Use **@switch** instead of **\*ngSwitch** for multiple condition rendering
- Implement **@defer** for lazy loading template sections

## Component Architecture

### Component Design and Communication
- Create **pure components** with predictable inputs/outputs
- Use **OnPush change detection** strategy by default
- Implement **single responsibility principle** for each component
- Use **@Input()** and **@Output()** for parent-child communication
- Implement **services** for sibling component communication
- Use **ViewChild** and **ContentChild** for DOM access

### State Management
- Use **services with BehaviorSubject** for simple state management
- Implement **NgRx** for complex application state
- Implement **RxJS operators** for reactive data transformation
- Use **Signals** for local component state in Angular 17+

## Services and Dependency Injection

### Service Design Patterns and DI
- Create **injectable services** with @Injectable decorator
- Use **providedIn: 'root'** for singleton services
- Use **constructor injection** as primary pattern
- Implement **inject()** function for functional injection (Angular 14+)
- Use **@Optional()** and **@Self()** decorators when appropriate

### HTTP and API Integration
- Use **HttpClient** for all HTTP operations
- Implement **HTTP interceptors** for cross-cutting concerns
- Use **typed HTTP responses** with interfaces
- Implement **error handling** with catchError operator

## Reactive Programming with RxJS

### RxJS Patterns and Best Practices
- Use **observables** for asynchronous data streams
- Implement **operators** for data transformation (map, filter, switchMap)
- Use **async pipe** in templates for automatic subscription management
- Implement **takeUntil** pattern for component cleanup
- Use **combineLatest** and **merge** for stream composition

### State Management and Error Handling
- Use **BehaviorSubject** for state that needs initial value
- Implement **Subject** for event-based communication
- Use **shareReplay** for expensive operations caching
- Use **catchError** operator for error handling
- Use **tap** operator for side effects and debugging

## Forms and Validation

### Reactive Forms (Recommended)
- Use **FormBuilder** for form creation
- Implement **FormControl**, **FormGroup**, and **FormArray**
- Use **validators** (built-in and custom) for form validation
- Implement **cross-field validation** with custom validators
- Use **updateOn** strategy for performance optimization

### Advanced Form Patterns
- Use **ngModel** for simple two-way data binding
- Implement **dynamic forms** with FormArray
- Use **conditional validators** based on form state
- Implement **async validators** for server-side validation
- Use **debounce** and **distinctUntilChanged** for performance

## Routing and Navigation

### Router Configuration and Navigation
- Use **Router** and **ActivatedRoute** for navigation
- Implement **route guards** (CanActivate, CanDeactivate, Resolve)
- Use **lazy loading** with loadChildren for code splitting
- Use **routerLink** directive for declarative navigation
- Implement **programmatic navigation** with Router.navigate()
- Use **relative navigation** for maintainable routes

### Route Security and Performance
- Implement **authentication guards** for protected routes
- Use **role-based guards** for authorization
- Implement **preloading strategies** for better performance
- Use **route resolvers** for data loading before navigation

## Testing Strategies

### Unit Testing with Jasmine and Karma
- Write **unit tests** for components, services, and pipes
- Use **TestBed** for component and service testing
- Implement **mock objects** and **spies** for isolation
- Use **fixture.detectChanges()** for change detection in tests
- Achieve **minimum 80% code coverage**

### Component Testing Patterns
- Test **component inputs** and **outputs**
- Use **DebugElement** for DOM interaction in tests
- Implement **async testing** with **fakeAsync** and **tick**
- Test **component lifecycle hooks** appropriately
- Use **PageObject pattern** for complex component testing

### Integration and E2E Testing
- Use **Protractor** or **Cypress** for E2E testing
- Implement **integration tests** for feature modules
- Test **routing** and **navigation** scenarios
- Use **data attributes** for stable test selectors
- Implement **visual regression testing** where appropriate

## Performance Optimization

### Change Detection Optimization
- Use **OnPush change detection** strategy
- Implement **immutable data patterns**
- Use **trackBy functions** in *ngFor loops
- Implement **pure pipes** for expensive operations
- Use **async pipe** to avoid manual subscriptions

### Bundle Optimization and Lazy Loading
- Implement **lazy loading** for feature modules
- Use **preloading strategies** for better perceived performance
- Implement **tree shaking** with proper imports
- Use **webpack bundle analyzer** for bundle optimization
- Implement **service workers** for caching strategies

### Runtime Performance
- Use **virtual scrolling** for large lists
- Implement **infinite scrolling** for paginated data
- Use **CDK Portal** for dynamic component rendering
- Implement **image lazy loading** with ng-lazyload-image
- Use **web workers** for CPU-intensive tasks

## Angular Material and UI Libraries

### Angular Material Integration
- Use **Angular Material** components for consistent UI
- Implement **theming** with Material Design palette
- Use **CDK** for advanced component behaviors
- Implement **responsive layouts** with Angular Flex Layout
- Use **accessibility features** built into Material components

### Custom Component Libraries
- Create **reusable component libraries** with ng-packagr
- Implement **design systems** with consistent styling
- Use **Storybook** for component documentation
- Implement **component testing** strategies
- Use **semantic versioning** for library releases

## Build and Deployment

### Angular CLI and Workspace
- Use **Angular CLI** for project scaffolding and management
- Implement **workspace configuration** for multi-project setups
- Use **custom schematics** for code generation
- Implement **build configurations** for different environments
- Use **angular.json** for project configuration management

### Production Build Optimization
- Use **AOT compilation** (enabled by default)
- Implement **build budgets** for bundle size monitoring
- Use **source maps** for production debugging
- Implement **differential loading** for modern browsers
- Use **service workers** with Angular PWA

### CI/CD Integration
- Use **GitHub Actions**, **Jenkins**, or **Azure DevOps** for CI/CD
- Implement **automated testing** in build pipelines
- Use **code quality gates** with SonarQube
- Implement **automated deployment** strategies
- Use **feature flags** for controlled rollouts

## Security Best Practices

### XSS Prevention and Input Sanitization
- **Never use innerHTML** directly, use Angular's DOM sanitization
- Use **DomSanitizer** for trusted content when necessary
- Implement **input validation** on both client and server
- Use **Content Security Policy** headers
- Validate **all user inputs** before processing

### Authentication and Authorization
- Implement **JWT authentication** with proper token handling
- Use **HTTP interceptors** for authentication headers
- Implement **role-based access control** in components and routes
- Use **secure storage** for sensitive data
- Implement **session timeout** and **token refresh**

## Tech Stack Requirements

### Core Dependencies
- **@angular/core** (17+) - framework core
- **@angular/common** - common directives and services
- **@angular/router** - routing functionality
- **@angular/forms** - reactive and template-driven forms
- **rxjs** - reactive programming

### Development Dependencies
- **@angular/cli** - development tooling
- **typescript** - type safety
- **@angular-eslint/eslint-plugin** - linting
- **jasmine** and **karma** - testing
- **@angular-devkit/build-angular** - build system

### Popular Libraries
- **@angular/material** - UI component library
- **@ngrx/store** - state management
- **@angular/cdk** - component development kit
- **ngx-translate** - internationalization
- **angular2-uuid** - UUID generation

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Angular extensions
- **WebStorm** with Angular support
- **Sublime Text** with Angular packages
- **Vim/Neovim** with Angular plugins

### Development Tools
- **Angular DevTools** browser extension
- **Angular Language Service** for IDE integration
- **Augury** for component tree inspection
- **Redux DevTools** for NgRx debugging
- **Webpack Bundle Analyzer** for performance analysis
