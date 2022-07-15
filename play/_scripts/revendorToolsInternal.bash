#!/usr/bin/env bash

set -eux

# Change the running directory when revendoring internal parts of CUE. Note we
# cannot use the git root directory here, because we might be running this
# script from its location inside the Go module cache (at least this is how it
# is used from the cuelang.org repo).
command cd "$( command cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )/.."

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

regex='s+cuelang.org/go/internal+github.com/cue-sh/playground/internal/cuelang_org_go_internal+g'

for i in "" filetypes encoding third_party/yaml
do
	rsync -a --relative --delete $td/$path@$version/internal/./$i/ ./internal/cuelang_org_go_internal/
	find ./internal/cuelang_org_go_internal/$i -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +
done

find ./internal/cuelang_org_go_internal -name "*.go" -exec sed -i $regex {} +
find ./internal/cuelang_org_go_internal/ -name "*_test.go" -exec rm {} +
cp $td/$path@$version/LICENSE ./internal/cuelang_org_go_internal

# 2022-02-09 - at the time of writing CUE tip causes
# a plain go mod tidy in the playground to fail because
# go1.16 would select one version, and go1.17 another.
# So we keep this extended form in place until we drop
# support for go1.16
go mod tidy -go=1.16 && go mod tidy -go=1.17
