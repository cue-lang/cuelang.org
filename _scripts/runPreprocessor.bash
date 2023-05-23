#!/usr/bin/env bash

set -eux

go run -trimpath ./internal/cmd/preprocessor "$@"
