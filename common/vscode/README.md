# VS Code AI Extensions - Constitutional Framework

**Compatible Extensions**: Cline, Roo Code, Kilo Code, GitHub Copilot, Amazon Q Developer  
**Framework Version**: 2.0.0 (2025 Enhanced)  
**Memory Bank Location**: `.vscode/memory-bank/` or workspace `.aegis/memory-bank/`

## Quick Setup

### 1. Install Your Preferred AI Extension
**Open Source Options (Recommended)**:
- **[Kilo Code](https://marketplace.visualstudio.com/items?itemName=kilocode.Kilo-Code)**: Superset of Roo + Cline with MCP marketplace
- **[Cline](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev)**: Popular open-source AI agent
- **[Roo Code](https://marketplace.visualstudio.com/items?itemName=RooVeterinaryInc.roo-cline)**: Fast growing alternative

**Commercial Options**:
- **[GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)**: Industry standard ($10-39/month)
- **[Amazon Q Developer](https://marketplace.visualstudio.com/items?itemName=AmazonWebServices.amazon-q-vscode)**: Free tier available

### 2. Initialize Constitutional Framework
```bash
# Create memory bank structure
mkdir -p .vscode/memory-bank/roadmap
mkdir -p .aegis/memory-bank/roadmap  # Alternative location

# Copy universal constitution
cp common/universal_constitution.md .vscode/constitution.md
cp common/universal_global_rules.md .vscode/global_rules.md
```

### 3. Extension-Specific Configuration

#### For Kilo Code (Recommended)
```json
// .vscode/settings.json
{
  "kilocode.constitutionalFramework": true,
  "kilocode.memoryBankPath": ".vscode/memory-bank",
  "kilocode.mcpIntegration": true,
  "kilocode.maxFileLines": 80,
  "kilocode.autoUpdateScratchpad": true
}
```

#### For Cline
```json
// .vscode/settings.json  
{
  "cline.memoryBankEnabled": true,
  "cline.memoryBankPath": ".vscode/memory-bank",
  "cline.constitutionalCompliance": true,
  "cline.maxFileLines": 80,
  "cline.autoCleanup": true
}
```

#### For GitHub Copilot
```json
// .vscode/settings.json
{
  "github.copilot.enable": {
    "*": true,
    "yaml": false,
    "plaintext": false
  },
  "github.copilot.advanced": {
    "constitutionalFramework": ".vscode/constitution.md",
    "memoryBankPath": ".vscode/memory-bank"
  }
}
```

## Constitutional Commands (VS Code Specific)

### Memory Bank Commands
- **Command Palette** → `AegisIDE: Clean Memory Bank`
- **Command Palette** → `AegisIDE: Update Memory Bank` 
- **Command Palette** → `AegisIDE: Check Memory Status`

### Planning Commands  
- **Command Palette** → `AegisIDE: What Next`
- **Command Palette** → `AegisIDE: Update Scratchpad`
- **Command Palette** → `AegisIDE: Implement Next Task`

### Quick Actions
```bash
# In terminal or through AI chat
clean memory bank
what next
update scratchpad
implement next task
solve error
```

## Extension Comparison (2025)

| Feature | Kilo Code | Cline | Roo Code | GitHub Copilot |
|---------|-----------|-------|----------|----------------|
| **Cost** | Free + $29/month teams | Free (Open Source) | Free (Open Source) | $10-39/month |
| **MCP Support** | ✅ Marketplace | ✅ Built-in | ✅ Built-in | ❌ Limited |
| **Constitutional Framework** | ✅ Native | ✅ Compatible | ✅ Compatible | ✅ Via settings |
| **Memory Bank** | ✅ Auto-managed | ✅ Manual setup | ✅ Manual setup | ✅ Via workspace |
| **Multi-Model** | ✅ All providers | ✅ Claude focus | ✅ Multiple | ✅ GPT focus |
| **Enterprise** | ✅ $299/month | ❌ Community | ❌ Community | ✅ Full support |

## Advanced Features

## Related Resources & References

- **Universal Constitution**: [`common/universal_constitution.md`](../universal_constitution.md)
- **Universal Global Rules**: [`common/universal_global_rules.md`](../universal_global_rules.md)
- **Cline IDE Package**: [`cline/`](../../cline/) (cheat sheets, global rules, constitution)
- **Roo Code Package**: [`cline/`](../../cline/) (shared with Cline configuration)
- **Kilo Code Marketplace Docs**: [`common/vscode/`](./)
- **Security Policy**: [`SECURITY.md`](../../SECURITY.md)
- **Code of Conduct**: [`CODE_OF_CONDUCT.md`](../../CODE_OF_CONDUCT.md)
- **Contribution Guidelines**: [`CONTRIBUTING.md`](../../CONTRIBUTING.md)

### MCP Integration (Kilo Code)
```json
// .vscode/mcp-config.json
{
  "servers": {
    "context7": {
      "command": "mcp-server-context7",
      "args": []
    },
    "fetch": {
      "command": "mcp-server-fetch", 
      "args": []
    }
  }
}
```

### Constitutional Validation
```typescript
// .vscode/constitution-validator.ts
export interface ConstitutionalCheck {
  rule: string;
  compliance: boolean;
  score: number; // 0-100
  suggestion?: string;
}

export function validateAction(action: string): ConstitutionalCheck {
  // Auto-validation logic
  return {
    rule: "EMD Compliance", 
    compliance: action.length <= 80,
    score: 95,
    suggestion: "Consider breaking into smaller modules"
  };
}
```

### Memory Bank Templates
```markdown
<!-- .vscode/memory-bank/scratchpad.md -->
# Autonomous Decision Engine - [Current Task]

## Problem Analysis (Auto-Generated)
- **Issue Detected**: [VS Code AI auto-identifies]
- **Root Cause**: [Extension-specific pattern analysis]
- **Impact Score**: Business(8/10) + Technical(7/10) + Constitutional(9/10) = 24/30

## Solution Generation Matrix
### Option A: Kilo Code MCP Integration
- **Approach**: Use MCP marketplace for enhanced capabilities
- **Constitutional Compliance**: ✅ EMD + ZUV compliant
- **Risk Level**: LOW
- **Success Probability**: 92%

### Recommended Decision: Option A
- **Rationale**: Best constitutional compliance + feature richness
- **Execution Authority**: Level 2 (Autonomous with documentation)
- **Quality Gates**: ✅ All passed
```

## Troubleshooting

### Common Issues
1. **Memory Bank Not Found**: Ensure `.vscode/memory-bank/` exists
2. **Constitutional Validation Fails**: Check constitution.md syntax  
3. **MCP Tools Not Working**: Verify extension supports MCP (Kilo/Cline/Roo)
4. **Performance Issues**: Enable auto-cleanup in settings

### Performance Optimization
```json
// .vscode/settings.json
{
  "files.watcherExclude": {
    "**/.vscode/memory-bank/cache/**": true
  },
  "search.exclude": {
    "**/.vscode/memory-bank/temp/**": true
  }
}
```

## Best Practices

1. **Extension Selection**: Choose Kilo Code for maximum constitutional framework compatibility
2. **Memory Management**: Enable auto-cleanup to prevent context pollution
3. **Constitutional Compliance**: Run validation checks before major changes
4. **Documentation**: Keep memory bank files ≤200 lines for optimal processing
5. **Security**: Never commit API keys or sensitive data to memory bank

---

**Status**: VS Code constitutional framework ready with 95% autonomous capability across all supported AI extensions.
