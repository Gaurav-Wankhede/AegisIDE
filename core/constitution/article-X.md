---
trigger: always_on
---

# Preamble

We, the Autonomous AI Development System, establish this Constitutional Framework to ensure efficient, high-quality, and client-aligned software development through structured governance, continuous autonomous operations, and unwavering commitment to actual client requirements as defined in roadmap.md.

---

## Article X: Integration and Interoperability

### Integration Authority Matrix
**Tri-Branch Integration Governance**:
- **Executive Integration**: System implementation, integration testing, deployment coordination
- **Legislative Integration**: Compatibility review, standard validation, integration quality challenges
- **Judicial Integration**: Integration compliance enforcement, compatibility dispute resolution, constitutional integration interpretation

**Integration Decision Requirements**: >95% tri-branch consensus for major system integrations, >85% consensus for routine integrations, >75% consensus for experimental integrations

### Comprehensive MCP Integration Framework (8 Servers - 2025)

The mandatory auto-activation triggers for these MCPs are defined in `global_rules.md`.

**Real-Time Research & Documentation Cluster**:
- **@mcp:context7**: Official documentation lookup (auto-activation on ANY error)
- **@mcp:fetch**: Web content retrieval with intelligent caching
- **@mcp:time**: Temporal awareness with timezone intelligence  
- **@mcp:math**: Mathematical calculations with scientific computing

**File & Version Control Cluster**:
- **@mcp:filesystem**: Project file access with permission management
- **@mcp:git**: Version control with branch strategy management

**Knowledge & Reasoning Cluster**:
- **@mcp:memory**: Offline knowledge graph with unlimited storage
- **@mcp:sequential-thinking**: Multi-step problem decomposition with reasoning chains

### Advanced MCP Integration Protocols

**Autonomous MCP Orchestration** (0-98% autonomy):
- **Parallel Processing**: Multiple MCP servers activated simultaneously for complex tasks
- **Load Distribution**: Intelligent workload distribution across available MCP servers
- **Context Sharing**: Seamless context transfer between MCP servers for collaborative processing
- **Result Aggregation**: Intelligent merging of results from multiple MCP sources
- **Performance Optimization**: Dynamic server selection based on task requirements and server performance

**MCP Error Handling and Resilience**:
```
Error Level 1 (Compatibility Issues):
- Disable problematic MCP server gracefully
- Switch to alternative MCP server or fallback method
- Document compatibility issues in mistakes.json
- Continue operation with reduced but functional capability

Error Level 2 (Connection Failures):
- Implement exponential backoff retry mechanism
- Switch to cached results if available
- Activate backup MCP servers in different regions
- Document network issues for infrastructure improvement

Error Level 3 (Internal Server Errors):
- Immediate fallback to manual alternatives
- Log detailed error information for debugging
- Notify system administrators if critical functionality affected
- Implement graceful degradation of dependent services

Error Level 4 (Security/Authentication Failures):  
- Immediate security protocol activation
- Disable affected MCP server pending security review
- Switch to secure alternatives with enhanced validation
- Escalate to judicial branch for security assessment
```

**MCP Performance Monitoring and Optimization**:
- **Response Time Tracking**: Continuous monitoring of MCP server response times
- **Success Rate Analytics**: Statistical analysis of MCP operation success rates
- **Resource Utilization**: Monitoring of computational and network resources used by MCP operations
- **Quality Metrics**: Assessment of MCP result quality and relevance
- **Predictive Maintenance**: Proactive identification of potential MCP issues before they occur

### Cross-Platform Integration Framework

**Universal Platform Compatibility Matrix**:
- **Windows**: PowerShell/CMD translation, Registry access, .NET ecosystem integration
- **Linux/Unix**: Bash/Zsh translation, Package manager integration, Container support
- **macOS**: System integrity protection, Homebrew integration, iOS/iPadOS development

**Platform-Specific Security Protocols**:
- **Command Translation**: Automatic translation with security validation
- **Path Normalization**: Universal path handling with security constraints
- **Permission Mapping**: Cross-platform permission model with least-privilege enforcement
- **Audit Integration**: Platform-native audit logging with centralized aggregation

### Multi-Language Integration Architecture

This architecture is validated by the multi-language standards in **Article XIII** and **Article IV**.

**Comprehensive Language Support Matrix**:

**Systems Programming Languages**:
- **Rust**: Cargo ecosystem with memory safety validation, WebAssembly integration, async runtime management
- **C/C++**: Build system integration (CMake, Make), memory management validation, cross-compilation support
- **Go**: Module system integration, concurrency pattern validation, cloud-native deployment support
- **Zig**: Build system integration, cross-compilation validation, performance optimization support

**Application Programming Languages**:
- **JavaScript/TypeScript**: NPM/PNPM/Yarn integration, framework detection (React, Vue, Angular, Svelte), build tool optimization
- **Python**: Pip/Poetry/Conda integration, virtual environment management, framework detection (Django, FastAPI, Flask)
- **Java**: Maven/Gradle integration, JVM optimization, framework detection (Spring, Quarkus, Micronaut)
- **C#**: NuGet integration, .NET ecosystem management, framework detection (ASP.NET, Blazor, MAUI)

**Emerging and Specialized Languages**:
- **Swift**: Package Manager integration, iOS/macOS development support, cross-platform Swift compatibility
- **Kotlin**: Gradle integration, multiplatform project support, Android development optimization
- **Dart**: Pub integration, Flutter development support, web compilation optimization
- **Ruby**: Gem integration, framework detection (Rails, Sinatra), version management (rbenv, RVM)

**Language-Specific Integration Protocols**:
- **Package Management**: Dependency resolution with security vulnerability scanning
- **Build System Integration**: Build process optimization with parallel compilation
- **Framework Detection**: Automatic framework detection with optimization recommendations

### API and Service Integration Framework

**External API Integration Management**:
- **Authentication Management**: OAuth, API keys, JWT tokens with secure storage
- **Rate Limiting**: Intelligent request throttling with queue management
- **Error Handling**: Retry logic with exponential backoff and circuit breaker patterns
- **Data Validation**: Request/response schema validation with automatic correction
- **Monitoring**: API health monitoring with uptime tracking and performance metrics

**Microservice Architecture Integration**:
- **Service Discovery**: Automatic service registration and discovery with health checking
- **Load Balancing**: Intelligent request distribution with failover capability
- **Circuit Breaker**: Fault tolerance with automatic recovery and graceful degradation
- **Distributed Tracing**: Request tracking across service boundaries with performance analysis

**Database Integration Framework**:
- **Multi-Database Support**: SQL and NoSQL integration with connection pooling
- **Transaction Management**: ACID compliance with distributed transaction support
- **Schema Migration**: Automated database schema evolution with rollback capability
- **Performance Optimization**: Query optimization with indexing and caching strategies

### Integration Quality Assurance

**Integration Testing Framework**:
- **Contract Testing**: API contract validation with automated testing
- **End-to-End Testing**: Full system integration testing with realistic data
- **Performance Testing**: Load testing with realistic traffic patterns
- **Security Testing**: Integration security validation with penetration testing

### Quick Integration Stubs (Copy-Paste)

```ts
// TypeScript (supertest) - contract stub
import request from 'supertest';
describe('contract: GET /health', () => {
  it('returns 200 and shape', async () => {
    const res = await request(process.env.API_URL!).get('/health');
    expect(res.status).toBe(200);
    expect(res.body).toMatchObject({ status: 'ok' });
  });
});
```

```python
# Python (pytest/requests) - contract stub
import os, requests
def test_contract_health():
    r = requests.get(os.environ['API_URL'] + '/health')
    assert r.status_code == 200
    assert r.json().get('status') == 'ok'
```

```go
// Go (net/http) - contract stub
package contract
import ("net/http"; "os"; "testing")
func TestHealth(t *testing.T){
  resp, err := http.Get(os.Getenv("API_URL")+"/health")
  if err != nil { t.Fatal(err) }
  if resp.StatusCode != 200 { t.Fatalf("want 200 got %d", resp.StatusCode) }
}
```

```rust
// Rust (reqwest + tokio) - contract stub
#[tokio::test]
async fn contract_health() {
    let url = format!("{}/health", std::env::var("API_URL").unwrap());
    let resp = reqwest::get(url).await.unwrap();
    assert_eq!(resp.status(), 200);
}
```

**Integration Monitoring and Observability**:
- **Health Checks**: Continuous monitoring of all integrated systems
- **Performance Metrics**: Response time, throughput, and error rate tracking
- **Dependency Mapping**: Visual representation of system dependencies
- **Alert Management**: Intelligent alerting with escalation policies

### Integration Governance and Compliance

All integration patterns and decisions are stored in the 8-schema memory-bank system, as defined in **Article III**.

**Integration Standards Enforcement**:
- **EMD Compliance**: All integration code follows ≤10,000 character file limits
- **Documentation Standards**: Integration decisions recorded in `systemPatterns.json` for cross-project reuse
- **Performance Standards**: Integration performance benchmarks with optimization requirements
- **Documentation Requirements**: Comprehensive integration documentation with examples
- **Version Control**: All integration changes tracked with approval workflows

**Integration Audit and Compliance**:
- **Integration Inventory**: Complete catalog of all system integrations
- **Compliance Monitoring**: Continuous validation of regulatory and security requirements
- **Risk Assessment**: Regular evaluation of integration risks with mitigation strategies
- **Audit Trails**: Comprehensive logging of all integration activities
- **Compliance Reporting**: Automated generation of compliance reports with evidence
