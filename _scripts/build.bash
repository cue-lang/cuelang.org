#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

run="false"
time=""
if [ "${NETLIFY:-}" != "true" ]
then
	time="time -p"
	run="true"
fi

# Build playground
bash playground/_scripts/build.bash

# Run the preprocessor
go run ./internal/cmd/preprocessor execute --debug --run=$run

# Main site
cd hugo
$time npm ci
$time npm run icons
$time hugo $@
