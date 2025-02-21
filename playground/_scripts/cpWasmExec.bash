#!/usr/bin/env bash

version=$(go env GOVERSION)
minor_version=$(echo "$version" | cut -d'.' -f2)

# In go1.24.0 and later wasm_exec.js moved
if [ "$minor_version" -ge 24 ]; then
	cp $(go env GOROOT)/lib/wasm/wasm_exec.js ./src
else
	cp $(go env GOROOT)/misc/wasm/wasm_exec.js ./src
fi

