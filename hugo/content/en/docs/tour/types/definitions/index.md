---
title: Definitions
weight: 90
aliases:
- /docs/tour/types/defs
---

In CUE, schemas are typically written as **definitions**.
A definition is a field whose identifier starts with `#` or `_#`.

Because CUE knows that definitions are used for validation,
they aren't output as data.\
It's normal for definitions to specify fields that don't have concrete values,
such as types.

A definition also tells CUE the complete set of allowed fields in a struct.\
Referring to a definition **closes** any structs and lists recursively.
Structs and lists can be left **open** using `...`.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
message: "Hello, \(#Name)!"
#Name:   "world"

#A: {
	n: int
	// Uncomment this to allow any field.
	// ...
}

valid: #A & {n: 3}
invalid: #A & {N: 3}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWljIGZpbGUuY3Vl" >}}
$ cue eval -ic file.cue
message: "Hello, world!"
valid: {
    n: 3
}
invalid: {
    n: int
    N: _|_ // invalid.N: field not allowed
}
{{< /code-tab >}}
{{< /code-tabs >}}
