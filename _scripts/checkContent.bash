#!/usr/bin/env bash
set -euo pipefail

# checkContent.bash asserts that specific pages under content/ and hugo/
# contain (or don't contain) particular content. These are checks which should
# probably live elsewhere (e.g. the preprocessor), but are placed here until
# implemented in a more principled manner.

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

# TODO: move this assertion into CUE as part of https://cuelang.org/issue/2825.
echo 'Checking that the /docs/draft/ hierarchy contains only draft pages ...'
# "! git grep ..." doesn't work, as "set -e" is defined not to strike when a  command is negated.
# cf. https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
if git grep --files-without-match '^draft: true' 'hugo/content/*/docs/draft/**.md'; then exit 1; fi

# TODO: move this assertion into the preprocessor as part of https://cuelang.org/issue/3496.
echo 'Checking that every page presenting Go code also contains "go vet" and "staticcheck" ...'
# i.e. pages with "go mod init" and a Go file in a txtar archive.
filesWithGoModInit="$(git grep -l 'go mod init' 'content/**.md')"
filesWithGoModInitAndTxtarGoFiles="$(git grep -l '^-- .*\.go --$' -- $filesWithGoModInit)"

if git grep --files-without-match '^go vet \./\.\.\.$' -- $filesWithGoModInitAndTxtarGoFiles; then exit 1; fi
if git grep --files-without-match '^go run honnef.co/go/tools/cmd/staticcheck@v0.5.1 ./...$' -- $filesWithGoModInitAndTxtarGoFiles; then exit 1; fi
