#!/usr/bin/env node
import { dirname, join } from "node:path";
import { fileURLToPath } from "node:url";
import { Plop, run } from "plop";
import minimist from "minimist";

const args = process.argv.slice(2);
const argv = minimist(args);
const __dirname = dirname(fileURLToPath(import.meta.url));

Plop.prepare(
  {
    cwd: argv.cwd,
    configPath: join(__dirname, "plopfile.js"),
    preload: argv.preload || [],
    completion: argv.completion
  },
  (env) => {
    const options = {
      ...env,
      dest: process.cwd(),
    };
    return Plop.execute(options, run);
  }
);
