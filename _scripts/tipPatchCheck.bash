#!/usr/bin/env bash
set -euo pipefail

# Usage:
#     tipPatchCheck.bash
#
# tipPatchCheck validates that the patch stored at $patchPath can be
# successfully applied to the current working tree and git index state.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

patchPath=$(./_scripts/tipPatchPath.bash)

# We must be in a clean state first
if test ! -z "$(git status --porcelain)"
then
	echo "working tree is not porcelain"
	exit 1
fi

# --check: dry-run mode.
# --index: working tree and index must be identical.
git apply --check --index $patchPath
