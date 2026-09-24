# create-vite-lib

A modern CLI tool to scaffold TypeScript libraries powered by [Vite](https://vitejs.dev/).

## Features

- **Vite-powered builds**: Produces an ESM library bundle.
- **TypeScript**: Strict, modern configuration.
- **Testing**: [Vitest](https://vitest.dev/) and [@testing-library](https://testing-library.com/) ready.
- **Linting & Formatting**: Pre-configured [Oxlint](https://oxc.rs/docs/guide/usage/linter.html), [Prettier](https://prettier.io/), and [lint-staged](https://github.com/okonet/lint-staged).
- **Git Hooks**: [Husky](https://typicode.github.io/husky/) for pre-commit checks.
- **Single type declaration**: Generates a single `index.d.ts` via [API Extractor](https://api-extractor.com/).
- **Templates**: Choose between a pure TypeScript or React TypeScript library template.
- **Zero-config publishing**: Ready for npm publish out of the box.

## Quick Start

```sh
pnpm dlx create-vite-lib
```

Follow the prompts to select a template and name your library.

Example:

```sh
? [PLOP] Please choose a generator. (Use arrow keys)
❯ lib
  react-lib
? lib name please my-lib
✔  +! 13 files added
 -> /my-lib/.oxlintrc.json
 -> /my-lib/.lintstagedrc.yml
 -> /my-lib/.prettierignore
 -> /my-lib/.prettierrc.yml
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
- `pnpm lint` — Lint code with Oxlint
- `pnpm test` — Run tests with Vitest
- `pnpm type:check` — Type-check with TypeScript
- `pnpm check` — Check formatting, lint, types, and tests
- `pnpm build` — Build the ESM production bundle and root declaration

## Template Structure

Each generated library includes:

- `src/` — Source code and tests
- `vite.config.ts` — Vite build config
- `tsconfig.json` — TypeScript config
- `.oxlintrc.json`, `.prettierrc.yml`, `.lintstagedrc.yml` — Linting/formatting configs
- `.husky/` — Git hooks
- `index.d.ts` — Bundled public type declaration

## Requirements

- Node.js v22.22.2+
- [pnpm](https://pnpm.io/) (recommended)

## History

See the history of generated libraries in [create-vite-lib-history](https://github.com/smmoosavi/create-vite-lib-history)
