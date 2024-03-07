---
title: "Bytes"
weight: 60
---

CUE distinguishes between a `string` and a `bytes` type.
Bytes are converted to base64 when emitting JSON.
Byte literals are defined with single quotes.
The following additional escape sequences are allowed in byte literals:

{{{with code "en" "escapes"}}}
-- plain.txt --
    \xnn   // arbitrary byte value defined as a 2-digit hexadecimal number
    \nnn   // arbitrary byte value defined as a 3-digit octal number
{{{end}}}
<!-- jba: this contradicts the spec, which has \nnn (no leading zero) -->

{{{with code "en" "bytes"}}}
exec cue export bytes.cue
cmp stdout result.txt
-- bytes.cue --
a: '\x03abc'
-- result.txt --
{
    "a": "A2FiYw=="
}
{{{end}}}
