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

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Steps

This tutorial takes you through defining a CUE schema, generating JSON Schema
from it with `cue def`, and then using the result to validate some data.

{{{with step}}}
Create a CUE file containing a schema for a conference event:

{{{with upload "en" "schema.cue"}}}
-- schema.cue --
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
{{{end}}}

This schema defines an `#Event` that has a name, a venue, and a list of
sessions. Each `#Session` has a title, a speaker, and a duration in minutes
that must be between 1 and 480.

The `@experiment(explicitopen)` attribute makes the open and closed status of
CUE structs translate predictably into JSON Schema, so we recommend enabling it
whenever you generate JSON Schema. See
[`cue help experiments`]({{< relref "docs/reference/command/cue-help-experiments" >}})
for details about the experiment itself.
{{{end}}}

{{{with step}}}
Generate JSON Schema from the `#Event` definition:

{{{with script "en" "generate"}}}
cue def --out jsonschema -e '#Event' schema.cue
{{{end}}}

The `--out jsonschema` flag tells `cue` to produce JSON Schema output.
The `-e '#Event'` flag selects the `#Event` definition as the root of the
schema.

Notice that the `#Session` definition, referenced by `#Event`, appears
automatically in the `$defs` section of the generated schema.
{{{end}}}

{{{with step}}}
Save the generated schema to a file:

{{{with script "en" "save schema"}}}
cue def --out jsonschema -e '#Event' -o event.schema.json schema.cue
{{{end}}}
{{{end}}}

{{{with step}}}
Create a valid data file:

{{{with upload "en" "good.json"}}}
-- good.json --
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
{{{end}}}
{{{end}}}

{{{with step}}}
Create a data file with a deliberate problem:

{{{with upload "en" "bad.json"}}}
-- bad.json --
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
{{{end}}}

This file has a session with a duration of 600 minutes, which exceeds the
maximum of 480 defined in the schema.
{{{end}}}

{{{with step}}}
Validate both data files against the generated JSON Schema:

{{{with script "en" "validate"}}}
! cue vet event.schema.json good.json bad.json
{{{end}}}

`cue vet` recognizes the JSON Schema from its signature fields and uses it to
validate the data files. The valid data passes, but the invalid data is
rejected because the duration exceeds the constraint.
{{{end}}}

{{{with step}}}
Fix the data and re-validate:

{{{with upload "en" "bad.json fixed"}}}
#force
-- bad.json --
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
{{{end}}}

{{{with script "en" "validate fixed"}}}
cue vet event.schema.json good.json bad.json
{{{end}}}

The silent output confirms that both files now validate successfully against
the generated JSON Schema.
{{{end}}}

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
