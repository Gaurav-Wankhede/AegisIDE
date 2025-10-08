---
description: Find best algorithms and optimize code using @mcp:context7, @mcp:fetch, @mcp:sequential-thinking, @mcp:memory with best practices
---

# /optimize - Algorithm & Code Optimization

_This workflow is defined canonically under `core/workflow/optimize.md`. IDEs such as Windsurf surface the same workflow via `.windsurf/workflow/optimize.md`, so path references should be interpreted through that mount when executed inside the IDE._

## Purpose
Initiated by the **IAS Researcher** or the **Innovation Shadow**, this workflow follows a full parliamentary process to identify, approve, and implement performance and architectural optimizations. It ensures that all changes are backed by MCP-driven research, validated by benchmarks, and achieve >95% consensus before deployment.

## Constitutional Authority
- **Article I**: Governs the roles of the IAS Researcher (finding efficient algorithms) and the Innovation Shadow (proposing better patterns).
- **Article II**: Mandates the parliamentary consensus process for all strategic and technical proposals.
- **Article IV**: Upholds the constitutional principles of performance focus and code quality.
- **Article VIII**: Defines the framework for performance and resource optimization.

## MCP Role Map
- `@mcp:context7`: Used by the **IAS Researcher** to retrieve official optimization guidance.
- `@mcp:fetch`: Used by the **Innovation Shadow** to collect industry benchmarks and community solutions.
- `@mcp:filesystem`: Used by the **Development Minister** to apply approved optimizations.
- `@mcp:git`: Used by all parties to snapshot proposals, benchmarks, and final changes for the audit trail.
- `@mcp:memory`: Used by the **IAS** to retrieve historical patterns and store new optimization strategies.
- `@mcp:sequential-thinking`: Used by the **Prime Minister** to orchestrate the debate and by the **IAS** to plan the implementation.
- `@mcp:time`: Used to timestamp all phases to measure efficiency gains.
- `@mcp:math`: Used by the **Analytics Shadow** and **IAS** to calculate performance metrics and consensus scores.

## Workflow Sequence

### Phase 1: Identification & Proposal (IAS Researcher / Innovation Shadow)
*An optimization opportunity is identified through performance analysis or research.*
1.  **Performance Analysis**: The **IAS** scans the codebase and memory-bank metrics to identify bottlenecks, inefficient algorithms, or suboptimal data structures.
2.  **MCP Research**: The **IAS Researcher** and **Innovation Shadow** conduct comprehensive research using `@mcp:context7`, `@mcp:fetch`, and `@mcp:memory` to find the best algorithms and practices.
3.  **Proposal Formulation**: A formal optimization proposal is drafted, including:
    *   Baseline performance benchmarks (`@mcp:math`, `@mcp:time`).
    *   The proposed algorithm or architectural change.
    *   Expected performance gains and impact analysis.
    *   Supporting evidence from MCP research.

### Phase 2: Parliamentary Review & Consensus
*The proposal is submitted to Parliament for democratic review.*
1.  **Opposition Challenge**:
    *   **Quality Shadow**: Scrutinizes the proposal for potential regressions, maintainability issues, or violations of EMD/ZUV principles.
    *   **Analytics Shadow**: Validates the projected performance metrics and ROI.
2.  **Structured Debate**: The **Prime Minister** convenes a debate to discuss the trade-offs.
3.  **Vote**: Parliament votes on the proposal. A weighted consensus score is calculated by `@mcp:math`, requiring **≥95% approval** to proceed.

### Phase 3: Implementation (Development Minister)
*Upon approval, the **Development Minister** executes the optimization.*
1.  **Apply Optimizations**: The approved changes are implemented using `@mcp:filesystem`.
2.  **Code Quality Validation**: The implementation is validated against all constitutional quality standards (EMD, ZUV, tests pass).
3.  **Documentation**: The code is documented with the rationale for the changes.

### Phase 4: Benchmarking & Validation (IAS & Quality Shadow)
*The results are measured and validated by neutral parties.*
1.  **Post-Optimization Benchmarking**: The **IAS** runs benchmarks to measure the actual performance improvement against the baseline.
2.  **Quality Assurance**: The **Quality Shadow** confirms that all tests pass and no new quality issues were introduced.

### Phase 5: Judicial Review & Final Approval
*The **Chief Justice** provides the final constitutional sign-off.*
1.  The complete record (proposal, debate, benchmarks, and implementation) is submitted for judicial review.
2.  The Chief Justice verifies that the process was constitutional and that the outcome aligns with the framework's principles.
3.  Upon approval, the changes are committed via `@mcp:git`.

### Phase 6: Knowledge Storage (IAS Researcher)
*The successful optimization pattern is integrated into the system's long-term memory.*
1.  The **IAS Researcher** updates `systemPatterns.json` and the `memory.json` knowledge graph with the new optimization pattern, benchmarks, and decision rationale via `@mcp:memory`.
2.  The performance gains are logged in `progress.json`.

## Optimization Patterns
```bash
# Common optimization techniques:

1. Caching:
   - Memoization for expensive computations
   - LRU cache for frequent access
   - Lazy evaluation for deferred work

2. Batching:
   - Batch API calls
   - Bulk database operations
   - Grouped I/O operations

3. Indexing:
   - Database indexes for queries
   - Hash maps for fast lookups
   - Spatial indexes for geo data

4. Parallelization:
   - Multi-threading for CPU-bound
   - Async/await for I/O-bound
   - Work-stealing for load balancing

5. Compression:
   - Data compression for storage
   - Response compression for network
   - Stream compression for large data
```

## Performance Metrics
```bash
@mcp:math → Track improvements:

# Time Complexity:
Before: O(n²) → After: O(n log n)
Improvement: 100x faster for n=1000

# Space Complexity:
Before: O(n²) → After: O(n)
Memory savings: 99% for large datasets

# Real-world metrics:
- Response time: 500ms → 50ms (90% faster)
- Throughput: 100 req/s → 1000 req/s (10x)
- Memory usage: 1GB → 100MB (90% reduction)
- CPU utilization: 80% → 20% (75% reduction)
```

## Success Criteria
- ✅ Performance bottlenecks identified
- ✅ MCP research completed (all 5 MCPs)
- ✅ Optimal algorithms selected
- ✅ Optimizations implemented
- ✅ Benchmarks show improvement
- ✅ Code quality maintained (EMD/ZUV)
- ✅ Tests pass (100%)
- ✅ Documentation updated
- ✅ Patterns stored in memory bank

## Optimization Checklist
```bash
# Before optimization:
□ Profile code to find bottlenecks
□ Establish baseline metrics
□ Research best practices via MCPs
□ Plan optimization approach

# During optimization:
□ Apply algorithm improvements
□ Optimize data structures
□ Reduce memory allocations
□ Add parallelization where beneficial
□ Maintain code quality standards

# After optimization:
□ Run comprehensive benchmarks
□ Verify all tests pass
□ Document changes and trade-offs
□ Update memory bank with patterns
□ Store knowledge in @mcp:memory
```

## Next Steps
After successful optimization:
1. Monitor performance in production
2. Continue profiling for new bottlenecks
3. Apply learned patterns to other code
4. Share optimization knowledge via @mcp:memory
