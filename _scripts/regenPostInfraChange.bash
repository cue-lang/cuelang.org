#!/usr/bin/env bash

set -eu

# This convenience script is run post a change in one of the "infra" inputs to
# a guide output. i.e. the Dockerfile (or anything that contributes to that),
# the preprocessor etc.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Generate
go generate ./...
pushd playground > /dev/null
go generate ./...
popd > /dev/null

./_scripts/buildDockerImage.bash
CUE_UPDATE=1 go test -run TestScripts/execute_multistagescript ./internal/cmd/preprocessor/cmd

# Test
go test ./...
pushd playground > /dev/null
go test ./...
popd > /dev/null

./_scripts/runPreprocessor.bash execute --update
