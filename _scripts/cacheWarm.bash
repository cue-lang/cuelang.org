#!/usr/bin/env bash
set -euo pipefail

# warmCache.bash warms the CUE module cache with any CUE dependencies, so that
# any credentials used to authenticate to the central registry only need to be
# in scope for the duration of this script.

function cleanup() { rm -rfv "${CUE_CONFIG_DIR}"; }

export CUE_CONFIG_DIR="$(mktemp -d)"
trap cleanup EXIT
go tool cue login --token $CUE_TOKEN
go tool cue mod tidy --check
