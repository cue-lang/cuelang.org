#!/usr/bin/env bash

set -eux

rootDir="$(git rev-parse --show-toplevel)"

source "$rootDir/_scripts/defaultCUEVersion.bash"

# Start this work within the playground
cd "$rootDir/playground"

go mod edit -require cuelang.org/go@$CUELANG_CUE_DEFAULT
go mod tidy
go mod download
path="cuelang.org/go"
version=$(go list -m -f={{.Version}} $path)

td=$(mktemp -d)
trap "rm -rf $td" EXIT

pushd $td > /dev/null
modCache=$(go env GOMODCACHE)
if [ "$modCache" = "" ]
then
	modCache=${GOPATH%%:*}/pkg/mod
fi
unzip -q $modCache/cache/download/$path/@v/$version.zip
popd > /dev/null


for i in "" filetypes encoding third_party/yaml
do
	rsync -a --relative --delete $td/$path@$version/internal/./$i/ ./internal/cuelang_org_go_internal/
	find ./internal/cuelang_org_go_internal/$i -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
done

# Fix up import paths
regex='s+cuelang.org/go/internal+github.com/cue-lang/cuelang.org/playground/internal/cuelang_org_go_internal+g'
find ./internal/cuelang_org_go_internal -name "*.go" -exec sed -i $regex {} +

# Remove go:generate directives
find ./internal/cuelang_org_go_internal -name "*.go" -exec sed -i '/^\/\/go:generate/d' {} +

# Remove test files
find ./internal/cuelang_org_go_internal/ -name "*_test.go" -exec rm {} +

# Retain a copy of the license
cp $td/$path@$version/LICENSE ./internal/cuelang_org_go_internal
