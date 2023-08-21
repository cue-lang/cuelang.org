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
- https://github.com/cue-lang/docs-and-content/issues/114: "CUE By Example explainer"
- https://github.com/cue-lang/cue/issues/575: "must() builtin"
---

This [CUE By Example](FIXME:CBE-explainer) guide demonstrates constraining the
sum of a list of numbers.

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

import "list"

// both data fields are lists of numbers
good_list: [...number]
bad_list: [...number]

// we introduce a hidden CUE field for
// each list we want to check.
// each hidden field unifies the relevant
// value constraint with the list's sum
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
The scenario where your list is imported across package boundaries might
require different CUE until issue #575
[("support a must() builtin")](https://github.com/cue-lang/cue/issues/575)
is implemented. The method shown on this page can't currently deal with every
potential nuance of that scenario.

If you need to constrain data at its source, and then import it across package
boundaries with the constraint intact, read this [separate Howto Guide](FIXME).
{{< /info >}}

## Related content

- [How-to Guide](TODO): Constraining data at source, allowing it to be imported
  across package boundaries along with its constraint
- TODO: CUE stdlib package tour, `list` package page
