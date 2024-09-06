#!/usr/bin/env bash
set -euo pipefail

# Usage:
#     tipPatchApply.bash
#
# tipPatchApply applies the patch stored at $patchPath to the current git
# working tree and index. This patch is intended to make the cuelang.org site
# compatible with the tip version of cue-lang/cue.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

patchPath=$(./_scripts/tipPatchPath.bash)

# We must be in a clean state first
if test ! -z "$(git status --porcelain)"
then
	echo "working tree is not porcelain"
	exit 1
fi

# --index: working tree and index must be identical.
git apply --index $patchPath
