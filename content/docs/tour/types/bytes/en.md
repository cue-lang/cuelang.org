---
title: "Bytes"
weight: 6
---

CUE distinguishes between a `string` and a `bytes` type.
Bytes are converted to base64 when emitting JSON.
Byte literals are defined with single quotes.
The following additional escape sequences are allowed in byte literals:

{{{with code "en" "escapes"}}}
-- in.txt --
    \xnn   // arbitrary byte value defined as a 2-digit hexadecimal number
    \nnn   // arbitrary byte value defined as a 3-digit octal number
{{{end}}}
<!-- jba: this contradicts the spec, which has \nnn (no leading zero) -->

{{{with code "en" "bytes"}}}
-- in.cue --
a: '\x03abc'
-- out.json --
{
    "a": "A2FiYw=="
}
{{{end}}}
