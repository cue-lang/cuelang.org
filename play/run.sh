#!/usr/bin/env bash
set -eux

trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

# cd to the directory containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

npm install

echo "Running serverless functions (background)"
go run github.com/cue-sh/playground/functions/snippets >/dev/null 2>&1 &

echo "Building WASM backend"
GOOS=js GOARCH=wasm go build -o main.wasm
cp $(go env GOROOT)/misc/wasm/wasm_exec.js ./src

echo "Running npm run serve"
npm run watch
