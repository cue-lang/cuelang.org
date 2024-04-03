---
title: Working with JSON Schema
authors:
- myitcv
tags:
- cue command
- encodings
---

## Introduction

In this tutorial you will learn how to use `cue` to work with JSON Schema.

## Prerequisites

- **A tool to edit text files**. Any text editor you have will be fine, for
  example [VSCode](https://code.visualstudio.com/).
- **A command terminal**. `cue` works on all platforms, so any terminal on Linux
  or macOS, and on PowerShell, `cmd.exe` or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) in Windows.
- **An installed `cue` binary**
  ([installation details]({{< relref "/docs/introduction/installation" >}}))
- **Some awareness of CUE schemata**
  ([Constraints]({{< relref "/docs/tour/basics/constraints" >}}) and
   [Definitions]({{< relref "/docs/tour/basics/definitions" >}}) in the CUE tour)

This tutorial is written using the following version of `cue`:

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.8.0
...
```
This howto demonstrates how to import (convert) some JSON Schema to a CUE
definition, and then use the result to validate some JSON.

{{< step stepNumber="1" >}}
Start with a JSON schema file:

```json { title="schema.json" }
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "additionalProperties": false,
    "required": [
        "cuisine",
        "tables"
    ],
    "properties": {
        "cuisine": {
            "type": "string",
            "format": "string"
        },
        "tables": {
            "type": "array",
            "items": {
                "$ref": "#/$defs/table"
            }
        }
    },
    "definitions": {
        "table": {
            "type": "object",
            "additionalProperties": false,
            "required": [
                "seats"
            ],
            "properties": {
                "seats": {
                    "type": "number",
                    "minimum": 2,
                    "maximum": 10
                },
                "view": {
                    "type": "boolean"
                }
            }
        }
    }
}
```

This schema validates data that defines a restaurant.

{{< /step >}}

{{< step stepNumber="2" >}}
Import (convert) the JSON Schema to a CUE definition called `#restaurant`:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCAtbCAnI3Jlc3RhdXJhbnQ6JyAtcCBjdWlzaW5lIHNjaGVtYS5qc29u" }
$ cue import -l '#restaurant:' -p cuisine schema.json
```
This gives the following CUE:

```cue { title="schema.cue" }
package cuisine

#restaurant: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")
	cuisine: string
	tables: [...#table]

	#table: {
		seats: >=2 & <=10
		view?: bool
	}
}
```
{{< /step >}}

{{< step stepNumber="3" >}}
Define some restaurant data:

```yml { title="data.yml" }
restaurants:
  The Split Pea:
    cuisine: Contemporary
    tables:
      - seats: 4
        view: true
      - seats: 6
  Il Pomodoro Marcio:
    cuisine: Italian
    tables:
      - seats: 100
      - seats: 8
        view: true
```

{{< /step >}}

{{< step stepNumber="4" >}}
Constrain the `restaurants` field by the `#restaurant` definition:

```cue { title="constraints.cue" }
package cuisine

restaurants?: [string]: #restaurant
```
{{< /step >}}

{{< step stepNumber="5" >}}
Validate the data using the schema and constraints:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAuIGRhdGEueW1s" }
$ cue vet . data.yml
restaurants."Il Pomodoro Marcio".tables.0.seats: invalid value 100 (out of bound <=10):
    ./schema.cue:9:16
    ./data.yml:11:16
```

{{< /step >}}

{{< step stepNumber="6" >}}
Fix the data validation error:

```yml { title="data.yml" }
restaurants:
  The Split Pea:
    cuisine: Contemporary
    tables:
      - seats: 4
        view: true
      - seats: 6
  Il Pomodoro Marcio:
    cuisine: Italian
    tables:
      - seats: 10
      - seats: 8
        view: true
```

{{< /step >}}

{{< step stepNumber="7" >}}
Re-validate the data using the schema and constraints:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAuIGRhdGEueW1s" }
$ cue vet . data.yml
```

{{< /step >}}

## Related content

- [**Optional field constraints**]({{< relref
    "docs/tour/types/structs"
  >}})
- [**Commented CUE guides**]({{< relref
    "docs/howto#commented-cue-guides"
  >}})
<!-- TODO:postLG
- [**Regular fields**]({{</* relref
    "docs/language-guide/data/maps-and-fields#field-names"
  */>}})
- [**Value constraints**]({{</* relref
    "docs/language-guide/schemas-and-validation/value-constraints"
  */>}})
-->
