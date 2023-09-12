#!/usr/bin/env bash

# noWriteCache.bash checks the commit referred to by $1 to see
# whether it contains the Preprocessor-No-Write-Cache trailer.

[[ "$(git log -1 --pretty='%(trailers:key=Preprocessor-No-Write-Cache,valueonly)' $1)" == "true" ]]
