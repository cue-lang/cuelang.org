#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

time=""
if [ "${NETLIFY:-}" != "true" ]
then
	time="time -p"
fi

# Build editor
bash editor/build.bash

# Main site
cd hugo
$time npm ci
$time npm run icons
$time hugo $@
