---
title: Using "list.MaxItems" and "list.MinItems" to constrain the length of a list
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
aliases:
- ensure-min-max-list
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`list.MaxItems`](https://pkg.go.dev/cuelang.org/go/pkg/list#MaxItems) and
[`list.MinItems`](https://pkg.go.dev/cuelang.org/go/pkg/list#MinItems)
to require that a list contains a maximum and/or minimum number of items.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

import "list"

a: [1, 2, 3, 4, 5]
b: [1, 2, 3, 4, 5]
c: [1, 2, 3, 4, 5]

// a must contain no more than 2 items
a: list.MaxItems(2)

// b must contain at least 6 items
b: list.MinItems(6)

// c must contain at least 2 items, and no more than 6 items
c: list.MinItems(2) & list.MaxItems(6)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
a: invalid value [1,2,3,4,5] (does not satisfy list.MaxItems(2)): len(list) > MaxItems(2) (5 > 2):
    ./file.cue:10:4
    ./file.cue:5:4
    ./file.cue:10:18
b: invalid value [1,2,3,4,5] (does not satisfy list.MinItems(6)): len(list) < MinItems(6) (5 < 6):
    ./file.cue:13:4
    ./file.cue:6:4
    ./file.cue:13:18
{{< /code-tab >}}
{{< /code-tabs >}}

## Alternative to `list.MinItems`

If the number of required items is both small and known in advance, then this
core language syntax might be preferred instead of `list.MinItems`:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

// f must contain at least 3 elements
f: [_, _, _, ...]

f: [1, 2]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
f: incompatible list lengths (2 and 3)
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
