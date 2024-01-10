---
title: Using the builtin functions "list.Avg", "list.Max", "list.Min, and "list.Sum" to summarise lists of numbers
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin functions `list.Avg`, `list.Max`,
`list.Min` and `list.Sum` to calculate various simple summary statistics for a
list of numbers including the list's arithmetic mean, its maximum and minimum
values, and the sum of its values.

{{{with code "en" "cc"}}}
#location left right

exec cue eval
cmp stdout out
-- file.cue --
package example

import "list"

sum:  list.Sum(_data)
min:  list.Min(_data)
max:  list.Max(_data)
mean: list.Avg(_data)

manualMean: sum / len(_data)

_data: [
	-0.00000000001,
	0,
	1,
	5,
	10,
	42,
	-999,
]
-- out --
sum:        -941.00000000001
min:        -999
max:        42
mean:       -134.4285714285728571428571428571429
manualMean: -134.4285714285728571428571428571429
{{{end}}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) builtin package
