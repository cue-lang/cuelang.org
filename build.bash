#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

time=""
if [ "${NETLIFY:-}" != "true" ]
then
	time="time -p"
fi

# If we are building tip then we need to grab the master of our cuelang.org/go
# and main from github.com/cue-sh/playground dependencies
if [ "${BRANCH:-}" = "tip" ]
then
	GOPROXY=direct $time go get cuelang.org/go@master
	# Now force cuelang.org/go  through the proxy so that the /pkg.go.dev redirect works
	$time go get -d cuelang.org/go@$(go list -m -f={{.Version}} cuelang.org/go)
	$time go mod tidy
	$time go generate ./...
fi

echo $SHELL
# Main site
$time npm ci
$time npm run icons
$time hugo $@
