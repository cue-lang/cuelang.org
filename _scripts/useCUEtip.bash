#!/usr/bin/env bash

set -eu

# Usage:
#
#     useCUEtip.bash [TIP_BRANCH_REF] [CUE_COMMIT_REF]
#
# useCUEtip updates the working tree to be based on the tip of CUE. It first
# moves to a detached HEAD state, then cherry-picks the changes from
# TIP_BRANCH_REF (defaults to origin/tip if not provided as an argument). The
# the site configuration is overridden to use CUE_COMMIT_REF (or master as a
# default if not provided as an argument) as the CUE version we should use.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# We must be in a clean state first
if test ! -z "$(git status --porcelain)"
then
	echo "working tree is not porcelain"
	exit 1
fi

# Move to detached head state
git checkout $(git rev-parse HEAD)

# cherry-pick tip commits
tipbranch=${1:-origin/tip}
git cherry-pick $tipbranch

versionref=${2:-master}

# Resolve $versionref to a pseudo-version. Notice this intentionally honours
# GOPROXY rather that setting a specific value in the script.
td=$(mktemp -d)
trap "rm -rf $td" EXIT
pushd $td > /dev/null
go mod init mod.example &> /dev/null
go get cuelang.org/go@$versionref &> /dev/null
version=$(go list -m -f={{.Version}} cuelang.org/go)
popd > /dev/null

echo "Will use cuelang.org/go@$version"

# For now we want to override all versions to use the tip of CUE.
# This might change in case one entry in the version matrix is
# deliberately used to "hold back" to a previous version. For now
# we don't need that, and could easily make it configurable later.
cue def -t version="$version" -p site --out cue cue: - <<EOD > tip.cue
_version: _ @tag(version)
versions: cue: [string]: v: _version
EOD
