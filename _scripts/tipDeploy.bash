#!/usr/bin/env bash
set -euo pipefail

# Usage:
#     tipDeploy.bash <git-user-name> <git-user-email>
#
# tipDeploy commits the current state of the working tree and force-pushes it
# to the "tip" branch, which triggers a build-and-deploy of tip.cuelang.org
# inside Netlify.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

headShortRef=$(git rev-parse --short HEAD)
gitUserName="$1"
gitUserEmail="$2"
gitRemote="${3:-origin}"

git config user.name  "$gitUserName"
git config user.email "$gitUserEmail"

git add --verbose . ':^content/**/gen_cache.cue'
git commit --verbose --allow-empty --message "tip.cuelang.org: site changes for $headShortRef" --trailer "Preprocessor-No-Write-Cache:true"
git add --verbose .
git commit --verbose --allow-empty --message "tip.cuelang.org: cache files for $headShortRef"

# Ensure we have the latest view of upstream branches, to reduce the window
# during which we might see force-push-to-tip errors like
# https://github.com/cue-lang/cuelang.org/actions/runs/11915828092/job/33207028909#step:53:293
git fetch "$gitRemote"

# A --force push is required because there's no automated *and meaningful* path
# between the current state of the tip branch and the state we wish to push.
# We don't lose any information by force pushing to this branch, whose only
# purpose is to communicate the state that needs to be deployed and to act as a
# trigger for the build inside Netlify.
git push --verbose --force "$gitRemote" HEAD:tip
