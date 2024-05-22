---
title: Fetching JSON data over HTTP
authors:
- jpluscplusm
toc_hide: true
---

This guide demonstrates how to use a CUE workflow command to fetch some JSON over HTTP.

It is converted from its JSON representation into data,
which is then used by the workflow command.

<!-- FIXME: update to fetch the example.json file contained in this page's directory, after the page has been merged -->

{{< code-tabs >}}
{{< code-tab name="a_tool.cue" language="cue" area="top" >}}
package example

import (
	"tool/http"
	"tool/cli"
	"encoding/json"
)

command: exampleCommand: {
	fetch: http.Get & {
		url: "https://proxy.golang.org/cached-only/cuelang.org/go/@v/v0.8.2.info"
	}
	data: json.Unmarshal(fetch.response.body) & #aSchema
	display: cli.Print & {
		text: "CUE version \(data.Version) was released with commit hash \(data.Origin.Hash)"
	}
}

// The data received is validated against this schema. This is good practice
// but is not required before using the data.
#aSchema: {
	Version!: string
	Origin?: {
		Hash!: string
		...
	}
	...
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGNtZCBleGFtcGxlQ29tbWFuZA==" >}}
$ cue cmd exampleCommand
CUE version v0.8.2 was released with commit hash 596c99191ad1eb7c39d547e59bc7085751d7952b
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- Go API: 
  [`tool/http`](https://pkg.go.dev/cuelang.org/go/pkg/tool/http#section-documentation) --
  make HTTP requests in workflow commands
- Go API: 
  [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#section-documentation) --
  convert data to and from its JSON representation
- Go API: 
  [`tool/cli`](https://pkg.go.dev/cuelang.org/go/pkg/tool/cli#section-documentation) --
  interact with the user's terminal in workflow commands
