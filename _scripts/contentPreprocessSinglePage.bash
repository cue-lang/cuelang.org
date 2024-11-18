#!/usr/bin/env bash
set -euo pipefail

# contentPreprocessSinglePage: invoke the preprocessor on a single page.
#
# This is useful when the site's "infra" dependencies have changed (requiring a
# preprocessor container image rebuild), and you want to test out the
# preprocessor's behaviour without rebuilding the entire site.
# NB This script's use of git-restore probably has wierd corner cases, so
# *don't use this script to automate anything inside CI*. It's only a
# convenience for authors in its current state - hence the "content" filename
# prefix.

# cd to the parent directory to that containing the script.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Invoke the preprocessor on a single page. Capture the exit code so we can
# propagate it from this script.
set +e
_scripts/runPreprocessor.bash execute --update "$1"
R=$?
set -e

# One of the first things the preprocessor does is to remove the files it
# believes it should be able to regenerate inside the hugo/ directory. It still
# does that when processing only a single file, so we must restore everything
# that's been deleted - which will be every HTML page inside hugo/ except the
# target page (which should show up as modified, not deleted).
git restore $(git diff --name-status  | grep '^D[[:space:]]*hugo' | awk '{print $2}')

# Propagate the preprocessor's exit code to the caller.
exit $R
