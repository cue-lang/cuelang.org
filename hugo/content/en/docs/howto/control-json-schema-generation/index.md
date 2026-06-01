---
title: Controlling JSON Schema generation output
tags: [encodings, cue command]
authors: [rogpeppe]
toc_hide: true
---

When generating [JSON Schema](https://json-schema.org/) from CUE, there are
several ways to control the output. This guide shows how different CUE
constructs affect the generated schema, and how to select which definitions to
export.

<!--more-->

## Selecting a definition with `-e`

{{< step stepNumber="1" >}}
The `-e` flag selects which definition to convert. Create a CUE file with
multiple definitions:

{{< code-tabs >}}
{{< code-tab name="defs.cue" language="cue" area="top-left" >}}
#Address: {
	street: string
	city:   string
	zip:    string
}

#Person: {
	name:    string
	address: #Address
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="2" >}}
Generate JSON Schema for just the `#Person` definition:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGRlZiAtLW91dCBqc29uc2NoZW1hIC1lICcjUGVyc29uJyBkZWZzLmN1ZQ==" }
$ cue def --out jsonschema -e '#Person' defs.cue
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$defs": {
        "#Address": {
            "type": "object",
            "additionalProperties": false,
            "properties": {
                "city": {
                    "type": "string"
                },
                "street": {
                    "type": "string"
                },
                "zip": {
                    "type": "string"
                }
            },
            "required": [
                "city",
                "street",
                "zip"
            ]
        }
    },
    "type": "object",
    "additionalProperties": false,
    "properties": {
        "address": {
            "$ref": "#/$defs/%23Address"
        },
        "name": {
            "type": "string"
        }
    },
    "required": [
        "address",
        "name"
    ]
}
````

When one definition references another, the referenced definition appears in
the `$defs` section of the generated schema.
{{< /step >}}

## Open and closed structs

CUE definitions are closed by default, meaning they reject fields not
mentioned in the definition. Adding `...` to a definition makes it open,
allowing additional fields. This maps directly to `additionalProperties` in
JSON Schema.

{{< step stepNumber="3" >}}
Create a file with both closed and open definitions:

{{< code-tabs >}}
{{< code-tab name="open.cue" language="cue" area="top-left" >}}
#Closed: {
	name: string
}

#Open: {
	name: string
	...
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="4" >}}
Generate JSON Schema for the closed definition:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGRlZiAtLW91dCBqc29uc2NoZW1hIC1lICcjQ2xvc2VkJyBvcGVuLmN1ZQ==" }
$ cue def --out jsonschema -e '#Closed' open.cue
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "type": "object",
    "additionalProperties": false,
    "properties": {
        "name": {
            "type": "string"
        }
    },
    "required": [
        "name"
    ]
}
````

The closed definition produces `"additionalProperties": false`.
{{< /step >}}

{{< step stepNumber="5" >}}
Compare with the open definition:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGRlZiAtLW91dCBqc29uc2NoZW1hIC1lICcjT3Blbicgb3Blbi5jdWU=" }
$ cue def --out jsonschema -e '#Open' open.cue
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "type": "object",
    "additionalProperties": true,
    "properties": {
        "name": {
            "type": "string"
        }
    },
    "required": [
        "name"
    ]
}
````

The open definition produces `"additionalProperties": true`, allowing the
schema to accept fields beyond those explicitly listed.
{{< /step >}}

## Writing output to a file

{{< step stepNumber="6" >}}
Use the `-o` flag to write the generated schema directly to a file:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGRlZiAtLW91dCBqc29uc2NoZW1hIC1lICcjQ2xvc2VkJyAtbyBjbG9zZWQuc2NoZW1hLmpzb24gb3Blbi5jdWUKY2F0IGNsb3NlZC5zY2hlbWEuanNvbg==" }
$ cue def --out jsonschema -e '#Closed' -o closed.schema.json open.cue
$ cat closed.schema.json
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "type": "object",
    "additionalProperties": false,
    "properties": {
        "name": {
            "type": "string"
        }
    },
    "required": [
        "name"
    ]
}
````
{{< /step >}}

## Related content

- {{< linkto/related/concept "how-cue-works-with-json-schema" >}}
- {{< linkto/related/tutorial "converting-cue-to-json-schema" >}}
- {{< linkto/related/howto "generate-json-schema-from-cue" >}}
- {{< linkto/related/reference "command/cue-help-def" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
