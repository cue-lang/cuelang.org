#/usr/bin/env bash

set -eu

go generate ./internal/cmd/preprocessor/cmd
./_scripts/runPreprocessor.bash execute
git add internal/cmd/preprocessor/cmd/gen_pkghash.go content/**/gen_cache.cue
if [[ "$(git status --porcelain)" == "" ]]
then
	# we have nothing to do - do not amend the commit
	exit
fi
git commit --amend --no-edit
