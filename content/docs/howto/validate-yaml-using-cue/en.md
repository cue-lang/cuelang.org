---
title: How to validate YAML using CUE
weight:
draft: false
toc_hide: true
tags:
    - cue command
---

## Introduction

Validating YAML _values_ to be of specific data types is a common need for many
situations. Ensuring that the values in your YAML file are valid is essential to
avoid configuration-related errors. This How-to Guide checks and ensures each
value in a YAML file is the _data type_ it's supposed to be, using the CUE command line.

## Prerequisites

- You have [CUE installed](https://cuelang.org/docs/install/) locally. This
allows you to run `cue` commands
- You know how to use [CUE Definitions/ Helper Fields]({{< ref "/docs/language-guide/data" >}})

## Requirements

- Using the command line or terminal
- File editing

## Steps

Create a YAML file called `x.yaml` with the following:

{{{with upload "en" "initial x.yaml"}}}
-- x.yaml --
people:
  Gopher:
    name: Gopher
    age: 12
    address: Mountain View
  Ken:
    name: Ken
    age: 21
    address: The Blue Sky
{{{end}}}

Create a CUE file named `x.cue`

The following CUE creates a CUE definition that describes the data type
constraints for every person.

{{{with upload "en" "initial x.cue"}}}
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

Run the following `cue` command in your:

{{{with script "en" "initial vet"}}}
cue vet x.cue x.yaml
{{{end}}}

_NOTE: `cue vet` is silent when run successfully. Output will only show on error._

Add another person to your YAML data.

{{{with upload "en" "another person"}}}
-- x.yaml --
people:
  Gopher:
    name: Gopher
    age: 12
    address: Mountain View
  Ken:
    name: Ken
    age: 21
    address: The Blue Sky
  Rob:
    name: Rob
    age: 42.2
    address: CUEtopia
{{{end}}}

Validate again with `cue vet`

{{{with script "en" "broken vet"}}}
! cue vet x.cue x.yaml
{{{end}}}

The command output shows validation errors where the YAML violates
the (type) constraints that you have declared.

Fix up the YAML

{{{with upload "en" "fixed yaml"}}}
-- x.yaml --
people:
  Gopher:
    name: Gopher
    age: 12
    address: Mountain View
  Ken:
    name: Ken
    age: 21
    address: The Blue Sky
  Rob:
    name: Rob
    age: 42
    address: CUEtopia
{{{end}}}

Validate with `cue vet` again

{{{with script "en" "fixed vet"}}}
cue vet x.cue x.yaml
{{{end}}}

The `cue vet` command will show no output on success.

Well done! Any future data errors on names, ages, and addresses in your YAML
will be detected. This is especially helpful with YAML files
with 100s (and even 1000s) of lines.

#### Further reading/See Also

- [cmd/cue command line documentation](https://cue.googlesource.com/cue/+/refs/tags/v0.2.0/doc/cmd/cue.md)
