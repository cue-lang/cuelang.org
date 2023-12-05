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

This [Commented CUE](/search/?q=tag:"commented%20cue") demonstrates howto
constrain a field to contain a string representations of integer values.

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue"  area="top-left" >}}
package example

import "strconv"

// Constrain s1 and s2 to be the string
// interpolation of the result of converting
// their respective values to integers.
s1?: "\(strconv.Atoi(s1))"
s2?: "\(strconv.Atoi(s2))"
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml"  area="top-right" >}}
# s1 is a valid integer
s1: "137"

# s2 is not a valid integer
s2: "42.7"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="err" type="terminal" area="bottom" >}}
$ cue vet .:example data.yml
s2: invalid interpolation: error in call to strconv.Atoi: strconv.Atoi: parsing "42.7": invalid syntax:
    ./example.cue:9:6
    ./example.cue:9:9
{{< /code-tab >}}
{{< /code-tabs >}}

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
