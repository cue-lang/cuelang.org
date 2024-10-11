#!/usr/bin/env bash

set -eu

# When bumping this version, don't forget to grep the repo for "staticcheck ..."
# and to sed the upgrade of the hard-coded checks that are tested for by
# _scripts/checkContent.bash.
go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 $(go list ./... |
	grep -v github.com/cue-lang/cuelang.org/playground/internal/cuelang_org_go_internal |
	grep -v github.com/cue-lang/cuelang.org/internal/parse
)
