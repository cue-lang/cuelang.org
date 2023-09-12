#!/usr/bin/env bash

# ignoreBuild.bash is a script that runs as part of the Netlify deploy step
# (configured in netlify.toml via internal/ci/netlify) that determines whether
# a given commit should be deployed or not.

# The script follows the logic requirements described in
#
# https://app.netlify.com/sites/cue/deploys/6500486782a4de0008f01c3a
#
# That is it must exit 1 if the commit should be deployed, i.e. not ignored,
# and exit 0 in case the commit should be ignored, i.e. not deployed.

# If the HEAD commit contains PREPROCESSOR-NO-WRITE-CACHE, we want to skip the
# build/deploy. Cache files will likely be stale in this situation which will
# cause the deploy to fail in any case.
if git log --format=%b -1 HEAD | grep -q ^PREPROCESSOR-NO-WRITE-CACHE$; then
	exit 0
fi

# Fall through to the default Netlify logic documented in the above page:
git diff --quiet $CACHED_COMMIT_REF $COMMIT_REF
