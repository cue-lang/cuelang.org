#/usr/bin/env bash

# cd to the parent directory to that containing the script
command cd "$( command cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

set -eu

git checkout --theirs internal/cmd/preprocessor/cmd/gen_pkghash.go content/**/gen_cache.cue
go generate -x ./internal/cmd/preprocessor/cmd
./_scripts/runPreprocessor.bash execute
git add internal/cmd/preprocessor/cmd/gen_pkghash.go content/**/gen_cache.cue
GIT_EDITOR=true git rebase --continue
