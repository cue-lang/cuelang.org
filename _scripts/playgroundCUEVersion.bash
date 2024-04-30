#!/usr/bin/env bash

set -eu

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

go run cuelang.org/go/cmd/cue export --out text -e versions.cue.playground.v
