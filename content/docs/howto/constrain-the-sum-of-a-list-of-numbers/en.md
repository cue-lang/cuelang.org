---
title: Constrain the sum of a list of numbers
Tags:
- constraints
- lists
---

This FIXME:Howto Guide demonstrates using CUE to constrain the sum of a list of
numbers to be less (or greater) than some other value.

## Example

In this example, `cue vet` warns us if the elements of `someList` in `data.yml`
sum to greater than 99.5:

{{< code-tabs >}}

{{< code-tab name="example.cue" area="top-left" >}}
package example

import (
	"list"
)

someList!: [...number]
_sum_someList: <=99.5 & list.Sum(someList)
{{< /code-tab >}}

{{< code-tab name="data.yml" language="yaml" area="bottom-left" >}}
someList: [ 1, 2, 3, 100 ]
{{< /code-tab >}}

{{< code-tab name="$ cue vet .:example data.yml" type="terminal" area="top-right" >}}
_sum_someList: invalid value 106.5 (out of bound <=99.5):
    ./example.cue:8:16
    ./example.cue:8:25

{{< /code-tab >}}

{{< /code-tabs >}}

## Steps

&gg;
In your CUE file, import the package `list`.

```CUE
import (
	"list"
)
```

&gg;
Ensure your list's field is in CUE's scope by placing an optional or required
**field constraint** on it.

```CUE
// if the field is required
myList!: [...number]

// if the field is optional
myList?: [...number]
```

&gg;
Create a hidden field holding the sum of your list of values and the constraint
you want to place on the sum.

For example, to ensure that the list `myList` sums to equal or greater than the
floating point value 500.123:

```CUE
_sum_myList: >=500.123 & list.Sum(myList)
```

The hidden field can be named anything you like - its name is unimportant. It
must start with an underscore in order to remain hidden and not become part of
the data.

{{< info >}}
A more complex scenario, where your data is held in a CUE package and is
imported by another package, might require special treatment. The method shown
on this page isn't designed to deal with every potential nuance of that
scenario, which is explored in a [separate Howto Guide](FIXME).
{{< /info >}}

## See also

- FIXME: Howto: using an embedded scalar to allow cross-package "deep"
  references to be value-constrained
- FIXME: CUE stdlib package tour, `list` package page
- Required and optional [**field constraints**]({{< ref
    "docs/language-guide/schemas-and-validation/field-constraints"
  >}})
