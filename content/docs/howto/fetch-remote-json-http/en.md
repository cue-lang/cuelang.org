---
title: Fetching a remote JSON file over HTTP
authors:
- jpluscplusm
toc_hide: true
---

This guide demonstrates how to use a CUE workflow command to fetch a remote
JSON file over HTTP, using the built-in
[`tool/http`](https://pkg.go.dev/cuelang.org/go/pkg/tool/http)
package.

<!-- FIXME: update to fetch the example.json file contained in this page's directory, after the page has been merged -->

{{{with code "en" "cc"}}}
#location top bottom
exec cue cmd exampleCommand
cmp stdout out
-- a_tool.cue --
package example

import (
	"tool/http"
	"tool/cli"
)

command: exampleCommand: {
	fetch: http.Get & {
		url: "https://proxy.golang.org/cached-only/cuelang.org/go/@v/v0.8.2.info"
	}
	display: cli.Print & {
		text: fetch.response.body
	}
}
-- out --
{"Version":"v0.8.2","Time":"2024-04-26T11:47:18Z","Origin":{"VCS":"git","URL":"https://review.gerrithub.io/cue-lang/cue","Ref":"refs/tags/v0.8.2","Hash":"596c99191ad1eb7c39d547e59bc7085751d7952b"}}
{{{end}}}

## Related content

- The built-in
  [`tool/http`](https://pkg.go.dev/cuelang.org/go/pkg/tool/http) package
