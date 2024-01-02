---
title: Using the builtin function "encoding/base64.Decode"
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `encoding/base64.Decode` to decode
data that is encoded as Base64.

{{{with code "en" "cc"}}}
#location left right

exec cue export
cmp stdout out
-- file.cue --
package example

import "encoding/base64"

// encoded contains some Base64-encoded data
encoded: "c29tZSBCYXNlNjQtZW5jb2RlZCBkYXRh"

// decoded contains the string interpolation of
// the byte array returned by base64.Decode
decoded: "\(base64.Decode(null, encoded))"
-- out --
{
    "encoded": "c29tZSBCYXNlNjQtZW5jb2RlZCBkYXRh",
    "decoded": "some Base64-encoded data"
}
{{{end}}}

## Related content

- The [`base64`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/base64) builtin package
