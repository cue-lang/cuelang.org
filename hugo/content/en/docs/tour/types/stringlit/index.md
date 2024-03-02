---
title: "String Literals"
weight: 40
---

CUE strings allow a rich set of escape sequences,
including Unicode code points
and [interpolations]({{< relref "../../expressions/interpolation" >}}).

CUE also supports multi-line strings, enclosed by a pair of triple quotes (`"""`).

The opening triple quote of a multi-line string must be immediately followed by
a newline.
The closing triple quote must be on a line by itself, optionally preceded by
whitespace.
Any whitespace preceding the closing quote must be
equal to or shorter in length than
the whitespace preceding all the string's other lines,
and is removed from all these lines.

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
