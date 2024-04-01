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

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Defaults, appropriate for the sensitive Netlify environment
time=""
readonlycache="--readonlycache"
nocachevolume="--nocachevolume"
skipcache=""
minify="--minify"

if [ "${NETLIFY:-}" != "true" ]
then
	# Local or CI - just not Netlify

	# It's useful to see timings on steps
	time="time -p"

	# In CI or locally we want to write to cache files. But per below we only
	# skip initially reading the cache in the case of CI. This is how we detect
	# stale caches.
	readonlycache=""

	if [ "${CI:-}" == "true" ]
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

# Build the docker image as required (it is a no-op if it exists)
bash _scripts/buildDockerImage.bash

# Run the preprocessor
bash _scripts/runPreprocessor.bash execute $readonlycache $nocachevolume $skipcache

# Main site
cd hugo
$time npm ci
$time hugo --cleanDestinationDir $minify $@
