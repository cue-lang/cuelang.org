---
title: Bytes
weight: 60
---

CUE distinguishes the **`bytes`** type from the `string` type.
Byte literals are defined with single quotes.

In addition to the escape sequences permitted in string literals,
byte literals also allow these escape sequences:

{{< table >}}
| Sequence | Result |
| ---:| --- |
| **`\xnn`** | Arbitrary byte value defined as the 2-digit hexadecimal number "**`nn`**" |
| **`\nnn`** | Arbitrary byte value defined as the 3-digit octal number "**`nnn`**" |
{{< /table >}}

Bytes are represented as Base64
when exporting concrete data to a format such as JSON or YAML
because they might contain binary data.
To avoid this, interpolate bytes inside a string value.

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
aString: "A string"

// Multiple representations of the same underlying
// bytes, which therefore unify succesfully.
Bytes: 'A string'
Bytes: '\(aString)'
Bytes: '\x41\x20\x73\x74\x72\x69\x6e\x67'
Bytes: '\101\040\163\164\162\151\156\147'

stringBytes: "\(Bytes)"
-- out --
{
    "aString": "A string",
    "Bytes": "QSBzdHJpbmc=",
    "stringBytes": "A string"
}
{{{end}}}
