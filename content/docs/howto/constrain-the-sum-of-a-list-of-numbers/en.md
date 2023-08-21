---
title: Constrain the sum of a list of numbers
Tags:
- constraints
- lists
- cue-by-example
relatedIssues:
- https://github.com/cue-lang/docs-and-content/issues/112: "CBE cross-package adaptor"
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
---

This [CUE By Example](FIXME:CBE-explainer) FIXME:Howto Guide
demonstrates using CUE to constrain the sum of a list of numbers.

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

import "list"

// both data fields are lists of numbers
good_list: [...number]
bad_list: [...number]

// we introduce a hidden CUE field for
// each list we want to check.
// each hidden field holds the value
// constraint unified with the list's sum
_good_sum: <=99.5 & list.Sum(good_list)
_bad_sum:  <=99.5 & list.Sum(bad_list)
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
good_list: [ 1,2,3,4 ]
bad_list:  [ 1,2,3,100.5 ]
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="bottom-right" >}}
_bad_sum: invalid value 106.5 (out of bound <=99.5):
    ./example.cue:14:12
    ./example.cue:14:21
{{< /code-tab >}}

{{< /code-tabs >}}

{{< info >}}
A different scenario, where your data is held in a CUE package and imported by
another package, might require special treatment. The method shown on this page
isn't designed to deal with every potential nuance of that scenario, which is
explored in a [separate Howto Guide](FIXME).
{{< /info >}}

## See also

- FIXME: Howto: using an embedded scalar to allow cross-package "deep"
  references to be value-constrained
- FIXME: CUE stdlib package tour, `list` package page
