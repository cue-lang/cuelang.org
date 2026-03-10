---
title: Importing a JSON Schema as a closed CUE definition
weight:
toc_hide: true
tags:
    - cue command
    - encodings
---

## Introduction

When importing a JSON Schema using
[`cue import`]({{< relref "docs/reference/command/cue-help-import" >}}),
the resulting CUE definition is *open* by default -- additional fields
beyond those declared in the schema are permitted.
This mirrors the default behaviour of JSON Schema, where unrecognised
properties are allowed unless explicitly forbidden.

The `openOnlyWhenExplicit` qualifier changes this behaviour. It produces
a *closed* CUE definition where only the properties explicitly declared
in the schema are permitted, without requiring `additionalProperties: false`
in the JSON Schema.

This How-to Guide shows you how to use the `openOnlyWhenExplicit`
qualifier with `cue import` to produce closed CUE definitions from
JSON Schema.

<!--more-->

## Prerequisites

- You have [CUE installed]({{< relref "docs/introduction/installation" >}})
  locally. This allows you to run `cue` commands

This guide is written using the following version of `cue`:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Steps

{{{with step}}}
Create a JSON Schema file:

{{{with upload "en" "schema.json"}}}
-- schema.json --
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "type": "object",
    "properties": {
        "name": {
            "type": "string"
        },
        "age": {
            "type": "integer"
        }
    },
    "required": [
        "name"
    ]
}
{{{end}}}

This schema defines an object with `name` and `age` properties.
It does **not** include `additionalProperties: false`, so by default
any extra properties would be allowed.

{{{end}}}

{{{with step}}}
Import the JSON Schema without the qualifier to see the default behaviour:

{{{with script "en" "import default"}}}
cue import -l '#Schema:' schema.json
cat schema.cue
{{{end}}}

Notice the `...` at the end of the struct -- this means the definition is
*open* and additional fields are permitted.
{{{end}}}

{{{with step}}}
Remove the generated file and re-import using the `openOnlyWhenExplicit`
qualifier:

{{{with script "en" "import closed"}}}
rm schema.cue
cue import jsonschema+openOnlyWhenExplicit: schema.json -l '#Schema:'
cat schema.cue
{{{end}}}

The resulting CUE definition no longer includes `...`, making it *closed*.
Only the `name` and `age` fields declared in the schema are permitted.
{{{end}}}

{{{with step}}}
Verify the closed schema rejects additional fields by creating a data file
with an extra field:

{{{with upload "en" "data.json"}}}
-- data.json --
{
    "name": "Charlie",
    "age": 30,
    "email": "charlie@example.com"
}
{{{end}}}

{{{with script "en" "vet closed"}}}
! cue vet -c -d '#Schema' schema.cue data.json
{{{end}}}

The validation fails because the `email` field is not permitted by the
closed schema.
{{{end}}}

{{{with step}}}
Confirm the same data would be accepted by the default (open) import.
Re-import without the qualifier:

{{{with script "en" "vet open"}}}
rm schema.cue
cue import -l '#Schema:' schema.json
cue vet -c -d '#Schema' schema.cue data.json
{{{end}}}

With the default open import, `cue vet` succeeds silently because the
extra `email` field is allowed.
{{{end}}}

## Related content

- {{< linkto/related/reference "command/cue-help-filetypes" >}} -- documents
  the `openOnlyWhenExplicit` qualifier and other file type qualifiers
- {{< linkto/related/concept "how-cue-works-with-json-schema" >}} -- an
  overview of CUE's JSON Schema support
- {{< linkto/related/tutorial "converting-json-schema-to-cue" >}} -- a
  tutorial covering basic JSON Schema to CUE conversion
