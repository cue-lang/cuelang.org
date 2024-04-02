#!/usr/bin/env bash

set -eux

# build.bash is used to build the site ready for deploy.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Defaults, appropriate for the sensitive Netlify environment
time=""
readonlycache="--readonlycache"
nocachevolume="--nocachevolume"
skipcache=""
minify="--minify"

if [[ "${NETLIFY:-}" != "true" ]]
then
	# Local or CI - just not Netlify

	# It's useful to see timings on steps
	time="time -p"

	# In CI or locally we want to write to cache files. But per below we only
	# skip initially reading the cache in the case of CI. This is how we detect
	# stale caches.
	readonlycache=""

	if [[ "${CI:-}" == "true" ]]
	then
		# See comment above for readonlycache
		skipcache="--skipcache"
	else
		# Locally we don't want to minify the results of Hugo to help make
		# debugging easier
		minify=""

		# We do want to use cache volumes locally... and only locally.
		nocachevolume=""
	fi
fi

# Build playground
bash playground/_scripts/build.bash

# Build the docker image as required (it is a no-op if it exists) but only if
# we are not on Netlify (because if we are we don't have docker and we have
# zero intention of running anything).
if [[ "${NETLIFY:-}" != "true" ]]
then
	bash _scripts/buildDockerImage.bash
fi

# Run the preprocessor
bash _scripts/runPreprocessor.bash execute $readonlycache $nocachevolume $skipcache

# Main site
cd hugo
$time npm ci
$time hugo --cleanDestinationDir $minify $@
