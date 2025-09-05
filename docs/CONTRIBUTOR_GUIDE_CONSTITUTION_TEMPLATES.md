# Contributor Guide: Constitution Templates & Environment Restrictions

This repository previously included constitution templates to accommodate environments where direct access to live `constitution.md` is restricted. Templates are optional and may be removed in projects that standardize on Markdown.

## When to Use Templates
- When the IDE cannot read from or write to `<ide hidden>/rules/constitution.md`
- When bootstrapping a new project to define constitutional rules before the IDE creates live files

## How to Apply
1. Copy the template into your project root's hidden IDE folder.
2. Rename or adopt it as the live Constitution at:
   - `.windsurf/rules/constitution.md`
   - `.cursor/rules/constitution.md`
   - `.clinerules/rules/constitution.md`
   - `.qoder/rules/constitution.md`
3. Update references in your Memory Bank docs accordingly.

## Oversight Workflow Checks
- Pre-execution ("run pre-oversight"): Read Constitution + `guide/` + `docs/` + ALL Memory Bank files
- During execution: Validate imports, paths, and security
- Post-execution ("run post-oversight"): Update Memory Bank (`activeContext.md`, `progress.md`), and document changes

## Notes
- Treat the Constitution as the supreme source of truth.
- Use templates as authoritative references only when the live `constitution.md` is unavailable.
- Keep citations to official docs in each IDE’s `guide/index.md`.
