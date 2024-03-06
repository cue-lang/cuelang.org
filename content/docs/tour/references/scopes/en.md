---
title: References and Scopes
weight: 10
---

A **reference** refers to the value of the field defined within the nearest
enclosing **scope**.

If a reference doesn't match a field within the same file,
then it may match a top-level field defined in any other file making up the
same CUE package.

If there is still no match then it may match a predefined value, such as a
[predefined bound]({{< relref "docs/tour/types/bounddef" >}}).

{{{with code "en" "tour"}}}
exec cue eval file.cue
cmp stdout out
-- file.cue --
v: "top level"
X: {
	v: "inside X"
	B: v // matches X.v
	C: {
		D: v // matches X.v
		E: {
			v: "inside X.C.E"
			F: {
				G: v // matches X.C.E.v
			}
		}
	}
}
Y: {
	B: v // matches the top-level v

	// C's dot notation, explicitly referencing
	// X.C.E.v, is explained on the next page.
	C: X.C.E.v
}
Z: v // matches the top-level v
-- out --
v: "top level"
X: {
    v: "inside X"
    B: "inside X"
    C: {
        D: "inside X"
        E: {
            v: "inside X.C.E"
            F: {
                G: "inside X.C.E"
            }
        }
    }
}
Y: {
    B: "top level"
    C: "inside X.C.E"
}
Z: "top level"
{{{end}}}
