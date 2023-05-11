#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

time=""
if [ "${NETLIFY:-}" != "true" ]
then
	time="time -p"
fi

# Build playground
bash playground/_scripts/build.bash

# Run the preprocessor
go run github.com/cue-lang/cuelang.org/internal/cmd/preprocessor execute --debug

# Main site
cd hugo
$time npm ci
$time npm run icons
$time hugo $@
