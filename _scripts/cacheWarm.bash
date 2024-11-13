#!/usr/bin/env bash
set -euo pipefail

# warmCache.bash warms the CUE module cache with any CUE dependencies, so that
# any credentials used to authenticate to the central registry only need to be
# in scope for the duration of this script.

function cleanup() { rm -rfv "${CUE_CONFIG_DIR}"; }

export CUE_CONFIG_DIR="$(mktemp -d)"
trap cleanup EXIT
echo "$CUELANG_CUE_LOGINS" >"$CUE_CONFIG_DIR/logins.json"
echo $CUELANG_CUE_LOGINS | { md5||md5sum ;}
go run cuelang.org/go/cmd/cue mod tidy --check
