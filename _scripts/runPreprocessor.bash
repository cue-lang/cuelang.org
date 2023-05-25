#!/usr/bin/env bash

set -eux

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

GOBIN=$PWD/.gobin go install -trimpath -buildvcs=false ./internal/cmd/preprocessor
$PWD/.gobin/preprocessor "$@"
