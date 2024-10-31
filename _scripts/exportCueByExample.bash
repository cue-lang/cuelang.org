#!/usr/bin/env bash
set -euo pipefail

# exportCueByExample.bash reads a single page from inside the hugo/ hierarchy,
# performs a few simple transformations, and emits a form that's 80% ready to
# be published at https://github.com/cue-labs/cue-by-example. This should be
# superseded by a solution to https://cuelang.org/issue/3543.

content="$1"

# Line comments, in order (as they can't appear inline):
#  awk: delete all content before the first Markdown H1
#  sed:
#  - any line with a text fenced code block is shell output
#  - shell output needs not to have a dollar-space prefix
#  - the opening of a code-tabs container isn't needed
#  - a text code-tab element is a text file (NB this isn't always correct!)
#  - a cue code-tab element is a CUE file
#  - the closing of a code-tabs container isn't needed
cat "$content" \
| awk '/^# / { x=1 } ; x {print}' \
| sed 's/^```text.*$/```sh/' \
| sed 's/^\$ //' \
| sed '/^{{< code-tabs >}}$/d' \
| sed 's/^{{< code-tab .*language="txt".*$/```text/' \
| sed 's/^{{< code-tab .*language="cue".*$/```cue/' \
| sed 's@^{{< /code-tab >}}{{< /code-tabs >}}$@```@'

cat <<EOC >&2

 NBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNB
 The transformation of the source file $content
 was successful, but MUST NOT be assumed to be complete. Make sure you audit
 its output, paying close attention to:
 - shell commands with a prefix marked as "Actual command in CUE-By-Example guide" (or similar)
 - anything inside {{< ... >}} blocks, which don't mean anything in GitHub Markdown
 - relative URLs inside [markdown](/links), as these won't resolve on GitHub
 - fenced code blocks that originally had filetypes other than text might have been changed to "text"
 NBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNBNB
EOC
