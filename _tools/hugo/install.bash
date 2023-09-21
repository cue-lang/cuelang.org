#!/usr/bin/env bash

set -eu

# Change to the directory containing this script
cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

CGO_ENABLED=1 go install -tags extended github.com/gohugoio/hugo
