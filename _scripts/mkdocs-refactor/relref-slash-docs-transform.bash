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
    #   {{< relref "/docs/foo" >}}
    # into
    #   {{< relref "docs/foo" >}}
    # ... so that it can be handled later, alongside existing non-absolute docs relref arguments.
    s@\{\{< *relref *"/docs/([^"]+)" *>\}\}@\{\{< relref "docs/\1" >\}\}@g

    # Special case: the literal "/docs" and "/docs/" strings.
    s@\{\{< *relref *"/docs/?" *>\}\}@\{\{< relref "docs" >\}\}@g
' \
    {} +
# Cater for BSD sed, which doesn't allow `-i` without a suffix.
find "$ppContent" -type f -name "*.$$.bak" -delete

_scripts/buildMkDocs.bash
