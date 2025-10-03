---
trigger: glob
globs: *.dart,*.js,*.tsx,*.ts,flutter,react-native,pubspec.yaml,metro.config.js
---

# Universal Mobile Cross-Platform Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `lib/features/user/profile/widgets/avatar_widget.dart` (≤80 lines)
- **Smallest possible files** - decompose at widget, component, and service levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular mobile architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: Flutter analyzer, Metro bundler, custom mobile analyzers
- **If any duplicacy found**, optimize immediately: extract common widgets, create reusable components, implement shared utilities, refactor into packages
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in mobile application logic
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **configuration files** for all parameters
- Implement dynamic parameter adjustment based on device capabilities and user preferences

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, UI rendering
- When implementing stub components, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **camelCase** for Dart variables and functions (Flutter)
- **camelCase** for JavaScript/TypeScript variables (React Native)
- **PascalCase** for classes and components
- **UPPER_CASE** for constants and environment variables
- **snake_case** for file names in Flutter, **kebab-case** for React Native

## Modern Mobile Development (2025)

### Flutter Framework (Google)
- Use **Flutter 3.22+** with latest stable features
- Implement **Material Design 3** and **Cupertino** design systems
- Use **Dart 3+** with null safety and modern features
- Leverage **Flutter Web** and **Desktop** for multi-platform deployment
- Implement **Hot Reload** for rapid development cycles

### React Native Framework (Meta)
- Use **React Native 0.74+** with latest architecture
- Implement **New Architecture** (Fabric, TurboModules)
- Use **React 18+** with concurrent features
- Leverage **TypeScript** for type safety
- Implement **Fast Refresh** for development efficiency

### State Management Patterns
- **Flutter**: Use **Bloc**, **Provider**, **Riverpod**, or **GetX**
- **React Native**: Use **Redux Toolkit**, **Zustand**, **Context API**, or **MobX**
- Implement **immutable state** patterns
- Use **state persistence** for app lifecycle management
- Create **state testing** strategies

## UI/UX Design Patterns

### Flutter Widget Architecture
- Use **StatelessWidget** for static UI components
- Implement **StatefulWidget** for dynamic interactions
- Create **custom widgets** for reusable UI elements
- Use **composition over inheritance** for widget design
- Implement **responsive design** with MediaQuery and LayoutBuilder

### React Native Component Patterns
- Use **functional components** with hooks
- Implement **custom hooks** for reusable logic
- Create **styled components** for consistent theming
- Use **FlatList** and **SectionList** for performance
- Implement **responsive design** with Flexbox and Dimensions

### Design System Implementation
- Create **design tokens** for colors, typography, spacing
- Implement **component libraries** with consistent styling
- Use **theme providers** for dark/light mode support
- Create **accessibility standards** with proper labels and hints
- Implement **animation libraries** (Lottie, Rive) for engaging UX

## Navigation and Routing

### Flutter Navigation
- Use **GoRouter** for declarative navigation
- Implement **named routes** with parameter passing
- Create **nested navigation** for complex flows
- Use **page transitions** for smooth user experience
- Implement **deep linking** for external navigation

### React Native Navigation
- Use **React Navigation 6** for stack and tab navigation
- Implement **drawer navigation** for menu systems
- Create **modal navigation** for overlays
- Use **navigation params** for data passing
- Implement **linking configuration** for deep links

### Navigation Best Practices
- Implement **navigation guards** for authentication
- Use **navigation analytics** for user flow tracking
- Create **navigation testing** for critical paths
- Implement **back button handling** for Android
- Use **navigation state persistence** for app restoration

## Platform Integration

### Device Capabilities
- Implement **camera integration** with proper permissions
- Use **location services** with privacy compliance
- Create **file system access** with scoped storage
- Implement **biometric authentication** (fingerprint, face)
- Use **push notifications** with proper handling

### Native Module Integration
- **Flutter**: Create **platform channels** for native communication
- **React Native**: Implement **native modules** for platform-specific features
- Use **method channels** for bidirectional communication
- Create **event channels** for streaming data
- Implement **proper error handling** for native operations

### Performance Optimization
- Use **lazy loading** for large lists and images
- Implement **image caching** and optimization
- Create **bundle splitting** for code optimization
- Use **tree shaking** to eliminate unused code
- Implement **memory management** best practices

## Data Management and APIs

### HTTP Client Integration
- **Flutter**: Use **Dio** or **HTTP** package for API calls
- **React Native**: Use **Axios** or **Fetch API** for networking
- Implement **request/response interceptors** for common logic
- Use **retry mechanisms** for network failures
- Create **request caching** for offline functionality

### Local Storage Solutions
- **Flutter**: Use **SharedPreferences**, **Hive**, or **SQLite**
- **React Native**: Use **AsyncStorage**, **Realm**, or **SQLite**
- Implement **secure storage** for sensitive data
- Use **database migrations** for schema changes
- Create **data synchronization** strategies

### Offline-First Architecture
- Implement **offline data caching** strategies
- Use **sync mechanisms** for data consistency
- Create **conflict resolution** for concurrent updates
- Implement **queue systems** for offline operations
- Use **network status monitoring** for connectivity handling

## Testing Strategies

### Unit Testing
- **Flutter**: Use **flutter_test** package for widget testing
- **React Native**: Use **Jest** and **React Native Testing Library**
- Write **unit tests** for business logic and utilities
- Implement **mock objects** for external dependencies
- Achieve **minimum 80% code coverage**

### Integration Testing
- **Flutter**: Use **integration_test** package for E2E testing
- **React Native**: Use **Detox** or **Maestro** for E2E testing
- Test **user workflows** and critical paths
- Implement **device testing** on multiple platforms
- Use **automated testing** in CI/CD pipelines

### UI Testing
- Create **golden tests** for UI consistency (Flutter)
- Implement **snapshot testing** for component rendering (React Native)
- Use **accessibility testing** for inclusive design
- Test **responsive layouts** on different screen sizes
- Implement **visual regression testing**

## Performance and Optimization

### Build Optimization
- **Flutter**: Use **--release** builds for production
- **React Native**: Implement **bundle optimization** with Metro
- Use **code splitting** for lazy loading
- Implement **asset optimization** (images, fonts)
- Create **build size analysis** and monitoring

### Runtime Performance
- Monitor **frame rates** and **rendering performance**
- Implement **memory profiling** for leak detection
- Use **performance monitoring** tools (Firebase Performance)
- Create **startup time optimization**
- Implement **battery usage optimization**

### Platform-Specific Optimization
- **iOS**: Implement **App Store optimization** guidelines
- **Android**: Use **Android App Bundle** for distribution
- Create **platform-specific UI** adaptations
- Implement **deep linking** optimization
- Use **platform APIs** efficiently

## Security Best Practices

### Data Security
- Implement **data encryption** for sensitive information
- Use **secure communication** (HTTPS, certificate pinning)
- Create **authentication strategies** (OAuth, JWT)
- Implement **biometric authentication** where appropriate
- Use **secure storage** for credentials and tokens

### Code Security
- Implement **code obfuscation** for production builds
- Use **environment variables** for sensitive configuration
- Create **API key protection** strategies
- Implement **runtime application self-protection** (RASP)
- Use **security scanning** tools in development

## Deployment and Distribution

### App Store Deployment
- **iOS**: Use **Xcode** and **App Store Connect** for distribution
- **Android**: Use **Google Play Console** for publishing
- Implement **app signing** and **security configurations**
- Create **release notes** and **version management**
- Use **staged rollouts** for gradual deployment

### CI/CD Pipeline
- Implement **automated building** with GitHub Actions or similar
- Use **automated testing** in deployment pipeline
- Create **environment management** (dev/staging/prod)
- Implement **crash reporting** with Crashlytics or Sentry
- Use **performance monitoring** for production apps

## Tech Stack Requirements

### Flutter Stack
- **Flutter** (3.22+) - UI framework
- **Dart** (3+) - programming language
- **Provider/Bloc** - state management
- **Dio** - HTTP client
- **SharedPreferences** - local storage

### React Native Stack
- **React Native** (0.74+) - mobile framework
- **TypeScript** - type safety
- **React Navigation** - navigation solution
- **Redux Toolkit** - state management
- **AsyncStorage** - local storage

### Development Tools
- **Android Studio** - Android development
- **Xcode** - iOS development
- **VS Code** - cross-platform development
- **Flutter Inspector** - UI debugging
- **Flipper** - React Native debugging

### Testing and Deployment
- **Firebase** - backend services and analytics
- **Fastlane** - automated deployment
- **CodePush** - over-the-air updates (React Native)
- **Crashlytics** - crash reporting
- **App Center** - mobile DevOps

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Flutter and React Native extensions
- **Android Studio** with Flutter plugin
- **Xcode** for iOS development and debugging
- **IntelliJ IDEA** with mobile development plugins

### Development Workflow
- Use **hot reload/refresh** for rapid development
- Implement **debugging** with proper breakpoint support
- Use **version control** with mobile-specific .gitignore
- Set up **automated testing** with mobile CI/CD
- Use **code formatting** with Dart formatter or Prettier
