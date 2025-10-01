#!/usr/bin/env bash
set -euo pipefail

# buildMkDocs.bash runs the preprocessor in MkDocs mode to build the
# contents of mkdocs/preprocessor/ into mkdocs/source/, and then uses
# MkDocs to build the preprocessor's output into hugo/static/mkdocs/.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

_scripts/runPreprocessor.bash execute \
    --dir mkdocs/preprocessor/ \
    --mkdocs-output mkdocs/source/ \
|| echo "FIXME: Preprocessor failure masked."

# Workaround for https://cuelang.org/issue/4044
rsync -a mkdocs/static/ mkdocs/source/
# Workaround for https://cuelang.org/issue/4114
rsync -a mkdocs/source/content/ mkdocs/source/
rm -vrf mkdocs/source/content/

mkdocs build --config-file mkdocs/config.yml
