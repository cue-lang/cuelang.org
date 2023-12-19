---
title: Definitions
weight: 150
---

In CUE, schemas are typically written as Definitions.
A definition is a field which identifier starts with
`#` or `_#`.
This tells CUE that they are to be used for validation and should
not be output as data; it is okay for them to remain unspecified.

A definition also tells CUE the full set of allowed fields.
In other words, definitions define "closed" structs.
Including a `...` in struct keeps it open.

{{{with code "en" "example"}}}
exec cue export schema.cue
cmp stdout result.txt
-- schema.cue --
#Conn: {
	address:  string
	port:     int
	protocol: string
	// uncomment this to allow any field
	// ...
}

lossy: #Conn & {
	address:  "1.2.3.4"
	port:     8888
	protocol: "udp"
	// uncomment this to get an error
	// foo: 2
}
-- result.txt --
{
    "lossy": {
        "address": "1.2.3.4",
        "port": 8888,
        "protocol": "udp"
    }
}
{{{end}}}
