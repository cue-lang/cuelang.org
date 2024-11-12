---
title: Dynamic Fields
weight: 30
aliases:
- /docs/tour/expressions/interpolfield
---

A **dynamic field** is a field whose name, or *label*, is determined by
an expression wrapped in parentheses
or through string interpolation:
`(a + b)` or `"\(a + b)"`.

A dynamic field's identifier is not available in the scope in which the field is defined.\
Referencing dynamic fields needs to be done using
[selectors, index expressions]({{< relref "docs/tour/references/selectors" >}}),
or [aliases]({{< relref "docs/tour/references/aliases" >}}).

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
a:       "foo"
b:       "bar"
(a + b): "foobar"

s: X={
	"\(a)_and_\(b)": "foobar"

	// Valid references using a selector and
	// an index expression.
	FooAndBar: s.foo_and_bar
	FooAndBar: X["foo_and_bar"]

	// Invalid reference because the
	// indentifer is not in scope.
	//FooAndBar: foo_and_bar
}

// Valid reference using an index expression.
FooAndBar: s["foo_and_bar"]
-- out --
a: "foo"
b: "bar"
s: {
    foo_and_bar: "foobar"
    FooAndBar:   "foobar"
}
foobar:    "foobar"
FooAndBar: "foobar"
{{{end}}}
