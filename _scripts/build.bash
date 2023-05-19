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
if [ "${CI:-}" == "true" ]; then
	# Preserve the webpack cache if one exists
	hasWebpackCache=false
	if [ -d node_modules/.cache ]; then
		hasWebpackCache=true
		td=$(mktemp -d)
		mv node_modules/.cache $td
	fi
	$time npm ci
	if [ "$hasWebpackCache" == "true" ]; then
		mv $td/.cache node_modules/
	fi
else
	$time npm install
fi
$time npm run icons
$time hugo $@
