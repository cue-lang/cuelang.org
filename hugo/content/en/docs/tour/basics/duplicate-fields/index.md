---
title: Duplicate Fields
weight: 90
---

CUE allows **duplicate** field definitions so long as they don't conflict.
If they don't conflict then we say that they **unify** successfully.
**Unification** either uses the explicit `&` operator,
or happens implicitly whenever any field is redeclared.

For concrete data,
unification of basic types requires that all duplicate field values must be equal.\
Within structs, fields are unified and duplicates are handled recursively.\
Similarly, within lists, elements are unified and duplicates are handled recursively.
<!-- ([we discuss open-ended lists later](/language-guide/data/lists/).) -->

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
N: 1
L: [1, 2, {a: 3}]
S: {
	a: 2
	b: {c: 3}
}

// Implicit unification.
N: 1
L: [1, 2, {b: 4}]
S: {
	a: 2
	b: {d: 4}
}

S: {
	// Explicit unification.
	c: L & [1, 2, {c: 5}]
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
N: 1
L: [1, 2, {
    a: 3
    b: 4
}]
S: {
    a: 2
    c: [1, 2, {
        a: 3
        b: 4
        c: 5
    }]
    b: {
        c: 3
        d: 4
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}
