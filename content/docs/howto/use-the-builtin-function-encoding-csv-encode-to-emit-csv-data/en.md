---
title: Using the builtin function "encoding/csv.Encode" to emit CSV data
tags:
- commented cue
- encodings
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `encoding/csv.Encode` to encode a
list of lists into a string as comma-separated values (CSV).

{{{with code "en" "cc"}}}
exec cue export -e output --out text
cmp stdout out
-- file.cue --
package example

import "encoding/csv"

data: [
	["Id", "Name", "Location", "Species"],
	["1", "Charlie", "Ripon, North Yorkshire", "cat"],
	["2", "Fred", "San Francisco", "cat"],
	["3", "Greyfriars Bobby", "Edinburgh", "dog"],
	["4", "Nemo", "???", "fish"],
]

output: csv.Encode(data)
-- out --
Id,Name,Location,Species
1,Charlie,"Ripon, North Yorkshire",cat
2,Fred,San Francisco,cat
3,Greyfriars Bobby,Edinburgh,dog
4,Nemo,???,fish

{{{end}}}

## Related content

- The [`encoding/csv`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/csv) builtin package
