---
title: Using "list.IsSortedStrings" as a field validator
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function
[`list.IsSortedStrings`](https://pkg.go.dev/cuelang.org/go/pkg/list#IsSortedStrings)
as a field validator to assert that lists of strings are sorted alphabetically.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top" >}}
package example

import "list"

sorted: ["A", "B", "C"]
unsorted: ["B", "C", "A"]

sorted:   list.IsSortedStrings
unsorted: list.IsSortedStrings // validation failure
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue eval
unsorted: invalid value ["B","C","A"] (does not satisfy list.IsSortedStrings):
    ./file.cue:6:11
    ./file.cue:9:11
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- `list.IsSortedStrings` can also be used
  [to return a list's sort status as a boolean]({{< relref
    "../use-list-issortedstrings-to-report-if-lists-of-strings-are-sorted"
  >}})
- `list.IsSortedStrings` only validates if lists of strings are sorted
  alphabetically - use `list.IsSorted`
  [to validate any other list type or sort order]({{< relref
    "../use-list-issorted-as-a-field-validator"
  >}})
- The [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list) built-in package
