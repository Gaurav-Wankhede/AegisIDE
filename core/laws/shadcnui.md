---
trigger: glob
globs: components/ui/*.tsx,lib/utils.ts,tailwind.config.ts,components.json
---

# Universal Shadcn UI Development Rules for Modern IDEs

## Core Architecture Principles

### Open-Code Component Ownership
- **Always install components into your repository** using the `npx shadcn add` CLI; never rely on opaque NPM packages.
- **Treat every component as first-party code**—modify, extend, and test it exactly as you would any internal module.
- **Preserve the headless + style layers**: keep behavior (Radix primitives, React Hook Form, TanStack Table) separate from Tailwind classes and design tokens.

### Extreme Microservices Decomposition (EMD)
- **Maximum 80 lines per file** including imports, comments, and whitespace.
- **Create deep nested subfolders** for every sub-functionality:  
  ```
  src/components/ui/
  ├── button.tsx           (≤80 lines)
  └── card/
      ├── card.tsx         (≤80 lines)
      ├── card_header.tsx  (≤80 lines)
      └── card_footer.tsx  (≤80 lines)
  ```
- Use `index.ts` files only for re-exports (also ≤80 lines).

### Design Token Consistency
- All components must consume the shared Tailwind CSS variables (`--primary`, `--background`, `--foreground`, etc.).
- **Never redefine colors or spacing** inside component files; extend the token palette in one place (`tailwind.config.js`).

### Duplication Detection and Optimization (DDO)
- **Run duplicate-code scanners** (ESLint plugins, jscpd, PMD CPD) on every commit and CI run.
- If duplication exists, **extract shared logic** into `lib/` or `shared/ui/` utilities without breaking APIs.
- Enforce **pre-commit hooks** and **weekly automated scans** to maintain zero redundancy.

### Data-Driven Configuration (DDP)
- **No hard-coded magic numbers** in components; pull sizes, breakpoints, and animation durations from a central config or design token file.
- Use utilities (`cn`, `variants`) to compute class names from props rather than embedding style decisions inline.

## Code Quality and Naming

### Zero Unused Variables (ZUV)
- Never prefix with `_` to silence TypeScript; remove or utilize every declaration.
- Log or assert variables in temporary stubs to avoid dead code.

### Naming Conventions
- **camelCase** for variables and functions (`isDialogOpen`), **PascalCase** for components (`AlertDialog`), **UPPER_CASE** for design tokens.
- Folder names are **singular** for atomic components (`button`, `input`) and **plural** for collections (`icons`, `hooks`).

### Type Safety
- **Strict TypeScript** (`"strict": true` in `tsconfig.json`).
- Export **ComponentProps** and **VariantProps** types alongside each component for IDE autocompletion and reuse.

## Async & State Management

- Use **React hooks** (`use`, `useEffect`, `useOptimistic`) for async data in server or client components.
- Wrap async interactions (forms, modals) with **server actions** or **react-query/SWR** to keep UI components stateless.
- **AbortController** for cancellable fetches; expose `onCancel` props where relevant.

## Performance Optimization

- Split large variants into separate files when nearing 80 lines.
- Memoize expensive calculations with `useMemo` and `useCallback`.
- Leverage **tree-shakable exports** by avoiding default exports in `ui/` components.

## Testing Requirements

- Unit-test components with **Jest** and **React Testing Library**; snapshot test visual variants.
- End-to-end test UI flows with **Playwright**.
- Maintain ≥ 80% code coverage; include accessibility assertions with `@testing-library/jest-dom`.

## Documentation Standards

- Provide **JSDoc/TSdoc** comments for every public prop and variant.
- Maintain **Storybook** stories for each component and its variants; update stories whenever props change.

## File Organization Rules

```
src/
├── app/                # Next.js route segments
├── components/
│   ├── ui/             # Shadcn components
│   ├── icons/          # SVG icon components
│   └── composite/      # Feature-specific compositions
├── lib/                # Utilities (cn, variants, fetchers)
├── hooks/              # Custom React hooks
├── styles/             # Tailwind config & global CSS
└── tests/              # Unit and E2E tests mirroring src structure
```

## IDE & Workflow Integration

- Enable **ESLint**, **Prettier**, and **TypeScript** plugins for instant feedback.
- Configure **VS Code**, **Cursor**, **RooCline**, or any modern IDE to run formatters and linters on save.
- Use **Husky + lint-staged** to enforce formatting, linting, and duplicate scanning before every commit.

## Security and Accessibility

- Ensure every interactive component handles **keyboard navigation** and **WAI-ARIA** roles.
- Validate **all props**; sanitize any user-generated content.
- Use **Content Security Policy** headers and **Strict-Transport-Security** in hosting platform.

## Deployment & Package Management

- Prefer **pnpm** or **yarn workspaces**; lock dependency versions.
- Deploy on **Vercel** or comparable platforms with preview environments.
- Keep component updates reproducible by scripting `npx shadcn@latest ...` commands in `package.json`.

Following these rules guarantees a maintainable, scalable, and highly customizable Shadcn UI codebase across any modern IDE or AI-assisted workflow.
