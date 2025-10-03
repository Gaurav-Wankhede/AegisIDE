---
trigger: glob
globs: *.yml,*.yaml,Dockerfile,kubernetes,terraform,aws,azure,gcp,helm,ansible
---

# Universal Cloud DevOps Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `infrastructure/kubernetes/apps/user-service/deployment.yaml` (≤80 lines)
- **Smallest possible files** - decompose at service, environment, and resource levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **infrastructure as code** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: Terraform analyzers, Kubernetes validators, YAML linters
- **If any duplicacy found**, optimize immediately: extract common configurations, create reusable modules, implement shared templates, refactor into libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

### Data-Driven Programming (DDP)
- **Never hardcode values** in infrastructure configuration
- All parameters **must be calculated from real-world data and configuration**
- Use **environment variables** and **configuration files** for all parameters
- Implement dynamic parameter adjustment based on real-time system performance

## Variable and Code Quality Standards

### Zero Unused Variables (ZUV)
- **Never use `_` as prefix** to suppress unused variable warnings
- **Utilize all declared variables** or **remove entirely**
- Ensure every variable serves specific purpose: computation, logging, error handling, resource configuration
- When implementing stub configurations, use variables meaningfully through logging or debug assertions

### Naming Conventions
- **kebab-case** for Kubernetes resource names
- **snake_case** for Terraform variables and outputs
- **camelCase** for cloud provider resource properties
- **UPPER_CASE** for environment variables and constants
- **Descriptive, environment-oriented names** for deepest infrastructure hierarchies

## Modern Cloud Platforms (2025)

### Amazon Web Services (AWS)
- Use **AWS CDK** or **CloudFormation** for infrastructure as code
- Implement **EC2**, **ECS**, **EKS** for compute resources
- Use **RDS**, **DynamoDB** for managed database services
- Leverage **S3**, **CloudFront** for storage and content delivery
- Implement **Lambda** for serverless computing

### Microsoft Azure
- Use **Azure Resource Manager (ARM)** or **Bicep** for infrastructure
- Implement **Azure Container Instances**, **AKS** for containerized workloads
- Use **Azure SQL Database**, **Cosmos DB** for data storage
- Leverage **Azure Storage**, **CDN** for content delivery
- Implement **Azure Functions** for serverless applications

### Google Cloud Platform (GCP)
- Use **Google Cloud Deployment Manager** or **Terraform** for infrastructure
- Implement **Google Kubernetes Engine (GKE)** for container orchestration
- Use **Cloud SQL**, **Firestore** for managed databases
- Leverage **Cloud Storage**, **Cloud CDN** for data and content
- Implement **Cloud Functions** for event-driven computing

## Kubernetes Container Orchestration

### Cluster Architecture
- Use **Kubernetes 1.28+** with latest stable features
- Implement **multi-zone clusters** for high availability
- Create **node pools** with appropriate instance types
- Use **cluster autoscaling** for dynamic resource management
- Implement **network policies** for security isolation

### Workload Management
- Use **Deployments** for stateless applications
- Implement **StatefulSets** for stateful workloads
- Create **DaemonSets** for node-level services
- Use **Jobs** and **CronJobs** for batch processing
- Implement **HorizontalPodAutoscaler** for automatic scaling

### Configuration and Secrets
- Use **ConfigMaps** for application configuration
- Implement **Secrets** for sensitive data management
- Create **PersistentVolumes** for data persistence
- Use **StorageClasses** for dynamic volume provisioning
- Implement **ServiceAccounts** for pod identity

## Infrastructure as Code (IaC)

### Terraform Implementation
- Use **Terraform 1.6+** with latest provider versions
- Implement **modules** for reusable infrastructure components
- Create **workspaces** for environment separation
- Use **remote state** with proper locking mechanisms
- Implement **plan and apply** workflows in CI/CD

### Terraform Best Practices
- Use **variable validation** and **type constraints**
- Implement **data sources** for existing resource references
- Create **locals** for computed values and complex expressions
- Use **count** and **for_each** for resource iteration
- Implement **depends_on** for explicit resource dependencies

### Cloud Formation and ARM Templates
- **AWS**: Use **CloudFormation** with **nested stacks**
- **Azure**: Implement **ARM templates** or **Bicep** for Azure resources
- Create **parameter files** for environment-specific values
- Use **outputs** for cross-stack references
- Implement **stack policies** for resource protection

## Container Technologies

### Docker Containerization
- Use **multi-stage builds** for optimized image sizes
- Implement **non-root users** for security
- Create **.dockerignore** files for build optimization
- Use **specific base images** with version pinning
- Implement **health checks** for container monitoring

### Container Registries
- Use **private registries** for proprietary images
- Implement **image scanning** for vulnerability detection
- Create **image tagging** strategies for versioning
- Use **registry webhooks** for automated deployment
- Implement **image cleanup** policies for storage optimization

### Container Security
- Use **distroless** or **minimal base images**
- Implement **image vulnerability scanning**
- Create **pod security policies** or **pod security standards**
- Use **network policies** for traffic isolation
- Implement **admission controllers** for policy enforcement

## CI/CD Pipeline Architecture

### Pipeline Design
- Use **GitOps** workflows for infrastructure deployment
- Implement **branch-based** environments (dev/staging/prod)
- Create **automated testing** for infrastructure code
- Use **approval workflows** for production deployments
- Implement **rollback mechanisms** for failed deployments

### GitHub Actions Integration
- Create **workflow files** for automated CI/CD
- Use **reusable workflows** for common patterns
- Implement **secrets management** with GitHub Secrets
- Create **environment protection** rules
- Use **deployment status** checks for quality gates

### Jenkins and Alternative CI/CD
- Implement **Jenkins pipelines** with Jenkinsfile
- Use **pipeline as code** for version control
- Create **shared libraries** for reusable pipeline components
- Implement **parallel execution** for faster builds
- Use **pipeline monitoring** and alerting

## Monitoring and Observability

### Prometheus and Grafana
- Use **Prometheus** for metrics collection and alerting
- Implement **Grafana** for visualization and dashboards
- Create **custom metrics** for business logic monitoring
- Use **AlertManager** for notification management
- Implement **service discovery** for dynamic target detection

### Logging Solutions
- Use **Elasticsearch, Logstash, Kibana (ELK)** stack for log management
- Implement **Fluentd** or **Fluent Bit** for log collection
- Create **log parsing** and **enrichment** rules
- Use **log retention** policies for storage optimization
- Implement **log-based alerting** for proactive monitoring

### Distributed Tracing
- Use **Jaeger** or **Zipkin** for distributed tracing
- Implement **OpenTelemetry** for observability instrumentation
- Create **trace correlation** across microservices
- Use **performance analysis** for bottleneck identification
- Implement **sampling strategies** for trace collection

## Security and Compliance

### Infrastructure Security
- Implement **identity and access management** (IAM) best practices
- Use **least privilege principle** for service accounts
- Create **network segmentation** with proper firewall rules
- Implement **encryption at rest** and **in transit**
- Use **certificate management** for TLS/SSL

### Compliance and Governance
- Implement **policy as code** with Open Policy Agent (OPA)
- Use **compliance scanning** tools for infrastructure validation
- Create **audit trails** for all infrastructure changes
- Implement **data residency** and **sovereignty** requirements
- Use **cost management** and **resource tagging** strategies

### Security Scanning
- Use **container image scanning** for vulnerabilities
- Implement **infrastructure code scanning** with tools like Checkov
- Create **security policy validation** in CI/CD pipelines
- Use **runtime security** monitoring for anomaly detection
- Implement **penetration testing** for security validation

## Disaster Recovery and Backup

### Disaster Recovery and Backup
- Implement **automated backup** schedules for critical data
- Use **cross-region replication** for disaster recovery
- Create **point-in-time recovery** capabilities
- Implement **multi-availability zone** deployments
- Use **load balancing** and **failover** mechanisms
- Create **circuit breakers** for service resilience
- Create **recovery time objectives** (RTO) and **recovery point objectives** (RPO)
- Implement **disaster recovery runbooks** and procedures
- Use **automated failover** mechanisms where possible

## Cost Optimization

### Resource Optimization
- Use **right-sizing** for compute resources
- Implement **auto-scaling** to match demand
- Create **spot instances** and **preemptible VMs** for cost savings
- Use **reserved instances** for predictable workloads
- Implement **resource scheduling** for non-production environments

### Cost Monitoring
- Use **cost allocation tags** for resource tracking
- Implement **budget alerts** for cost management
- Create **cost optimization** recommendations
- Use **showback** and **chargeback** models for accountability
- Implement **cost anomaly detection** for unusual spending

## Tech Stack Requirements

### Core Infrastructure Tools
- **Terraform** (1.6+) - infrastructure as code
- **Kubernetes** (1.28+) - container orchestration
- **Docker** (24+) - containerization
- **Helm** (3+) - Kubernetes package management
- **Ansible** - configuration management

### Cloud Provider CLIs
- **AWS CLI** - Amazon Web Services management
- **Azure CLI** - Microsoft Azure management
- **gcloud** - Google Cloud Platform management
- **kubectl** - Kubernetes cluster management
- **terraform** - infrastructure provisioning

### Monitoring and Observability
- **Prometheus** - metrics collection
- **Grafana** - visualization and dashboards
- **ELK Stack** - log management
- **Jaeger** - distributed tracing
- **OpenTelemetry** - observability framework

### CI/CD Tools
- **GitHub Actions** - automated workflows
- **Jenkins** - continuous integration
- **ArgoCD** - GitOps deployment
- **Tekton** - cloud-native CI/CD
- **Spinnaker** - multi-cloud deployment

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with cloud and DevOps extensions
- **IntelliJ IDEA** with cloud toolkit plugins
- **Vim/Neovim** with infrastructure development plugins
- **Cloud Shell** editors for cloud-native development

### Development Workflow
- Use **infrastructure language servers** for intelligent completion
- Implement **validation and linting** for infrastructure code
- Use **version control** with infrastructure-specific .gitignore
- Set up **automated testing** for infrastructure changes
- Use **code formatting** with infrastructure code standards
