---
title: "String Literals"
weight: 4
---

CUE strings allow a richer set of escape sequences than JSON.

CUE also supports multi-line strings, enclosed by a pair of triple quotes `"""`.
The opening quote must be followed by a newline.
The closing quote must also be on a newline.
The whitespace directly preceding the closing quote must match the preceding
whitespace on all other lines and is removed from these lines.

Strings may also contain [interpolations](../../expressions/interpolation).
<!-- FIXME: update interpolations link -->


{{< code-tabs >}}
{{< code-tab name="stringlit.cue" language="cue"  area="top-left" >}}
// 21-bit unicode characters
a: "\U0001F60E" // 😎

// multiline strings
b: """
	Hello
	World!
	"""
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
{
    "a": "😎",
    "b": "Hello\nWorld!"
}
{{< /code-tab >}}
{{< /code-tabs >}}
