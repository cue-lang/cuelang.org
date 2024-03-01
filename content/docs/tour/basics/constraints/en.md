---
title: Constraints
weight: 120
---

**Constraints** specify what values are allowed.

As follows from
[types are values]({{< relref "types-are-values">}}),
contraints are just values
\- like anything else that can be assigned to a field.
Conceptually, however,
they can be considered
something in between types and concrete values.

Constraints can also **reduce boilerplate**
and simplify the specification of data.

If a constraint defines a concrete value,
there is no need to specify that field
in locations where this constraint applies.

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
