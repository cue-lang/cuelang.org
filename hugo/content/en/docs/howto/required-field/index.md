---
title: How do I make CUE require that a field exist?
tags:
- FIXMElevel201
---

Requiring that a field exist is a first-class concept in CUE. This FIXME:HOWTO
Guide demonstrates using CUE's **required field** syntax.

## Required fields

Place the **required field** marker, an exclamation mark, between the field's
name and the colon separating the name from the field's right hand side. The
field's right hand side (FIXME: not "value", but what?) may take any form that
would be legal if the marker *weren't* present, placing any kind of CUE
constraint on the field's concrete value.

```CUE
a_required_field!:         string
"another required field"!: int
a_struct: {
	a_nested_struct: {
		a_deeply_nested_required_field!:  bool
		"another-nested-required-field"!: "a concrete value"
	}
}
```

## Examples

### Inside a list of structs

#### Using a reference

Lists cannot contain fields directly, but *can* contain structs. These structs
can contain fields, which can be marked as being required, as shown above.

Requiring that a field exist in each struct that's in a list uses exactly the
same syntax as above, but is demonstrated here for your convenience.

Create a struct that contains the required fields that each list element must
contain (`_a_struct`). Specify that your lists contain only elements that
adhere to the struct's constraints.

```CUE {name="example-reference.cue"}
_a_struct: {
	a_required_field!:         int
	"another required field"!: "a concrete value"
}

list_1: [..._a_struct]
list_2: [..._a_struct]

list_1: [{
	a_required_field:         5
	"another required field": "a concrete value"
}, {
	a_required_field:         10
	"another required field": "a concrete value"
}]

list_1: [{
	a_required_field:         5
	"another required field": "a concrete value"
}, {
	a_required_field:         10
	"another required field": "a concrete value"
}]

list_2: [{
	a_required_field: 5
}, {
	"another required field": "a concrete value"
}, {
	a_required_field:         10
	"another required field": "some other concrete value"
}]
```

Here, both `list_1` and `list_2` are subject to the required field constraints
of `_a_struct`, but only `list_1` unifies successfully. Attempting to use
`list_2` in a concrete context will fail.

CUE CLI commands such as `cue export` result in an error message that
references `list_2`'s conflicting concrete values:

```console
$ cue export example-reference.cue
list_2.2."another required field": conflicting values "a concrete value" and "some other concrete value":
    example-reference.cue:3:29
    example-reference.cue:7:10
    example-reference.cue:7:13
    example-reference.cue:31:28
```

Fixing this conflict results in `cue` highlighting required fields that are
missing from any elements of `list_2`:

```console
$ cue export example-reference.cue
list_2.0."another required field": field is required but not present:
    example-reference.cue:3:2
    example-reference.cue:7:13
list_2.1.a_required_field: field is required but not present:
    example-reference.cue:2:2
    example-reference.cue:7:13
```

#### Without using a reference

The previous example can be expressed without the use of the `_a_struct`
reference, like this:

```CUE {name="example-no-reference.cue"}
list_1: [...{
	a_required_field!:         int
	"another required field"!: "a concrete value"
}]
list_2: [...{
	a_required_field!:         int
	"another required field"!: "a concrete value"
}]

list_1: [{
	a_required_field:         5
	"another required field": "a concrete value"
}, {
	a_required_field:         10
	"another required field": "a concrete value"
}]

list_1: [{
	a_required_field:         5
	"another required field": "a concrete value"
}, {
	a_required_field:         10
	"another required field": "a concrete value"
}]

list_2: [{
	a_required_field: 5
}, {
	"another required field": "a concrete value"
}, {
	a_required_field:         10
	"another required field": "some other concrete value"
}]
```

Both ways of expressing this constraint on `list_1` and `list_2` are the same.
They result in identical CUE behaviour, including the `cue` CLI failures when
using `list_2`, as detailed above.
