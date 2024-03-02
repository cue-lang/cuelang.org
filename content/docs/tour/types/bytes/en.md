---
title: Bytes
weight: 60
---

CUE distinguishes the **`bytes`** type from the `string` type.

Byte literals are defined with single quotes, rather than strings' double
quotes.

In addition to those escape sequences permitted in string literals,
these are also allowed in byte literals:

{{< table >}}
| Sequence | Result |
| ---:| --- |
| **`\xnn`** | Arbitrary byte value defined as the 2-digit hexadecimal number "**`nn`**" |
| **`\nnn`** | Arbitrary byte value defined as the 3-digit octal number "**`nnn`**" |
{{< /table >}}

Bytes are converted to Base64
when exporting concrete data to a format such as JSON or YAML
in order to ensure that the underlying binary data can be interpreted
accurately.

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
-- out --
{
    "aString": "A string",
    "Bytes": "QSBzdHJpbmc="
}
{{{end}}}
