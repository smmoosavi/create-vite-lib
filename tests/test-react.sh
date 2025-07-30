#!/bin/bash
set -e

export NAME="my-react-lib"
export TEMPLATE="react-lib"

./tests/test.sh "$@"
