#!/usr/bin/env bash
set -euo pipefail

# cd to the grandparent directory of the script.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../.."

. _scripts/tmp-mkdocs/config.env

: "$mkdocsRoot" # Required.
ppContent="$mkdocsRoot/preprocessor/content"

find "$ppContent" -name 'en.md' -exec sed -i.$$.bak -E \
-e ' # Handle non-self-closing issue tags pairs.
    s@\{\{< *issue +([0-9]+) *>\}\}(.*)\{\{< */issue *>\}\}@[\2](/issue/\1)@g
' \
-e ' # Handle a single, self-closing issue tag.
    s@\{\{< *issue +([0-9]+) */>\}\}@[issue #\1](/issue/\1)@g
' \
    {} +
# Cater for BSD sed, which doesn't allow `-i` without a suffix.
find "$ppContent" -type f -name "*.$$.bak" -delete

_scripts/buildMkDocs.bash
