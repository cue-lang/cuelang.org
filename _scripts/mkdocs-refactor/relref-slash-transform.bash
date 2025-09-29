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
    #   {{< relref "/foo/bar" >}}
    # into
    #   /foo/bar
    #
    # We know that there are no cases where the first path component of such an absolute
    # relref link is "docs" because they were updated by a previous commit; hence we do
    # not have to exclude them.
    s@\{\{< *relref *"(/[^"]+)" *>\}\}@\1@g
' \
    {} +
# Cater for BSD sed, which doesn't allow `-i` without a suffix.
find "$ppContent" -type f -name "*.$$.bak" -delete

_scripts/buildMkDocs.bash
