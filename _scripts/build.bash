#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

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
bash _scripts/runPreprocessor.bash execute --debug --norun=$norun

# Main site
cd hugo
$time npm ci
$time npm run icons
$time hugo $@
