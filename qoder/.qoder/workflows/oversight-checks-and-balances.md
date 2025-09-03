---
description: Oversight checks-and-balances workflow for Qoder
---

# Qoder Oversight — Checks & Balances

## Pre-execution
- [ ] Read `.qoder/rules/rules.xml` (or use `.qoder/constitution/constitution-template.md` if unavailable)
- [ ] Read all present files under `.qoder/docs/` and `.qoder/guide/`
- [ ] Verify plan aligns with Constitution precedence: Constitution > Oversight > Executive > Docs/Workflows
- [ ] Select MCPs per rules (context7, fetch, filesystem, git, memory)

## During execution
- [ ] Parallelize independent reads/searches only
- [ ] NEVER parallelize writes/edits/terminal commands
- [ ] Validate imports/syntax continuously; log decisions and citations (URLs)

## Post-execution
- [ ] Update Memory Bank (`activeContext.md`, `progress.md`)
- [ ] Document issues in `mistakes.md`
- [ ] Commit changes with task reference
