#/usr/bin/env bash

set -eu

go generate ./internal/cmd/preprocessor/cmd
./_scripts/runPreprocessor.bash execute
git add content/**/gen_cache.cue
if git diff --cached --quiet; then
	# we have nothing to do - do not amend the commit
	exit
fi
git commit --amend --no-edit
