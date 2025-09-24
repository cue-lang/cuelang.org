#!/usr/bin/env bash
set -euo pipefail

# cd to the grandparent directory of the script.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../.."

. _scripts/mkdocs-refactor/config.env

: "$mkdocsRoot" # Required.
ppContent="$mkdocsRoot/preprocessor/content"

find "$ppContent" -name 'en.md' -exec sed -i.$$.bak -E \
-e '
    # Transform
    #   {{< relref "#foo" >}}
    # into
    #   #foo
    s/\{\{< *relref *"(#[^"]+)" *>}}/\1/g
' \
    {} +
# Cater for BSD sed, which doesn't allow `-i` without a suffix.
find "$ppContent" -type f -name "*.$$.bak" -delete

_scripts/buildMkDocs.bash
