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

```coq
{{{with sidebyside "en" "references-basics"}}}
-- in.cue --
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
-- out.cue --
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
{{{end}}}
```

A field that uses quotes may not be referenced with its unquoted name, even if
it would otherwise be a valid identifier.

```coq
{{{with sidebyside "en" "quoted-field-reference-error"}}}
#norun need to implement #nofmt for in.cue
-- in.cue --
"foo": 2
a:     foo // error
-- out.err --
{{{end}}}
```

## Aliases

Aliases allows referring to fields with names that have to be quoted, by
allowing those to be associated with an identifier.

```coq
{{{with sidebyside "en" "aliases"}}}
-- in.cue --
X="a-b": 1 // a-b must be quoted
b:       X

Y=c: 2
d:   Y // equivalent to d: c
-- out.cue --
"a-b": 1
b:     1
c:     2
d:     2
{{{end}}}
```

List values can be similarly aliased.

<aside>
💡 TODO

</aside>

```coq
{{{with sidebyside "en" "list-aliases"}}}
#norun list aliases not yet supported
-- in.cue --
[X=1, X, X]
-- out.cue --
[1, 1, 1]
{{{end}}}
```

In most cases, instead of referencing a field alias of a parent node one should
use value aliases.

```coq
{{{with sidebyside "en" "value-alias"}}}
-- in.cue --
a: X={
	bar: X.foo
}
-- out.cue --
a: {
    bar: X.foo
}
{{{end}}}
```

<!--

*Advanced paragraph: To alias the top of a file, use `X=_`. More about this in embedding.*

-->

## Selecting fields `a.b` `a."b"`

The `.x` notation is used to select a field within a map or element within a
list.
The value of `x` must be an {{{reference "identifier"}}} or a quoted string when
referencing a field in a map or an integral number when referring to an element
in a list.

```coq
{{{with sidebyside "en" "field-selector"}}}
#norun numerice selector not supported yet
-- in.cue --
a: {
    b:         2
    "foo-bar": 3
}
b: [{}, { foo: 4 }]

x: a.b
y: a."foo-bar"
z: b.1.foo
-- out.cue --

{{{end}}}
```

## Dynamically selecting fields `a.(x)` `a."\(x)"` `a[x]`

The `.(x)` notation is used to select a field within a map or element within a
list for a key that is dynamically computed.

An alternative notation for this is `a[x]`.
The main difference is that it allows negative indices to index from the end of
a list.

```coq
{{{with sidebyside "en" "dynamic-field-selector"}}}
#norun .(x) not implemented yet
-- in.cue --
a: B: 1
b: "B"
c: [0, 1, 2]

x: a.(b)
y: c.(x)
z: b[-1]
-- out.cue --
{{{end}}}
```

<!-- TODO: : billion laughs: YAML problem: CUE equivalent. Evaluation is fine. -->

## Let expressions

Use `let` expressions for values that need to appear multiple times, but without
making one field depend on another and without using helper fields.
Each reference to a let expression is unique: let expressions never clash when
merging two maps.

```coq
{{{with sidebyside "en" "let-expressions"}}}
#norun open lists not implemented yet
-- in.cue --
 let X = {list: []}
a: X
b: X
c: X

// Setting any of the above fields does not influence the other.
b: list: [1, 2]
-- out.cue --
{{{end}}}
```

