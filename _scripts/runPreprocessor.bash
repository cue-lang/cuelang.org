#!/usr/bin/env bash

set -eux

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

GOBIN=$PWD/.gobin go install -trimpath -buildvcs=false ./internal/cmd/preprocessor

# Remove preprocessor and hugo target directories. This ensures we don't leave
# any stale files lying around. Slight hack: only do so if we are running the
# execute command (but not when running with the --serve or --check flags) .
# Note this ties this script to _scripts/serve.bash so if making changes to
# order or args in that script, make changes to the check here.
#
# TODO: make the prepreprocessor smart enough to do this itself.
if [[ "${1:-}" == "execute" && "${2:-}" != "--serve" && "${2:-}" != "--check" ]]; then
	rm -rf _public hugo/content
fi

exec $PWD/.gobin/preprocessor "$@"
