---
title: Constrain the sum of a list of numbers
authors:
- jpluscplusm
tags:
- validation
- commented cue
relatedIssues:
- https://github.com/cue-lang/docs-and-content/issues/112: "CC cross-package adaptor"
- https://github.com/cue-lang/cue/issues/2553: "failing CUE commands"
- https://github.com/cue-lang/cue/issues/2564: "link from content to Issue"
- https://github.com/cue-lang/docs-and-content/issues/114: "Commented CUE explainer"
- https://github.com/cue-lang/cue/issues/575: "must() builtin"
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates constraining the sum of a list of numbers.

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue"  area="top-left" >}}
package example

import "list"

// both data fields are lists of numbers
good_list: [...number]
bad_list: [...number]

// we introduce a hidden CUE field for
// each list we want to check.
// each hidden field unifies the relevant
// value constraint with the list's sum
_good_sum: <=100 & list.Sum(good_list)
_bad_sum:  <=99.5 & list.Sum(bad_list)
{{< /code-tab >}}
{{< code-tab name="data.yml" language="yml"  area="top-right" >}}
good_list: [ 1,2,3,4 ]
bad_list:  [ 1,2,3,100.5 ]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="err" type="terminal" area="bottom" >}}
$ cue vet .:example data.yml
_bad_sum: invalid value 106.5 (out of bound <=99.5):
    ./schema.cue:14:12
    ./schema.cue:14:21
{{< /code-tab >}}
{{< /code-tabs >}}

<!-- TODO: constraining these sums across package boundaries -->

<!-- ## Related content -->

<!-- - [How-to Guide](TODO): Constraining data at source, allowing it to be imported
  across package boundaries along with its constraint -->
<!-- - TODO: CUE stdlib package tour, `list` package page -->
