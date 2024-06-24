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

	# Default to skipping the reading of a cache unless we are told otherwise
	# safe not to do so.
	skipcache="--skipcache"

	if [[ "${CI:-}" == "true" && "${CI_NO_SKIP_CACHE:-}" == "true" ]]; then
		# Safe to read from the cache when we are told it's safe to do so in CI
		skipcache=""

		# But as a means of helping to flush out changes to a piece of content
		# that are not reproducible, we remove an gen_cache.cue files that
		# changed as part of this commit. If the associated content is
		# reproducible then these files will be recreated and we will have a
		# clean commit at the end of the process.
		for i in $(git show --pretty="" --name-only HEAD); do
			if [[ "$(basename "$i")" == "gen_cache.cue" ]]; then
				# We force here because the gen_cache.cue file in question might
				# have been removed as part of this commit. We just know the file
				# changed.
				rm -f $i
			fi
		done
	fi

	if [[ "${CI:-}" != "true" ]]; then
		# Safe to read from the cache locally too.
		skipcache=""

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
