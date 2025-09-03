# Contributor Guide: Constitution Templates & Environment Restrictions

This repository includes constitution templates to accommodate environments where direct access to live `rules.xml` is restricted.

## When to Use Templates
- When the IDE cannot read from or write to `<ide hidden>/rules/rules.xml`
- When bootstrapping a new project to define constitutional rules before the IDE creates live files

## Template Locations (per IDE)
- Windsurf: `windsurf/.windsurf/constitution/constitution-template.xml`
- Cursor: `cursor/.cursor/constitution/constitution-template.md`
- Cline: `cline/.clinerules/constitution/constitution-template.md`
- Qoder: `qoder/.qoder/constitution/constitution-template.md`

## How to Apply
1. Copy the template into your project root's hidden IDE folder.
2. Rename or adopt it as the live Constitution at:
   - `.windsurf/rules/rules.xml`
   - `.cursor/rules/rules.xml`
   - `.clinerules/rules/rules.xml`
   - `.qoder/rules/rules.xml`
3. Update references in your Memory Bank docs accordingly.

## Oversight Workflow Checks
- Pre-execution: Read Constitution + `guide/` + `docs/` + ALL Memory Bank files
- During execution: Validate imports, paths, and security
- Post-execution: Update Memory Bank (`activeContext.md`, `progress.md`), and document changes

## Notes
- Treat the Constitution as the supreme source of truth.
- Use templates as authoritative references only when the live `rules.xml` is unavailable.
- Keep citations to official docs in each IDE’s `guide/index.md`.
