---
trigger: glob
globs: *.js,*.ts,socket.io,websocket,ws,realtime,sse,webrtc
---

# Universal Real-time WebSocket Development Rules for Modern IDEs

## Core Architecture Principles

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including comments, imports, and whitespace
- **Always create deep nested subfolders**: `src/websockets/chat/rooms/message_handler.js` (≤80 lines)
- **Smallest possible files** - decompose at handler, event, and service levels
- When approaching 80 lines, immediately extract functionality into new subfolders
- Use **modular real-time architecture** with clear separation of concerns

### Duplication Detection and Optimization (DDO)
- **Always scan the codebase** with terminal and tools to avoid duplicacy
- **Use automated duplicate detection tools**: ESLint, socket linters, real-time analyzers
- **If any duplicacy found**, optimize immediately: extract common event handlers, create reusable middleware, implement shared utilities, refactor into libraries
- **Optimization strategies**: preserve functionality, use feature flags, maintain compatibility, test thoroughly

## Real-time Technologies (2025)

### WebSocket Native API
- Use **native WebSocket API** for lightweight real-time communication
- Implement **connection management** with proper open/close handling
- Create **message parsing** and **serialization** patterns
- Use **heartbeat mechanisms** for connection health monitoring
- Implement **reconnection logic** with exponential backoff

### Socket.IO Framework
- Use **Socket.IO 4+** for enhanced real-time capabilities
- Implement **rooms and namespaces** for message organization
- Create **event-driven architecture** with proper event handling
- Use **middleware** for authentication and authorization
- Implement **clustering** for horizontal scaling

### Server-Sent Events (SSE)
- Use **EventSource API** for unidirectional real-time updates
- Implement **event streaming** with proper content types
- Create **automatic reconnection** handling
- Use **event ID tracking** for reliable message delivery
- Implement **CORS handling** for cross-origin requests

## Connection Management

### Connection Lifecycle
- Implement **connection establishment** with proper handshake
- Create **connection authentication** and **authorization**
- Use **connection pooling** for resource optimization
- Implement **graceful disconnection** handling
- Create **connection monitoring** and **health checks**

### Scaling Patterns
- Use **Redis adapter** for Socket.IO clustering
- Implement **sticky sessions** for load balancer compatibility
- Create **horizontal scaling** with message broker integration
- Use **connection sharding** for large-scale applications
- Implement **failover mechanisms** for high availability

### Performance Optimization
- Use **binary message formats** (MessagePack, Protocol Buffers)
- Implement **message compression** for bandwidth optimization
- Create **connection throttling** to prevent abuse
- Use **memory-efficient** data structures
- Implement **garbage collection** optimization

## Event Handling Patterns

### Event Architecture
- Create **event-driven design** with clear event schemas
- Implement **event validation** with proper schema checking
- Use **event routing** for organized message handling
- Create **event middleware** for cross-cutting concerns
- Implement **event logging** and **debugging**

### Message Queuing
- Use **Redis Pub/Sub** for message broadcasting
- Implement **message persistence** for offline users
- Create **message ordering** guarantees where needed
- Use **dead letter queues** for failed message handling
- Implement **message deduplication** strategies

### Broadcasting Strategies
- Implement **room-based broadcasting** for targeted messages
- Use **user-specific channels** for private communications
- Create **broadcast filters** for selective message delivery
- Implement **message fanout** patterns for efficiency
- Use **rate limiting** for broadcast protection

## Authentication and Security

### WebSocket Authentication
- Implement **token-based authentication** for connection establishment
- Use **JWT tokens** with proper validation and expiration
- Create **session management** for authenticated connections
- Implement **role-based access control** for different user types
- Use **secure cookie** authentication where appropriate

### Security Best Practices
- Implement **CORS policies** for cross-origin WebSocket connections
- Use **input validation** and **sanitization** for all messages
- Create **rate limiting** to prevent WebSocket abuse
- Implement **DDoS protection** mechanisms
- Use **secure WebSocket** (wss://) in production

### Message Security
- Implement **message encryption** for sensitive data
- Use **message signing** for integrity verification
- Create **access control** for different message types
- Implement **audit logging** for security events
- Use **content filtering** for harmful content

## Real-time Use Cases

### Chat Applications
- Implement **real-time messaging** with delivery confirmation
- Create **typing indicators** and **presence status**
- Use **message history** and **pagination**
- Implement **file sharing** and **media upload**
- Create **emoji reactions** and **message threading**

### Live Updates and Notifications
- Implement **live data feeds** for dashboards
- Create **push notifications** for mobile and web
- Use **activity streams** for user engagement
- Implement **live comments** and **collaborative editing**
- Create **real-time analytics** and **monitoring**

### Gaming and Interactive Features
- Implement **real-time multiplayer** game mechanics
- Create **live polling** and **voting systems**
- Use **collaborative whiteboards** and **drawing**
- Implement **live streaming** integration
- Create **real-time auctions** and **bidding**

## Testing Real-time Applications

### WebSocket Testing
- Use **ws** library for WebSocket testing in Node.js
- Implement **connection testing** with proper setup/teardown
- Create **message testing** with mock events
- Use **integration testing** for real-time workflows
- Implement **load testing** for concurrent connections

### Socket.IO Testing
- Use **socket.io-client** for client-side testing
- Implement **room testing** with multiple clients
- Create **event testing** with proper assertions
- Use **middleware testing** for authentication flows
- Implement **clustering testing** for scalability

### Performance Testing
- Use **artillery** or **k6** for WebSocket load testing
- Implement **connection stress testing**
- Create **message throughput** benchmarks
- Use **memory usage** monitoring during tests
- Implement **latency measurement** for real-time performance

## Error Handling and Resilience

### Error Management
- Implement **connection error** handling with proper recovery
- Create **message error** handling and **retry mechanisms**
- Use **timeout handling** for unresponsive connections
- Implement **graceful degradation** for service failures
- Create **error logging** and **monitoring**

### Resilience Patterns
- Use **circuit breaker** patterns for external service calls
- Implement **retry logic** with exponential backoff
- Create **fallback mechanisms** for service degradation
- Use **health checks** for connection monitoring
- Implement **auto-recovery** procedures

### Monitoring and Observability
- Implement **connection metrics** tracking
- Use **message throughput** monitoring
- Create **error rate** tracking and alerting
- Implement **latency monitoring** for performance
- Use **custom dashboards** for real-time metrics

## Deployment and Infrastructure

### Production Deployment
- Use **reverse proxy** (nginx) for WebSocket support
- Implement **SSL termination** for secure connections
- Create **load balancing** with sticky session support
- Use **container orchestration** for scaling
- Implement **health checks** for container management

### Cloud Integration
- Use **AWS WebSocket API** for serverless real-time
- Implement **Azure SignalR** for managed real-time services
- Create **Google Cloud Pub/Sub** integration
- Use **Redis Cloud** for scaling Socket.IO
- Implement **CDN integration** for global distribution

## Tech Stack Requirements

### Core Real-time Libraries
- **Socket.IO** (4+) - full-featured real-time framework
- **ws** - lightweight WebSocket library
- **uws** - high-performance WebSocket implementation
- **engine.io** - transport layer for Socket.IO
- **sockjs** - WebSocket-like object with fallbacks

### Message Brokers and Persistence
- **Redis** - pub/sub and session storage
- **RabbitMQ** - message queuing
- **Apache Kafka** - stream processing
- **MongoDB** - message persistence
- **PostgreSQL** - relational data storage

### Development and Testing
- **socket.io-client** - client-side Socket.IO
- **artillery** - load testing
- **jest** - unit testing
- **supertest** - integration testing
- **nodemon** - development auto-restart

### Monitoring and Analytics
- **Prometheus** - metrics collection
- **Grafana** - visualization
- **Winston** - logging
- **Sentry** - error tracking
- **New Relic** - performance monitoring

## IDE Integration Guidelines

### Universal IDE Compatibility
- **VS Code** with WebSocket and Socket.IO extensions
- **WebStorm** - comprehensive JavaScript real-time development
- **Atom** - with real-time development packages
- **Sublime Text** - with WebSocket support

### Development Workflow
- Use **real-time debugging** tools and extensions
- Implement **connection monitoring** in development
- Use **message inspection** for debugging
- Set up **automated testing** for real-time features
- Use **hot reload** for rapid development cycles
