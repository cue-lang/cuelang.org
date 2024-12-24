---
title: Ensuring a list is a subset of another list
tags: [commented cue]
authors: [jpluscplusm]
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to make sure that a list of concrete, simple values only
contains elements that are *also* present in another list.
In other words, how to ensure that one list is a subset of another list.

{{{with code "en" "cc"}}}
! exec cue vet
cmp stderr out
-- file.cue --
package example

_X: ["a", "b", "c"]

A: ["a", "a", "b", "a"]
// A must contain only values in _X.
A: [...or(_X)]

B: ["a", "b", "b", "E"]
// B must be a subset of _X.
B: [...or(_X)]
-- out --
B.3: 3 errors in empty disjunction:
B.3: conflicting values "a" and "E":
    ./file.cue:3:6
    ./file.cue:9:20
    ./file.cue:11:5
B.3: conflicting values "b" and "E":
    ./file.cue:3:11
    ./file.cue:9:20
    ./file.cue:11:5
B.3: conflicting values "c" and "E":
    ./file.cue:3:16
    ./file.cue:9:20
    ./file.cue:11:5
{{{end}}}

{{<info>}}
This guide shows some lists of concrete and simple values being validated against another list.

The technique it demonstrates can also be used to validate incomplete
(non-concrete) and composite (struct and list) values, but the rules around its
use are nuanced and evolving.

{{<issue 2583>}}Issue #2583{{</issue>}} tracks some open questions about
comparability in CUE that are worth considering before using this technique
to validate more complex values.
{{</info>}}

## Related content

- {{<issue 2583>}}Issue #2583{{</issue>}}
- Reference: [The CUE Language Specification: Comparison operators]({{< relref "docs/reference/spec" >}}#comparison-operators)
  -- CUE's comparability rules
