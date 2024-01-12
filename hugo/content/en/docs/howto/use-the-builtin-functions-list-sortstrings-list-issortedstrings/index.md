---
title: Using the builtin functions "list.SortStrings" and "list.IsSortedStrings" to sort and test lists of strings
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin functions `list.SortStrings` to sort lists
of strings, and `list.IsSortedStrings` to test that list of strings are sorted.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="left" >}}
package example

import "list"

unsorted: ["z", "Z", "a", "AAA", "42", "!£$%^&*"]
sorted: list.SortStrings(unsorted)

// IsSortedStrings returns a boolean, which may be
// assigned as shown here, or used as a validator
// as shown in the other example on this page.
testUnsorted: list.IsSortedStrings(unsorted)
testSorted:   list.IsSortedStrings(sorted)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="right" >}}
$ cue eval
unsorted: ["z", "Z", "a", "AAA", "42", "!£$%^&*"]
sorted: ["!£$%^&*", "42", "AAA", "Z", "a", "z"]
testUnsorted: false
testSorted:   true
{{< /code-tab >}}
{{< /code-tabs >}}

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "list"

unsorted: ["c", "b", "a"]
sorted: ["a", "b", "c"]

// IsSortedStrings can be used as a field validator.
unsorted: list.IsSortedStrings
sorted:   list.IsSortedStrings
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue eval
unsorted: invalid value ["c","b","a"] (does not satisfy list.IsSortedStrings):
    ./file.cue:5:11
    ./file.cue:9:11
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- `list.SortStrings` can only sort lists of strings *alphabetically*.
  In any other situation, use [`list.Sort`]({{< relref
    "../use-the-builtin-functions-list-sort-list-issorted"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) builtin package
