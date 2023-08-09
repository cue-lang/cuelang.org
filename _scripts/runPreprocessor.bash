#!/usr/bin/env bash

set -eux

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# In CI, we set the PREPROCESSOR_NOWRITECACHE env var only under certain
# conditions. See internal/ci/github/trybot.cue for more details. When running
# locally, we set the env var based on whether the HEAD commit contains
# PREPROCESSOR-NO-WRITE-CACHE on a clear line.
if [ "${CI:-}" != "true" ] && git log --format=%b -1 HEAD | grep -q PREPROCESSOR-NO-WRITE-CACHE
then
	export PREPROCESSOR_NOWRITECACHE="true"
fi

GOBIN=$PWD/.gobin go install -trimpath -buildvcs=false ./internal/cmd/preprocessor
exec $PWD/.gobin/preprocessor "$@"
