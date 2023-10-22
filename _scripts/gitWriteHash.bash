#/usr/bin/env bash

set -eu

revhash=$(git rev-parse HEAD)

# Create hugo/data directory if it doesn't exist
mkdir -p hugo/data

echo "{\"Revision\": \"$revhash\"}" > hugo/data/Repository.json
