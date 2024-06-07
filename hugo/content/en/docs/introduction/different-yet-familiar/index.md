---
title: Different, Yet Familiar
weight: 10
---

You'll see various examples of CUE's syntax in this introduction, which will
probably feel rather familiar if you've spent any time working with data.
In its most simple form CUE shares a few of JSON's patterns, but
**significantly** improves the experience of managing JSON by hand.

You can learn more about these improvements at the start of the
[CUE tour]({{< relref "/docs/tour/basics/json-superset" >}}), but we'll
continue here by taking a look at some characteristics of CUE that you might
not have experienced in a language before ...

### Order Doesn't Matter

In CUE, **fields can be declared in any order**.
This property lies at the heart of many of CUE's behaviours and is often
referred to as *order irrelevance*. It applies at all levels of granularity:

- within the fields of each data *struct* (which is what JSON calls an "object"),
- across the fields and structs defined inside a single `.cue` file,
- when merging multiple `.cue` files that make up a CUE *package*.

Order irrelevance flows from the fact that the rules of CUE's most fundamental
operation guarantee that *every* possible ordering results in the same
underlying data structure - so it doesn't matter which *specific* ordering is
chosen. This operation is called **unification**.

In formal terms, unification is associative, commutative and idempotent.
In *practical* terms, unification means that:

- data is immutable: once a field has been made concrete by assigning it a
  specific value, that value is fixed and cannot be changed (but this is far
  less restrictive than it might appear at first glance!)
- data and constraints can be combined from multiple sources predictably and
  efficiently, using a convenient shorthand form for specifying sparsely-populated structs
- 

Here's an example

 CUE   There are exceptions to this rule, such as the members of a list (which are inherently ordered), but 


CUE's design ensures that combining CUE values in any
order always gives the same result
(it is associative, commutative and idempotent).
This makes CUE particularly well-suited for cases where CUE
constraints are combined from different sources:

- Data validation: different departments or groups can each
define their own constraints to apply to the same set of data.

- Code extraction and generation: extract CUE definitions from
multiple sources (Go code, Protobuf), combine them into a single
definition, and use that to generate definitions in another
format (e.g. OpenAPI).

- Configuration: values can be combined from different sources
  without one having to import the other.

The ordering of values also allows set containment analysis of entire
configurations.
Where most validation systems are limited to checking whether a concrete
value matches a schema, CUE can validate whether any instance of
one schema is also an instance of another (is it backwards compatible?),
or compute a new schema that represents all instances that match
two other schema.

### Types are Values

CUE does not distinguish between values and types.
This is a powerful notion that allows CUE to define ultra-detailed
constraints, but it also simplifies things considerably:
there is no separate schema or data definition language to learn
and related language constructs such as sum types, enums,
and even null coalescing collapse onto a single construct.

Below is a demonstration of this concept.
On the left one can see a JSON object (in CUE syntax) with some properties
about the city of Moscow.
The middle column shows a possible schema for any municipality.
On the right one sees a mix between data and schema as is exemplary of CUE.

{{< columns >}}
Data
```cue
moscow: {
	name:    "Moscow"
	pop:     11.92M
	capital: true
}
```
{{< columns-separator >}}
Schema
```cue
municipality: {
	name:    string
	pop:     int
	capital: bool
}
```
{{< columns-separator >}}
CUE
```cue
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
```
{{< /columns >}}

In general, in CUE one starts with a broad definition of a type, describing
all possible instances.
One then narrows down these definitions, possibly by combining constraints
from different sources (departments, users), until a concrete data instance
remains.


### Push, not pull, constraints

CUE's constraints act as data validators, but also double as
a mechanism to reduce boilerplate.
This is a powerful approach, but requires some different thinking.
With traditional inheritance approaches one specifies the templates that
are to be inherited from at each point they should be used.
In CUE, instead, one selects a set of nodes in the configuration to which
to apply a template.
This selection can be at a different point in the configuration altogether.

Another way to view this, a JSON configuration, say, can be
defined as a sequence of path-leaf values.
For instance,
```json
{
    "a": 3,
    "b": {
        "c": "foo"
    }
}
```

could be represented as

```cue
"a": 3
"b": "c": "foo"
```

All the information of the original JSON file is retained in this
representation.

CUE generalizes this notion to the following pattern:
```
<set of nodes>: <constraints>
```
Each field declaration in CUE defines a set of nodes to which to apply
a specific constraint.
Because order doesn't matter, multiple constraints can be applied to the
same nodes, all of which need to apply simultaneously.
Such constraints may even be in different files.
But they may never contradict each other:
if one declaration says a field is `5`, another may not override it to be `6`.
Declaring a field to be both `>5` and `<10` is valid, though.

This approach is more restricted than full-blown inheritance;
it may not be possible to reuse existing configurations.
On the other hand, it is also a more powerful boilerplate remover.
For instance, suppose each job in a set needs to use a specific
template.
Instead of having to spell this out at each point,
one can declare this separately in a one blanket statement.

So instead of

```cue
jobs: {
	foo: acmeMonitoring & {...}
	bar: acmeMonitoring & {...}
	baz: acmeMonitoring & {...}
}
```

one can write

```cue
jobs: [string]: acmeMonitoring

jobs: {
	foo: {...}
	bar: {...}
	baz: {...}
}
```

There is no need to repeat the reference to the monitoring template for
each job, as the first already states that all jobs _must_ use `acmeMonitoring`.
Such requirements can be specified across files.

This approach not only reduces the boilerplate contained in `acmeMonitoring`
but also removes the repetitiveness of having to specify
this template for each job in `jobs`.
At the same time, this statement acts as a type enforcement.
This dual function is a key aspect of CUE and
typed feature structure languages in general.

This approach breaks down, of course, if the restrictions in
`acmeMonitoring` are too stringent and jobs need to override them.
To this extent, CUE provides mechanisms to allow defaults, opt-out, and
soft constraints.
