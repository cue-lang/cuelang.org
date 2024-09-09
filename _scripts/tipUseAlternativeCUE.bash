#!/usr/bin/env bash
set -euo pipefail

# Usage:
#     tipUseAlternativeCUE.bash [CUE_COMMIT_REF]
#
# tipUseAlternativeCUE resolves the version of CUE available via
# cuelang.org/go@$CUE_COMMIT_REF and overrides the site configuration so that
# this version takes the place of all named CUEs (currently only "latest" and
# "prerelease" are directly overridden, with their versions transitively
# dictating those used by "tip", "default", and "playground"). CUE_COMMIT_REF
# defaults to "master", so that invoking the script with no arguments will use
# the tip of cue-lang/cue.

versionRef=${1:-master}

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Resolve $versionRef to a pseudo-version. Notice this intentionally honours
# GOPROXY rather that setting a specific value in the script, allowing the
# setting to be controlled by this script's invocation.
td=$(mktemp -d)
trap "rm -rf $td" EXIT
pushd $td > /dev/null
go mod init mod.example &> /dev/null
go get cuelang.org/go@$versionRef &> /dev/null
version=$(go list -m -f={{.Version}} cuelang.org/go)
popd > /dev/null

echo "Will use cuelang.org/go@$version"

# Override all versions of CUE referenced by the site to be $version.
# This might change if any entries are added to the version matrix that
# deliberately make a previous version of CUE available but, for now, we don't
# need that - and could easily make it configurable later.
go run cuelang.org/go/cmd/cue def \
    -t version="$version" \
    -p site \
    --out cue \
    cue: - <<EOD >tip.cue
_version: _ @tag(version)
versions: cue: [string]: v: _version
EOD
