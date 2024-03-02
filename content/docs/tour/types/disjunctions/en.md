---
title: Disjunctions
weight: 100
---

**Disjunctions**, or sum types, define a new type derived from a list of
several types.
The list is encoded with its members separated by the pipe symbol (`|`).

The new type allows values that unify successfully with at least one type from the list.\
When the value is concrete and is being exported, the value must unify
successfully with *only* one type from the list.


{{{with code "en" "tour"}}}
exec cue eval -i file.cue
cmp stdout out
-- file.cue --
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
-- out --
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
{{{end}}}
