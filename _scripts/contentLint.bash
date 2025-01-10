#!/usr/bin/env bash
set -euo pipefail

# contentLint.bash asserts that specific pages under content/ and hugo/
# contain (or don't contain) particular content. These are checks which should
# probably live elsewhere (e.g. the preprocessor), but are placed here until
# implemented in a more principled manner.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# TODO: move this assertion into CUE as part of https://cuelang.org/issue/2825.
echo 'Checking that the /docs/draft/ hierarchy contains only draft pages ...'

# We use an "if" here because "! git grep ..." failing wouldn't cause the
# script to exit, as "set -e" doesn't apply when a command is negated.
# cf. https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
if git grep --files-without-match '^draft: true' 'hugo/content/*/docs/draft/**.md'; then exit 1; fi

# TODO: move this assertion into the preprocessor as part of https://cuelang.org/issue/3496.
echo 'Checking that every page presenting Go code also contains "go vet" and "staticcheck" ...'
# i.e. pages containg both "go mod init" ...
filesWithGoModInit="$(git grep -l 'go mod init' 'content/**.md')"
# ... and at least one Go file in a txtar archive.
filesWithGoModInitAndTxtarGoFiles="$(git grep -l '^-- .*\.go --$' -- $filesWithGoModInit)"

if git grep --files-without-match '^go vet \./\.\.\.$' -- $filesWithGoModInitAndTxtarGoFiles; then exit 1; fi
if git grep --files-without-match '^go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./...$' -- $filesWithGoModInitAndTxtarGoFiles; then exit 1; fi

echo 'Checking that internal links to other pages on the site are not direct (i.e. they must use "{{<relref>}}") ...'
# This grep pattern first checks all markdown pages under content/ for the
# 3-character string "](/", which is assumed to return only lines containing
# markdown links where the link target is internal (i.e. on the same site) and
# does not use "relref" to resolve the page path (is "direct").
# The use of relref is desirable as it checks that links' target pages exist.
# However, because Hugo doesn't know about Netlify server-side redirects, we
# also need an exclusion list of internal link targets that *are* permitted to
# be direct. The exclusion list is encoded as a trailing negative lookahead
# alternation. It's not exhaustive, so might need to be expanded when the site
# uses a larger set of acceptable internal direct links.
# Some of the list's entries are complete (e.g. slack/discord, which end with
# an escaped ")"); the rest encode permitted path prefixes.
if git grep -P '\]\(/(?!s/slack\)|s/discord\)|releases/|go/|search/)' 'content/**/*.md'; then exit 1; fi
