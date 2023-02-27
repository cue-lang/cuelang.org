#!/usr/bin/env bash

set -eux

# Pass signals to child processes
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

# cd to the directory containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Running serverless functions (background)"
go run ./internal/cmd/serverless-local &>/dev/null &

cd hugo
npm ci
npm run icons
hugo serve -D --renderToDisk
