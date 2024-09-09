#!/usr/bin/env bash
set -euo pipefail

# Usage:
#     tipPatchApply.bash [CUE_COMMIT_REF]
#
# tipPatchApply updates the working tree to be based on a specific version of
# CUE (likely the tip of cue-lang/cue).
# It first moves to a detached HEAD state and applies the diff found in
# $patchPath.
# Then the version of CUE available via cuelang.org/go@$CUE_COMMIT_REF is
# resolved, and the site configuration is overridden so that this version takes
# the place of all named CUEs (currently "latest", "prerelease", "tip" and
# "default").
# CUE_COMMIT_REF defaults to "master", so that invoking the script with no
# arguments will use the tip of cue-lang/cue.

versionRef=${1:-master}

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

# Apply the tip patch.
patchPath="$(_scripts/tipPatchPath.bash)"
git apply --index "$patchPath"

# Resolve $versionRef to a pseudo-version. Notice this intentionally honours
# GOPROXY rather that setting a specific value in the script, allowing the
# setting to be varied externally by the caller.
td=$(mktemp -d)
trap "rm -rf $td" EXIT
pushd $td > /dev/null
go mod init mod.example &> /dev/null
go get cuelang.org/go@$versionRef &> /dev/null
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
