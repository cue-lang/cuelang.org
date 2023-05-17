---
title: Field Constraints
weight: 40
draft: false
---

Field constraints allow restricting field values without actually defining a
field.
They are only part of the output if they are unified with an actual field.
It is recommended that schemas have only field constraints.

## Optional Field Constraints

<!-- demonstrate that

- add constraints, without defining a field
- do not exist (cannot be referenced)
- errors are okay

-->

You use this if concrete data _may_ specify the field.

For schemas, one typically wants to define types and constraints on fields
without actually declaring these fields. Since in CUE data and schema is mixed,
we explicitly mark schema fields with a question mark (`?`):

```coq
{{{with sidebyside "en" "composition-operator"}}}
#check should be single
-- in.cue --
Feedback: {
	all?:       string
	committee?: string
}
-- out.cue --
Feedback: {}
{{{end}}}
```

## Required Field Constraints

We use `!` instead of `?` to additionally specify that this field _*must_* be
defined for an instance of this map to be valid.

```coq
{{{with sidebyside "en" "field-constraint-required"}}}
#check should be single
-- in.cue --
Name: {
	first!:  string
	middle?: string
	last!:   string
}
-- out.cue --
Name: {
    first!: string
    last!:  string
}
{{{end}}}
```

As a rule of thumb, all fields in a schema are defined as field constraints.

## Pattern Constraints

A <def>*pattern constraint</def>* is a special field constraint that applies to
multiple fields at once.

```coq
Foo: [Expr]: Constraint
```

Here, Constraint applies to any field in Foo whose name matches `Expr`. For
instance,

```coq
StringMap: [string]: string
```

defines a map of strings, and in

```coq
Foo: [=~”Name$”]: =~”[A-Z]”
```

any field whose name ends with `"Name"` must start with a capital letter.

The field constraint `first?: string` is identical to `["first"]: string`. The
question mark notation can thus be seen as a shorthand for this special case.
It is possible to refer to the name of a field within the constraint using a
name alias:

```coq
Foo: [Name=Expr]: { name: Name }
```

The alias `Name` is only visible within the constraint.

## Dynamic Field Constraints

```coq
(x)?: y

(x)!: y
```
