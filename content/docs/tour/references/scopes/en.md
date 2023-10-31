---
title: "References and Scopes"
weight: 1
---

A reference refers to the value of the field defined within the nearest
enclosing scope.

If no field matches the reference within the file, it may match a top-level
field defined in any other file of the same package.

If there is still no match, it may match a predefined value.

{{{with code "en" "scopes"}}}
-- in.cue --
v: 1
a: {
	v: 2
	b: v // matches the inner v
}
a: {
	c: v // matches the top-level v
}
b: v
-- out.cue --
v: 1
a: {
    v: 2
    c: 1
    b: 2
}
b: 1
{{{end}}}
