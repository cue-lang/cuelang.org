#!/usr/bin/env bash

## Temporary exploration of the Netlify build context.
### This is safe to remove at any time.
set +u
if [[ "$NETLIFY" = "true" ]]; then
    printf 'env: CONTEXT: "%s"\n'          "$CONTEXT" >&2
    printf 'env: BRANCH: "%s"\n'           "$BRANCH" >&2
    printf 'env: HEAD: "%s"\n'             "$HEAD" >&2
    printf 'env: URL: "%s"\n'              "$URL" >&2
    printf 'env: DEPLOY_URL: "%s"\n'       "$DEPLOY_URL" >&2
    printf 'env: DEPLOY_PRIME_URL: "%s"\n' "$DEPLOY_PRIME_URL" >&2
    printf 'env: SITE_NAME: "%s"\n'        "$SITE_NAME" >&2
fi
## End of build context exploration.

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
	# We set GOPRIVATE here because we reguarly see issues when trying to go get
	# a recent commit that index.golang.org might not yet have seen.
	GOPRIVATE=cuelang.org/go $time go get cuelang.org/go@master

	# Now force cuelang.org/go  through the proxy so that the /pkg.go.dev redirect works
	$time go get -d cuelang.org/go@$(go list -m -f={{.Version}} cuelang.org/go)
	$time go mod tidy
	$time go generate ./...
fi

# Main site
$time git submodule update -f --init --recursive
$time npm install
$time hugo $@

# CUE playground
bash play/build.bash
