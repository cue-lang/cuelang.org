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

```coq
{{{with sidebyside "en" "dynamic-fields"}}}
-- in.cue --
a: 5
b: "bar"
c: "baz"

("foo" + b): 5

"foo\(c)": 6
-- out.cue --
a:      5
b:      "bar"
foobar: 5
c:      "baz"
foobaz: 6
{{{end}}}
```

## Pattern constraints

Sometimes it is useful to apply a constraint to several fields at once.
This can be done with {{{reference "pattern constraints"}}}.
This construct is usually used in schema, but can be useful in templates when
combined with existing fields.

Pattern constraints apply a constraint to any field that matches a field name
pattern.
In the following example, this is used to require that the value of each field
name ending with "Name" should not start with a lowercase letter.

```coq
{{{with sidebyside "en" "bulk-constraints"}}}
-- in.cue --
person: {
	[=~"Name$"]: !~"^[[:lower:]]"
	lastName:    string
	firstName:   string

	address: string
	phone:   string
}
-- out.cue --
person: {
    lastName:  !~"^[[:lower:]]"
    firstName: !~"^[[:lower:]]"
    address:   string
    phone:     string
}
{{{end}}}
```

<!--  TODO

`and([])`

`and` takes a list and returns the result of applying
the `&` operator to all elements in the list.
It returns top for the empty list.

```coq
{{{with sidebyside "en" "core-builtin-and"}}}
-- in.cue --
a: and([>=10, >5, <=10])
b: and([2])
c: and([])
-- out.cue --
a: 10
b: 2
c: _
{{{end}}}
```

- a: ?? expr / a: <- expr

-->
