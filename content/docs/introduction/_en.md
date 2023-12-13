---
title: Introduction
weight: 10
toc_hide: false
index_hide: true
aliases:
- /docs/introduction/welcome
---

## Welcome!

CUE is an open-source data validation language and inference engine
with its roots in logic programming.
Although the language is not a general-purpose programming language,
it has many applications, such as
data validation, data templating, configuration, querying,
code generation and even scripting.
The inference engine can be used to validate
data in code or to include it as part of a code generation pipeline.

A key thing that sets CUE apart from its peer languages
is that it merges types and values into a single concept.
Whereas in most languages types and values are strictly distinct,
CUE orders them in a single hierarchy (a lattice, to be precise).
This is a very powerful concept that allows CUE to do
many fancy things.
It also simplifies matters.
For instance, there is no need for generics and enums, sum types
and null coalescing are all the same thing.


## Applications

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


## History

Although it is a very different language, the roots of CUE lie in GCL,
the dominant configuration language in use at Google as of this writing.
It was originally designed to configure Borg, the predecessor of Kubernetes.
In fact, the original idea was to use graph unification as used in CUE for GCL.
One of the authors of GCL had extensive experience with such systems and
experienced the benefit of being able to compute and reason with types for the
creation of powerful tooling.

The graph unification model CUE is based on
was in common use in computational linguistics at that time and was
successfully used to manage grammars and lexicons of over 100k lines of
declarative definitions.
These were effectively very large
configurations of something as irregular and complex as a human language.
A property of these systems were that the types, or constraints, one
defines validate the data while simultaneously reducing boilerplate.
Overall, this approach seemed to be extremely well-suited
for cloud configuration.

However, the early design of GCL went for something simpler that coincidentally
was also incompatible with the notion of graph unification.
This simpler approach proved insufficient, but it was already too late to
move to the earlier foreseen approach.
Instead, an inheritance-based override model was adopted.
Its complexity made the earlier foreseen tooling intractable
and they never materialized.
The same holds for the GCL offsprings that copied its model.

CUE goes back to the original idea of using a constraint-based approach and
also makes an effort to incorporate lessons learned from 15 years of GCL usage.
This also includes lessons learned from offsprings and different approaches to
configuration altogether.


## Philosophy and principles

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
{{{with code "en" "data"}}}
-- in.cue --
moscow: {
	name:    "Moscow"
	pop:     11.92M
	capital: true
}
{{{end}}}
{{< columns-separator >}}
Schema
{{{with code "en" "schema"}}}
-- in.cue --
municipality: {
	name:    string
	pop:     int
	capital: bool
}
{{{end}}}
{{< columns-separator >}}
CUE
{{{with code "en" "CUE"}}}
-- in.cue --
largeCapital: {
	name:    string
	pop:     >5M
	capital: true
}
{{{end}}}
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
{{{with code "en" "json"}}}
-- in.json --
{
    "a": 3,
    "b": {
        "c": "foo"
    }
}
{{{end}}}

could be represented as

{{{with code "en" "cue form of json"}}}
-- in.cue --
"a": 3
"b": "c": "foo"
{{{end}}}

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

{{{with code "en" "non-dry"}}}
-- in.cue --
jobs: {
	foo: acmeMonitoring & {...}
	bar: acmeMonitoring & {...}
	baz: acmeMonitoring & {...}
}
{{{end}}}

one can write

{{{with code "en" "dry"}}}
-- in.cue --
jobs: [string]: acmeMonitoring

jobs: {
	foo: {...}
	bar: {...}
	baz: {...}
}
{{{end}}}

There is no need to repeat the reference to the monitoring template for
each job, as the first already states that all jobs _must_ use `acmeMonitoring`.
Such requirements can be specified across files.

This approach not only reduces the boilerplate contained in `acmeMonitoring`
but also removes the repetitiveness of having to specify
this template for each job in `jobs`.
At the same time, this statement act as a type enforcement.
This dual function is a key aspect of CUE and
typed feature structure languages in general.

This approach breaks down, of course, if the restrictions in
`acmeMonitoring` are too stringent and jobs need to override them.
To this extent, CUE provides mechanisms to allow defaults, opt-out, and
soft constraints.


### Separate configuration from computation

There comes a time that one (seemingly) will need do complex
computations to generate some configuration data.
But simplicity of a configuration language can be paramount when one quickly
needs to make changes.
These are obviously conflicting interests.

CUE takes the stance that computation and configuration should
be separated.
And CUE actually makes this easy.
The data that needs to be computed can be generated outside of CUE
and put in a file that is to be mixed in.
The data can even be generated in CUE's scripting layer and automatically
injected in a configuration pipeline.
Both approaches rely on CUE's property that the order in which this data gets
added is irrelevant.



### Be useful at all scales

The usefulness of a language may depend on the scale of the project.
Having too many different languages can put a cognitive strain on
developers, though, and migrating from one language to another as
scaling requirements change can be very costly.
CUE aims to minimize these costs
by covering a myriad of data- and configuration-related tasks at all scales.

**Small scale**
At small scales, reducing boilerplate in configurations is not necessarily
the best thing to do.
Even at a small scale, however, repetition can be error prone.
For such cases, CUE can define schema to validate otherwise
typeless data files.

**Medium scale**
As soon the desire arises to reduce boilerplate, the `cue` tool can
help to automatically rewrite configurations.
See the Quick and Dirty section of the
[Kubernetes tutorial](https://github.com/cue-labs/cue-by-example/blob/main/003_kubernetes_tutorial/README.md)
for an example using the `import` and `trim` tool.
Thousands of lines can be obliterated automatically using this approach.

**Large scale**
CUE's underlying formalism was developed for large-scale configuration.
Its import model incorporates best practices for large-scale engineering
and it is optimized for automation.
A key to this is advanced tooling.
The mathematical model underlying CUE's operations allows for
automation that is untractable for most other approaches.
CUE's `trim` command is an example of this.


### Tooling

Automation is key.
Nowadays, a good chunk of code gets generated, analyzed, reformatted,
and so on by machines.
The CUE language, APIs, and tooling have been designed to allow for
machine manipulation.
Aspects of this are:

- make the language easy to scan and parse,
- restrictions on imports,
- allow any piece of data to be split across files and generated
  from different sources,
- define packages at the directory level,
- and of course its value and type model.

The order independence also plays a key role in this.
It allows combining constraints from various sources without having
to define any order in which they are to be applied to get
predictable results.


<!-- something about this?
Not turing complete.
Run in contexts where cost is hard to attribute.
Easier to make claims about termination (smart contracts).
-->
