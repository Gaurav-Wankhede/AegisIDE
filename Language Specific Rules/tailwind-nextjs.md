# Tailwind CSS Rules for Next.js (App Router, v4+) — Two Project Layouts

## Shared Tailwind + Next.js Conventions

1. **Class-Based Dark Mode**  
   tailwind.config.js → `darkMode: "class"`  
   The `<html>` element receives either `class="dark"` or nothing, controlled by `next-theme`.

2. **Theme Hook & Class Composer**  
   ```tsx
   "use client";
   import { useTheme } from "next-theme";
   import { cn } from "@/lib/utils";           // tiny clsx/tailwind-merge helper

   export function ThemeToggle() {
     const { theme, setTheme } = useTheme();
     return (
       <button
         onClick={() => setTheme(theme === "dark" ? "light" : "dark")}
         className={cn(
           "rounded px-3 py-2 text-sm transition-colors",
           theme === "dark" ? "bg-zinc-800 text-zinc-100" : "bg-zinc-200 text-zinc-900"
         )}
       >
         Toggle Theme
       </button>
     );
   }
   ```

3. **Utilities**
   - `cn(...classes)` merges Tailwind strings and handles conditional output.  
   - Always choose `theme === "dark" ? "class-for-dark" : "class-for-light"` for all dynamic color cases; never inline style.

4. **Extreme Microservices Decomposition (EMD)**  
   ≤ 80 lines per file (including imports/comments). Split immediately when nearing the limit.

5. **Duplication Detection & Data-Driven Styling**  
   Same DDO/DDS practices as the generic Tailwind rules (Stylelint + jscpd, tokens only in tailwind.config.js).

***

## Layout A “with src/” Directory

```
src/
├── app/               # Next.js App Router
│   ├── layout.tsx     # Imports "src/styles/globals.css"
│   └── page.tsx
├── components/
│   ├── ui/            # Atomic components (≤80 lines each)
│   └── composite/     # Feature compositions
├── styles/
│   ├── globals.css    # @tailwind directives + base tokens
│   └── themes/        # css variables per theme if needed
├── lib/
│   ├── utils.ts       # cn() + helpers
│   └── hooks.ts       # reusable hooks
├── tailwind.config.ts
└── postcss.config.mjs
```

Key points for this layout:

- `import "@/styles/globals.css";` only in `app/layout.tsx`.
- Use absolute imports (`@/components/...`) enabled by `paths` in tsconfig.
- Place all Tailwind plugin code under `src/styles/plugins/` (≤80 lines each) and import them in tailwind.config.ts.

***

## Layout B “root-level app/” (No src Folder)

```
app/                   # Root App Router
├── layout.tsx         # Imports "./globals.css"
├── page.tsx
├── components/
│   ├── ui/
│   └── composite/
├── globals.css        # @tailwind directives + base tokens
├── lib/
│   ├── utils.ts
│   └── hooks.ts
├── tailwind.config.ts
└── postcss.config.mjs
```

Distinct rules:

- Relative imports (`"./globals.css"`) inside `app/layout.tsx`.
- Keep all code under `app/` except configuration files; no additional top-level `src/`.
- Tailwind `content` paths in tailwind.config.ts must scan `./app/**/*.{ts,tsx}` and `./components/**/*.{ts,tsx}`.

***

## Tailwind-Specific Rules Inside Next.js

1. **Content Paths**  
   ```ts
   export default {
     content: [
       "./app/**/*.{ts,tsx}",
       "./components/**/*.{ts,tsx}"
     ],
     darkMode: "class",
     theme: { extend: {} },
     plugins: [],
   };
   ```

2. **Global CSS**  
   ```
   @tailwind base;
   @tailwind components;
   @tailwind utilities;
   ```

3. **Preferred Class Patterns**  
   - Theme-aware colors: `bg-primary-500 dark:bg-primary-400` via design tokens.  
   - Conditional via cn(): `cn("p-4", theme === "dark" ? "bg-zinc-900" : "bg-white")`.

4. **Testing & Linting**  
   - `prettier-plugin-tailwindcss` for class sorting.  
   - `eslint-plugin-tailwindcss` in strict mode.  
   - Jest/Playwright tests must cover both themes by mocking `useTheme()`.

5. **Performance**  
   - Enable `experimental.optimizeCss` in next.config.js (if available).  
   - Always run `tailwindcss --minify` in production builds.

Following these guidelines ensures a scalable, theme-aware Next.js App Router project with Tailwind CSS v4+, whether you choose to develop inside `src/` or directly in the root `app/` directory.