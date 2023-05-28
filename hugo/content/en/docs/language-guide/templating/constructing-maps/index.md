---
title: Constructing Maps
weight: 20
draft: false
---

Until now, we have only seen how to derive values for a fixed defined tree.

## Computing field names

Sometimes it is necessary to compute a field's name and not just its value.
You can do this by using formulas in parentheses for field names.
Alternatively, you can use string comprehensions.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: 5
b: "bar"
c: "baz"

("foo" + b): 5

"foo\(c)": 6
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a:      5
b:      "bar"
foobar: 5
c:      "baz"
foobaz: 6
{{< /code-tab >}}
{{< /code-tabs >}}

## Pattern constraints

Sometimes it is useful to apply a constraint to several fields at once.
This can be done with {{{reference "pattern constraints"}}}
.
This construct is usually used in schema, but can be useful in templates when
combined with existing fields.

Pattern constraints apply a constraint to any field that matches a field name
pattern.
In the following example, this is used to require that the value of each field
name ending with "Name" should not start with a lowercase letter.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
person: {
	[=~"Name$"]: !~"^[[:lower:]]"
	lastName:    string
	firstName:   string

	address: string
	phone:   string
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
person: {
    lastName:  !~"^[[:lower:]]"
    firstName: !~"^[[:lower:]]"
    address:   string
    phone:     string
}
{{< /code-tab >}}
{{< /code-tabs >}}

<!--  TODO

`and([])`

`and` takes a list and returns the result of applying
the `&` operator to all elements in the list.
It returns top for the empty list.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: and([>=10, >5, <=10])
b: and([2])
c: and([])
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: 10
b: 2
c: _
{{< /code-tab >}}
{{< /code-tabs >}}

- a: ?? expr / a: <- expr

-->
