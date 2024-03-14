---
title: Using "encoding/base64.Encode"
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/base64.Encode`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/base64#Encode)
to encode a string as Base64.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="left" >}}
package example

import "encoding/base64"

decoded: "some string"
encoded: base64.Encode(null, decoded)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "decoded": "some string",
    "encoded": "c29tZSBzdHJpbmc="
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`encoding/base64`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/base64) built-in package
