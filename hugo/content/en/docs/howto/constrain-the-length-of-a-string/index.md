---
title: Constrain the length of a string
tags:
- level:user
- field constraints
- language
relatedIssues:
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/114: "Commented CUE explainer"
- https://github.com/cue-lang/cue/issues/575: "must()"
---

This [Commented CUE](FIXME:explainer) guide demonstrates how to make sure a
string has a minimum length, maximum length, or both. It shows the length being
constrained in bytes and also in Runes (which is what the Go programming
language calls [code points](https://go.dev/blog/strings)).

## Constrain a string's length in Runes

Use the `strings` package's `MaxRunes()` and `MinRunes()` functions to
**constrain a string's length in Runes**:

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top" >}}
package example

import "strings"

// Each ASCII character is a single Rune.
// "x" contains 41 ASCII characters
x: "a string containing only ASCII characters"
x: strings.MinRunes(8) & strings.MaxRunes(40)

// Each South Korean character is a single Rune.
// "y" contains 3 Runes.
y: "한국어"
y: strings.MinRunes(4)

// Each of these emoji is also a single Rune.
// "z" contains 3 Runes.
z: "😄😀🙃"
z: strings.MaxRunes(2)
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example" type="terminal" area="bottom" >}}
x: invalid value "a string containing only ASCII characters" (does not satisfy strings.MaxRunes(40)):
    ./example.cue:8:26
    ./example.cue:7:4
    ./example.cue:8:4
    ./example.cue:8:43
y: invalid value "한국어" (does not satisfy strings.MinRunes(4)):
    ./example.cue:13:4
    ./example.cue:12:4
    ./example.cue:13:21
z: invalid value "😄😀🙃" (does not satisfy strings.MaxRunes(2)):
    ./example.cue:18:4
    ./example.cue:17:4
    ./example.cue:18:21
{{< /code-tab >}}

{{< /code-tabs >}}

## Constrain a string's length in bytes

Use the builtin `len()` function to **constrain a string's length in bytes**:

{{< info >}}
The "len()"-based examples use an embedded scalar value with an alias to permit
their fields to be of type "string" whilst *also* allowing their byte lengths
to be constrained.

This pattern will be obsoleted by the "must()" directive, which is tracked
in this CUE Issue: <https://github.com/cue-lang/cue/issues/575>.
{{< /info >}}

{{< code-tabs >}}

{{< code-tab name="example.cue" language="cue" area="top" >}}
package example

// Each ASCII character is a single bytes.
// "x" contains 41 ASCII characters
x: string & {// a string declaration is optional
	let content = "a string containing only ASCII characters"
	content
	#bytes: >=10 & <40 & len(content)
}

// Each of these South Korean characters contains
// 3 bytes, therefore "y" contains 9 bytes
y: {
	let content = "한국어"
	content
	#bytes: <=8 & len(content)
}

// Each of these emoji contains 4 bytes, therefore
// "z" contains 12 bytes.
z: {
	let content = "😄😀🙃"
	content
	#bytes: >=20 & len(content)
}
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example" type="terminal" area="bottom" >}}
x.#bytes: invalid value 41 (out of bound <40):
    ./example.cue:8:17
    ./example.cue:8:23
y.#bytes: invalid value 9 (out of bound <=8):
    ./example.cue:16:10
    ./example.cue:16:16
z.#bytes: invalid value 12 (out of bound >=20):
    ./example.cue:24:10
    ./example.cue:24:17
{{< /code-tab >}}

{{< /code-tabs >}}

## Related content

TODO
