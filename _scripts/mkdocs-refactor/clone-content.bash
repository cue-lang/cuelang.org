#!/usr/bin/env bash
set -euo pipefail

# cd to the grandparent directory of the script.
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/../.."

. _scripts/mkdocs-refactor/config.env

: "$mkdocsRoot" # Required.
ppContent="$mkdocsRoot/preprocessor/content"

# Initialise content from existing content/docs/ dir.
rm -rf "$mkdocsRoot"
mkdir -p "$ppContent"
cp -pri content/docs/ "$ppContent/"

# Update Hugo category index page filenames to MkDocs' expected filenames.
find "$ppContent/docs/" -name _en.md | while read X
do
    mv -i "$X" "$(dirname "$X")/en.md"
done

# Create preprocessor's required config.
go tool cue def .:site -o "$mkdocsRoot/preprocessor/site.cue"
