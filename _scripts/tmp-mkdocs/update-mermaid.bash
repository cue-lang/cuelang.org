#!/usr/bin/env bash
set -euo pipefail

# cd to the grandparent directory of the script.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../.."

. _scripts/tmp-mkdocs/config.env

: "$mkdocsRoot" # Required.
ppContent="$mkdocsRoot/preprocessor/content"

# This rather gross multi-command sed seems to be forced by cross-platform
# sed's handling of newlines.
find "$ppContent" -name 'en.md' -exec sed -i.$$.bak -E \
    -e ' # Handle the opening tag of a mermaid diagram without a caption.
  s@^\{\{< mermaid >\}\}.*@``` mermaid@
' \
    -e ' # Handle the opening tag of a mermaid diagram with a caption.
  /^\{\{< mermaid caption="[^"]+" >\}\}$/ {

    # Insert two lines before the matched line
    i\
``` mermaid\
---

    # Replace the matched line with the dynamic title
    s/^\{\{< mermaid caption="([^"]+)" >\}\}$/title: "\1"/

    # Append a trailing line after the matched line
    a\
---

}
' \
    -e '
  s@^\{\{< /mermaid >\}\}.*@```@
' \
    {} +
# Cater for BSD sed, which doesn't allow `-i` without a suffix.
find "$ppContent" -type f -name "*.$$.bak" -delete

# _scripts/buildMkDocs.bash
