---
title: Converting CUE to JSON Schema
authors:
- rogpeppe
tags:
- cue command
- encodings
toc_hide: true
---

## Introduction

CUE is a concise and powerful language for describing and constraining data, but
not all systems speak CUE. Some systems need schemas formatted as
[JSON Schema](https://json-schema.org/). The `cue` command can generate JSON
Schema from CUE definitions, letting you share your schemas with tools that
don't understand CUE directly.

In this tutorial you'll define a CUE schema, use `cue` to generate JSON Schema
from it, and then validate some data against the generated schema.

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

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.18.0-0.dev.0.20260702073200-7686325819d2
...
````

## Steps

This tutorial takes you through defining a CUE schema, generating JSON Schema
from it with `cue def`, and then using the result to validate some data.

{{< step stepNumber="1" >}}
Create a CUE file containing a schema for a conference event:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
@experiment(explicitopen)

#Event: {
	name:     string
	venue:    string
	sessions: [...#Session]
}

#Session: {
	title:    string
	speaker:  string
	duration: int & >0 & <=480
}
{{< /code-tab >}}{{< /code-tabs >}}

This schema defines an `#Event` that has a name, a venue, and a list of
sessions. Each `#Session` has a title, a speaker, and a duration in minutes
that must be between 1 and 480.

The `@experiment(explicitopen)` attribute makes the open and closed status of
CUE structs translate predictably into JSON Schema, so we recommend enabling it
whenever you generate JSON Schema. See
[`cue help experiments`]({{< relref "docs/reference/command/cue-help-experiments" >}})
for details about the experiment itself.
{{< /step >}}

{{< step stepNumber="2" >}}
Generate JSON Schema from the `#Event` definition:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGRlZiAtLW91dCBqc29uc2NoZW1hIC1lICcjRXZlbnQnIHNjaGVtYS5jdWU=" }
$ cue def --out jsonschema -e '#Event' schema.cue
{
    "$schema": "https://json-schema.org/draft/2020-12/schema",
    "$defs": {
        "Session": {
            "type": "object",
            "additionalProperties": false,
            "properties": {
                "duration": {
                    "allOf": [
                        {
                            "type": "number"
                        },
                        {
                            "type": "integer",
                            "exclusiveMinimum": 0,
                            "maximum": 480
                        }
                    ]
                },
                "speaker": {
                    "type": "string"
                },
                "title": {
                    "type": "string"
                }
            },
            "required": [
                "duration",
                "speaker",
                "title"
            ]
        }
    },
    "type": "object",
    "additionalProperties": false,
    "properties": {
        "name": {
            "type": "string"
        },
        "sessions": {
            "type": "array",
            "items": {
                "$ref": "#/$defs/Session"
            }
        },
        "venue": {
            "type": "string"
        }
    },
    "required": [
        "name",
        "venue"
    ]
}
````

The `--out jsonschema` flag tells `cue` to produce JSON Schema output.
The `-e '#Event'` flag selects the `#Event` definition as the root of the
schema.

Notice that the `#Session` definition, referenced by `#Event`, appears
automatically in the `$defs` section of the generated schema.
{{< /step >}}

{{< step stepNumber="3" >}}
Save the generated schema to a file:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGRlZiAtLW91dCBqc29uc2NoZW1hIC1lICcjRXZlbnQnIC1vIGV2ZW50LnNjaGVtYS5qc29uIHNjaGVtYS5jdWU=" }
$ cue def --out jsonschema -e '#Event' -o event.schema.json schema.cue
````
{{< /step >}}

{{< step stepNumber="4" >}}
Create a valid data file:

{{< code-tabs >}}
{{< code-tab name="good.json" language="json" area="top-left" >}}
{
    "name": "CUE Conference",
    "venue": "Amsterdam",
    "sessions": [
        {
            "title": "Getting Started with CUE",
            "speaker": "Alice",
            "duration": 45
        },
        {
            "title": "Advanced Schema Design",
            "speaker": "Bob",
            "duration": 90
        }
    ]
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{< step stepNumber="5" >}}
Create a data file with a deliberate problem:

{{< code-tabs >}}
{{< code-tab name="bad.json" language="json" area="top-left" >}}
{
    "name": "CUE Conference",
    "venue": "Amsterdam",
    "sessions": [
        {
            "title": "Marathon Workshop",
            "speaker": "Charlie",
            "duration": 600
        }
    ]
}
{{< /code-tab >}}{{< /code-tabs >}}

This file has a session with a duration of 600 minutes, which exceeds the
maximum of 480 defined in the schema.
{{< /step >}}

{{< step stepNumber="6" >}}
Validate both data files against the generated JSON Schema:

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBldmVudC5zY2hlbWEuanNvbiBnb29kLmpzb24gYmFkLmpzb24=" }
$ cue vet event.schema.json good.json bad.json
sessions.0.duration: invalid value 600 (out of bound <=480):
    ./event.schema.json:16:30
    ./bad.json:8:25
````

`cue vet` recognizes the JSON Schema from its signature fields and uses it to
validate the data files. The valid data passes, but the invalid data is
rejected because the duration exceeds the constraint.
{{< /step >}}

{{< step stepNumber="7" >}}
Fix the data and re-validate:

{{< code-tabs >}}
{{< code-tab name="bad.json" language="json" area="top-left" >}}
{
    "name": "CUE Conference",
    "venue": "Amsterdam",
    "sessions": [
        {
            "title": "Marathon Workshop",
            "speaker": "Charlie",
            "duration": 240
        }
    ]
}
{{< /code-tab >}}{{< /code-tabs >}}

````text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCBldmVudC5zY2hlbWEuanNvbiBnb29kLmpzb24gYmFkLmpzb24=" }
$ cue vet event.schema.json good.json bad.json
````

The silent output confirms that both files now validate successfully against
the generated JSON Schema.
{{< /step >}}

## Conclusion

You've completed this tutorial - well done!

In this tutorial you defined a schema in CUE, used `cue def --out jsonschema`
to generate a JSON Schema from it, and then used the generated schema to
validate data - catching and fixing an error along the way.

## Related content

- {{< linkto/related/concept "how-cue-works-with-json-schema" >}}
- {{< linkto/related/tutorial "converting-json-schema-to-cue" >}}
- {{< linkto/related/reference "command/cue-help-def" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
