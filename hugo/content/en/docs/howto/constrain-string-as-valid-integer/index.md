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
---

This [CUE By Example](TODO:CBE-explainer) FIXME:Howto Guide demonstrates using
CUE to constrain a field so that it must represent an integer value encoded as
a string.

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

// strconv contains the function used
// for string-to-integer translation
import "strconv"

// s1 and s2 are string fields that must
// represent valid integers
s1!: "\(strconv.Atoi(s1))"
s2!: "\(strconv.Atoi(s2))"
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
# s1 is a valid integer
s1: "137"

# s2 is not a valid integer
s2: "42.7"
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom-right" >}}
s2: invalid interpolation: error in call to strconv.Atoi: strconv.Atoi: parsing "42.7": invalid syntax:
    ./example.cue:10:6
    ./example.cue:10:9
{{< /code-tab >}}

{{< /code-tabs >}}

## Related content

- [**Unification**](TODO) in the CUE Language Guide
- [**The `strconv` package**](TODO) in the CUE standard library
