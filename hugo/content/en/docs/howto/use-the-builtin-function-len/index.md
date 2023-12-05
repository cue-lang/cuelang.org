---
title: Using the builtin function "len" to calculate lengths
tags:
- language
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the
[builtin]({{< relref "docs/reference/glossary#builtin-functions" >}})
function
[`len()`]({{< relref "docs/reference/glossary#len-builtin-function" >}})
to calculate the lengths of different CUE types.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue"  area="top-left" >}}
package example

_someBytes: '😎abc123🥶' & bytes
_aString:   "😎abc123🥶" & string

a: len([
	1,
	"two",
	3 + 3,
	{value: 4},
])

b: len(_someBytes)

// using len() on a string returns
// the number of bytes it contains
// not the number of characters
c: len(_aString)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="top-right" >}}
$ cue export .:example
{
    "a": 4,
    "b": 14,
    "c": 14
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- Don't use the `len()` function on a string, for the reason mentioned above.\
  Instead, learn
  [how to constrain the length of a string]({{< relref "docs/howto/constrain-the-length-of-a-string" >}})
  using functions from the CUE `strings` standard package.
