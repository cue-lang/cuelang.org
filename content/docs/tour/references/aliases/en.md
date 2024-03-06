---
title: Aliases
weight: 30
---

**Aliases** and **let declarations** both provide a way to access a value via a
different name.

They are typically used to access a field in an outer scope that has been made
inaccessible (or *shadowed*) by the same field name existing in an inner scope.

Both aliases and let declarations use an equals sign (`=`) to assign an
identifier its value, and let declarations begin with the `let` keyword.
Their slightly different applications are nuanced,
but they provide the same fundamental capability.
In general, if you have a choice of which form to use, choose an alias.

Aliases and let declarations are *not* members of a struct.
They do not appear in output,
and can only be referenced within the scope in which they are defined.

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
a: b: "this is a.b"

let A = a
c: {
	a: {// this field shadows the outer "a"
		c: A.b
	}
}

d: D={
	e: "this is d.e"
	f: {
		e: {// this field shadows the outer "e"
			g: D.e
		}
	}
}
-- out --
a: {
    b: "this is a.b"
}
c: {
    a: {
        c: "this is a.b"
    }
}
d: {
    e: "this is d.e"
    f: {
        e: {
            g: "this is d.e"
        }
    }
}
{{{end}}}
