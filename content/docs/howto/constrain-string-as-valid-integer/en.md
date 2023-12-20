---
title: Constrain a string to be a valid integer
tags:
- validation
- commented cue
authors:
- jpluscplusm
- myitcv
relatedIssues:
- https://github.com/cue-lang/docs-and-content/issues/112: "CC cross-package adaptor"
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/32: "tour of the CUE standard library"
- https://github.com/cue-lang/docs-and-content/issues/114: "CC explainer"
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to constrain fields to contain string representations of
integer values.

{{{with code "en" "example"}}}
! exec cue vet .:example data.yml
cmp stderr out.err
-- example.cue --
package example

import "strconv"

// Constrain s1 and s2 to be the string
// interpolation of the result of converting
// their respective values to integers.
s1?: "\(strconv.Atoi(s1))"
s2?: "\(strconv.Atoi(s2))"
-- data.yml --
# s1 is a valid integer
s1: "137"

# s2 is not a valid integer
s2: "42.7"
-- out.err --
s2: invalid interpolation: error in call to strconv.Atoi: strconv.Atoi: parsing "42.7": invalid syntax:
    ./example.cue:9:6
    ./example.cue:9:9
{{{end}}}

The constraint enforces that the concrete values of `s1` and `s2` are equal to
the `string`-to-`int`-to-`string` conversions of those same values. This process
must start and end with identical values, otherwise validation fails, as in the
case of `s2`.

{{< info >}}
`cue`'s error messages can, at times, be rather hard to interpret. This is an
area we are actively looking to improve. Please [raise bug
reports](https://github.com/cue-lang/cue/issues/new/choose) with examples
you find hard to understand.
{{< /info >}}

## Related content

<!-- * [**Unification**](TODO) in the CUE Language Guide -->
* [**The `strconv` package**](https://pkg.go.dev/cuelang.org/go/pkg/strconv) in
the CUE standard library
