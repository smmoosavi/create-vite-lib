#!/bin/bash
set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo_title() {
  local msg=" $1 "
  local len=${#msg}
  local border_top="┏"
  local border_mid="┃"
  local border_bot="┗"
  for ((i = 0; i < len; i++)); do
    border_top+="━"
    border_bot+="━"
  done
  border_top+="┓"
  border_bot+="┛"
  echo
  echo -e " $border_top"
  echo -e " $border_mid$msg$border_mid"
  echo -e " $border_bot"
  echo
}

REPO_PATH=$(cd "${1:-$(pwd)}" && pwd)
TEST_DIR="/tmp/create-vite-lib-e2e"
PACK_DIR="$TEST_DIR/packages"
LIB_DIR="$TEST_DIR/my-lib"
REACT_LIB_DIR="$TEST_DIR/my-react-lib"
SAMPLE_DIR="$TEST_DIR/sample-app"

rm -rf "$TEST_DIR"
mkdir -p "$PACK_DIR"

echo_title "Generating libraries"
cd "$TEST_DIR"
CI=1 "$REPO_PATH/index.js" lib my-lib
CI=1 "$REPO_PATH/index.js" react-lib my-react-lib

echo_title "Building and packing libraries"
for library_dir in "$LIB_DIR" "$REACT_LIB_DIR"; do
  cd "$library_dir"
  pnpm install
  pnpm check
  pnpm build
  pnpm pack --pack-destination "$PACK_DIR"
done

LIB_PACKAGE="$PACK_DIR/my-lib-0.1.0.tgz"
REACT_LIB_PACKAGE="$PACK_DIR/my-react-lib-0.1.0.tgz"

if [[ ! -f "$LIB_PACKAGE" || ! -f "$REACT_LIB_PACKAGE" ]]; then
  echo -e "${RED}Expected package tarballs were not created.${NC}"
  exit 1
fi

echo_title "Creating consumer project"
mkdir -p "$SAMPLE_DIR/src"
cd "$SAMPLE_DIR"
cat >package.json <<'EOF'
{
  "name": "sample-app",
  "private": true,
  "version": "0.0.0",
  "type": "module",
  "scripts": {
    "build": "tsc --noEmit && vite build"
  },
  "dependencies": {
    "@types/react": "^19",
    "@types/react-dom": "^19",
    "@vitejs/plugin-react": "^6",
    "react": "^19",
    "react-dom": "^19",
    "typescript": "^6",
    "vite": "^8"
  }
}
EOF

cat >tsconfig.json <<'EOF'
{
  "compilerOptions": {
    "target": "ES2022",
    "lib": ["ES2022", "DOM", "DOM.Iterable"],
    "module": "ESNext",
    "moduleResolution": "bundler",
    "jsx": "react-jsx",
    "strict": true,
    "skipLibCheck": false,
    "noEmit": true
  },
  "include": ["src"]
}
EOF

cat >index.html <<'EOF'
<div id="root"></div>
<script type="module" src="/src/main.tsx"></script>
EOF

cat >src/main.tsx <<'EOF'
import { StrictMode } from 'react';
import { createRoot } from 'react-dom/client';
import App from './App';

createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <App />
  </StrictMode>,
);
EOF

pnpm install
pnpm add "$LIB_PACKAGE" "$REACT_LIB_PACKAGE"

cat >src/App.tsx <<'EOF'
import { myLib } from 'my-lib';
import { MyReactLib } from 'my-react-lib';

export default function App() {
  return (
    <main>
      <h1>{myLib()}</h1>
      <MyReactLib>consumer content</MyReactLib>
    </main>
  );
}
EOF

echo_title "Checking installed packages"
node --input-type=module <<'EOF'
import { myLib } from 'my-lib';
import { MyReactLib } from 'my-react-lib';

if (myLib() !== 'my-lib') {
  throw new Error('my-lib returned an unexpected value');
}

if (MyReactLib({ children: 'consumer content' }).type !== 'span') {
  throw new Error('my-react-lib returned an unexpected React element');
}
EOF

pnpm build

echo -e "${GREEN}"
echo_title "End-to-end package test passed"
echo -e "${NC}"
