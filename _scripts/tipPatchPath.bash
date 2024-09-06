#!/usr/bin/env bash
set -euo pipefail

# Usage:
#     tipPatchPath.bash
#
# tipPatchPath prints the path of the patch file that makes the repo compatible
# with the tip of cue-lang/cue, relative to the repo root.

echo "internal/patch/tip.diff"
