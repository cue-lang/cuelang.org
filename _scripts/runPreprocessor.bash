#!/usr/bin/env bash

set -eu

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# In CI, we set the PREPROCESSOR_NOWRITECACHE env var only under certain
# conditions. See internal/ci/github/trybot.cue for more details. When running
# locally, we set the env var based on whether the HEAD commit contains
# the Preprocessor-No-Write-Cache: true trailer.
#
# But we don't actually mean HEAD. Because if could be that we are in the
# middle of a rebase, and the rebase failed. In which case we need to be
# looking at REBASE_HEAD. So first calculate whether we should be using HEAD
# or REBASE_HEAD.
head=HEAD
if [[ -f .git/rebase-merge/stopped-sha ]]
then
	head=REBASE_HEAD
fi
if [[ "${CI:-}" != "true" ]] && ./_scripts/noWriteCache.bash $head
then
	export PREPROCESSOR_NOWRITECACHE="true"
fi

# Write current commit revision to hugo data file
bash _scripts/gitWriteHash.bash

GOBIN=$PWD/.gobin go install -trimpath -buildvcs=false ./internal/cmd/preprocessor

exec $PWD/.gobin/preprocessor "$@"
