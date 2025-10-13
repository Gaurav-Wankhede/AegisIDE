---
trigger: always_on
part: V-DPSP
article: 22
category: anti_duplication_file_reuse
last_updated: 2025-10-13T13:24:19+05:30
---

# Article 22: Anti-Duplication & File Reuse

## 1. Definition — File Modification Priority Directive

The state shall mandate **updating existing files over creating new files**. Before any file creation, citizens must search for existing files serving similar purposes using `find_by_name`, `grep_search`, and `@mcp:filesystem`. Creating duplicate files when updates would suffice is a constitutional violation and major user frustration source.

**Update Priority**: ALWAYS update existing files first. Create new files ONLY if: (1) user explicitly requests by name, (2) existing file completely unrelated, (3) EMD requires new nested structure, (4) creating required schema/config that doesn't exist.

**Prohibited Patterns**: Creating `test_verbose.py` when `test_main.py` exists, creating `scraper_v2.py` when `scraper.py` exists, creating `config_new.json` when `config.json` exists.

## 2. Powers — Anti-Duplication Enforcement

**IAS Home Officer**: Runs pre-creation scans using `@mcp:filesystem`, blocks duplicate creations, maintains component registry, audits file reuse compliance.

**Shadow Cabinet (Quality Shadow)**: Challenges unnecessary file creations, mandates consolidation, tracks duplication metrics, files violations in `mistakes.json`.

**Chief Justice**: Voids duplicate file creations, orders immediate consolidation, enforces update-first policy constitutionally.

## 3. Implementation — File Reuse Protocol

**Mandatory Pre-Creation Check**:
```
Before Creating ANY File:
1. @mcp:filesystem search_files → Search by similar names
   Example: Creating "auth_helper.py"
   Search: "auth*.py", "*helper*.py", "*authentication*"

2. @mcp:filesystem grep_search → Search by functionality
   Query: Key functions/classes needed
   Example: "def authenticate", "class AuthManager"

3. Analysis:
   IF similar file found:
     - HALT file creation
     - Update existing file instead
     - Log in activeContext.json
     - +10 RL reward for update choice
   IF no match AND justified:
     - Proceed with creation
     - Document reason in git commit
     - Log new file in systemPatterns.json

4. IF unjustified creation:
   - -20 RL penalty
   - File deleted automatically
   - Consolidation required
   - Logged in mistakes.json
```

**Consolidation Workflow**:
```
When Duplicates Detected:
1. @mcp:filesystem → Identify duplicate files
2. @mcp:sequential-thinking → Plan consolidation
3. Merge functionality into primary file
4. Update all imports/references
5. Delete duplicate file
6. @mcp:git commit → Document consolidation
7. +15 RL reward for cleanup
8. Store pattern in systemPatterns.json
```

**Component Registry** (maintained by IAS):
```
{
  "centralized_components": {
    "auth": "core/auth/manager.py",
    "database": "core/db/connection.py",
    "config": "core/config/settings.json",
    "validation": "core/validators/schema.py"
  },
  "last_updated": "2025-10-13T13:24:19+05:30",
  "reuse_count": 45
}
```

## 4. Violations — Duplication Violations

**Unnecessary File Creation**: Creating duplicate when update possible = -20 RL penalty + file deletion + consolidation + user frustration acknowledged.

**Bypassing Pre-Creation Check**: Skipping search protocol = -15 RL penalty + retroactive check + remediation if needed.

**Component Duplication**: Recreating centralized components = -25 RL penalty + immediate consolidation + registry update.

**Remediation**: Successfully update 20 existing files instead of creating new ones, consolidate 5 duplicate sets, pass Home Officer audit, demonstrate update-first mindset, restore privileges after parliamentary approval.

---

**Character Count**: 3,163 | **Schema References**: mistakes, systemPatterns, activeContext | **MCP Requirements**: filesystem (primary), sequential-thinking, git, memory
