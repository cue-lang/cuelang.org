---
title: Fetching JSON data over HTTP
authors:
- jpluscplusm
toc_hide: true
tags:
- workflow command
---

{{{with _script_ "en" "HIDDEN: set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{{with _upload_ "en" "HIDDEN: server.go"}}}
-- server.go --
package main

import (
	"fmt"
	"net/http"
)

// Mirror of https://proxy.golang.org/cached-only/cuelang.org/go/@v/v0.8.2.info
var response = `{"Version":"v0.8.2","Time":"2024-04-26T11:47:18Z","Origin":{"VCS":"git","URL":"https://review.gerrithub.io/cue-lang/cue","Ref":"refs/tags/v0.8.2","Hash":"596c99191ad1eb7c39d547e59bc7085751d7952b"}}`
var hostport = "{{{.HOSTPORT}}}"

func main() {
	fmt.Println("Starting server on " + hostport)
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, response)
	})

	if err := http.ListenAndServe(hostport, nil); err != nil {
		fmt.Println("Server failed:", err)
	}
}
{{{end}}}

{{{with _script_ "en" "HIDDEN: go run server"}}}
# TODO: This is technically racey, but we adopt the same posture as
# https://cuelang.org/cl/1176732: let's wait for it to actually become a
# problem before we worry about it. That said, we do build the executable
# before running it (instead of "go run server.go") to try and /help/ avoid an
# HTTP connection being attempted before the server is listening.
go build server.go
nohup ./server > /tmp/howto-fetch-json-data-http.log 2>&1 &
sleep 1
rm server
{{{end}}}

This guide demonstrates how to use a CUE workflow command to fetch some JSON over HTTP.

It is converted from its JSON representation into data,
which is then used by the workflow command.

<!-- TODO: consider demonstrating a validation failure when https://github.com/cue-lang/cue/issues/3186 is resolved -->

{{{with upload "en" "cc"}}}
-- a_tool.cue --
package example

import (
	"tool/http"
	"tool/cli"
	"encoding/json"
)

command: info: {
	fetch: http.Get & {
		url: "{{{.URI}}}"
	}
	display: cli.Print & {
		_data: #info & json.Unmarshal(fetch.response.body)
		text:  "CUE version \(_data.Version) was released with commit hash \(_data.Origin.Hash)"
	}
}

// The data received is validated against this schema. This is good practice,
// but is not required before using the data.
#info: {
	Version!: string
	Origin?: {
		Hash!: string
		...
	}
	...
}
{{{end}}}

{{{with script "en" "command"}}}
cue cmd info
{{{end}}}

## Related content

- {{< linkto/related/reference "command/cue-help-commands" >}} -- CUE workflow commands
- Go API:
  [`tool/http`](https://pkg.go.dev/cuelang.org/go/pkg/tool/http#section-documentation) --
  make HTTP requests in workflow commands
- Go API:
  [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#section-documentation) --
  convert data to and from its JSON representation
- Go API:
  [`tool/cli`](https://pkg.go.dev/cuelang.org/go/pkg/tool/cli#section-documentation) --
  interact with the user's terminal in workflow commands
