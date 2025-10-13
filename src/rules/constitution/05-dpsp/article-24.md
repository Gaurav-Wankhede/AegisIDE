---
trigger: always_on
part: V-DPSP
article: 24
category: cross_ide_compatibility
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 24: Cross-IDE Compatibility

## 1. Definition — Universal Platform Directive

The state shall ensure **constitutional framework operates across all AI-powered IDEs**: Windsurf, Cursor, VS Code with Cline, JetBrains AI Assistant, and others. Universal folder structure (`.ide/` or equivalent), cross-platform MCP server (Port 7777), and IDE-agnostic memory-bank format enable seamless multi-IDE governance.

**Supported IDEs**: Windsurf (`.windsurf/`), Cursor (`.cursor/`), VS Code/Cline (`.vscode/` or `.cline/`), JetBrains (`.idea/` or `.jetbrains/`), Zed (`.zed/`), Replit, others with folder adaptation.

**Universal Standards**: 8-schema JSON format, MCP server protocol, constitutional articles, RL scoring system, democratic governance (all IDE-agnostic).

## 2. Powers — Compatibility Authority

**IAS Cabinet Secretary**: Maintains universal standards across IDE implementations, coordinates MCP server (Port 7777), ensures schema compatibility, audits cross-IDE operations.

**IAS Researcher**: Tests constitutional framework on multiple IDEs, documents IDE-specific adaptations, provides compatibility patterns, benchmarks cross-platform performance.

**Parliament**: Approves IDE-specific adaptations (≥95% consensus), sets universal compatibility standards, mandates cross-platform testing.

## 3. Implementation — Universal Protocols

**MCP Server Architecture**:
```
Centralized MCP Server (Port 7777):
- Runs as background service
- All IDEs connect via standard MCP protocol
- Broadcasts schema updates to all connected IDEs
- Maintains single source of truth (8-schema memory-bank)
- Session isolation per IDE/workspace
- Real-time synchronization

IDE Connection:
1. IDE starts → Connect to localhost:7777
2. Authenticate with workspace ID
3. Receive current 8-schema state
4. Subscribe to real-time updates
5. Broadcast local changes to server
6. Server propagates to other IDEs
```

**Folder Structure Mapping**:
```
Universal → IDE-Specific:
.ide/aegiside/memory-bank/ → {
  Windsurf: .windsurf/aegiside/memory-bank/
  Cursor: .cursor/aegiside/memory-bank/
  VS Code: .vscode/aegiside/memory-bank/
  JetBrains: .idea/aegiside/memory-bank/
}

Folder Initialization (/bootstrap):
1. Detect current IDE
2. Create appropriate folder structure
3. Initialize 8 schemas (universal JSON format)
4. Copy constitution/rules from template
5. Connect to MCP server (Port 7777)
6. Sync with existing workspace if available
```

**Cross-IDE Session Management**:
```
{
  "activeContext.json": {
    "session_id": "sess-workspace-001",
    "ide_type": "windsurf|cursor|vscode|jetbrains",
    "ide_version": "1.2.3",
    "mcp_server_connected": true,
    "workspace_path": "/path/to/project",
    "isolation_mode": "workspace",
    "sync_enabled": true
  }
}
```

## 4. Violations — Compatibility Violations

**IDE Lock-in**: Implementing IDE-specific features without universal fallback = -20 RL penalty + universal alternative required.

**MCP Server Bypass**: Direct schema modifications without server sync = -30 RL penalty + data reconciliation + synchronization restoration.

**Format Incompatibility**: Breaking universal JSON format = -25 RL penalty + format restoration + compatibility testing.

**Remediation**: Test framework on 3 different IDEs, achieve 100% cross-platform compatibility, pass Cabinet Secretary audit, contribute compatibility patterns, restore privileges after parliamentary approval.

---

**Character Count**: 2,988 | **Schema References**: activeContext, systemPatterns | **MCP Requirements**: filesystem, memory, time
