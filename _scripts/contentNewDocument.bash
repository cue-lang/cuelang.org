#!/usr/bin/env bash
set -euo pipefail

# TODO: this script should really become a subcommand of the preprocessor.

# Invoke the script with no arguments to see the usage text.
function _usage(){
    cat <<HERE
usage: $(basename $0): new-content-directory [directory-to-copy]

Script must be invoked from the repository root
 == $(git rev-parse --show-toplevel)
HERE
}

function _fatal(){ echo "FATAL: $1; exiting"; exit 1; }
function main() {
    local newDirArg="$1"; shift
    local copyDir=""
    # Argument #2 is optional, so we check for its presence.
    if [ "$#" -ne 0 ]; then
        copyDir="$1"; shift
    fi

    # Refuse to run if we're not invoked from the repo root in order to remove
    # some complexity when calculating $newPage's CUE path for insertion into
    # page.cue.
    thisDir="$PWD"
    gitRootDir="$(git rev-parse --show-toplevel)"
    [ "$thisDir" = "$gitRootDir" ] || _fatal "script must be invoked from repo root"

    # Refuse to overwrite an pre-existing directory.
    [ ! -d "$newDirArg" ] || _fatal "$newDirArg already exists"

    # TODO: Test that $newDirArg adheres to some sensible rules given that it
    # will form part of the URL e.g. no semi-colons, spaces, etc.
    # TODO: Remember that the path leading up to the repo root might contain
    # spaces, which means we /probably/ can't simply
    #    if echo "$newDirArg" | grep -v '[ ;]'; then _fatal whoops

    # Create new content directory, or copy existing.
    if [ -z "$copyDir" ]; then
        mkdir -p "$newDirArg"
    else
        # assert that copyDir actually exists
        [ -d "$copyDir" ] || _fatal "$copyDir does not exist"
        cp -priv "$copyDir" "$newDirArg"
    fi

    # Get the absolute path to $newDirArg, so that commands from this point
    # forwards do not need to worry about the argument having involved any
    # directory traversal.
    newDir="$(cd "$newDirArg" > /dev/null; echo "$PWD")"

    # Remove unwanted files copied from $copyDir.
    rm -f "$newDir/gen_cache.cue"

    # Assemble $cuePath, which will be the page's path inserted into page.cue.
    # use bash's "remove string prefix" mechanism to normalise the new
    # directory's path inside the git root.
    cuePathSpaceSeparated="$(echo ${newDir#$gitRootDir/} | sed 's@/@ @g')"
    export cuePathSpaceSeparated
    # $cuePath ends up looking like '"foo":"bar":"baz":{}'.
    # It will be tidied up with cue-fmt-s.
    cuePath="$(for p in $cuePathSpaceSeparated; do echo -n \"$p\": ; done ; echo 'page: _')"

    # Create page.cue.
    # TODO(jm): this creates a page.cue that doesn't set up Central Registry
    # users, etc - which may have been part of the reason an existing directory
    # was selected to be copied. Inherit the page.cue contents from $copyDir.
    echo -e "package site\n$cuePath" >"$newDir/page.cue"
    cue fmt -s "$newDir/page.cue"

    # Create en.md if it wasn't copied from $copyDir.
    # TODO: cope with _en.md files.
    if [ ! -e "$newDir/en.md" ]; then
        echo -e "---\ntitle: $newDir\n---" >"$newDir/en.md"
    fi

    echo -n "SUCCESS: $newDirArg created"
    if [ -z "$copyDir" ]; then
        echo "."
    else
        echo " as a copy of $copyDir."
    fi
}

if [ "$#" -eq 0 ]; then
    _usage
    exit 1
fi

main "$@"
