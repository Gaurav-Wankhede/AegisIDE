# Contributing to AegisIDE

Thank you for your interest in contributing! This project defines a constitutional framework for agentic IDEs, inspired by and enhancing the Cline Memory Bank model.

## Governance Model (Separation of Powers)
- Constitution: `<ide hidden>/rules/rules.xml` is the supreme source of truth.
- Oversight: Checks & Balances workflows enforce pre/during/post execution audits.
- Executive: Memory Bank (global rules + memory-bank files) operates under the Constitution.
- Precedence: Constitution > Oversight > Executive > Workflows/Docs.

## How to Contribute
- Issues: Use labels to propose improvements, report bugs, or request docs.
- Pull Requests: Keep focused; reference related issues; describe changes clearly.
- Branching: Use feature branches; keep commits scoped and descriptive.

## Development Workflow (Plan/Act)
- Plan Mode: Read Constitution + `guide/` + `docs/` + ALL Memory Bank files; outline approach.
- Act Mode: Implement in small steps; validate imports and syntax; update Memory Bank.
- Citations: Prefer official sources; add links in `guide/index.md`.
- Parallelization: Reads/searches in parallel only; never parallelize writes.
- Memory Bank updates when:
  - Discovering new patterns
  - After significant changes
  - On explicit “update memory bank” requests
  - When context needs clarification

## PR Checklist
- [ ] Read Constitution + docs/guide + Memory Bank before changes
- [ ] Added/updated citations in `guide/index.md` if needed
- [ ] Updated relevant Memory Bank files (esp. `activeContext.md`, `progress.md`)
- [ ] Added tests or validation steps where applicable
- [ ] No secrets committed; follows security guidance
- [ ] Docs updated (README or per-IDE guides) when behavior changes

## Code Style & Tools
- Keep changes concise and well-documented.
- Use modern patterns; validate imports and paths.
- Prefer small, composable modules; avoid excessive abstraction.

## License
By contributing, you agree that your contributions will be licensed under the MIT License. See `LICENSE.md`.

## Code of Conduct
Please read and follow our `CODE_OF_CONDUCT.md`. Respectful, inclusive collaboration is required.
