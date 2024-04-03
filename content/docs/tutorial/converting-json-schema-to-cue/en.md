---
title: Converting JSON Schema to CUE
authors:
- myitcv
tags:
- cue command
- encodings
---

## Introduction

CUE is a concise and powerful language for describing and constraining data, but
not all systems speak CUE. Some systems can only produce schemas formatted in
[JSON Schema](https://json-schema.org/). This isn't a problem for the `cue`
command because it speaks JSON Schema - letting you use JSON Schema alongside
schemas written in CUE.

In this tutorial you'll use `cue` to convert a JSON Schema to CUE,
and then use the result to validate some data.

## Prerequisites

- **The `cue` binary** --
  follow the [installation instructions]({{< relref "/docs/introduction/installation" >}})
  if you don't already use `cue`
- **A tool to edit text files** --
  any text editor you have will be fine, such as
  [VSCode](https://code.visualstudio.com/),
  [Notepad](https://apps.microsoft.com/detail/9msmlrh6lzf3), or
  [Vim](https://www.vim.org/download.php)
- **A command terminal** --
  `cue` works on all platforms, so you can use any Linux or macOS terminal,
  or a Windows terminal such as PowerShell, cmd, or
  [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
  to run commands.
- **Some awareness of CUE schemata** --
  the language tour's pages on
  [Constraints]({{< relref "/docs/tour/basics/constraints" >}}) and
  [Definitions]({{< relref "/docs/tour/basics/definitions" >}}) are a good refresher

This tutorial is written using the following version of `cue`:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Steps

This tutorial takes you through converting some JSON Schema to a CUE definition
using the `cue import` command,
and then using the result to validate some YAML.

{{{with step}}}
Create a JSON schema file:

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
Convert the JSON Schema to a CUE definition called `#restaurant`:

{{{with script "en" "cue def"}}}
cue import -l '#restaurant:' -p cuisine schema.json
{{{end}}}

{{{with _script "en" "backup imported schema"}}}
cp schema.cue .schema.cue
{{{end}}}

It's good practise to tell `cue` to place imported CUE inside a package.
Here, we choose the `cuisine` package.

`cue import` creates the file `schema.cue` containing this CUE:

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
Create `data.yaml` that defines some restaurant data:

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

This data contains a deliberate problem that `cue` will catch for us, shortly.
If you spotted the problem while entering the data, make sure you *didn't*
correct it!

{{{end}}}

{{{with step}}}
Create `constraints.cue` that constrains the `restaurants` field by the
`#restaurant` definition:

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

`cue vet` outputs nothing when validation succeeds. But as you can see, there
are some validation errors.
{{{end}}}

{{{with step}}}
Fix the data validation error by updating your `data.yml` file:

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

The "silent" no output from `cue vet` confirms that the fixed data validates successfully.
{{{end}}}

## Conclusion

You've completed this tutorial - well done!

In this tutorial you converted JSON Schema to CUE using `cue import`, and then
used the resulting CUE to catch and fix an error in some data.

<!--
## Related content
-->
