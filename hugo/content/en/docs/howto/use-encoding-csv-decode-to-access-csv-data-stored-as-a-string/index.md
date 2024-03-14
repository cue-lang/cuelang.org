---
title: Using "encoding/csv.Decode" to access CSV data stored as a string
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
to decode a string containing comma-separated values (CSV) into a list of
lists.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

import "encoding/csv"

data: """
	Id,Name,Location,Species
	1,Charlie,"Ripon, North Yorkshire",cat
	2,Fred,San Francisco,cat
	3,Greyfriars Bobby,Edinburgh,dog
	4,Nemo,???,fish
	"""

output: csv.Decode(data)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtZSBvdXRwdXQ=" >}}
$ cue export -e output
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
