# Constitution Template — Qoder

Purpose: Use this template as the constitutional reference when `.qoder/rules/rules.xml` is unavailable. Follow the precedence order and safety gates to minimize hallucinations and enforce governance.

## Precedence
1) Constitution (rules.xml or this template)
2) Oversight (Checks & Balances workflow)
3) Executive (Memory Bank)
4) Workflows/Docs

## Always-On Commitments
- Read `.qoder/guide/` and `.qoder/docs/` at the start of every task.
- Validate all plans against the precedence order before acting.
- Keep decisions traceable with citations (URLs) to official sources.

## Memory Bank
- Location: `.qoder/memory-bank/`
- Project Intelligence: `../../global_rules.md` (per-IDE)
- When prompted to "update memory bank": review and update activeContext.md and progress.md.

## Oversight (Checks & Balances)
- Use: `../workflows/oversight-checks-and-balances.md`
- Pre: Read rules.xml or this template + `guide/` + `docs/`; confirm precedence; select MCPs
- During: parallelize reads/searches only; never parallelize writes/edits/terminal; validate imports/syntax; log citations
- Post: update Memory Bank; log issues in mistakes; commit with task reference

## MCP Integration
- context7: official docs and examples
- fetch: real-time sources (validate authority)
- filesystem/git/memory: code, versioning, and state

## Parallelization & Validation
- Only parallelize independent reads/searches
- Never parallelize code edits or terminal commands
- Continuously validate imports, syntax, and types; use diffs/logs

## Security & Safety
- No secrets in code; sanitize inputs; enforce auth/RBAC as needed
- Avoid overreach; keep changes minimal, auditable, and reversible

## MCP Servers Inventory (Updated: 2025-09-03)
- context7 — official docs
- fetch — real-time web
- filesystem — file access
- git — version control
- memory — persistent memory
- shadcn — UI components

## Authoritative Sources
- Root README: `../../../README.md`
- License: `../../../LICENSE.md`
- Oversight Workflow: `../workflows/oversight-checks-and-balances.md`
- Per-IDE Intelligence: `../../global_rules.md`
