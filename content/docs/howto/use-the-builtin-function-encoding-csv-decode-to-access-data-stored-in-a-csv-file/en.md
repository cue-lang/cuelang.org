---
title: Using the builtin function "encoding/csv.Decode" to access data stored in a CSV file
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `encoding/csv.Decode` to decode a
file containing comma-separated values (CSV) into a list of lists.

{{{with code "en" "cc"}}}
exec cue export .:example -l input: text: data.csv -e output
cmp stdout out
-- data.csv --
Id,Name,Location,Species
1,Charlie,"Ripon, North Yorkshire",cat
2,Fred,San Francisco,cat
3,Greyfriars Bobby,Edinburgh,dog
4,Nemo,???,fish
-- file.cue --
package example

import "encoding/csv"

input:  string
output: csv.Decode(input)
-- out --
[
    [
        "Id",
        "Name",
        "Location",
        "Species"
    ],
    [
        "1",
        "Charlie",
        "Ripon, North Yorkshire",
        "cat"
    ],
    [
        "2",
        "Fred",
        "San Francisco",
        "cat"
    ],
    [
        "3",
        "Greyfriars Bobby",
        "Edinburgh",
        "dog"
    ],
    [
        "4",
        "Nemo",
        "???",
        "fish"
    ]
]
{{{end}}}

## Related content

- The [`encoding/csv`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/csv) builtin package
