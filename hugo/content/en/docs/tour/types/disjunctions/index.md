---
title: Disjunctions
weight: 100
---

**Disjunctions**, or sum types, define a new type derived from a list of
several types.

The new type allows values that match *exactly* one type from the list.

When unifying the disjunction with concrete values, it is an error if a value
is specified that does not unify successfully with at least one type from the
list.
It is also an error if a concrete value is specified that does not provide CUE
with enough information to work out which member of the disjunction applies.

The list is expressed in a visually distinct manner,
with its members separated by the pipe symbol (`|`).

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#Conn: {
	address:  string
	port:     int
	protocol: "tcp" | "udp"
}

lossy: #Conn & {
	address:  "203.0.113.42"
	port:     8888
	protocol: "udp" // acceptable value
}
error: #Conn & {
	address:  "203.0.113.42"
	port:     8888
	protocol: "IP" // evaluation failure
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWkgZmlsZS5jdWU=" >}}
$ cue eval -i file.cue
#Conn: {
    address:  string
    port:     int
    protocol: "tcp" | "udp"
}
lossy: {
    address:  "203.0.113.42"
    port:     8888
    protocol: "udp"
}
error: {
    address:  "203.0.113.42"
    port:     8888
    protocol: _|_ // error.protocol: 2 errors in empty disjunction: (and 2 more errors)
}
{{< /code-tab >}}
{{< /code-tabs >}}
