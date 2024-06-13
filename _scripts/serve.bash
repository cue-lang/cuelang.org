#!/usr/bin/env bash

set -eux

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Run the preprocessor once, before starting the server, so that the initial FS
# state observed by Hugo (in hugo/) matches what's in content/.
# This works around the following race condition:
# - make a Hugo-breaking update in content/ that requires an entire
#   preprocessor+server restart, as tracked in https://github.com/cue-lang/cue/issues/3109
# - stop the server
# - fix the issue in content/
# - start the server
# - Hugo processes hugo/ before the preprocessor has updated hugo/ with the fixed content
# - Hugo exits, causing the preprocessor to exit
_scripts/runPreprocessor.bash execute

# Run the preprocess in serve mode which will itself run hugo.
# Do not render to disk, to avoid any removed files lingering
# in local serve mode (hugo does not tidy these with default
# behaviour).
source _scripts/runPreprocessor.bash execute \
    --serve \
    --hugo="--renderToMemory" \
    --hugo='--buildDrafts' \
    --hugo='--navigateToChanged' \
    --debug=hugo \
    "$@"
