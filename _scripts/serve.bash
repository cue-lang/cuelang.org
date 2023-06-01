#!/usr/bin/env bash

set -eux

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# Run the preprocess in serve mode which will itself run hugo
source _scripts/runPreprocessor.bash execute --serve --hugo '-D' --hugo '--renderToDisk' "$@"
