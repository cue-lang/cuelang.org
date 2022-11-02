#!/usr/bin/env bash

set -eux

# build.bash is used by netlify when deploying the site

if [ "$NETLIFY" != "true" ]
then
	echo "Not on Netlify; cowardly refusing to run"
	exit 1
fi

env="production"

# If we are running on netlify (i.e. a deploy) and we are building tip then we
# need to grab the master of our cuelang.org/go and main from
# github.com/cue-sh/playground dependencies
if [ "$BRANCH" = "tip" ]
then
	env="tip"
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
