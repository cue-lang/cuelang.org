---
title: Using "encoding/base64.Decode"
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/base64.Decode`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/base64#Decode)
to decode data that is encoded as Base64.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="left" >}}
package example

import "encoding/base64"

// encoded contains some Base64-encoded data
encoded: "c29tZSBCYXNlNjQtZW5jb2RlZCBkYXRh"

// decoded contains the string interpolation of
// the byte array returned by base64.Decode
decoded: "\(base64.Decode(null, encoded))"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "encoded": "c29tZSBCYXNlNjQtZW5jb2RlZCBkYXRh",
    "decoded": "some Base64-encoded data"
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`encoding/base64`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/base64) built-in package
