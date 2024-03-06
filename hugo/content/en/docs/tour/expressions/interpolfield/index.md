---
title: Dynamic Fields
weight: 30
---

A **dynamic field** is a field whose name, or *label*,
is determined by an expression wrapped in parentheses: `(a + b)`

A dynamic field's identifier is not available in the scope in which the field is defined.\
Referencing dynamic fields needs to be done using
[selectors, index expressions]({{< relref "docs/tour/references/selectors" >}}),
and [aliases]({{< relref "docs/tour/references/aliases" >}}).

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
a:       "foo"
b:       "bar"
(a + b): "foobar"

s: X={
	"\(a)\(b)": "foobar"

	// Valid references using a selector and
	// an index expression.
	FooBar: s.foobar
	FooBar: X["foobar"]

	// Invalid reference because the
	// indentifer is not in scope.
	//FooBar: foobar
}

// Valid reference using an index expression.
FooBar: s["foobar"]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
a: "foo"
b: "bar"
s: {
    foobar: "foobar"
    FooBar: "foobar"
}
foobar: "foobar"
FooBar: "foobar"
{{< /code-tab >}}
{{< /code-tabs >}}
