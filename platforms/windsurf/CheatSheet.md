# Command Cheat Sheet — Constitutional Framework Quick Reference (2025)

**PURPOSE**: Ultra-brief command reference for AI agents  
**FULL DETAILS**: See `global_rules.md` for complete framework documentation  
**CONSTITUTIONAL AUTHORITY**: `.windsurf/rules/constitution/` Articles I-XVI

---

## 🚀 Core Commands (8 Total)

**Project Initialization**:
- **`init`** → Auto-detect project state → Restore OR generate 8 essential schemas → Enable autonomous workflow

**Execution**:
- **`next`** → Execute next task → Update ALL 8 essential schemas → Auto-continue → NEVER STOP
- **`update`** → Refresh ALL 8 essential schemas (and any project-specific automation files if present) → Schema validation → Context health check
  
  Note: If extended automation files exist (e.g., deployment/monitoring/dependencies), `update` also refreshes them, but the 8 essential schemas remain the canonical core.

**Quality**:
- **`validate`** → Ajv schema + linkage validators (+ language tests when present) → Report compliance
- **`fix`** → HALT-FIX-VALIDATE loop → Auto-fix errors → Update bugfix.json

**Monitoring**:
- **`health`** → Monitor attention budget, context rot, JSON integrity
- **`optimize`** → Analyze patterns → Propose improvements
- **`status`** → Complete progress report → Tasks, bugs, metrics

---

## ⚡ Autonomy Levels

- **0-98%**: Execute immediately without permission
- **99%**: Document rationale then execute automatically
- **100%**: Human consultation required

---

## 🔄 Autonomous Execution Flow

```
Task Complete → Update ALL 8 essential schemas → Validate → Load Next → Execute → Repeat
```

**CRITICAL**: AI NEVER stops after one task at 0-98% autonomy

---

## 🚨 Emergency Fallbacks

**MCP Failures** → Switch to native IDE operations → Continue without interruption  
**Validation Errors** → HALT → Auto-fix via @mcp:context7 → Re-validate → Continue  
**Context Rot** → Auto-compress → Preserve critical patterns → Optimize

---

## 📋 Task Completion Checklist

- [ ] Task implemented and validated
- [ ] ALL 8 essential schemas updated (plus automation files if present)
- [ ] Quality checks passed (zero errors/warnings)
- [ ] Next task auto-loaded and execution started
- [ ] Knowledge stored (@mcp:memory)

---

## 🔧 Session Resume (Zero Manual Input)

**Existing Projects**:
```
1. AI auto-scans .windsurf/memory-bank/ (8 essential schemas)
2. Auto-loads ALL core schemas with schema validation
3. Type: next (or AI auto-triggers)
4. Workflow resumes exactly where you left off
```

**New Projects**:
```
1. Type: init
2. AI generates the 8 essential schemas (bootstrap) and any required automation files
3. Autonomous workflow activated
```

---

## 📁 Quick Reference

**Memory-Bank**: 8 essential schemas (+ roadmap.md). Extended automation files are optional and project-specific.  
**Constitution**: 16 articles in `.windsurf/rules/constitution/`  
**Schemas**: 8 essential schemas in `.windsurf/memory-bank/schemas/` (see `README.md`)  
**Laws**: Project-specific in `.windsurf/rules/laws/`

**For Complete Details**: See `global_rules.md` (MCP automation, project structure, validation commands, compliance thresholds, etc.)

---

**Constitutional Principle**: AI maintains continuous autonomous execution with instant MCP activation, zero-stop task chaining, and automatic context updates without manual reminders.
