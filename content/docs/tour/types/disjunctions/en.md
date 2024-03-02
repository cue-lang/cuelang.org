---
title: Disjunctions
weight: 100
---

A **disjunction**, or sum type, defines a new type consisting of two or more
options that the type will allow.

The disjunction's options are values called its *elements*,
and they are separated by the pipe symbol (`|`).

The new type allows values that unify successfully with *at least one* of its elements.
When a value constrained by a disjunction is exported it must unify
successfully with *only one* of the disjunction's elements.
<!-- TODO: should we relax or refine this wording,
given that `x: 1 & ( 1 | int )` exports successfully? -->

{{{with code "en" "tour"}}}
exec cue eval -ic file.cue
cmp stdout out
-- file.cue --
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
-- out --
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
{{{end}}}
