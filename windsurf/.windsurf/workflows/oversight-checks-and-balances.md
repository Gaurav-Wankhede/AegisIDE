---
description: Oversight checks-and-balances workflow for Windsurf (pre/during/post constitutional compliance)
---

# Windsurf Oversight — Checks & Balances

Follow for every task to enforce the Constitution (rules.xml), Executive (Memory Bank), and safety gates.

## Pre-execution
- [ ] Read `.windsurf/rules/rules.xml` (or use `.windsurf/constitution/constitution-template.xml` if unavailable)
- [ ] Read all present files under `.windsurf/docs/` and `.windsurf/guide/`
- [ ] Verify plan aligns with Constitution precedence: Constitution > Oversight > Executive > Docs/Workflows
- [ ] Select MCPs per rules (context7, fetch, filesystem, git, memory, shadcn)

## During execution
- [ ] Parallelize independent reads/searches only
- [ ] NEVER parallelize writes/edits/terminal commands
- [ ] Validate imports/syntax continuously; use diffs and logs
- [ ] Record decisions and citations (URLs) in relevant `guide/` files

## Post-execution
- [ ] Update Memory Bank (active context, progress)
- [ ] Document issues in mistakes.md (if applicable)
- [ ] Commit changes and tag with task reference

