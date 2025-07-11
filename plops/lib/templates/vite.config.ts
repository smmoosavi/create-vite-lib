/// <reference types="vitest" />
import { resolve } from 'node:path';
import { defineConfig } from 'vite';
import dts from 'vite-plugin-dts';
import packageJson from './package.json';

const dependencies = [
  ...Object.keys(packageJson.dependencies ?? {}),
  ...Object.keys(packageJson.peerDependencies ?? {}),
];

let external = (source: string) =>
  dependencies.some((dep) => source === dep || source.startsWith(dep + '/'));

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [dts({ outDir: resolve(__dirname, './.cache/dts') })],
  test: {
    coverage: {
      reporter: ['clover', 'json', 'lcov', 'text'],
      provider: 'istanbul',
    },
  },
  build: {
    lib: {
      entry: [resolve(__dirname, 'src/index.ts')],
      formats: ['es', 'cjs'],
    },
    rollupOptions: {
      external,
    },
  },
});
