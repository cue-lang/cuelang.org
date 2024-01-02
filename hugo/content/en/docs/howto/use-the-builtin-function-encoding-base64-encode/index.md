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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="left" >}}
package example

import "encoding/base64"

decoded: "some string"
encoded: base64.Encode(null, decoded)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="right" >}}
$ cue export
{
    "decoded": "some string",
    "encoded": "c29tZSBzdHJpbmc="
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`base64`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/base64) builtin package
