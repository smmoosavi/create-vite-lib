# create-vite-lib

create lib with vite

## Usage

```
$ pnpm create vite-lib
? [PLOP] Please choose a generator. lib
? lib name please my-lib
? description please the best lib ever
✔  +! 14 files added
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

$ cd my-lib
$ git init; git add --all; git commit -m 'init my-lib'
$ pnpm install
```

## Scripts

- format: run prettier
- test: run tests
- build: build production builds
