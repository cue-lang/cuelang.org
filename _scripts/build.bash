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
bash _scripts/runPreprocessor.bash execute --debug=all,-cache --norun=$norun $skipcache

# Main site
cd hugo
$time npm ci
$time hugo --cleanDestinationDir $minify $@
