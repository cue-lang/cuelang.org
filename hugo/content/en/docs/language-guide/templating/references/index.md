---
title: References
weight: 10
draft: false
---


Any node may reference another node to use it as is, compose it with other
values, or use it in an expression. A node references another node by means of a
path relative to one of its parent nodes.

{{{with sidetrack}}}
YAML also allows referencing values by means of anchors. Anchors mark node
locations with a globally unique name that can be used anywhere in the tree.
JSON has no way to specify such reuse.
{{{end}}}

## Field references

A field reference is an identifier that references a field with a name using
that identifier in any of the parent nodes.
If there are multiple parents with the same name, the “innermost” name parent wins.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: 1
b: a
c: {
	a: 2
	// innermost wins
	b: a
}
d: {
	"a": 2
	// refers to top-level, as parent is quoted
	b: a
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: 1
b: 1
c: {
    a: 2
    b: 2
}
d: {
    a: 2
    b: 1
}
{{< /code-tab >}}
{{< /code-tabs >}}

A field that uses quotes may not be referenced with its unquoted name, even if
it would otherwise be a valid identifier.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
"foo": 2
a:     foo // error
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" type="terminal" area="top-right" >}}
{{< /code-tab >}}
{{< /code-tabs >}}

## Aliases

Aliases allows referring to fields with names that have to be quoted, by
allowing those to be associated with an identifier.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
X="a-b": 1 // a-b must be quoted
b:       X

Y=c: 2
d:   Y // equivalent to d: c
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
"a-b": 1
b:     1
c:     2
d:     2
{{< /code-tab >}}
{{< /code-tabs >}}

List values can be similarly aliased.

<aside>
💡 TODO

</aside>

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
[X=1, X, X]
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
[1, 1, 1]
{{< /code-tab >}}
{{< /code-tabs >}}

In most cases, instead of referencing a field alias of a parent node one should
use value aliases.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: X={
	bar: X.foo
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: {
    bar: X.foo
}
{{< /code-tab >}}
{{< /code-tabs >}}

<!--

*Advanced paragraph: To alias the top of a file, use `X=_`. More about this in embedding.*

-->

## Selecting fields `a.b` `a."b"`

The `.x` notation is used to select a field within a map or element within a
list.
The value of `x` must be an {{{reference "identifier"}}} or a quoted string when
referencing a field in a map or an integral number when referring to an element
in a list.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: {
    b:         2
    "foo-bar": 3
}
b: [{}, { foo: 4 }]

x: a.b
y: a."foo-bar"
z: b.1.foo
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}

{{< /code-tab >}}
{{< /code-tabs >}}

## Dynamically selecting fields `a.(x)` `a."\(x)"` `a[x]`

The `.(x)` notation is used to select a field within a map or element within a
list for a key that is dynamically computed.

An alternative notation for this is `a[x]`.
The main difference is that it allows negative indices to index from the end of
a list.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: B: 1
b: "B"
c: [0, 1, 2]

x: a.(b)
y: c.(x)
z: b[-1]
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
{{< /code-tab >}}
{{< /code-tabs >}}

<!-- TODO: : billion laughs: YAML problem: CUE equivalent. Evaluation is fine. -->

## Let expressions

Use `let` expressions for values that need to appear multiple times, but without
making one field depend on another and without using helper fields.
Each reference to a let expression is unique: let expressions never clash when
merging two maps.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
 let X = {list: []}
a: X
b: X
c: X

// Setting any of the above fields does not influence the other.
b: list: [1, 2]
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
{{< /code-tab >}}
{{< /code-tabs >}}

