#!/usr/bin/env bash

set -eu

# Take a file provide over stdin, write to a temporary directory,
# execute testscript, if succeess cat the file to stdout, if error
# cat the output to stderr and exit 1.

td=$(mktemp -d)
trap "rm -rf $td" EXIT
cd $td

cat - > script.txt
if testscript "$@" script.txt > output 2>&1;
then
	cat script.txt
else
	ec=$?
	cat output >&2
	exit $ec
fi
