+++
title = "Code Generation and Extraction"
weight = 35
description = "Converting CUE constraints to and from definitions in other languages."
+++

Code generation and extraction is a broad topic and, for instance, overlaps
with the topics discussed in
[Data Definition](/docs/usecases/datadef) and
[Go](/docs/integrations/go).

In this section we emphasize the role of CUE in a code-generation pipeline,
that is using CUE as an interlingua for the extraction from and the
generation to multiple sources.


## Core issues addressed by CUE

### Extract data definition from existing sources

When one identifies the need to define interchangeable data schema
one usually already has some code base to deal with.

CUE can currently extract definitions from:

- [Go code](/docs/integrations/go#extract-cue-from-go)
- Protobuf definitions ( This is untrue for golang: https://github.com/cue-lang/cue/issues/581 )

Moreover, CUE can combine and reduce the constraints from various sources
and report if there are any inconsistencies.


### Enhance existing standards

CUE also allows annotating existing sources with CUE expressions.
This allows one to keep using existing sources or allow for a smoother
transition into taking a CUE-centric approach.
For instance, a project might be quite reliant on protobuf definitions
as the source of truth of at least one aspect of schema definition.
For this particular case, CUE allows annotating Protobuf field declarations
with CUE expressions using field options.

{{< highlight proto >}}
message Server {
  int32 port = 1 [(cue.val) = ">5000 & <10_000"];
}
{{< /highlight>}}

A similar approach is supported for Go:

{{< highlight go >}}
type Sum struct {
    A int `cue:"c-b" json:"a,omitempty"`
    B int `cue:"c-a" json:"b,omitempty"`
    C int `cue:"a+b" json:"c,omitempty"`
}
{{< /highlight >}}

In both cases, the constraints will be included the extraction to CUE.
In the case of Go, the constraints specified in the field tags can also
be used to validate Go structs directly.


### Convert CUE to other standards

Currently, CUE supports converting CUE to OpenAPI and Go, although it is
certainly not limited to these cases.


## Comparisons

### CEL

The [Common Expression Language](https://github.com/google/cel-spec),
or CEL, defines a simple expression language that can be used as a
standardization of constraints.
It focuses on simplicity, speed, termination guarantees and
being able run embedded in applications.

Unification of basic typed-feature structures has pseudo-linear run
time complexity.
The addition of comprehensions make the operation polynomial.
Not disallowing recursion would make CUE Turing complete.
The addition of sum types in CUE make certain operations NP-complete.
The NP-completeness manifests itself only when reasoning over incomplete types.
Trying to optimize a CEL expression would generally suffer from the same issue.
The same problem does not exist when applying CUE to concrete values.

That said, CUE is currently not optimized for embedded running.
Currently, generated Go stubs embed a CUE interpreter into the code.
These stubs are compatible with a mode where CUE generates native code,
which would give it similar characteristics.

CEL allows embedded implementation to add arbitrary functions.
CUE does not.
CUE keeps tight control over the pureness or hermeticity of evaluation
and to ensure the properties of the value lattice are not broken.
It would be possible, however, to provide the ability to add custom functions
for restricted to concrete values.


### Protoc-gen-validate (PGV)

PGV also allows annotating Protobuf fields with validation code,
with implementations for Go and Java and an experimental versions for C++
as of this writing.


{{< highlight proto >}}
message Server {
  int32 port = 1 [(validate.rules).int32 = { gte: 5000, lte: 10000 }];
}
{{< /highlight>}}
