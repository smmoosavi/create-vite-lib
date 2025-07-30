#!/bin/bash
set -e

export NAME="my-lib"
export TEMPLATE="lib"

./tests/test.sh "$@"
