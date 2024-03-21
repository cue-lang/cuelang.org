---
title: "Currently broken CUE syntax highlighting"
toc_hide: true
---

This page exists solely to demonstrate the current state of Hugo/Chroma's CUE
syntax highlighting, specifically on language elements that aren't handled well.

```cue
// Some types aren't highlighted the same as others
Types: {
	x: bytes // unhighlighted
	x: float
	x: int
	x: null   // bold but not blue, but maybe that's because it's a keyword
	x: number // unhighlighted
	x: string
}

// Quotes inside other string forms break out of string highlighting
Quotes: {
	x: #" foo "bar" baz "#
	x: """
		foo "bar" baz
		"""
	x: "foo \"bar\" baz" // works
	// Modified escape delimiters interact poorly with quotes inside strings
	Escapes: {
		x: #"foo "\U12345678" baz"#
		x: ##"""
			Here's a regex:
			    #"\d{3}"#
			"""##
	}
}

// Tags' at signs appear as an error
Tags: {
	who: *"World" | string @tag(who) // @-sign is red
}
```
