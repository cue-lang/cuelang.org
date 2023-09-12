#!/usr/bin/env bash

# noWriteCache.bash checks the commit referred to by $1 to see
# whether it contains the PREPROCESSOR-NO-WRITE-CACHE directive.
# This directive must appear on a clear line before trailers.

git log --format=%b -1 $1 | grep -Pzo -q '\n\nPREPROCESSOR-NO-WRITE-CACHE\n\n'
