---
title: Constraints
weight: 120
---

**Constraints** specify what values are allowed.

Because
[types are values]({{< relref "types-are-values">}}),
contraints are just values
\- like anything else that can be assigned to a field.\
Conceptually, however,
they can be considered
something in between types and concrete values.

Constraints can also **reduce boilerplate**
and simplify the specification of data.

If a constraint specifies a field with a concrete value then unification means
that the field and its value are present everywhere the constraint applies, and
don't need to be repeated. For instance, this example's `human` field:

{{{with code "en" "tour"}}}
exec cue export file.cue -e viola
cmp stdout out
-- file.cue --
person: {
	name:  string
	age:   int
	human: true // People are always humans
}

viola: person
viola: {
	name: "Viola"
	age:  38
}
-- out --
{
    "name": "Viola",
    "age": 38,
    "human": true
}
{{{end}}}
