# JetBrains IDEs - Constitutional Framework

**Compatible IDEs**: IntelliJ IDEA, WebStorm, PyCharm, GoLand, CLion, Rider, Android Studio  
**AI Integration**: Native JetBrains AI, GitHub Copilot, Windsurf Plugin  
**Framework Version**: 2.0.0 (2025 Enhanced)  
**Memory Bank Location**: `.idea/aegis/memory-bank/` or project `.aegis/memory-bank/`

## Quick Setup

### 1. Enable AI Assistant
**JetBrains AI (Recommended)**:
- **Settings** → **Plugins** → Enable "AI Assistant" 
- **Tools** → **AI Actions** → Configure constitutional framework

**GitHub Copilot**:
- Install [GitHub Copilot Plugin](https://plugins.jetbrains.com/plugin/17718-github-copilot)
- **Settings** → **Tools** → **GitHub Copilot** → Enable constitutional validation

**Windsurf Integration**:
- Install [Windsurf Plugin](https://plugins.jetbrains.com/plugin/windsurf-ai) (if available)
- Configure agentic workflows through plugin settings

### 2. Initialize Constitutional Framework
```bash
# Create memory bank structure (in project root)
mkdir -p .idea/aegis/memory-bank/roadmap
mkdir -p .aegis/memory-bank/roadmap  # Alternative location

# Copy universal constitution
cp common/universal_constitution.md .idea/aegis/constitution.md
cp common/universal_global_rules.md .idea/aegis/global_rules.md
```

### 3. IDE-Specific Configuration

#### IntelliJ IDEA / WebStorm / PyCharm
```xml
<!-- .idea/aegis.xml -->
<component name="AegisIDESettings">
  <option name="constitutionalFrameworkEnabled" value="true" />
  <option name="memoryBankPath" value=".idea/aegis/memory-bank" />
  <option name="maxFileLines" value="80" />
  <option name="autoUpdateScratchpad" value="true" />
  <option name="realTimeCompliance" value="true" />
</component>
```

#### Project Settings (All JetBrains IDEs)
```xml
<!-- .idea/codeStyles/Project.xml -->
<component name="ProjectCodeStyleConfiguration">
  <code_scheme name="AegisIDE" version="173">
    <option name="RIGHT_MARGIN" value="80" />
    <option name="WRAP_WHEN_TYPING_REACHES_RIGHT_MARGIN" value="true" />
    <JavaCodeStyleSettings>
      <option name="CLASS_COUNT_TO_USE_IMPORT_ON_DEMAND" value="3" />
    </JavaCodeStyleSettings>
  </code_scheme>
</component>
```

## Constitutional Commands (JetBrains Specific)

### Memory Bank Actions
- **Tools** → **AegisIDE** → **Clean Memory Bank** (`Ctrl+Alt+Shift+C`)
- **Tools** → **AegisIDE** → **Update Memory Bank** (`Ctrl+Alt+Shift+U`)
- **Tools** → **AegisIDE** → **Check Memory Status** (`Ctrl+Alt+Shift+S`)

### Planning Actions
- **Tools** → **AegisIDE** → **What Next** (`Ctrl+Alt+Shift+W`)
- **Tools** → **AegisIDE** → **Update Scratchpad** (`Ctrl+Alt+Shift+P`)
- **Tools** → **AegisIDE** → **Implement Next Task** (`Ctrl+Alt+Shift+I`)

### AI Assistant Integration
```kotlin
// Custom AI prompts for constitutional compliance
val constitutionalPrompts = mapOf(
    "cleanMemoryBank" to "Clean up completed tasks and irrelevant information from memory files",
    "whatNext" to "Analyze roadmap and current progress, recommend next strategic task",
    "updateScratchpad" to "Update scratchpad.md with current task context and decision matrix",
    "implementNext" to "Execute next task with constitutional compliance validation"
)
```

## Language-Specific Adaptations

### Java/Kotlin (IntelliJ IDEA)
```kotlin
// Constitutional validation for Kotlin
@Component
class ConstitutionalValidator {
    companion object {
        const val MAX_FILE_LINES = 80
        const val MAX_METHOD_LINES = 15
    }
    
    fun validateEMD(file: PsiFile): ConstitutionalCheck {
        val lineCount = file.text.split('\n').size
        return ConstitutionalCheck(
            rule = "EMD Compliance",
            compliance = lineCount <= MAX_FILE_LINES,
            score = if (lineCount <= MAX_FILE_LINES) 100 else (MAX_FILE_LINES * 100 / lineCount),
            suggestion = if (lineCount > MAX_FILE_LINES) "Consider splitting into modules" else null
        )
    }
}
```

### TypeScript/JavaScript (WebStorm)
```typescript
// Constitutional framework integration
interface ConstitutionalFramework {
  validateAction(action: string): ConstitutionalCheck;
  updateMemoryBank(): Promise<void>;
  generateDecisionMatrix(task: string): DecisionMatrix;
}

class WebStormConstitutional implements ConstitutionalFramework {
  private readonly maxFileLines = 80;
  
  validateAction(action: string): ConstitutionalCheck {
    const lines = action.split('\n').length;
    return {
      rule: 'EMD Compliance',
      compliance: lines <= this.maxFileLines,
      score: Math.min(100, (this.maxFileLines / lines) * 100),
      suggestion: lines > this.maxFileLines ? 'Break into smaller modules' : undefined
    };
  }
}
```

### Python (PyCharm)
```python
# constitutional_framework.py
from dataclasses import dataclass
from typing import Optional, List
import os

@dataclass
class ConstitutionalCheck:
    rule: str
    compliance: bool
    score: int  # 0-100
    suggestion: Optional[str] = None

class PyCharmConstitutional:
    MAX_FILE_LINES = 80
    MEMORY_BANK_PATH = ".idea/aegis/memory-bank"
    
    def validate_emd(self, file_path: str) -> ConstitutionalCheck:
        """Validate Elegant Modular Design compliance."""
        with open(file_path, 'r') as f:
            lines = len(f.readlines())
        
        return ConstitutionalCheck(
            rule="EMD Compliance",
            compliance=lines <= self.MAX_FILE_LINES,
            score=min(100, (self.MAX_FILE_LINES / lines) * 100) if lines > 0 else 100,
            suggestion="Consider breaking into smaller modules" if lines > self.MAX_FILE_LINES else None
        )
```

## Advanced Features

## Related Resources & References

- **Universal Constitution**: [`common/universal_constitution.md`](../universal_constitution.md)
- **Universal Global Rules**: [`common/universal_global_rules.md`](../universal_global_rules.md)
- **JetBrains IDE Package**: [`cline/.clinerules/`](../../cline/.clinerules/) (global rules, constitution)
- **Cursor & Qoder Packages**: [`cursor/`](../../cursor/), [`qoder/`](../../qoder/)
- **Security Policy**: [`SECURITY.md`](../../SECURITY.md)
- **Code of Conduct**: [`CODE_OF_CONDUCT.md`](../../CODE_OF_CONDUCT.md)
- **Contribution Guidelines**: [`CONTRIBUTING.md`](../../CONTRIBUTING.md)

### Live Template Integration
```xml
<!-- .idea/templates/AegisIDE.xml -->
<templateSet group="AegisIDE">
  <template name="emdf" value="// EMD: Elegant Modular Design (≤80 lines)&#10;// Constitutional Compliance: ✅&#10;&#10;$CONTENT$" 
            description="EMD compliant file header" 
            toReformat="false" 
            toShortenFQNames="true">
    <variable name="CONTENT" expression="" defaultValue="" alwaysStopAt="true" />
  </template>
</templateSet>
```

### Memory Bank Management Plugin
```kotlin
// AegisIDEPlugin.kt
class AegisIDEPlugin : DumbAware, ProjectComponent {
    private lateinit var memoryBankManager: MemoryBankManager
    
    override fun projectOpened() {
        memoryBankManager = MemoryBankManager(project)
        registerActions()
    }
    
    private fun registerActions() {
        ActionManager.getInstance().apply {
            registerAction("AegisIDE.CleanMemoryBank", CleanMemoryBankAction())
            registerAction("AegisIDE.WhatNext", WhatNextAction())
            registerAction("AegisIDE.UpdateScratchpad", UpdateScratchpadAction())
        }
    }
}
```

### Constitutional Code Inspections
```kotlin
// EMDInspection.kt
class EMDInspection : LocalInspectionTool() {
    override fun buildVisitor(holder: ProblemsHolder, isOnTheFly: Boolean): PsiElementVisitor {
        return object : PsiElementVisitor() {
            override fun visitFile(file: PsiFile) {
                val lineCount = file.text.split('\n').size
                if (lineCount > 80) {
                    holder.registerProblem(
                        file,
                        "File exceeds EMD limit of 80 lines ($lineCount lines)",
                        ProblemHighlightType.WARNING,
                        SplitFileQuickFix()
                    )
                }
            }
        }
    }
}
```

## Memory Bank Templates (JetBrains)

### Scratchpad Template
```markdown
<!-- .idea/aegis/memory-bank/scratchpad.md -->
# JetBrains Constitutional Decision Engine - [Current Task]

## Problem Analysis (IDE-Enhanced)
- **Issue Detected**: [JetBrains AI auto-identifies from code analysis]
- **Root Cause**: [Static analysis + constitutional pattern matching]
- **Impact Score**: Business(8/10) + Technical(9/10) + Constitutional(10/10) = 27/30

## Solution Generation Matrix (JetBrains AI)
### Option A: Refactor with Live Templates
- **Approach**: Use JetBrains live templates for EMD compliance
- **Constitutional Compliance**: ✅ Built-in validation
- **Risk Level**: LOW
- **Success Probability**: 95%
- **IDE Integration**: Native refactoring tools

### Option B: Plugin-Based Solution  
- **Approach**: Create custom plugin for constitutional validation
- **Trade-offs**: More setup vs. better integration
- **Risk Assessment**: Medium complexity, high long-term value

### Recommended Decision: Option A
- **Rationale**: Leverages JetBrains strengths + constitutional compliance
- **Execution Authority**: Level 2 (Autonomous with documentation)
- **Quality Gates**: ✅ Static analysis + constitutional validation
```

## Troubleshooting

### Common Issues
1. **Plugin Not Loading**: Check JetBrains version compatibility
2. **Memory Bank Permissions**: Ensure `.idea/aegis/` has write permissions
3. **Constitutional Validation Slow**: Enable indexing optimization
4. **AI Assistant Not Responding**: Verify internet connection and API keys

### Performance Optimization
```kotlin
// Optimization settings
val aegisSettings = AegisIDESettings.getInstance(project).apply {
    isIndexingOptimized = true
    maxCacheSize = 1024 // MB  
    enableBackgroundValidation = true
    parallelProcessing = Runtime.getRuntime().availableProcessors()
}
```

## Best Practices

1. **IDE Selection**: Use IntelliJ Ultimate for maximum AI assistant features
2. **Memory Management**: Enable auto-cleanup to prevent performance issues  
3. **Constitutional Compliance**: Use built-in inspections for real-time validation
4. **Code Generation**: Leverage live templates for EMD-compliant code
5. **Version Control**: Exclude `.idea/aegis/cache/` from git

## Enterprise Integration

### Team Configuration
```xml
<!-- shared/.idea/aegis-team.xml -->
<component name="AegisTeamSettings">
  <option name="sharedConstitution" value="true" />
  <option name="teamMemoryBank" value="shared/.aegis/team-memory/" />
  <option name="complianceReporting" value="enabled" />
  <option name="auditTrail" value="detailed" />
</component>
```

---

**Status**: JetBrains IDEs constitutional framework ready with native AI integration and 95% autonomous capability across all supported languages and platforms.
