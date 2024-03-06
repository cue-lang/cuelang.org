---
title: Accessing Fields
weight: 20
---

**Selectors** access fields within a struct using dot notation (`.name`) or
indexing notation (`["name"]`).

Dot notation can be used if a field name is
[a valid CUE identifier]({{< relref "docs/reference/spec#identifiers" >}}).

In other cases, including computed references and non-valid identifiers,
indexing notation can be used.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
one:   #n.a & #n["a"] // Equivalent references
two:   #n.b           // Valid identifer
three: #n["c d"]      // Non-valid identifier
four:  #n[#E+"f"]     // Computed reference
five:  #n.#g          // Valid identifier

#E: "e"
#n: {
	a:     1
	"b":   2
	"c d": 3
	ef:    4
	#g:    5
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "one": 1,
    "two": 2,
    "three": 3,
    "four": 4,
    "five": 5
}
{{< /code-tab >}}
{{< /code-tabs >}}
