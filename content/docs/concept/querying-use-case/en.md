---
title: "Querying use case"
description: "Find data matching certain criteria"
toc_hide: true
---

CUE orders all values in a value lattice.
A value more at the top of a hierarchy is what programming languages would
refer to as a type.
Concrete value or constraints on such a "type" are all instances of that type.

In other words, CUE constraints can be used to find patterns in data.
`cue vet` is a simple instance of this.

But more elaborate querying in the form of a `find` or `query` subcommand
is certainly possible.
We would love to hear about your envisioned use cases to plan out
such a subcommand.

## Programmatic Querying

In the mean time, you can query data programmatically using the CUE API.
What you will need to do is

- load data and constraints using
  `cuelang.org/go/cue.Runtime` or
  `cuelang.org/go/cue/load.Instances`.
- Walk over data using `cuelang.org/go/cue.Value`'s `Walk` method
  or look up specific values.
- call `pattern.Subsumes(value)`, where `pattern` and `value` are
  `cue.Value`s to see if value is an instance of pattern.
