# create-vite-lib

A modern CLI for scaffolding TypeScript libraries with [Vite](https://vitejs.dev/).

## Features

- **Vite-powered builds**: Outputs both ESM and CJS bundles.
- **TypeScript-first**: Strict, up-to-date configuration.
- **Testing ready**: Preconfigured with [Vitest](https://vitest.dev/) and [@testing-library](https://testing-library.com/).
- **Linting & Formatting**: Includes [ESLint](https://eslint.org/), [Prettier](https://prettier.io/), and [lint-staged](https://github.com/okonet/lint-staged).
- **Git Hooks**: [Husky](https://typicode.github.io/husky/) for pre-commit checks.
- **Unified type declarations**: Generates a single `index.d.ts` using [API Extractor](https://api-extractor.com/).
- **Flexible templates**: Choose between pure TypeScript or React TypeScript library templates.
- **Instant publishing**: Ready for npm publish with zero extra config.

## Quick Start

```sh
pnpm dlx create-vite-lib
```

Follow the prompts to select a template and name your library.

Example session:

```sh
? [PLOP] Please choose a generator. (Use arrow keys)
❯ lib
  react-lib
? lib name please my-lib
✔  +! 14 files added
 -> /my-lib/.eslintrc.yml
 -> /my-lib/.lintstagedrc.yml
 -> /my-lib/.prettierignore
 -> /my-lib/.prettierrc.yml
 -> /my-lib/api-extractor.json
 -> /my-lib/index.d.ts
 -> /my-lib/package.json
 -> /my-lib/tsconfig.json
 -> /my-lib/vite.config.ts
 -> /my-lib/.gitignore
 -> /my-lib/.husky/pre-commit
 -> /my-lib/src/index.ts
 -> /my-lib/src/my-lib.test.ts
 -> /my-lib/src/my-lib.ts
✔  ->

Done! Next steps:

  cd my-lib
  git init; git add .; git commit -m "initial commit"
  pnpm install
  pnpm build
```

## Scripts

- `pnpm format` — Format code with Prettier
- `pnpm lint` — Lint code with ESLint
- `pnpm test` — Run tests with Vitest
- `pnpm build` — Build ESM, CJS, and type declarations

## Template Structure

Each generated library includes:

- `src/` — Source code and tests
- `vite.config.ts` — Vite build config
- `tsconfig.json` — TypeScript config
- `.eslintrc.yml`, `.prettierrc.yml`, `.lintstagedrc.yml` — Linting/formatting configs
- `.husky/` — Git hooks
- `api-extractor.json` — API Extractor config

## Requirements

- Node.js v18+
- [pnpm](https://pnpm.io/) (recommended)

## History

See the history of generated libraries in [create-vite-lib-history](https://github.com/smmoosavi/create-vite-lib-history)
