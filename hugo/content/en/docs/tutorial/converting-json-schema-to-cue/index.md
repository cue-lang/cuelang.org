---
title: Converting JSON Schema to CUE
authors:
- myitcv
tags:
- cue command
- encodings
toc_hide: true
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

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.8.0
...
```

## Steps

This tutorial takes you through converting some JSON Schema to a CUE definition
using the `cue import` command,
and then using the result to validate some YAML.

{{< step stepNumber="1" >}}
Create a JSON schema file:

```json { title="schema.json" }
{
    "$schema": "http://json-schema.org/draft-07/schema#",
    "type": "object",
    "additionalProperties": false,
    "required": [
        "name",
        "cuisine",
        "tables"
    ],
    "properties": {
        "name": {
            "type": "string"
        },
        "cuisine": {
            "type": "string"
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
Convert the JSON Schema to a CUE definition called `#restaurant`:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCAtbCAnI3Jlc3RhdXJhbnQ6JyAtcCBjdWlzaW5lIHNjaGVtYS5qc29u" }
$ cue import -l '#restaurant:' -p cuisine schema.json
```
It's good practise to tell `cue` to place imported CUE inside a package.
Here, we choose the `cuisine` package.

`cue import` creates the file `schema.cue` containing this CUE:

```cue { title="schema.cue" }
package cuisine

#restaurant: {
	@jsonschema(schema="http://json-schema.org/draft-07/schema#")
	name:    string
	cuisine: string
	tables: [...#table]

	#table: {
		seats: >=2 & <=10
		view?: bool
	}
}
```
CUE natively understands JSON Schema, and is able to convert all of the JSON
Schema constraints into CUE constraints. Notice the CUE schema is also
considerably more concise and readable.

{{< /step >}}

{{< step stepNumber="3" >}}
Create some data files that contain restaurant details:

```yml { title="split_pea.yml" }
name: The Split Pea
cuisine: Contemporary
tables:
  - seats: 4
    view: true
  - seats: 6
```

```yml { title="pomodoro.yml" }
name: Il Pomodoro Marcio
cuisine: Italian
tables:
  - seats: 100
  - seats: 8
    view: true
```

One of these files contains a deliberate problem that `cue` will catch for us,
shortly.  If you spotted the problem while entering the data, make sure you
*didn't* correct it!

{{< /step >}}

{{< step stepNumber="4" >}}
Validate the data using the schema and constraints:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAtZCAnI3Jlc3RhdXJhbnQnIHNjaGVtYS5jdWUgKi55bWw=" }
$ cue vet -d '#restaurant' schema.cue *.yml
tables.0.seats: invalid value 100 (out of bound <=10):
    ./schema.cue:10:16
    ./pomodoro.yml:4:12
```

`cue vet` outputs nothing when validation succeeds. But as you can see, there
are some validation errors.
{{< /step >}}

{{< step stepNumber="5" >}}
Fix the data validation error by updating your `pomodoro.yml` file:

```yml { title="pomodoro.yml" }
name: Il Pomodoro Marcio
cuisine: Italian
tables:
  - seats: 10
  - seats: 8
    view: true
```

{{< /step >}}

{{< step stepNumber="6" >}}
Re-validate the data using the schema and constraints:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldCAtZCAnI3Jlc3RhdXJhbnQnIHNjaGVtYS5jdWUgKi55bWw=" }
$ cue vet -d '#restaurant' schema.cue *.yml
```

The "silent" lack of output from `cue vet` confirms that the fixed data
validates successfully.
{{< /step >}}

## Conclusion

You've completed this tutorial - well done!

In this tutorial you converted JSON Schema to CUE using `cue import`, and then
used the resulting CUE to catch and fix an error in some data.

<!--
## Related content
-->
