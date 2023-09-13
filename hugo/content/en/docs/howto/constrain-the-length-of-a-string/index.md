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

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top" >}}
package example

import "strings"

// 2 examples that use only single-byte, ASCII characters
ascii: {
	constrain_runes: "only ASCII characters" // 21 runes composed of 21 bytes
	// enforce that the field contains between 2 and 8 runes
	constrain_runes: strings.MinRunes(2) & strings.MaxRunes(8)

	constrain_bytes: {
		// set up an alias to allow the following CUE to refer to it
		let content = "only ASCII characters" // 21 runes composed of 21 bytes

		// this embedded scalar ultimately sets the value of the containing field,
		// "constrain_bytes"
		content

		// enforce that "content" contains between 50 and 100 bytes
		#bytes: len(content) & >=50 & <=100
	}
}

// 2 examples that use multi-byte, South Korean Hangul characters
multibyte: {
	constrain_runes: "한글" // 2 runes composed of 6 bytes
	// enforce that the field contains 5 or fewer runes
	constrain_runes: strings.MaxRunes(5)

	constrain_bytes: {
		// set up an alias to allow the following CUE to refer to it
		let content = "한글" // 2 runes composed of 6 bytes

		// this embedded scalar ultimately sets the value of the containing field,
		// "constrain_bytes"
		content

		// enforce that "content" contains 5 or fewer bytes
		#bytes: len(content) & <=5
	}
}

// 2 examples that use multi-byte, emoji characters
emoji: {
	constrain_runes: "😄🥵🙃🥶" // 4 runes composed of 16 bytes
	// enforce that the field contains 10 or more runes
	constrain_runes: strings.MinRunes(10)

	constrain_bytes: {
		// set up an alias to allow the following CUE to refer to it
		let content = "😄🥵🙃🥶" // 4 runes composed of 16 bytes

		// this embedded scalar ultimately sets the value of the containing field,
		// "constrain_bytes"
		content

		// enforce that "content" contains 10 or more bytes
		#bytes: len(content) & >=10
	}
}
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example" type="terminal" area="bottom" >}}
ascii.constrain_runes: invalid value "only ASCII characters" (does not satisfy strings.MaxRunes(8)):
    ./example.cue:9:41
    ./example.cue:7:19
    ./example.cue:9:19
    ./example.cue:9:58
ascii.constrain_bytes.#bytes: invalid value 21 (out of bound >=50):
    ./example.cue:20:26
    ./example.cue:20:11
multibyte.constrain_bytes.#bytes: invalid value 6 (out of bound <=5):
    ./example.cue:39:26
    ./example.cue:39:11
emoji.constrain_runes: invalid value "😄🥵🙃🥶" (does not satisfy strings.MinRunes(10)):
    ./example.cue:47:19
    ./example.cue:45:19
    ./example.cue:47:36
{{< /code-tab >}}

{{< /code-tabs >}}

{{< info >}}
The "len()"-based examples use an embedded scalar value with an alias to permit
their fields to be of type "string" whilst *also* allowing their byte lengths
to be constrained.

This pattern will be obsoleted by the "must()" directive, which is tracked
in this CUE Issue: <https://github.com/cue-lang/cue/issues/575>.
{{< /info >}}

## Related content

TODO
