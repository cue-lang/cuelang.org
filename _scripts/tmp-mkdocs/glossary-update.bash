#!/usr/bin/env bash
set -euo pipefail

# cd to the grandparent directory of the script.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../.."

. _scripts/tmp-mkdocs/config.env

: "$mkdocsRoot" # Required.
glossary="$mkdocsRoot/preprocessor/content/docs/reference/glossary/en.md"

# We need a version of awk that supports the 3-arg match function.
# This fails if it's not available.
awk 'BEGIN{ match("abc",/(b)/,m) }' </dev/null

# Use awk not sed, as only GNU sed can perform the required lowercase conversion.
# A wider set of awks support the 3-arg match form.
awk '
# Change H2 headings to H3.
$1=="##" {
    $1="###"
}

# Change step shortcodes into H2 headings with a custom anchor matching
# the current page content. i.e.
#   {{< step group="glossary" stepNumber="A" >}}
# becomes
#   ## :regional_indicator_a: { id="glossary-step-A" }
/^\{\{< *step +group="[^"]+" +stepNumber="[A-Z]" *>\}\}$/ {
    match($0, /group="([^"]+)" stepNumber="([A-Z])"/, m)
    g = m[1]
    s = m[2]
    l = tolower(s)
    $0 = sprintf("## :regional_indicator_%s: { id=\"%s-step-%s\" }", l, g, s)
}

# Handle the single non-alphabetic step number
/^\{\{< *step +group="glossary" +stepNumber="#" *>\}\}$/ {
    $0 = "## :hash: { id=\"glossary-step-%23\" }"
}

# Remove closing step shortcodes.
/^\{\{< *\/step *>\}\}$/ {
    $0 = ""
}

# Emit all lines.
{
    print
}
' <"$glossary" >"$glossary.new"

mv "$glossary.new" "$glossary"

_scripts/buildMkDocs.bash
