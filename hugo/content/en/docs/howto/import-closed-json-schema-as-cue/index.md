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

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAtbCAnI1NjaGVtYTonIHNjaGVtYS5qc29uCmNhdCBzY2hlbWEuY3Vl" }
$ cue import -l '#Schema:' schema.json
$ cat schema.cue
#Schema: {
	@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")
	name!: string
	age?:  int
	...
}
````

Notice the `...` at the end of the struct -- this means the definition is
*open* and additional fields are permitted.
{{< /step >}}

{{< step stepNumber="3" >}}
Remove the generated file and re-import using the `openOnlyWhenExplicit`
qualifier:

````text { title="TERMINAL" type="terminal" codeToCopy="cm0gc2NoZW1hLmN1ZQpjdWUgaW1wb3J0IGpzb25zY2hlbWErb3Blbk9ubHlXaGVuRXhwbGljaXQ6IHNjaGVtYS5qc29uIC1sICcjU2NoZW1hOicKY2F0IHNjaGVtYS5jdWU=" }
$ rm schema.cue
$ cue import jsonschema+openOnlyWhenExplicit: schema.json -l '#Schema:'
$ cat schema.cue
#Schema: {
	@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")
	name!: string
	age?:  int
}
````

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

{{< step stepNumber="5" >}}
Confirm the same data would be accepted by the default (open) import.
Re-import without the qualifier:

````text { title="TERMINAL" type="terminal" codeToCopy="cm0gc2NoZW1hLmN1ZQpjdWUgaW1wb3J0IC1sICcjU2NoZW1hOicgc2NoZW1hLmpzb24KY3VlIHZldCAtYyAtZCAnI1NjaGVtYScgc2NoZW1hLmN1ZSBkYXRhLmpzb24=" }
$ rm schema.cue
$ cue import -l '#Schema:' schema.json
$ cue vet -c -d '#Schema' schema.cue data.json
````

With the default open import, `cue vet` succeeds silently because the
extra `email` field is allowed.
{{< /step >}}

## Related content

- {{< linkto/related/reference "command/cue-help-filetypes" >}} -- documents
  the `openOnlyWhenExplicit` qualifier and other file type qualifiers
- {{< linkto/related/concept "how-cue-works-with-json-schema" >}} -- an
  overview of CUE's JSON Schema support
- {{< linkto/related/tutorial "converting-json-schema-to-cue" >}} -- a
  tutorial covering basic JSON Schema to CUE conversion
