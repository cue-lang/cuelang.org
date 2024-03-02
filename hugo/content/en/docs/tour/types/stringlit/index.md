---
title: Strings
weight: 40
---

**Strings** are instances of the `string` type.
String literals are defined within double quotes.

Strings allow a rich set of escape sequences,
including Unicode code points
and [interpolations]({{< relref "../expressions/interpolation" >}}).

CUE also supports multi-line strings, enclosed by a pair of triple quotes (`"""`).
The opening quotes of a multi-line string must be immediately followed by a newline,
and the closing quotes must be on a line by themselves, optionally preceded by whitespace.
Any whitespace before the closing quotes must also prefix the lines between the quotes,
because it is removed from all lines.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
a: "\U0001F60E" // A 21-bit Unicode character.
b: """
	This is a
	multi-line string \(a)
	"""
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "a": "😎",
    "b": "This is a\nmulti-line string 😎"
}
{{< /code-tab >}}
{{< /code-tabs >}}
