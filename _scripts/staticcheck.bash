#!/usr/bin/env bash

set -eu

go run honnef.co/go/tools/cmd/staticcheck@v0.5.0 $(go list ./... |
	grep -v github.com/cue-lang/cuelang.org/playground/internal/cuelang_org_go_internal |
	grep -v github.com/cue-lang/cuelang.org/internal/parse
)
