---
title: Constrain a string to be a valid integer
tags:
- constraints
- cue-by-example
relatedIssues:
- https://github.com/cue-lang/docs-and-content/issues/112: "CBE cross-package adaptor"
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/32: "tour of the CUE standard library"
- https://github.com/cue-lang/docs-and-content/issues/114: "CUE By Example explainer"
---

This [CUE By Example](TODO:Explainer) guide demonstrates constraining a field
to contain only string representations of integer values.

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

// the builtin strconv package
// contains a function that
// converts strings to integers

import "strconv"

// s1 and s2 are fields that are
// required to contain only
// string representations of
// integers.

s1: "\(strconv.Atoi(s1))"
s2: "\(strconv.Atoi(s2))"

// this constraint is enforced
// by unifying each of s1 and
// s2's concrete values with
// string-to-int-to-string
// conversions of those same
// values. this process must
// start and end with identical
// strings to permit CUE
// unification to complete
// successfully.
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
# s1 is a valid integer
s1: "137"

# s2 is not a valid integer
s2: "42.7"
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom-right" >}}
s2: invalid interpolation: error in call to strconv.Atoi: strconv.Atoi: parsing "42.7": invalid syntax:
    ./example.cue:15:6
    ./example.cue:15:9
{{< /code-tab >}}

{{< /code-tabs >}}

## Related content

- [**Unification**](TODO) in the CUE Language Guide
- [**The `strconv` package**](TODO) in the CUE standard library
