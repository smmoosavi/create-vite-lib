#!/bin/bash
set -e


# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


# assert NAME and TEMPLATE are set in env
if [ -z "$NAME" ]; then
  echo "${RED}Error: NAME is not set!${NC}"
  exit 1
fi

if [ -z "$TEMPLATE" ]; then
  echo "${RED}Error: TEMPLATE is not set!${NC}"
  exit 1
fi


# Function to print section titles
echo_title() {
    local msg=" $1 "
    local len=${#msg}
    local border_top="┏"
    local border_mid="┃"
    local border_bot="┗"
    for ((i=0; i<$len; i++)); do border_top+="━"; border_bot+="━"; done
    border_top+="┓"
    border_bot+="┛"
    echo
    echo
    echo -e " $border_top"
    echo -e " $border_mid$msg$border_mid"
    echo -e " $border_bot"
    echo
}

# Get the repository path (default to current directory)
REPO_PATH=${1:-$(pwd)}
echo "Using repository path: $REPO_PATH"

echo_title "Starting 'create-vite-lib $TEMPLATE' tests..."

TEST_DIR="/tmp/create-vite-lib-tests"
mkdir -p "$TEST_DIR"

cd "$TEST_DIR"
rm -rf "$TEST_DIR/$NAME"


echo_title "Creating a new Vite library project..."

"$REPO_PATH/index.js" "$TEMPLATE" "$NAME"

echo_title "Commiting initial files..."
cd "$NAME"
git init
git config --local user.email "test@example.com"
git config --local user.name "Test User"
git config --local init.defaultBranch main
git add .
git commit -m "initial commit"

echo_title "Installing dependencies..."

pnpm install

echo_title "Commiting dependencies..."
git add .; git commit -m "install dependencies"

echo_title "Formatting the code..."

pnpm format
git diff --exit-code || {
  echo -e "${RED}Git diff is not empty after formatting!${NC}"
  exit 1
}

echo_title "Running linter..."

pnpm lint

echo_title "Running tests..."

pnpm test

echo_title "Building the library..."
pnpm build

git diff --exit-code || {
  echo -e "${RED}Git diff is not empty after build!${NC}"
  exit 1
}


echo_title "Checking outdated packages..."

pnpm outdated || true

echo -e "${GREEN}"
echo_title "All tests passed successfully!"
echo -e "${NC}"
