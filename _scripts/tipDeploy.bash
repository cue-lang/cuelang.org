#!/usr/bin/env bash
set -euo pipefail

# Usage:
#     tipDeploy.bash
#
# tipDeploy commits the current state of the working tree and force-pushes it
# to the "tip" branch, which triggers a build-and-deploy of tip.cuelang.org
# inside Netlify.

# cd to the parent directory to that containing the script
cd "$( dirname "${BASH_SOURCE[0]}" )"
cd ..

headShortRef=$(git rev-parse --short HEAD)

git add content/**/gen_cache.cue
git commit --allow-empty --message "tip.cuelang.org: $headShortRef: cache files"
git add .
git commit --allow-empty --message "tip.cuelang.org: $headShortRef: source files"

git push origin HEAD:tip
