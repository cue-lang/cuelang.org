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

<!--more-->

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

```` { .text title="TERMINAL" data-copy="cue version" }
$ cue version
cue version v0.14.1
...
````

## Steps

This tutorial takes you through converting some JSON Schema to a CUE definition
using the `cue import` command,
and then using the result to validate some YAML.

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Create a JSON schema file:

```` { .json title="schema.json" }
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
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
    "$defs": {
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
````

This schema validates data that defines a restaurant.

---


[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Convert the JSON Schema to a CUE definition called `#restaurant`:

```` { .text title="TERMINAL" data-copy="cue import -l &#39;#restaurant:&#39; -p cuisine schema.json" }
$ cue import -l '#restaurant:' -p cuisine schema.json
````

It's good practise to tell `cue` to place imported CUE inside a package.
Here, we choose the `cuisine` package.

`cue import` creates the file `schema.cue` containing this CUE:

```` { .cue title="schema.cue" }
package cuisine

#restaurant: {
	@jsonschema(schema="https://json-schema.org/draft/2020-12/schema")

	close({
		name!:    string
		cuisine!: string
		tables!: [...#table]
	})

	#table: close({
		seats!: >=2 & <=10
		view?:  bool
	})
}
````

CUE natively understands JSON Schema, and is able to convert all of the JSON
Schema constraints into CUE constraints. Notice the CUE schema is also
considerably more concise and readable.


---


[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Create some data files that contain restaurant details:

```` { .yaml title="split_pea.yml" }
name: The Split Pea
cuisine: Contemporary
tables:
  - seats: 4
    view: true
  - seats: 6
````

```` { .yaml title="pomodoro.yml" }
name: Il Pomodoro Marcio
cuisine: Italian
tables:
  - seats: 100
  - seats: 8
    view: true
````

One of these files contains a deliberate problem that `cue` will catch for us,
shortly.  If you spotted the problem while entering the data, make sure you
*didn't* correct it!


---


[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: Validate the data using the schema and constraints:

```` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#restaurant&#39; schema.cue *.yml" }
$ cue vet -c -d '#restaurant' schema.cue *.yml
tables.0.seats: invalid value 100 (out of bound <=10):
    ./schema.cue:13:17
    ./pomodoro.yml:4:12
````

`cue vet` outputs nothing when validation succeeds. But as you can see, there
are some validation errors.

---


[**:material-chevron-right-circle-outline: Step 5**](#step-5){id="step-5"}: Fix the data validation error by updating your `pomodoro.yml` file:

```` { .yaml title="pomodoro.yml" }
name: Il Pomodoro Marcio
cuisine: Italian
tables:
  - seats: 10
  - seats: 8
    view: true
````


---


[**:material-chevron-right-circle-outline: Step 6**](#step-6){id="step-6"}: Re-validate the data using the schema and constraints:

```` { .text title="TERMINAL" data-copy="cue vet -c -d &#39;#restaurant&#39; schema.cue *.yml" }
$ cue vet -c -d '#restaurant' schema.cue *.yml
````

The "silent" lack of output from `cue vet` confirms that the fixed data
validates successfully.

---


## Conclusion

You've completed this tutorial - well done!

In this tutorial you converted JSON Schema to CUE using `cue import`, and then
used the resulting CUE to catch and fix an error in some data.

<!--
## Related content
-->
