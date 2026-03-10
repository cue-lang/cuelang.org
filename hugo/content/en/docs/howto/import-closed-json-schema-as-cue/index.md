---
title: Importing a JSON Schema as a closed CUE definition
weight:
toc_hide: true
tags:
    - cue command
    - encodings
    - jsonschema
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

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.16.0
...
````

## Steps

{{< step stepNumber="1" >}}
Create a JSON Schema file:

{{< code-tabs >}}
{{< code-tab name="schema.json" language="json" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

This schema defines an object with `name` and `age` properties.
It does **not** include `additionalProperties: false`, so by default
any extra properties would be allowed.

{{< /step >}}

{{< step stepNumber="2" >}}
Import the JSON Schema without the qualifier to see the default behaviour:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAtbCAnI1NjaGVtYTonIHNjaGVtYS5qc29u" }
$ cue import -l '#Schema:' schema.json
````

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
#Schema: {
	@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")
	name!: string
	age?:  int
	...
}
{{< /code-tab >}}{{< /code-tabs >}}

Notice the `...` at the end of the struct -- this means the definition is
*open* and additional fields are permitted.
{{< /step >}}

{{< step stepNumber="3" >}}
Re-import using the `openOnlyWhenExplicit` qualifier.
The `-f` flag tells `cue import` to overwrite the existing `schema.cue` file:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAtZiBqc29uc2NoZW1hK29wZW5Pbmx5V2hlbkV4cGxpY2l0OiBzY2hlbWEuanNvbiAtbCAnI1NjaGVtYTon" }
$ cue import -f jsonschema+openOnlyWhenExplicit: schema.json -l '#Schema:'
````

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
#Schema: {
	@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")
	name!: string
	age?:  int
}
{{< /code-tab >}}{{< /code-tabs >}}

The resulting CUE definition no longer includes `...`, making it *closed*.
Only the `name` and `age` fields declared in the schema are permitted.
{{< /step >}}

{{< step stepNumber="4" >}}
Verify the closed schema rejects additional fields by creating a data file
with an extra field:

{{< code-tabs >}}
{{< code-tab name="data.json" language="json" area="top-left" >}}
{
    "name": "Charlie",
    "age": 30,
    "email": "charlie@example.com"
}
{{< /code-tab >}}{{< /code-tabs >}}

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAtYyAtZCAnI1NjaGVtYScgc2NoZW1hLmN1ZSBkYXRhLmpzb24=" }
$ cue vet -c -d '#Schema' schema.cue data.json
email: field not allowed:
    ./data.json:4:6
````

The validation fails because the `email` field is not permitted by the
closed schema.
{{< /step >}}

## Related content

- {{< linkto/related/reference "command/cue-help-filetypes" >}} -- documents
  the `openOnlyWhenExplicit` qualifier and other file type qualifiers
- {{< linkto/related/concept "how-cue-works-with-json-schema" >}} -- an
  overview of CUE's JSON Schema support
- {{< linkto/related/tutorial "converting-json-schema-to-cue" >}} -- a
  tutorial covering basic JSON Schema to CUE conversion
