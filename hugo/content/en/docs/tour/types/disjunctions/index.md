---
title: Disjunctions
weight: 100
---

A **disjunction**, or sum type, defines a new type derived from 
several values.
The values are called the disjunction's *elements*,
and the disjunction is defined with its elements separated by the pipe symbol (`|`).

A disjunction's new type permits values that unify successfully with at least
one of its elements.
When a value constrained by a disjunction is exported it must unify
successfully with *only one* value from the list.

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
	protocol: "IP" // invalid value
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
