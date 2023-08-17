---
title: How do I make a field optional?
tags:
- level:user
- field constraints
- cue theory
---

Placing constraints on a field's value *if the field exists*, whilst also
allowing the field to be absent, is a first-class concept in CUE.

This FIXME:HOWTO Guide demonstrates using CUE's **optional field constraint**
syntax.

## Optional fields

Place the optional field marker, a question mark, between the field's
name and the colon separating the name from the field's right hand side. The
field's right hand side (FIXME: not "value", but what?) may take any form that
would be legal if the marker *weren't* present, placing any kind of CUE
constraint on the field's concrete value. This results in an **optional field
constraint** that is asserted if *and only if* the field is present.

```CUE {title="example-optional-fields.cue"}
package example

an_optional_field?:        string
"another optional field"?: int
a_struct: {
	a_nested_struct: {
		a_deeply_nested_optional_field?:  bool
		"another-nested-optional-field"?: "a concrete value"
	}
}
```

A field marked as optional doesn't appear in a concrete export *unless it's
given a concrete value elsewhere*. Value constraints placed on optional fields
only constrain the field's value *if it's present* - they don't bring the field
into existence by themselves.

Exporting the above `example` package as JSON, we can see that none of the
fields marked as being optional appear in the output:

```console
$ cue export .:example
{
    "a_struct": {
        "a_nested_struct": {}
    }
}
```

However, if we add some concrete data to the `example` package, we see that
data present in the output:

FIXME: how to **present** "add this file to the existing corpus, and then run
this command, and get this output"?

```CUE {title="example-optional-data.cue"}
package example

an_optional_field: "some string value"
```

```console
$ cue export .:example
{
    "an_optional_field": "some string value"
    "a_struct": {
        "a_nested_struct": {}
    }
}
```

If we add more data that doesn't adhere to the value constraints placed on our
optional fields, we can see that `cue` exposes the problem as an error message
and execution failure: FIXME: same add-data-run-command-show-output problem as above.

```CUE {title="example-optional-failure.cue"}
package example

a_struct: {
	a_nested_struct: {
		a_deeply_nested_optional_field: "clearly not a boolean value"
	}
}
```

```console
a_struct.a_nested_struct.a_deeply_nested_optional_field: conflicting values "clearly not a boolean value" and bool (mismatched types string and bool):
    ./example-optional-failure.cue:5:35
    ./example-optional-fields.cue:7:37
```

## See also

- [**Optional field constraints**]({{< ref "docs/language-guide/schemas-and-validation/field-constraints#optional-field-constraints" >}})
  in the CUE language guide
