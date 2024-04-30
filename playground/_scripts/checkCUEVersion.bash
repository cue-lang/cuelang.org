#!/usr/bin/env bash

set -eu

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

playVersion="$(../_scripts/playgroundCUEVersion.bash)"
depVersion="$(go list -m -f {{.Version}} cuelang.org/go)"
if [[ "$playVersion" != "$depVersion" ]]
then
	echo "Playground dependency CUE version $depVersion is not the default $playVersion"
	exit 1
fi

