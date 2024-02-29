---
title: Using modules with the Go API
authors:
- myitcv
tags:
- modules
- tooling
toc_hide: true
---

{{{with _script "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{{with _script "en" "cue mod registry"}}}
# TODO: this is inherently racey. But not a problem in practice...
# for now. When it does become a problem we can solve this properly
# using a nc-based wait loop or similar.
nohup cue mod registry localhost:5000 > /tmp/cue_mod_registry 2>&1 &
sleep 0.5
{{{end}}}

{{{with _upload "en" "person module"}}}
-- .person/cue.mod/module.cue --
module: "schemas.example/person@v0"
{{{end}}}

{{{with _upload "en" "person schema"}}}
-- .person/person.cue --
package person

#Person: {
	name?: string
	age?:  int
}
{{{end}}}

{{{with _script "en" "publish person module"}}}
export CUE_EXPERIMENT=modules
export CUE_REGISTRY=localhost:5000
cd $HOME/.person
cue mod publish v0.1.0
cd $HOME
unset CUE_EXPERIMENT
{{{end}}}

{{{with script "en" "cue mod init"}}}
cue mod init our.example/mod@v0
{{{end}}}

{{{with upload "en" "main cue file"}}}
-- main.cue --
package main

import "schemas.example/person@v0"

p: person.#Person & {
	name: "cueckoo"
	age:  99
}
{{{end}}}

{{{with script "en" "cue mod tidy"}}}
export CUE_EXPERIMENT=modules
cue mod tidy
cue export
{{{end}}}

{{{with script "en" "go mod init"}}}
#ellipsis 0
go mod init our.example/mod
{{{end}}}

{{{with upload "en" "main go file"}}}
-- main.go --
package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()
	bps := load.Instances([]string{"."}, &load.Config{
		Env: []string{"CUE_REGISTRY=localhost:5000"},
	})
	v := ctx.BuildInstance(bps[0])
	namePath := cue.ParsePath("p.name")
	name := v.LookupPath(namePath)
	fmt.Printf("%v: %v\n", namePath, name)
}
{{{end}}}

{{{with script "en" "run go main"}}}
#ellipsis 0
go get cuelang.org/go@$CUELANG_CUE_PRERELEASE
#ellipsis 0
go mod tidy
go run .
{{{end}}}
