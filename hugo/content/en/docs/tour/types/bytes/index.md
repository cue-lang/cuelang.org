---
title: "Bytes"
weight: 6
---

CUE distinguishes between a `string` and a `bytes` type.
Bytes are converted to base64 when emitting JSON.
Byte literals are defined with single quotes.
The following additional escape sequences are allowed in byte literals:

```txt
    \xnn   // arbitrary byte value defined as a 2-digit hexadecimal number
    \nnn   // arbitrary byte value defined as a 3-digit octal number
```
<!-- jba: this contradicts the spec, which has \nnn (no leading zero) -->

{{< code-tabs >}}
{{< code-tab name="bytes.cue" language="text"  area="top-left" >}}
a: '\x03abc'
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
{
    "a": "A2FiYw=="
}
{{< /code-tab >}}
{{< /code-tabs >}}
