#!/usr/bin/env bash

set -eu

# usePlayVersion ensures that the playground go.mod reflects the site-level
# version of CUE intended to be used by the playground.

rootDir="$(git rev-parse --show-toplevel)"

# Start this work within the playground
cd "$rootDir/playground"

playVersion="$(../_scripts/playgroundCUEVersion.bash)"
go mod edit -require cuelang.org/go@$playVersion

go mod tidy
