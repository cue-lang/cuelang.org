---
title: JSON Superset
weight: 30
---

CUE is a superset of JSON.
It adds the following conveniences:

- C-style comments,
- quotes may be omitted from field names without special characters,
- commas at the end of fields are optional,
- comma after last element in list is allowed,
- outer curly braces are optional.

JSON objects are called structs in CUE.
An object member is called a field.

{{{with code "en" "example"}}}
exec cue export json.cue
cmp stdout result.txt
-- json.cue --
one: 1
two: 2

// A field using quotes.
"two-and-a-half": 2.5

list: [
	1,
	2,
	3,
]
-- result.txt --
{
    "one": 1,
    "two": 2,
    "two-and-a-half": 2.5,
    "list": [
        1,
        2,
        3
    ]
}
{{{end}}}
