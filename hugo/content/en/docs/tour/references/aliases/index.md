---
title: "Aliases"
weight: 3
---

An alias defines a local macro.

A typical use case is to provide access to a shadowed field.

Aliases are not members of a struct. They can be referred to only within the
struct, and they do not appear in the output.

{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
 let A = a // A is an alias for a
a: {
	d: 3
}
b: {
	a: {
		// A provides access to the outer "a" which would
		// otherwise be hidden by the inner one.
		c: A.d
	}
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="text" type="terminal" area="top-right" >}}
a: {
    d: 3
}
b: {
    a: {
        c: 3
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}
