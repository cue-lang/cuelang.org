---
title: Using the builtin function "encoding/base64.Encode"
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `encoding/base64.Encode` to
encode a string as Base64.

{{{with code "en" "cc"}}}
#location left right

exec cue export
cmp stdout out
-- file.cue --
package example

import "encoding/base64"

decoded: "some string"
encoded: base64.Encode(null, decoded)
-- out --
{
    "decoded": "some string",
    "encoded": "c29tZSBzdHJpbmc="
}
{{{end}}}

## Related content

- The [`base64`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/base64) builtin CUE package
