---
title: Fetching JSON data over HTTP
authors:
- jpluscplusm
toc_hide: true
tags:
- workflow command
---

This guide demonstrates how to use a CUE workflow command to fetch some JSON over HTTP.

It is converted from its JSON representation into data,
which is then used by the workflow command.

<!-- TODO: consider demonstrating a validation failure when https://github.com/cue-lang/cue/issues/3186 is resolved -->

{{< code-tabs >}}
{{< code-tab name="a_tool.cue" language="cue" area="top-left" >}}
package example

import (
	"tool/http"
	"tool/cli"
	"encoding/json"
)

command: info: {
	fetch: http.Get & {
		url: "https://proxy.golang.org/cached-only/cuelang.org/go/@v/v0.8.2.info"
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
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCBpbmZv" }
$ cue cmd info
CUE version v0.8.2 was released with commit hash 596c99191ad1eb7c39d547e59bc7085751d7952b
```

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
