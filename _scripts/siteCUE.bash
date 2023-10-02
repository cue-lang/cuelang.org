#!/usr/bin/env bash

# siteCUE.bash is a simple wrapper around runPreprocessor.bash that
# behaves like cmd/cue.
#
#     ./_scripts/siteCUE.bash export -e versions
#
# The one important detail is that if we are running cue cmd (i.e $1 == "cmd")
# then we write a temporary file in the root of the repo so that the _tool.cue
# files can see the result of the evaluation of the entire site, not just what
# is at the root.  This temporary file is removed in a trap in this script.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

files=$( ./_scripts/runPreprocessor.bash execute --ls)

# Unconditionally remove this file if it exists to start with
# as it will interfere with evaluation, parsing etc.
rm -f defresult.cue

if [[ "$1" == "cmd" ]]; then
	trap "rm -f defresult.cue" EXIT
	cue def $files > defresult.cue
fi

cue "$@" $files
