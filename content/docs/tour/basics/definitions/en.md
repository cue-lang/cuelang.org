---
title: Definitions
weight: 150
---

In CUE, schemas are typically written as **definitions**.
A definition is
a field whose identifier starts with `#` or `_#`.

Because CUE knows that
definitions are intended to be used for validation,
they aren't output as data
\- and can therefore remain unspecified,
not containing concrete values.

A definition also
tells CUE the complete set of allowed fields,
meaning that
evaluations will fail
if any additional fields are specified.
We say that
such a definition defines
a  **closed** struct,
as demonstrated below.
It is closed *recursively*.

**Embedding**
an ellipsis (`...`)
in a struct
keeps it **open**,
non-recursively,
and permits additional fields to be specified
at the scope of the ellipsis.

{{{with code "en" "tour"}}}
! exec cue vet file.cue
cmp stderr out
-- file.cue --
#Conn: {
	address:  string
	port:     int
	protocol: string

	// If this ellipsis is uncommented, any
	// additional fields at this scope would
	// be permitted:
	// ...
}

lossy: #Conn
lossy: {
	address:  "203.0.113.42"
	port:     8888
	protocol: "udp"

	// This field is not specified in #Conn,
	// and its presence causes an evaluation
	// failure.
	timeout: 30
}
-- out --
lossy.timeout: field not allowed:
    ./file.cue:1:8
    ./file.cue:12:8
    ./file.cue:21:2
{{{end}}}
