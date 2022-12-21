#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

# If we are building tip then we need to grab the master of our cuelang.org/go
# and main from github.com/cue-sh/playground dependencies
if [ "${BRANCH:-}" = "tip" ]
then
	GOPROXY=direct go get cuelang.org/go@master
	# Now force cuelang.org/go  through the proxy so that the /pkg.go.dev redirect works
	go get -d cuelang.org/go@$(go list -m -f={{.Version}} cuelang.org/go)
	go mod tidy
	go generate ./...
fi

# Main site
git submodule update -f --init --recursive
npm install
hugo $@

# CUE playground
bash play/build.bash
