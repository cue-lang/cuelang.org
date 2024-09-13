#!/usr/bin/env bash
set -euxo pipefail

# ignoreBuild.bash runs as part of the Netlify deploy step (configured in
# netlify.toml via internal/ci/netlify) and determines whether a given commit
# should be deployed or not.
#
# It must exit 1 if the commit should be deployed (i.e. commit /not/ ignored)
# and exit 0 if the commit should not be deployed (i.e. commit ignored).
#
# These logic requirements are described in
# https://docs.netlify.com/configure-builds/ignore-builds/.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# If the HEAD commit contains the Preprocessor-No-Write-Cache: trailer, we want
# to skip the build/deploy. Cache files will likely be stale in this situation
# which will cause the deploy to fail in any case.
if _scripts/noWriteCache.bash; then
	exit 0
fi

# Deploy by default
exit 1
