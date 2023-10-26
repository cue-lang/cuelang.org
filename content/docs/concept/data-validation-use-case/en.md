---
title: "Data Validation use case"
description: "Validate text-based or programmatic data"
---

By far the most straightforward approach to specify data is in plain
JSON or YAML files.
Every value can be looked up right where it needs to be defined.
But even at small scales, one will soon have to deal with
consistency issues.

Data validation tools allow verifying the consistency of such data
based on a schema.


## Core issues addressed by CUE

### Client-side validation

There are not too many handy tools to verify plain data files.
Often, validation is relied upon to be done server side.
If it is done client side, it either relies on rather verbose schema
definitions or using custom tools that verify schema for a specific domain.

The `cue` command line tool provides a fairly straightforward way to
define schema and verify them against a collection of data files.

Given these two files, the `cue vet` command can verify that the values in
`ranges.yaml` are correct by just mentioning the two files on the command line.

{{{with code "en" "client-side-validation"}}}
! exec cue vet ranges.yaml check.cue
cmp stderr output
-- check.cue --
min?: *0 | number    // 0 if undefined
max?: number & >min  // must be strictly greater than min if defined.
-- ranges.yaml --
min: 5
max: 10
---
min: 10
max: 5
-- output --
max: invalid value 5 (out of bound >10):
    ./check.cue:2:16
    ./ranges.yaml:5:7
{{{end}}}<!-- *x -->


### Validating document-oriented databases

Document-oriented databases like Mongo and many others are characterized
by having flexible schema.
Some of them, like Mongo, optionally allow schema definitions, often in the
form of JSON schema.

CUE constraints can be used to verify document-oriented databases.
Its default mechanism and expression syntax allow for filling in missing
values for an older version of a schema.
More importantly, CUE's order independence allows
"patch" specifications to be separated from the main schema definition.
CUE can take care of merging these and report if there are any inconsistencies
in the definitions, even before they are applied to a concrete case.

CUE can be applied directly on the data in code using its API,
but it can also be used to compute JSON schemas from CUE definitions.
(See [cuelang.org/go/encoding/openapi](https://pkg.go.dev/cuelang.org/go/encoding/openapi).)
If a document-oriented database natively supports JSON schema it will likely
have its benefits to do so.
Using CUE to generate the schema has several advantages over doing so directly:

- CUE is far less verbose.
- CUE can extract base definitions from other sources, like Go and Protobuf.
- It allows annotating validation code in these other sources
  (e.g. field tags for Go, options for Protobuf).
- CUE's ability to merge, validate, and normalize configurations,
  allows separation of concerns between main schema and patches for
  older version, for instance.
- CUE can morph definitions in several forms, such as the structural OpenAPI
  needed for Kubernetes' CRDs as of version 1.15.


<!-- TODO: example or pointer to one. -->



### Migration path

As discussed in
["Be useful at all scales"](/docs/about#be-useful-at-all-scales), <!-- FIXME: update URL -->
there is a high cost to changing languages as one reaches the limits
with a certain approach.

CUE adds the benefit of type checking to plain data files.
Once in use, it allows the same,
familiar tools to move to something more structured
as this approach reaches its limits.
CUE provides automated rewrite tools, such as `cue import` and `cue trim`
to aid in such migration.


## Comparisons

### JSON Schema

The closest approach to validating JSON and YAML with schema is the use
of JSON schema and accompanying tools.

Compared to CUE, JSON schema does not have a unified type and value model.
This makes the ability to use JSON schema for boilerplate reduction minimal.
As it is specified in JSON itself (it is not a DSL) it can be quite verbose.

Overall CUE is a more concise, yet more powerful schema language.
For instance, in CUE one can specify that two fields need to be identical to
one another:

{{{with code "en" "jsonschema"}}}
-- in.cue --
point: {
    x: number
    y: number
}

diagonal: point & {
    x: y
    y: x
}
{{{end}}}

Such a thing is not possible in JSON schema (or most configuration languages
for that matter).

More on JSON Schema and its subset, OpenAPI,
in [Schema Definition](/docs/usecases/datadef#json-schema--openapi). <!-- FIXME: update URL -->
