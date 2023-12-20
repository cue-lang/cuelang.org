---
title: Constrain the length of a string
authors:
- jpluscplusm
tags:
- commented cue
- validation
relatedIssues:
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/114: "Commented CUE explainer"
- https://github.com/cue-lang/cue/issues/575: "must()"
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to make sure a string has a minimum length, or a maximum
length, or both.

This CUE shows string fields being constrained by their lengths as expressed in
bytes, and also in runes, as introduced by
[the Go programming language](https://go.dev/blog/strings#code-points-characters-and-runes).

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue"  area="top" >}}
package example

import "strings"

// 2 examples that use only single-byte, ASCII characters
ascii_constrain_runes: "only ASCII characters" // 21 runes composed of 21 bytes
// enforce that the field contains between 2 and 8 runes
ascii_constrain_runes: strings.MinRunes(2) & strings.MaxRunes(8)

ascii_constrain_bytes: {
	// set up an alias to allow the following CUE to refer to it
	let content = "only ASCII characters" // 21 runes composed of 21 bytes

	// this embedded scalar ultimately sets the value of the containing field,
	// "ascii_constrain_bytes"
	content

	// enforce that "content" contains between 50 and 100 bytes
	#bytes: len(content) & >=50 & <=100
}

// 2 examples that use multi-byte, South Korean Hangul characters
multibyte_constrain_runes: "한글" // 2 runes composed of 6 bytes
// enforce that the field contains 5 or fewer runes
multibyte_constrain_runes: strings.MaxRunes(5)

multibyte_constrain_bytes: {
	// set up an alias to allow the following CUE to refer to it
	let content = "한글" // 2 runes composed of 6 bytes

	// this embedded scalar ultimately sets the value of the containing field,
	// "multibyte_constrain_bytes"
	content

	// enforce that "content" contains 5 or fewer bytes
	#bytes: len(content) & <=5
}

// 2 examples that use multi-byte, emoji characters
emoji_constrain_runes: "😄🥵🙃🥶" // 4 runes composed of 16 bytes
// enforce that the field contains 10 or more runes
emoji_constrain_runes: strings.MinRunes(10)

emoji_constrain_bytes: {
	// set up an alias to allow the following CUE to refer to it
	let content = "😄🥵🙃🥶" // 4 runes composed of 16 bytes

	// this embedded scalar ultimately sets the value of the containing field,
	// "emoji_constrain_bytes"
	content

	// enforce that "content" contains 10 or more bytes
	#bytes: len(content) & >=10
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="err" type="terminal" area="bottom" >}}
$ cue vet .:example
ascii_constrain_runes: invalid value "only ASCII characters" (does not satisfy strings.MaxRunes(8)):
    ./example.cue:8:46
    ./example.cue:6:24
    ./example.cue:8:24
    ./example.cue:8:63
ascii_constrain_bytes.#bytes: invalid value 21 (out of bound >=50):
    ./example.cue:19:25
    ./example.cue:19:10
multibyte_constrain_bytes.#bytes: invalid value 6 (out of bound <=5):
    ./example.cue:36:25
    ./example.cue:36:10
emoji_constrain_runes: invalid value "😄🥵🙃🥶" (does not satisfy strings.MinRunes(10)):
    ./example.cue:42:24
    ./example.cue:40:24
    ./example.cue:42:41
{{< /code-tab >}}
{{< /code-tabs >}}

{{< info >}}
The `len()`-based examples use an embedded scalar value with an alias to permit
their fields to be of type `string` whilst *also* allowing their byte lengths
to be constrained.

This pattern will be obsoleted by the `must()` directive, which is tracked
in this CUE Issue: <https://github.com/cue-lang/cue/issues/575>.
{{< /info >}}
