# AegisIDE 3-Tier Migration Guide

**Version:** 3.0.0 → 4.0.0  
**Migration Type:** Breaking changes - Path restructure  
**Date:** October 30, 2025

---

## Overview

AegisIDE has migrated from a flat structure to a hierarchical **3-tier architecture** for better organization and 65-82% token savings.

### Old Structure (v3.0.0)
```
.aegiside/
├── routers/context-router.json (8,665 tokens)
├── workflows/ (18 files)
├── memory-bank/memory/ (8 files)
├── memory-bank/schemas/ (19 files)
├── ace-framework/ (3 files)
├── optimization/ (3 files)
├── constitution/ (43 articles)
├── enforcement/ (27 files)
├── architecture/ (5 files)
└── ... (12 top-level dirs)
```

### New Structure (v4.0.0)
```
.aegiside/
├── core/ (500 tokens)
│   ├── main-router.json
│   └── context-orchestrator.json
├── runtime/ (1-3K tokens)
│   ├── ace/
│   │   ├── generator/ (5 workflows)
│   │   ├── reflector/ (4 workflows, 2 suites)
│   │   └── curator/ (4 workflows, 1 suite)
│   ├── memory/
│   │   ├── active/ (3 files)
│   │   ├── history/ (5 files)
│   │   └── schemas/ (19 files)
│   └── optimization/ (3 files)
└── knowledge/ (0-5K tokens, on-demand)
    ├── governance/
    │   ├── constitution/ (43 articles)
    │   └── enforcement/ (27 files)
    ├── architecture/ (5 files)
    └── support/ (7 files)
```

---

## Breaking Changes

### 1. Path Mappings

| Old Path | New Path | Type |
|----------|----------|------|
| `routers/context-router.json` | `core/main-router.json` | Router |
| `routers/skills.json` | `core/context-orchestrator.json` | Router |
| `workflows/*.json` | `runtime/ace/{generator\|reflector\|curator}/` | Workflows |
| `memory-bank/memory/*.json` | `runtime/memory/{active\|history}/` | Memory |
| `memory-bank/schemas/` | `runtime/memory/schemas/` | Schemas |
| `ace-framework/` | `runtime/ace/` | ACE Core |
| `optimization/` | `runtime/optimization/` | Optimization |
| `constitution/` | `knowledge/governance/constitution/` | Constitution |
| `enforcement/` | `knowledge/governance/enforcement/` | Enforcement |
| `architecture/` | `knowledge/architecture/` | Architecture |
| `visualize/` | `knowledge/support/visualize/` | Support |
| `reflection/` | `knowledge/support/reflection/` | Support |

### 2. Semantic Suites (Workflow Merging)

**Old:** Load 3 separate workflows (3,900 tokens)  
**New:** Load 1 semantic suite (3,650 tokens)

| Suite | Merged Workflows | Location |
|-------|------------------|----------|
| `validation-suite.json` | validate, violation-detector, mcp-chain-validator | `runtime/ace/reflector/` |
| `error-recovery-suite.json` | fix, timeout-handler, fallback-chain | `runtime/ace/reflector/` |
| `state-suite.json` | continue, update, next | `runtime/ace/curator/` |

### 3. Router Changes

**Old Query:**
```bash
jq 'keys' .aegiside/routers/context-router.json  # Returns 20 keys
```

**New Query:**
```bash
jq '.tier_1_domains' .aegiside/core/main-router.json  # Returns 3 domains
```

**Routing Flow:**
- **Old:** Monolithic router → Target (8,665 tokens)
- **New:** Tier-1 (500) → Tier-2 (800-1.2K) → Tier-3 (0-5K) = 65-82% savings

---

## Migration Scripts

### Quick Migration (Automated)

```bash
# Backup existing structure
cp -r .aegiside .aegiside.backup_$(date +%Y%m%d)

# Pull new structure from GitHub
git pull origin main

# Verify migration
jq '.tier_1_domains' .aegiside/core/main-router.json
ls .aegiside/knowledge/governance/enforcement/shell/validators/*.sh | wc -l
```

### Manual Migration

```bash
# 1. Create new directory structure
mkdir -p .aegiside/core
mkdir -p .aegiside/runtime/ace/{generator,reflector,curator}
mkdir -p .aegiside/runtime/memory/{active,history,schemas}
mkdir -p .aegiside/runtime/optimization
mkdir -p .aegiside/knowledge/governance/{constitution,enforcement}
mkdir -p .aegiside/knowledge/architecture
mkdir -p .aegiside/knowledge/support/{visualize,reflection}

# 2. Move files (keeping originals as backup)
cp .aegiside/routers/context-router.json .aegiside/core/main-router.json
cp -r .aegiside/workflows/* .aegiside/runtime/ace/
cp -r .aegiside/memory-bank/memory/* .aegiside/runtime/memory/
cp -r .aegiside/constitution/* .aegiside/knowledge/governance/constitution/
cp -r .aegiside/enforcement/* .aegiside/knowledge/governance/enforcement/

# 3. Verify (should return 0)
grep -r "routers/context\|memory-bank\|workflows" .aegiside/runtime/ | wc -l
```

### Update Code References

```bash
# Update all workflow cross-references
find .aegiside/runtime/ace -name "*.json" -exec \
  sed -i 's|memory-bank/memory|runtime/memory|g; s|memory-bank|runtime/memory|g' {} +

# Verify no old references remain
grep -r "memory-bank" .aegiside/runtime/ace/ | wc -l  # Should be 0
```

---

## Testing Migration

### 1. Verify Structure
```bash
tree -L 2 .aegiside/
# Should show: core/, runtime/, knowledge/
```

### 2. Test Router Query
```bash
jq '.tier_1_domains' .aegiside/core/main-router.json
# Expected output: {"ace_queries": {...}, "governance_queries": {...}, "architecture_queries": {...}}
```

### 3. Test Memory Access
```bash
jq '.schema_version' .aegiside/runtime/memory/active/activeContext.json
# Should work without errors
```

### 4. Verify Validators
```bash
ls .aegiside/knowledge/governance/enforcement/shell/validators/*.sh | wc -l
# Expected: 18
```

### 5. Run Workflows
```bash
# Test semantic suite
cat .aegiside/runtime/ace/reflector/validation-suite.json | jq '.merged_workflows'
# Expected: ["validate.json", "violation-detector.json", "mcp-chain-validator.json"]
```

---

## Rollback (If Needed)

```bash
# Restore from backup
rm -rf .aegiside
mv .aegiside.backup_YYYYMMDD .aegiside

# Verify old structure restored
jq 'keys' .aegiside/routers/context-router.json
```

---

## Post-Migration Checklist

- [ ] Backup created: `.aegiside.backup_*`
- [ ] New structure verified: `tree -L 2 .aegiside/`
- [ ] Router query works: `jq '.tier_1_domains' core/main-router.json`
- [ ] Validators count: 18 in `knowledge/governance/enforcement/`
- [ ] No old references: `grep -r "routers/context\|memory-bank" .aegiside/runtime/`
- [ ] Semantic suites accessible
- [ ] Memory files in correct locations
- [ ] system-prompt.md updated (5883/6000 chars)
- [ ] global_rules.md symlinked to src/system-prompt.md

---

## Support

**Issues?** File at: https://github.com/Gaurav-Wankhede/AegisIDE/issues  
**Docs:** See `README.md` and `.aegiside/knowledge/architecture/architecture.mmd`  
**Version:** Check `jq '.schema_version' .aegiside/core/main-router.json`

---

## Changelog Summary

**Token Savings:**
- Old routing: 8,665 tokens (full context-router.json)
- New routing: 500-2,700 tokens (hierarchical tier loading)
- **Reduction: 65-82%**

**File Organization:**
- Old: 12 top-level directories
- New: 3 top-level directories (core, runtime, knowledge)
- **Simplification: 75%**

**Semantic Suites:**
- 3 suites created (merged 9 workflows → 3 suites)
- Average token savings: 250 tokens per suite load
