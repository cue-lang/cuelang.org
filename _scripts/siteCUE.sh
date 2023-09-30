#!/usr/bin/env bash

# siteCUE.bash is a simple wrapper around runPreprocessor.bash that
# behaves like cmd/cue.
#
#     ./_scripts/siteCUE.bash export -e versions

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

./_scripts/runPreprocessor.bash execute --ls | xargs cue "$@"
