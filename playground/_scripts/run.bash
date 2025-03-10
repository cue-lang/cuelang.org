#!/usr/bin/env bash

set -eux

# Pass signals to child processes
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

if [[ "${CI:-}" == "true" ]]
then
	echo "not expecting this to be run on CI"
	exit 1
fi

echo "Building WASM backend"
GOOS=js GOARCH=wasm go build -o main.wasm
./_scripts/cpWasmExec.bash

echo "Running npm run start"
npm run start
