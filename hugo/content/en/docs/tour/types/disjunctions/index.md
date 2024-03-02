---
title: Disjunctions
weight: 100
---

A **disjunction**, or sum type,
defines a constraint consisting of two or more options that are allowed.

The disjunction's options are values called its *elements*.
They are written separated by the pipe symbol (`|`).

A disjunction allows values
that unify successfully with *at least one* of its elements.
When a value constrained by a disjunction is exported
it must unify successfully with *only one* of the disjunction's elements.
<!-- TODO: should we relax or refine this wording,
given that `x: 1 & ( 1 | int )` exports successfully? -->

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
#Conn: {
	address:  string
	port:     int
	protocol: "tcp" | "udp" | "sctp" | "dccp"
}

lossy: #Conn & {
	address:  "203.0.113.42"
	port:     8888
	protocol: "udp" // acceptable value
}
error: #Conn & {
	address:  "203.0.113.42"
	port:     8888
	protocol: "IP" // invalid value
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLWljIGZpbGUuY3Vl" >}}
$ cue eval -ic file.cue
lossy: {
    address:  "203.0.113.42"
    port:     8888
    protocol: "udp"
}
error: {
    address:  "203.0.113.42"
    port:     8888
    protocol: _|_ // error.protocol: 4 errors in empty disjunction: (and 4 more errors)
}
{{< /code-tab >}}
{{< /code-tabs >}}
