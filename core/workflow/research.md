---
description: IAS Researcher workflow for algorithmic analysis and free-tier optimization.
---

# /research – IAS Research & Autonomous Optimization

## Purpose
This workflow is the constitutional duty of the **Administrative Service (IAS) Researcher**. It provides neutral, MCP-backed intelligence to Parliament, ensuring that all technical and strategic decisions are optimized for performance, scalability, and cost-effectiveness (free-tier first).

## Constitutional Authority
- **Article I**: Defines the Researcher as the Principal Scientific Advisor within the IAS, responsible for providing data-driven analysis.
- **Article II**: Mandates that IAS research dossiers form the evidence base for all parliamentary debates.
- **Article IV**: Requires the Researcher's sign-off on algorithmic efficiency and the viability of free-tier solutions.

## MCP Chain (Executed Autonomously by the Researcher)
1.  `@mcp:context7`: Retrieves official documentation for the specified libraries and algorithms.
2.  `@mcp:fetch`: Gathers external best practices, benchmarks, and information on scalable, free-tier services.
3.  `@mcp:math`: Calculates performance curves, resource footprints, and cost projections.
4.  `@mcp:sequential-thinking`: Decomposes the problem, compares alternatives, and structures the final report.
5.  `@mcp:memory`: Retrieves historical patterns and previous research from the knowledge graph to inform recommendations.
6.  `@mcp:filesystem`: Writes the final research dossier to `systemPatterns.json`.

## Workflow Sequence

1.  **Initiation**: Any member of Parliament or the Judiciary can trigger the workflow (e.g., `/research "analyze scalable free-tier database options"`). The process is fully autonomous from this point.
2.  **MCP Execution**: The **IAS Researcher** autonomously executes the full MCP chain to gather and process information.
3.  **Dossier Generation**: A standardized **research dossier** is generated and stored in `systemPatterns.json`. The dossier includes:
    *   **Executive Summary**: The key findings and a recommendation for the most scalable, free-tier, and autonomous solution.
    *   **Algorithmic Analysis**: Big O notation, performance benchmarks, and trade-offs.
    *   **Resource Footprint**: CPU, memory, and network usage estimates.
    *   **Security Assessment**: Known vulnerabilities and mitigation strategies (with input from the IAS Home Officer).
    *   **MCP Evidence**: A complete, verifiable trail of all MCP calls made during the research.
4.  **Publication**: A summary of the dossier is published to `roadmap/roadmap.md` for stakeholder visibility, and the full report is attached to the relevant proposal in `kanban.json` to inform the parliamentary debate.

```bash
# // turbo
@mcp:context7 → Get official docs
@mcp:fetch → Get external benchmarks & best practices for scalable, free-tier solutions
@mcp:math → Calculate performance & cost
@mcp:sequential-thinking → Structure analysis for autonomy and scalability
@mcp:memory → Retrieve historical patterns
@mcp:filesystem → Write dossier to systemPatterns.json
```
