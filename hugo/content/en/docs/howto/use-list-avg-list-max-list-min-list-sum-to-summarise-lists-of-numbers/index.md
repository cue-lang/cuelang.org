---
title: Using "list.Avg", "list.Max", "list.Min, and "list.Sum" to summarise lists of numbers
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`list.Avg`](://pkg.go.dev/cuelang.org/go/pkg/list#Avg),
[`list.Max`](https://pkg.go.dev/cuelang.org/go/pkg/list#Max),
[`list.Min`](https://pkg.go.dev/cuelang.org/go/pkg/list#Min), and
[`list.Sum`](https://pkg.go.dev/cuelang.org/go/pkg/list#Sum)
to calculate various simple summary statistics for a list of numbers including
the list's arithmetic mean, its maximum and minimum values, and the sum of its
values.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="left" >}}
package example

import "list"

sum:  list.Sum(_data)
min:  list.Min(_data)
max:  list.Max(_data)
mean: list.Avg(_data)

_data: [
	-0.00000000001,
	0,
	1,
	5,
	10,
	42,
	-999,
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV2YWw=" >}}
$ cue eval
sum:  -941.00000000001
min:  -999
max:  42
mean: -134.4285714285728571428571428571429
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
