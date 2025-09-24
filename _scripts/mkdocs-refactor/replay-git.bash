#!/usr/bin/env bash
set -euo pipefail

# cd to the grandparent directory of the script.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../.."

possibleScript="_scripts/$(git log -1 --pretty=%s | awk "{print \$NF}")"
if test -x "$possibleScript"
then
    # Move the repo back to the state before the current commit, except for the _scripts dir.
    git restore --source=HEAD^ -- . ':(exclude)_scripts/'

    # Invoke the not-rolled-back script.
    "$possibleScript"

fi
