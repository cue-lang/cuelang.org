---
title: Validating JSON using CUE
weight:
toc_hide: true
tags:
    - cue command
---

## Introduction

Validating JSON _values_ to be of specific data types is a common need for many
situations. Ensuring that the values in your JSON file are valid is essential
to avoid configuration-related errors. This How-to Guide checks and ensures
each value in a JSON file is the _data type_ it's supposed to be, using the CUE
command line.

## Prerequisites

-   You have [CUE installed]({{< relref "docs/introduction/installation" >}})
    locally. This allows you to run `cue` commands

## Requirements

-   Using the command line or terminal
-   File editing

## Steps

{{{with step}}}
Create a JSON file called `x.json` with the following:

{{{with upload "en" "x.json"}}}
-- x.json --
{
    "people": {
        "Gopher": {
            "name": "Gopher",
            "age": 12,
            "address": "Mountain View"
        },
        "Ken": {
            "name": "Ken",
            "age": 21,
            "address": "The Blue Sky"
        }
    }
}
{{{end}}}

{{{end}}}


{{{with step}}}
Create a CUE file named `x.cue`

The following CUE creates a CUE definition that describes the data type
constraints for every person.

{{{with upload "en" "x.cue"}}}
-- x.cue --
#Person: {
	name:    string
	age:     int
	address: string
}

people: [X=string]: #Person & {
	name: X
}
{{{end}}}

{{{end}}}

{{{with step}}}
Run the following `cue` command in your terminal:

{{{with script "en" "successful first vet"}}}
cue vet x.cue x.json
{{{end}}}

_NOTE: `cue vet` is silent when run successfully. Output will only show on error._
{{{end}}}

{{{with step}}}
Add another person to your JSON data by replacing your `x.json` file with the
following:

{{{with upload "en" "x.json v2"}}}
#force
-- x.json --
{
    "people": {
        "Gopher": {
            "name": "Gopher",
            "age": 12,
            "address": "Mountain View"
        },
        "Ken": {
            "name": "Ken",
            "age": 21,
            "address": "The Blue Sky"
        },
        "Rob": {
            "name": "Rob",
            "age": 42.2,
            "address": "CUEtopia"
        }
    }
}
{{{end}}}

{{{end}}}

{{{with step}}}
Validate again with `cue vet`:

{{{with script "en" "failing vet"}}}
! cue vet x.cue x.json
{{{end}}}

The command output shows validation errors where the JSON violates
the (type) constraints that you have declared.

{{{end}}}

{{{with step}}}
Fix up the JSON:

{{{with upload "en" "fixed x.json"}}}
#force
-- x.json --
{
    "people": {
        "Gopher": {
            "name": "Gopher",
            "age": 12,
            "address": "Mountain View"
        },
        "Ken": {
            "name": "Ken",
            "age": 21,
            "address": "The Blue Sky"
        },
        "Rob": {
            "name": "Rob",
            "age": 42,
            "address": "CUEtopia"
        }
    }
}
{{{end}}}

{{{end}}}

{{{with step}}}
Validate with `cue vet` again

{{{with script "en" "re-vet"}}}
cue vet x.cue x.json
{{{end}}}

The `cue vet` command will show no output on success.

{{{end}}}

Well done! Any future data errors on names, ages, and addresses in your JSON
will be detected. This is especially helpful with JSON files with 100s (and
even 1000s) of lines.

#### Further reading/See Also

-   [cmd/cue command line documentation](https://cue.googlesource.com/cue/+/refs/tags/v0.2.0/doc/cmd/cue.md)
