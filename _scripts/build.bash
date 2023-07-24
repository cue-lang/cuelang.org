#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

skipcache=""
norun="true"
time=""
minify="--minify"
if [ "${NETLIFY:-}" != "true" ]
then
	time="time -p"
	norun="false"
	minify=""
	if [ "${CI:-}" == "true" ]
	then
		skipcache="--skipcache=true"
	fi
fi

# Build playground
bash playground/_scripts/build.bash

# Run the preprocessor
bash _scripts/runPreprocessor.bash execute --debug=all --norun=$norun $skipcache

# Main site
cd hugo
$time npm ci
$time hugo --cleanDestinationDir $minify $@
