---
title: Introduction
weight: 10
toc_hide: false
index_hide: true
aliases:
- /docs/introduction/welcome
- /docs/about
---

### Welcome to CUE!

CUE is an
<dfn title='License: "Apache-2.0", DCO: true, CLA: false'>open-source</dfn>
project that develops and publishes several interrelated <!--FIXME:word--> resources:

- a [formal specification]({{< relref "docs/reference/spec" >}})
  for "CUE", a data validation language that has its roots in logic programming
- [`cue`]({{< relref "installation" >}}), a command line tool that evaluates CUE, combining it with structured data (e.g. JSON, YAML) and other schema formats (e.g. JSON Schema, Protobuf, OpenAPI) to validate, transform and produce data and constraints

-------------


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
For instance, there is no need for generics, and enums, sum types
and null coalescing are all the same thing.

### Applications

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

{{< cards >}}
{{< card href="why-cue" label="Why CUE?" title="On the next page:" >}}
Find out why CUE's unique approach is so powerful
{{< /card >}}
{{< /cards >}}
