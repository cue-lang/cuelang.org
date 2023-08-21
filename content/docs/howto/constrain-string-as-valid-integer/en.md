---
Title: Constrain a string to be a valid integer
---

Sometimes we need to use CUE to process structured data that contains fields
with inaccurate or generic data types. This can happen when other software
produces or requires data where numbers and boolean values are represented by
strings.

It's easy to use CUE to enforce that a string field actually contains integer
data.

This FIXME:Howto Guide show you how to do this.

## Steps

&gg;
Add the CUE package `strconv` into the import list of any existing CUE file in
which you'd like to assert a string's integer-ness.

If you aren't already using CUE, create a file and place this CUE in it:

```CUE {title="assertion.cue"}
package string_is_int

import "strconv"
```

You can name this file anything that starts with a number or letter and ends
with `.cue`.

&gg;
Inside this file, unify the field that is required to be an integer with the
following CUE assertion. Adapt both uses of the field name `a_string` to match
your specific field's name:

```CUE
a_string!: "\(strconv.Atoi(a_string))"
```

This example uses CUE's **required field constraint** syntax to enforce that
the field exists in your data.

If the field is optional, and is allowed to be missing from your data, use
CUE's **optional field constraint** syntax instead:

```CUE
a_string?: "\(strconv.Atoi(a_string))"
```

As before, adapt both uses of "`a_string`" to match your specific field's
name.

&gg;
Unify your CUE package with your data.

In this example we use the `string_is_int` package, but you should use
whichever CUE package contains your assertion.

{{< code-tabs >}}

{{< code-tab name="assertion.cue" area="top-left" >}}
package string_is_int

import "strconv"

a_string!: "\(strconv.Atoi(a_string))"
{{< /code-tab >}}

{{< code-tab name="float.yml" area="bottom-left" >}}
a_string: "1.234"
{{< /code-tab >}}
{{< code-tab name="string.yml" area="bottom-left" >}}
a_string: "some string"
{{< /code-tab >}}
{{< code-tab name="zeros.yml" area="bottom-left" >}}
a_string: "42.000"
{{< /code-tab >}}
{{< code-tab name="valid.yml" area="bottom-left" >}}
a_string: "137"
{{< /code-tab >}}

{{< code-tab name="$ cue vet" type="terminal" area="top-right" >}}
$ cue vet .:string_is_int float.yml
a_string: invalid interpolation: error in call to strconv.Atoi: strconv.Atoi: parsing "1.234": invalid syntax:
    ./example.cue:5:12
    ./example.cue:5:15
$ cue vet .:string_is_int string.yml
a_string: invalid interpolation: error in call to strconv.Atoi: strconv.Atoi: parsing "some string": invalid syntax:
    ./example.cue:5:12
    ./example.cue:5:15
$ cue vet .:string_is_int zeros.yml
a_string: invalid interpolation: error in call to strconv.Atoi: strconv.Atoi: parsing "42.000": invalid syntax:
    ./example.cue:5:12
    ./example.cue:5:15
$ cue vet .:string_is_int valid.yml
$
{{< /code-tab >}}

{{< /code-tabs >}}

## See also

- [**Unification**](FIXME): FIXME
- Required and optional [**field constraints**]({{< ref
    "docs/language-guide/schemas-and-validation/field-constraints"
  >}})
