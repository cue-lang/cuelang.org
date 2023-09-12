#!/usr/bin/env bash

set -eux

# ignoreBuild.bash is a script that runs as part of the Netlify deploy step
# (configured in netlify.toml via internal/ci/netlify) that determines whether
# a given commit should be deployed or not.

# The script follows the logic requirements described in
#
# https://docs.netlify.com/configure-builds/ignore-builds/
#
# That is it must exit 1 if the commit should be deployed, i.e. not ignored,
# and exit 0 in case the commit should be ignored, i.e. not deployed.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# If the HEAD commit contains the Preprocessor-No-Write-Cache: trailer, we want
# to skip the build/deploy. Cache files will likely be stale in this situation
# which will cause the deploy to fail in any case.
if _scripts/noWriteCache.bash; then
	exit 0
fi

# Fall through to the default Netlify logic documented in the above page:
git diff --quiet $CACHED_COMMIT_REF $COMMIT_REF
