---
trigger: glob
globs: Dockerfile,docker-compose.yml,*.dockerfile,.dockerignore,compose.yaml
---

# Universal Docker Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `docker/services/api/Dockerfile` (≤80 lines)
- **Smallest possible files** - decompose at service, environment, and configuration levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **multi-stage builds** for optimization (also ≤80 lines per stage)

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: hadolint, docker-compose validation, custom Docker analyzers
- **If any duplicacy found**, optimize immediately: extract common base images, create shared volumes, implement reusable compose services
- **Optimization strategies**: preserve functionality, use build args, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in Dockerfiles or compose files
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **.env files** for all parameters
- Implement dynamic parameter adjustment based on real-time system load

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: build args, environment variables, volume mounts
- When implementing stub configurations, use variables meaningfully through logging

### Naming Conventions
- **lowercase-with-hyphens** for container names and service names
- **UPPER_CASE** for environment variables and build arguments
- **lowercase** for volume and network names
- **descriptive-action-oriented-names** for deepest service hierarchies

## Modern Docker Features (2025)

### Multi-Stage Builds and Optimization
- Use **multi-stage builds** for production optimization
- Implement **distroless images** for security and size
- Use **BuildKit** features for advanced caching
- Implement **build arguments** for dynamic configuration
- Use **layer caching** strategies for faster builds

### Container Security Best Practices
- **Run as non-root user** in containers
- Use **specific image tags** instead of latest
- Implement **image scanning** with tools like Trivy
- Use **secrets management** with Docker secrets or external providers
- Implement **resource limits** and **health checks**

### Docker Compose Patterns
- Use **docker-compose.yml** for development environments
- Implement **docker-compose.override.yml** for local customization
- Use **profiles** for different environment configurations
- Implement **depends_on** with health checks for service orchestration
- Use **external networks** and **volumes** for shared resources

## Container Architecture

### Service Design Principles
- Create **single-concern containers** following microservices principles
- Use **init systems** for proper signal handling
- Implement **graceful shutdowns** with proper signal handling
- Use **health checks** for container monitoring
- Implement **logging** to stdout/stderr for container orchestration

### Networking and Communication
- Use **custom networks** for service isolation
- Implement **service discovery** through container names
- Use **environment variables** for service configuration
- Implement **load balancing** with reverse proxies
- Use **port mapping** strategically for external access

### Data Persistence and Volumes
- Use **named volumes** for persistent data
- Implement **bind mounts** for development workflows
- Use **tmpfs mounts** for temporary data
- Implement **volume backup** and **restore strategies**
- Use **volume drivers** for cloud storage integration

## Development Workflows

### Local Development
- Use **docker-compose** for local development environments
- Implement **hot reloading** with bind mounts
- Use **development-specific** docker-compose overrides
- Implement **database seeding** and **fixture loading**
- Use **debugging ports** and **IDE integration**

### Testing and CI/CD
- Use **test containers** for integration testing
- Implement **parallel testing** with separate database containers
- Use **multi-arch builds** for cross-platform compatibility
- Implement **container registry** integration
- Use **security scanning** in CI/CD pipelines

### Environment Management
- Use **.env files** for environment-specific configuration
- Implement **environment-specific** compose files
- Use **build args** for compile-time configuration
- Implement **runtime configuration** with environment variables
- Use **configuration management** tools like Consul or etcd

## Production Deployment

### Container Orchestration
- Use **Kubernetes** for production container orchestration
- Implement **Docker Swarm** for simpler orchestration needs
- Use **service meshes** like Istio for complex microservices
- Implement **auto-scaling** based on metrics
- Use **rolling deployments** for zero-downtime updates

### Monitoring and Observability
- Implement **centralized logging** with ELK stack or similar
- Use **metrics collection** with Prometheus and Grafana
- Implement **distributed tracing** with Jaeger or Zipkin
- Use **health check endpoints** for monitoring
- Implement **alerting** based on container metrics

### Security and Compliance
- Use **image vulnerability scanning** in CI/CD
- Implement **runtime security** with tools like Falco
- Use **network policies** for micro-segmentation
- Implement **secrets rotation** and **access control**
- Use **compliance scanning** for regulatory requirements

## Performance Optimization

### Build Optimization
- Use **layer caching** effectively with proper instruction ordering
- Implement **multi-stage builds** to reduce final image size
- Use **.dockerignore** to exclude unnecessary files
- Implement **build context** optimization
- Use **BuildKit** features for parallel builds

### Runtime Optimization
- Set appropriate **resource limits** (CPU, memory)
- Use **init systems** for proper process management
- Implement **process monitoring** and **restart policies**
- Use **read-only filesystems** where possible
- Implement **container right-sizing** based on metrics

### Registry and Distribution
- Use **image layer sharing** for efficient storage
- Implement **image compression** and **optimization**
- Use **content trust** for image verification
- Implement **geographic distribution** with registry replication
- Use **garbage collection** for unused images

## Testing Requirements

### Container Testing
- Write **unit tests** for Dockerfile instructions
- Use **container structure tests** for image validation
- Implement **integration tests** with test containers
- Use **security tests** for vulnerability scanning
- Achieve **minimum 80% coverage** of container configurations

### Testing Tools and Techniques
- Use **hadolint** for Dockerfile linting
- Implement **docker-compose** validation
- Use **container-diff** for image comparison
- Implement **chaos engineering** for resilience testing
- Use **load testing** for performance validation

## Security Best Practices

### Image Security
- Use **minimal base images** like Alpine or distroless
- **Scan images** for vulnerabilities regularly
- Use **trusted registries** and **image signing**
- Implement **image policy** enforcement
- **Update base images** regularly for security patches

### Runtime Security
- **Run containers as non-root** users
- Use **read-only root filesystems** where possible
- Implement **AppArmor** or **SELinux** profiles
- Use **seccomp** profiles to restrict system calls
- Implement **capability dropping** for least privilege

## Tech Stack Requirements

### Core Dependencies
- **Docker Engine** (24+) - container runtime
- **Docker Compose** (2.0+) - multi-container orchestration
- **BuildKit** - advanced build features
- **docker-cli** - command line interface

### Development Tools
- **hadolint** - Dockerfile linting
- **dive** - image layer analysis
- **docker-compose-validator** - compose file validation
- **trivy** - vulnerability scanning
- **container-structure-test** - image testing

### Popular Images and Tools
- **nginx** - web server and reverse proxy
- **postgres** - relational database
- **redis** - caching and message broker
- **node** - JavaScript runtime
- **python** - Python runtime

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with Docker extensions
- **JetBrains IDEs** with Docker plugin
- **Docker Desktop** for GUI management
- **command line** tools for automation

### Development Workflow
- Use **Docker extensions** for IDE integration
- Implement **dev containers** for consistent development environments
- Use **volume mounts** for code synchronization
- Set up **debugging** through container ports
- Use **integrated terminals** for container access
