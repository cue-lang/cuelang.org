#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

norun="true"
time=""
if [ "${NETLIFY:-}" != "true" ]
then
	time="time -p"
	norun="false"
fi

# Build playground
bash playground/_scripts/build.bash

# Run the preprocessor
go run ./internal/cmd/preprocessor execute --debug --norun=$norun

# Main site
cd hugo
$time npm ci
$time npm run icons
$time hugo $@
