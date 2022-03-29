# create-vite-lib

create lib with vite

## Features

- Setup vite for esm and cjs
- Setup husky, lint-staged, prettier, eslint, jest, typescript
- Generate a single index.d.ts file
- Two template files: pure and react

## Usage

```
$ pnpm dlx create-vite-lib
? [PLOP] Please choose a generator. lib
? lib name please my-lib
? description please the best lib ever
✔  +! 15 files added
 -> /my-lib/.eslintrc.yml
 -> /my-lib/.lintstagedrc.yml
 -> /my-lib/.prettierignore
 -> /my-lib/.prettierrc.yml
 -> /my-lib/api-extractor.json
 -> /my-lib/index.d.ts
 -> /my-lib/jest.config.js
 -> /my-lib/package.json
 -> /my-lib/tsconfig.json
 -> /my-lib/vite.config.ts
 -> /my-lib/.gitignore
 -> /my-lib/.husky/pre-commit
 -> /my-lib/src/index.ts
 -> /my-lib/src/my-lib.test.ts
 -> /my-lib/src/my-lib.ts
✔  ->

Done. Now run:

  cd my-lib
  git init; git add .; git commit -m "initial commit"
  pnpm install
  pnpm build

```

## Scripts

- format: run prettier
- test: run tests
- build: build production builds
- lint: run eslint

[Pure ESM](https://gist.github.com/sindresorhus/a39789f98801d908bbc7ff3ecc99d99c)