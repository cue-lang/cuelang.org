#!/usr/bin/env bash

set -eux

# Pass signals to child processes
trap "trap - SIGTERM && kill -- -$$" SIGINT SIGTERM EXIT

# cd to the parent directory to that containing the script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )/.."

cd hugo
npm ci
npm run icons

cd ..

# Run the preprocess in serve mode which will itself run hugo
go run ./internal/cmd/preprocessor execute --serve --debug -- -D --renderToDisk
