---
title: How CUE works with JSON Schema
tags:
- encodings
- cue command
authors:
- jpluscplusm
- myitcv
toc_hide: true
---

[JSON Schema](https://json-schema.org/) is a schema format encoded purely as
data, usually JSON. This means that any underlying JSON Schema file can be
processed, validated, or emitted by CUE's standard
[JSON capabilities]({{< relref "how-cue-works-with-JSON" >}}).
However, this doesn't implicitly allow schemas *represented* as JSON Schema to
be used as such, natively, in CUE.

To enable *native* support of schema information held as JSON Schema,
the schema needs to be converted to CUE.
The `cue` CLI tool can do this,
with CUE's Go API also understanding JSON Schema and producing CUE.

## Converting JSON Schema with the `cue` CLI

The [`cue import`]({{< relref "docs/reference/cli/cue-import" >}}) command can
take JSON Schema and emit CUE.

Let's start with this JSON Schema document:

```json { title="schema.json" }
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "title": "Main Person schema.",
    "description": "This schema defines a person.",
    "properties": {
        "person": {
            "description": "A person is a human being.",
            "type": "object",
            "required": [
                "name"
            ],
            "properties": {
                "name": {
                    "description": "What is this person called?",
                    "type": "string",
                    "minLength": 1
                },
                "address": {
                    "description": "Where does this person live?",
                    "type": "string",
                    "minLength": 1,
                    "maxLength": 200
                },
                "children": {
                    "description": "This is a very long comment for some reason, which will keep going and going past the point where it should probably have stopped.",
                    "type": "array",
                    "items": {
                        "type": "string"
                    },
                    "default": null
                },
                "home phone": {
                    "type": "string",
                    "deprecated": true
                }
            }
        }
    }
}
```

We use `cue import` to convert the JSON Schema to CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCBqc29uc2NoZW1hOiBzY2hlbWEuanNvbgo=" }
$ cue import jsonschema: schema.json
```
`cue import` recognises JSON Schema's signature fields and creates `schema.cue`:

```cue { title="schema.cue" }
import "strings"

// Main Person schema.
//
// This schema defines a person.
@jsonschema(schema="http://json-schema.org/draft-07/schema#")

// A person is a human being.
person?: {
	// What is this person called?
	name: strings.MinRunes(1)

	// Where does this person live?
	address?: strings.MinRunes(1) & strings.MaxRunes(200)

	// This is a very long comment for some reason, which will keep
	// going and going past the point where it should probably have
	// stopped.
	children?: [...string] | *null
	"home phone"?: string @deprecated()
	...
}
...
```
## Converting JSON Schema with the Go API

CUE's 
[`encoding/jsonschema`](https://pkg.go.dev/cuelang.org/go/encoding/jsonschema)
Go API can also convert JSON Schema to CUE.

{{< caution >}}
FIXME: Paul to supply MVP.
{{< /caution >}}
