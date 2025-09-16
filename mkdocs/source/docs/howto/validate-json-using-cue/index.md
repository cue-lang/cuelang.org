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

<!--more-->

## Prerequisites

-   You have [CUE installed]({{< relref "docs/introduction/installation" >}})
    locally. This allows you to run `cue` commands

## Requirements

-   Using the command line or terminal
-   File editing

## Steps

[**:material-chevron-right-circle-outline: Step 1**](#step-1){id="step-1"}: Create a JSON file called `x.json` with the following:

```` { .json title="x.json" }
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
````


---



[**:material-chevron-right-circle-outline: Step 2**](#step-2){id="step-2"}: Create a CUE file named `x.cue`

The following CUE creates a CUE definition that describes the data type
constraints for every person.

```` { .cue title="x.cue" }
#Person: {
	name:    string
	age:     int
	address: string
}

people: [X=string]: #Person & {
	name: X
}
````


---


[**:material-chevron-right-circle-outline: Step 3**](#step-3){id="step-3"}: Run the following `cue` command in your terminal:

```` { .text title="TERMINAL" data-copy="cue vet -c x.cue x.json" }
$ cue vet -c x.cue x.json
````

_NOTE: `cue vet` is silent when run successfully. Output will only show on error._

---


[**:material-chevron-right-circle-outline: Step 4**](#step-4){id="step-4"}: Add another person to your JSON data by replacing your `x.json` file with the
following:

```` { .json title="x.json" }
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
````


---


[**:material-chevron-right-circle-outline: Step 5**](#step-5){id="step-5"}: Validate again with `cue vet`:

```` { .text title="TERMINAL" data-copy="cue vet -c x.cue x.json" }
$ cue vet -c x.cue x.json
people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
    ./x.cue:3:11
    ./x.json:15:20
````

The command output shows validation errors where the JSON violates
the (type) constraints that you have declared.


---


[**:material-chevron-right-circle-outline: Step 6**](#step-6){id="step-6"}: Fix up the JSON:

```` { .json title="x.json" }
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
````


---


[**:material-chevron-right-circle-outline: Step 7**](#step-7){id="step-7"}: Validate with `cue vet` again

```` { .text title="TERMINAL" data-copy="cue vet -c x.cue x.json" }
$ cue vet -c x.cue x.json
````

The `cue vet` command will show no output on success.


---


Well done! Any future data errors on names, ages, and addresses in your JSON
will be detected. This is especially helpful with JSON files with 100s (and
even 1000s) of lines.

#### Further reading/See Also

-   [cmd/cue command line documentation](https://cue.googlesource.com/cue/+/refs/tags/v0.2.0/doc/cmd/cue.md)
