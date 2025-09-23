#!/usr/bin/env bash
set -euo pipefail

# cd to the grandparent directory of the script.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../.."

. _scripts/tmp-mkdocs/config.env

: "$mkdocsRoot" # Required.
ppContent="$mkdocsRoot/preprocessor/content"

find "$ppContent" -name 'en.md' -exec sed -i.$$.bak -E '
  /^[[:space:]]*\{\{< spotlight >\}\}[[:space:]]*$/d
  /^[[:space:]]*\{\{< \/spotlight >\}\}[[:space:]]*$/d
' {} +
# Cater for BSD sed, which doesn't allow `-i` without a suffix.
find "$ppContent" -type f -name "*.$$.bak" -delete

_scripts/buildMkDocs.bash
