---
title: Generating JSON Schema from CUE
tags: [encodings, cue command]
authors: [rogpeppe]
toc_hide: true
---

CUE definitions can be converted to
[JSON Schema](https://json-schema.org/),
letting you share your CUE schemas with tools and systems that understand
JSON Schema but not CUE.

This guide shows you how to generate JSON Schema from a CUE definition using
`cue def`.

<!--more-->

{{< step stepNumber="1" >}}
Create a CUE file containing a definition:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
#Person: {
	name:   string
	age:    int & >0
	email?: string
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="2" >}}
Generate JSON Schema from the definition using `cue def`:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGRlZiAtLW91dCBqc29uc2NoZW1hIC1lICcjUGVyc29uJyBzY2hlbWEuY3Vl" }
$ cue def --out jsonschema -e '#Person' schema.cue
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "type": "object",
    "additionalProperties": false,
    "properties": {
        "age": {
            "allOf": [
                {
                    "type": "number"
                },
                {
                    "type": "integer",
                    "exclusiveMinimum": 0
                }
            ]
        },
        "email": {
            "type": "string"
        },
        "name": {
            "type": "string"
        }
    },
    "required": [
        "age",
        "name"
    ]
}
````

The `--out jsonschema` flag tells `cue` to produce JSON Schema output, and the
`-e` flag selects the definition to convert.
{{< /step >}}

## Related content

- {{< linkto/related/concept "how-cue-works-with-json-schema" >}}
- {{< linkto/related/tutorial "converting-cue-to-json-schema" >}}
- {{< linkto/related/howto "control-json-schema-generation" >}}
- {{< linkto/related/reference "command/cue-help-def" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
