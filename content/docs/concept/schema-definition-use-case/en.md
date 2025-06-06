---
title: Schema Definition use case
description: Defining schema to communicate an API or standard
tags:
- go api
- validation
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

A data definition language describes the structure of data.
The structure defined by such a language can, in turn, be used
to verify implementations, validate inputs, or generate code.

Most modern dedicated data definition languages or standards allow
more than just describing whether a field is an integer or a string.
Standards like OpenAPI and CDDL allow defining things like default
values, ranges, and various other constraints.
OpenAPI even allows for complex logical combinators.

A key difference, however, is that these standards do not unify schema
and values—the thing that makes CUE so powerful.
There is no value lattice.
This limits these standards in various ways.
<!-- There is no or very limited possibility for boilerplate removal. -->

<!--more-->

## Core issues addressed by CUE

### Validating backwards compatibility

CUE's model makes it easy to verify that newer versions of schema
are backwards-compatible with older versions.

Consider the following versions of the same API:

{{{with upload "en" "api-cue"}}}
-- schema.cue --
// Release notes:
// - You can now specify your age and your hobby!
#V1: {
	age:   >=0 & <=100
	hobby: string
}

// Release notes:
// - People get to be older than 100, so we relaxed it.
// - It seems not many people have a hobby, so we made it optional.
#V2: {
	age:    >=0 & <=150 // people get older now
	hobby?: string      // some people don't have a hobby
}

// Release notes:
// - Actually no one seems to have a hobby nowadays anymore, so we dropped the field.
#V3: {
	age: >=0 & <=150
}
{{{end}}}

Declarations with a name starting with `#` are definitions.
Definitions are not emitted when converting to data, for instance when
exporting to JSON, and thus do not need to be concrete in such cases.
Definitions assume the definition of closed structs, which means a user may
only use fields that are explicitly defined.

In CUE, an API is backwards compatible if it subsumes the older one, or
if the old one is an instance of the new one.

This can be computed using the API:

{{{with upload "en" "api-go"}}}
-- main.go --
package main

import (
	_ "embed"
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
)

//go:embed schema.cue
var schemaFile string

func main() {
	ctx := cuecontext.New()
	rootValue := ctx.CompileString(schemaFile)

	v1 := rootValue.LookupPath(cue.ParsePath("#V1"))
	v2 := rootValue.LookupPath(cue.ParsePath("#V2"))
	v3 := rootValue.LookupPath(cue.ParsePath("#V3"))

	fmt.Println("V2 is backwards compatible with V1:", v2.Subsume(v1) == nil)
	fmt.Println("V3 is backwards compatible with V2:", v3.Subsume(v2) == nil)
}
{{{end}}}

{{{with _script_ "en" "HIDDEN: go mod tidy"}}}
go mod init cue.example
#ellipsis 0
go get cuelang.org/go@${CUELANG_CUE_LATEST}
#ellipsis 0
go mod tidy
{{{end}}}

{{{with script "en" "go run"}}}
go run .
{{{end}}}

It is as simple as that.
This is the kind of thing that is made possible
by ordering all values in a lattice, like CUE does.
For CUE, checking whether one API is an instance of another is like checking
whether 3 is less than 4.

Note that `V2` strictly relaxed the API relative to `V1`.
It allowed specifying a wider age range and made the `hobby` field optional.
In `V3` the `hobby` field is explicitly disallowed.
This is not backwards compatibly as it breaks previous field that did
contain a `hobby` field.

The current API only reports a _yea_ or _nay_.
The plan is to give full actionable reports.
Feedback welcome!


### Combining constraints from different sources

Most data definition languages are often not
explicitly defined for commutativity.
For instance, CDDL, although much less expressive than CUE, introduces operators
that break commutativity.

The additive property obtained by commutativity is of great value for
data definition.
Constraints often come from many sources.
For instance, one can have constraints from a base template, from code,
policies provided by different departments and policies provided by
a client.

CUE's additive nature of constraints allows piling up constraints,
in any order, to obtain a new definition.
Which leads us to the next topic.

### Normalization of data definitions

Adding constraints from many sources can result in a lot of redundancy.
Even worse, constraints can be specified in different logical forms,
making their additive form verbose and unwieldy.
This is fine if all a system does using these constraints is validate data.
But this is problematic if the added constraints are to form the basis for,
say, human consumption.

CUE's logical inference engine automatically reduces constraints.
Its API makes it possible to compute and select between
various normal forms to optimize for a certain representation.
This is used in
[CUE's OpenAPI generator]({{< relref "docs/integration/openapi" >}}),
for instance.


## Comparisons

### JSON Schema / OpenAPI

JSON Schema and OpenAPI are purely data-driven data definition standards.
OpenAPI originates from Swagger.
As of version 3, OpenAPI is more or less a subset of JSON Schema.
OpenAPI is used to define Kubernetes Custom Resource Definitions.
As of 1.15, this requires a variant of OpenAPI called Structural OpenAPI.
We will collectively refer to these as OpenAPI henceforth.

OpenAPI does not have any expressions or references.
They have powerful logical operators, though,
that make them remarkably expressive.

{{< info >}}
### On logical not
OpenAPI defines a `not` operator.
These get fuzzy when defined on structs, which OpenAPI allows.
CUE doesn't have such a construct, partly to avoid its logical pitfalls.
However, it can get a good approximation by interpreting `¬P` as `P→⊥`.
{{< /info >}}

An advantage of OpenAPI is that it is purely defined in terms of data (JSON).
This allows sending it over the wire.
It is defined such that implementing an interpreter is fairly straightforward.

One disadvantage is that it is very verbose.
Compare the following two equivalent schema definitions:

{{{with code "en" "openapi-comparison"}}}
#nofmt(native.cue) https://github.com/cue-lang/cue/issues/722

exec cue def native.cue --out openapi
cmp stdout openapi.json
-- native.cue --
// Definitions.
info: version: "v1beta1"

// Info describes...
#Info: {
	// Name of the adapter.
	name: string

	// Templates.
	templates?: [...string]

	// Max is the limit.
	max?: uint & <100
}
-- openapi.json --
{
    "openapi": "3.0.0",
    "info": {
        "version": "v1beta1",
        "title": "Generated by cue."
    },
    "paths": {},
    "components": {
        "schemas": {
            "Info": {
                "description": "Info describes...",
                "type": "object",
                "required": [
                    "name"
                ],
                "properties": {
                    "name": {
                        "description": "Name of the adapter.",
                        "type": "string"
                    },
                    "templates": {
                        "description": "Templates.",
                        "type": "array",
                        "items": {
                            "type": "string"
                        }
                    },
                    "max": {
                        "description": "Max is the limit.",
                        "type": "integer",
                        "minimum": 0,
                        "maximum": 100,
                        "exclusiveMaximum": true
                    }
                }
            }
        }
    }
}
{{{end}}}

The difference gets more extreme as more constraints and logical
combinators are used.

OpenAPI and CUE both have their roles.
The JSON format of OpenAPI makes it good interchange standard.
CUE, on the other hand, can serve as an engine to generate and interpret
OpenAPI constraints.
Note that CUE is generally more expressive and many CUE constraints will
not be encodeable in OpenAPI.


### OPA / Rego

Although not designed as a data definition language, Rego, the language
used for Open Policy Agent (OPA), also solves the issue of being able to
add constraints from multiple sources.

Rego, like CUE, has its roots in logic programming.
It is based on Datalog, a restricted form of Prolog, whereas CUE is based on
typed-feature structure or graph unification.
Typed-feature structures were designed to deal with the shortcomings
of Prolog for applications in encoding human languages.

Using a Datalog variant for what is essentially a constraint
validation task is somewhat curious.
Datalog makes an excellent query language.
But for constraint enforcement, it is a bit cumbersome as one effectively
first needs to query values to which to apply the constraints.
CUE collates the constraints with the location of the data to which they apply.
As a result, CUE constraints look a lot like the data they constrain,
unlike Rego which will be more reminiscent of a Datalog program.

But more importantly, CUE's approach is more amenable to finding normalized
and simplified representations of constraints, which makes it more suitable
for creating OpenAPI from them.


### CDDL

The Concise Data Definition Language (CDDL) is used to define
the structure of CBOR or JSON data.
CDDL shares many of the same constructs from CUE, including
disjunctions, embedding, optional fields, and definitions.

CDDL, however, has no value lattice and does not define mathematical
properties of its data.
There several other aspects in CDDL that contradict the use of a value lattice
or make it harder to do so.
Overall this restricts the expressiveness of CDDL compared to CUE
while complicating the ability to combine constraints on types
from multiple sources.

Unlike OpenAPI, CDDL is a domain-specific language (DSL).
It needs a specific interpreter.
It also has some non-trivial aspects to its evaluation, making it much harder
than OpenAPI to implement.

{{{with _script_ "en" "https://github.com/cue-lang/docs-and-content/issues/186 #1"}}}
go vet ./...
#ellipsis 0
go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./...
{{{end}}}
