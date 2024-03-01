---
title: Duplicate Fields
weight: 90
---

CUE allows duplicate field definitions so long as they don't conflict.\
If they don't conflict then we say that they are able to **unify**
successfully.

For concrete data, **unification** of basic types requires that all duplicate
field values must be equal.

Within structs, fields are unified and duplicates are handled recursively, as
described here.\
Similarly, within lists, elements are unified and duplicates are handled
recursively.
<!-- ([we discuss open-ended lists later](/language-guide/data/lists/).) -->

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
a: 1
a: 1

s: {
	b: 2
	c: {d: 3}
}
s: {
	c: {e: 4}
	f: 2
}

l: [1, 2, {a: 3}]
l: [1, 2, {b: 4}]
-- out --
a: 1
s: {
    b: 2
    c: {
        d: 3
        e: 4
    }
    f: 2
}
l: [1, 2, {
    a: 3
    b: 4
}]
{{{end}}}
