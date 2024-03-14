---
title: Using "encoding/csv.Decode" to access data stored in a CSV file
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`encoding/csv.Decode`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/csv#Decode)
to decode a file containing comma-separated values (CSV) into a list of lists.

{{< code-tabs >}}
{{< code-tab name="data.csv" language="csv" area="top-left" >}}
Id,Name,Location,Species
1,Charlie,"Ripon, North Yorkshire",cat
2,Fred,San Francisco,cat
3,Greyfriars Bobby,Edinburgh,dog
4,Nemo,???,fish
{{< /code-tab >}}
{{< code-tab name="file.cue" language="cue" area="top-right" >}}
package example

import "encoding/csv"

input:  string
output: csv.Decode(input)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtbCBpbnB1dDogdGV4dDogZGF0YS5jc3YgLWUgb3V0cHV0" >}}
$ cue export file.cue -l input: text: data.csv -e output
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
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`encoding/csv`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/csv) built-in package
