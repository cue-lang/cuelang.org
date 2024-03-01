---
title: JSON Superset
weight: 30
---

In its simplest form, CUE looks a lot like JSON.
This is because CUE is a superset of JSON.\
Or, put differently: **all valid JSON is CUE** (but not vice versa).
 
CUE significantly reduces the pain of dealing with JSON
by introducing several conveniences, including:

- C-style **comments** are allowed
- field names without special characters don't need to be quoted
- commas after a field are optional (and are usually omitted)
- commas after the final element of a list are allowed
- the outermost curly braces in a CUE file are optional

JSON objects are called **structs** or **maps** in CUE,
and object members are called **fields**.
JSON arrays are called **lists**.

{{< info >}}
Throughout this tour there are examples that show
some CUE,
a command that processes it,
and then the command's output
\- with each pane featuring a mouseover button that copies the related text to
your clipboard.
Here's an example that uses `cue export` to turn `file.cue` into JSON.
{{< /info >}}

{{{with code "en" "tour"}}}
exec cue export file.cue --out json
cmp stdout out
-- file.cue --
import "math"

// Simple field names don't need to be quoted.
one:       1
two:       2
piPlusOne: math.Pi + 1

// Field names must be quoted if they contain
// special characters, such as hyphen and space.
"quoted field names": {
	"two-and-a-half":    2.5
	"three point three": 3.3
	"four^four":         math.Pow(4, 4)
}

aList: [
	1,
	2,
	3,
]
-- out --
{
    "one": 1,
    "two": 2,
    "piPlusOne": 4.141592653589793238462643383279503,
    "quoted field names": {
        "two-and-a-half": 2.5,
        "three point three": 3.3,
        "four^four": 256
    },
    "aList": [
        1,
        2,
        3
    ]
}
{{{end}}}
