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

git add . ':^content/**/gen_cache.cue'
git commit --allow-empty --message "tip.cuelang.org: site changes for $headShortRef" --trailer "Preprocessor-No-Write-Cache:true"
git add .
git commit --allow-empty --message "tip.cuelang.org: cache files for $headShortRef"

# A --force push is required because there's no automated *and meaningful* path
# between the current state of the tip branch and the state we wish to push.
# We don't lose any information by force pushing to this branch, whose only
# purpose is to communicate the state that needs to be deployed and to act as a
# trigger for the build inside Netlify.
git push --force "$gitRemote" HEAD:tip
