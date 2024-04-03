---
title: Import JSON Schema to CUE
tags:
- commented cue
- cue command
- encodings
---

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
      - seats: 10
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
