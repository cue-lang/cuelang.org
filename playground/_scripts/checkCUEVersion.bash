#!/usr/bin/env bash

set -eu

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

source "../_scripts/playgroundCUEVersion.bash"

depVersion="$(go list -m -f {{.Version}} cuelang.org/go)"
if [[ "$CUELANG_CUE_DEFAULT" != "$depVersion" ]]
then
	echo "Playground dependency CUE version $depVersion is not the default $CUELANG_CUE_DEFAULT"
	exit 1
fi

