#!/usr/bin/env bash
set -euo pipefail

# Usage:
#     tipPatchGenerate.bash
#
# tipPatchGenerate takes the current state of the working tree and stores its
# diff against HEAD at $patchPath. This is intended to ease the ongoing,
# repeated generation of the patch that makes the repo compatible with the tip
# of cue-lang/cue.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

patchPath="$(./_scripts/tipPatchPath.bash)"

# tipPatchApply.bash applies the patch with "git apply", which strips the a/
# and b/ path prefixes, so write them regardless of the user's diff.noprefix
# setting. ":^x" excludes changes to "x" from the diff.
git diff --src-prefix=a/ --dst-prefix=b/ HEAD -- . ":^$patchPath" >"$patchPath"
