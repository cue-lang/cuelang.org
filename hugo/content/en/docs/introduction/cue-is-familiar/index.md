---
title: A Familiar Look and Feel
weight: 10
---

CUE will probably feel rather familiar if you've spent any time working with
data. CUE shares some syntax with JSON, but *significantly* improves the
experience of managing JSON by hand.

In its simplest form, CUE looks a lot like JSON.
This is because CUE is defined to be a *superset* of JSON - which means that
all valid JSON is CUE, but not vice versa.
Editing JSON manually can be somewhat awkward, so CUE introduces several
conveniences to make writing and reading data easier:

- comments are allowed, starting with `//` and extending to the end of the line
- field names without special characters don’t need to be quoted
- the outermost curly braces in a CUE file are optional
- commas after a field are optional (and are usually omitted)
- commas after the final element of a list are allowed
- literal multiline strings are allowed, and don't require newlines to be encoded
- nested structs containing one (or a few) fields have a convenient shorthand

Here's some data encoded as commented CUE, alongside the equivalent JSON
document. Notice how the CUE lacks curly braces at the top and bottom, and
doesn't have commas after each field's value:

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="left" >}}
strings: {
	singleLine: "Double quotes == string literal"
	multiLine: """
		Multiline strings start and end with triple
		double-quotes - no escaping of newlines!
		"""
}

// Many field names don't need to be quoted
// (but can be, if you want).
foo_Bar: 1
baz2:    2.2

// Some field names do need quotes, such as those
// that start with numbers, or contain spaces,
// hyphens, or other special characters.
"qu ux": "3.33"
"4":     "four"

a: deeply: nested: field: "value"

a: deeply: nested: struct: {
	containing: "multiple"
	fields:     true
}

// A list's final element can be followed by
// an optional comma.
aList: [
	"a",
	"b",
	"c",
]
anotherList: [1, 2, 3, 4, 5]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBleGFtcGxlLmN1ZSAtLW91dCBqc29u" >}}
$ cue export example.cue --out json
{
    "strings": {
        "singleLine": "Double quotes == string literal",
        "multiLine": "Multiline strings start and end with triple\ndouble-quotes - no escaping of newlines!"
    },
    "foo_Bar": 1,
    "baz2": 2.2,
    "qu ux": "3.33",
    "4": "four",
    "a": {
        "deeply": {
            "nested": {
                "field": "value",
                "struct": {
                    "containing": "multiple",
                    "fields": true
                }
            }
        }
    },
    "aList": [
        "a",
        "b",
        "c"
    ],
    "anotherList": [
        1,
        2,
        3,
        4,
        5
    ]
}
{{< /code-tab >}}
{{< /code-tabs >}}

However, most CUE users don't choose CUE simply because it's nicer to handle
than JSON - that's just a pragmatic consequence of the language's design.
Folks adopt CUE because of its revolutionary features, and these stem from its
concepts and syntaxes that *won't* seem quite as familiar.

We'll take a look at them next, in
[*Some Unique Differences*]({{< relref "cue-is-different" >}}) ...