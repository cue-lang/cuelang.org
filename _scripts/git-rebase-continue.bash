#/usr/bin/env bash

# cd to the parent directory to that containing the script
command cd "$( command cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

set -eu

git restore --theirs content/**/gen_cache.cue
go generate -x ./internal/cmd/preprocessor/cmd
./_scripts/runPreprocessor.bash execute
git add content/**/gen_cache.cue
GIT_EDITOR=true git rebase --continue
