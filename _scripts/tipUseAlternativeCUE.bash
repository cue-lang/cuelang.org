#!/usr/bin/env bash
set -euo pipefail
set -x # 2024-09-18: increase verbosity to help debug CI failures.

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

# The Go module proxy fetches cue-lang/cue from GitHub. Wait for GitHub to know
# about the requested commit before asking the proxy for it, since the proxy
# caches a 404 response for up to 30 minutes.
#
# We ask via gh, which authenticates with GH_TOKEN. That matters because
# api.github.com allows an unauthenticated caller only 60 requests per hour per
# IP, a budget which CI runners sharing an egress IP with other tenants exhaust
# easily.
for i in 1 2 3 4 5; do
	# gh exits non-zero for any HTTP error, so read the status from the response
	# rather than from the exit code: only some statuses are worth retrying.
	status=$(gh api -i --silent "repos/cue-lang/cue/commits/$versionRef" | awk 'NR == 1 {print $2}') || true
	case "$status" in
	200)
		break
		;;
	404 | 422)
		# GitHub does not know the commit yet; 422 is its answer for a
		# well-formed but unknown revision.
		reason="is not available on GitHub (HTTP $status)"
		;;
	5?? | "")
		# GitHub is unwell, or we never got an answer; gh has said why on stderr.
		reason="could not be looked up on GitHub"
		;;
	*)
		# Notably 403 or 429, meaning that we were blocked rather than that the
		# commit is missing. The rate limit is per hour, so waiting will not help.
		echo "tip: GitHub answered HTTP $status for cue-lang/cue@$versionRef" >&2
		exit 1
		;;
	esac
	if [ $i -eq 5 ]; then
		echo "tip: giving up waiting for cue-lang/cue@$versionRef on GitHub after $i attempts" >&2
		exit 1
	fi
	echo "tip: cue-lang/cue@$versionRef $reason, retrying in 30s (attempt $i)" >&2
	sleep 30
done

# Resolve $versionRef to a pseudo-version via GOPROXY. We pin GOPROXY to
# proxy.golang.org so that a failure to resolve the commit does not fall back
# to a direct VCS fetch, which is slow and flaky. The proxy can still return
# a 404 "invalid version" response for a very recently pushed commit it has
# not processed yet (see https://github.com/golang/go/issues/53906), so retry
# a few times with a sleep to give the proxy a chance to catch up.
td=$(mktemp -d)
trap "rm -rf $td" EXIT
pushd $td >/dev/null
go mod init mod.example
export GOPROXY=https://proxy.golang.org
for i in 1 2 3 4 5; do
	if go get cuelang.org/go@$versionRef; then
		break
	fi
	if [ $i -eq 5 ]; then
		echo "tip: giving up on go get cuelang.org/go@$versionRef after $i attempts" >&2
		exit 1
	fi
	echo "tip: go get failed, retrying in 30s (attempt $i)" >&2
	sleep 30
done
version=$(go list -m -f={{.Version}} cuelang.org/go)
popd >/dev/null

echo "tip: Will use cuelang.org/go@$version"

# Override all versions of CUE referenced by the site to be $version.
# This might change if any entries are added to the version matrix that
# deliberately make a previous version of CUE available but, for now, we don't
# need that - and could easily make it configurable later.
go tool cue def \
    -t version="$version" \
    -p site \
    --out cue \
    cue: - <<EOD >tip.cue
_version: _ @tag(version)
versions: cue: [string]: v: _version
EOD
