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

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}
This howto demonstrates how to import (convert) some JSON Schema to a CUE
definition, and then use the result to validate some JSON.

{{{with step}}}
Start with a JSON schema file:

{{{with upload "en" "json schema"}}}
-- schema.json --
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
{{{end}}}

This schema validates data that defines a restaurant.

{{{end}}}

{{{with step}}}
Import (convert) the JSON Schema to a CUE definition called `#restaurant`:

{{{with script "en" "cue def"}}}
cue import -l '#restaurant:' -p cuisine schema.json
{{{end}}}

{{{with _script "en" "backup imported schema"}}}
cp schema.cue .schema.cue
{{{end}}}

This gives the following CUE:

{{{with upload "en" "schema.cue"}}}
-- schema.cue --
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
{{{end}}}

{{{with _script "en" "assert schema.cue"}}}
diff -u .schema.cue schema.cue
{{{end}}}

{{{end}}}

{{{with step}}}
Define some restaurant data:

{{{with upload "en" "data.yml"}}}
-- data.yml --
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
{{{end}}}

{{{end}}}

{{{with step}}}
Constrain the `restaurants` field by the `#restaurant` definition:

{{{with upload "en" "constraints.cue"}}}
-- constraints.cue --
package cuisine

restaurants?: [string]: #restaurant
{{{end}}}
{{{end}}}

{{{with step}}}
Validate the data using the schema and constraints:

{{{with script "en" "validate 1"}}}
! cue vet . data.yml
{{{end}}}

{{{end}}}

{{{with step}}}
Fix the data validation error:

{{{with upload "en" "data.yml fixed"}}}
-- data.yml --
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
{{{end}}}

{{{end}}}

{{{with step}}}
Re-validate the data using the schema and constraints:

{{{with script "en" "validate 2"}}}
cue vet . data.yml
{{{end}}}

{{{end}}}

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
