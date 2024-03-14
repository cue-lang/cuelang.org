---
title: Using the built-in function "len" to calculate lengths
tags:
- language
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the
[built-in]({{< relref "docs/reference/glossary#built-in-functions" >}})
function
[`len()`]({{< relref "docs/reference/glossary#len-built-in-function" >}})
to calculate the lengths of different CUE types.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package example

a: len([5, 4, 3, 2])

// Using len() on a string returns the number of
// bytes it contains, not the number of
// characters

// This input is of type bytes
b: len('😎abc123🥶')

// This input is of type string
b: len("😎abc123🥶")
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "a": 4,
    "b": 14
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- Don't use the `len` function on a string, for the reason mentioned above.\
  {{< linkto/related/howto "constrain-the-length-of-a-string" >}}
  demonstrates using functions from the built-in `strings` package instead
