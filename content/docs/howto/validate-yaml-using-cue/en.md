---
title: Validating a YAML file with CUE 
tags:
- cue command
- encodings
toc_hide: true
---

## Introduction

Validating that values in a YAML file are specific data types is a very common
need, and it's often an essential part of avoiding configuration-related
errors.

This page guides you through the process of creating a schema in CUE that
describes some values' *data types*, and then using the `cue` command to check
that a YAML file adheres to that schema.

## Prerequisites

-   You have [CUE installed]({{< relref "docs/introduction/installation" >}})
    locally. This allows you to run `cue` commands

### Skills required

- You should be comfortable using a command line or terminal program to run commands
- You need to be able to create and update files using a text editor

## Prepare your files

{{< step stepNumber="1" >}}
Find the YAML file that you want to check.

Throughout this guide we'll be working with the following hypothetical example:

{{{with upload "en" "example.yaml"}}}
-- example.yaml --
teamName: Data Integrity
teamNumber: 139
leader: Charlie Cartwright
members:
- name: Baker Shannon
  email: bakers@cue.example
- name: Rahim Cline
  email: rahim@cue.example
  office: 42-139
- name: Mariam Shepard
  email: mariam.shepard@cue.example
issueTrackers:
  Data problems:
    url: https://issue.corp.example/data-problems
    ticketPrefix: DATAPRB
    maxTicketLoad: 42
  New data sources:
    url: https://issue.corp.example/data-sources
    ticketPrefix: DATASRC
    maxTicketLoad: 13.9
rooms:
- 12F
- 4.2.11
teamNickname: JSON and the Datanaughts
{{{end}}}
{{< /step >}}

{{< step stepNumber="2" >}}

Use the `cue` command to convert your YAML file to CUE so that you can use it
as a template to write your schema.

{{{with script "en" "schema.cue - import"}}}
cue import -p validate example.yaml -l Schema: -o schema.cue -f
{{{end}}}

The specific filename you choose isn't important, but the commands throughout
this guide will refer to `schema.cue`.

Our example YAML file was imported as the following CUE:

{{{with script "en" "schema.cue - initial contents"}}}
cat schema.cue
{{{end}}}

(Don't worry about the size of the schema file, and the fact that it contains
concrete data. We're about to make it *much* smaller.)

{{< /step >}}

{{< step stepNumber="3" >}}
Test that `cue vet` can successfully validate your YAML file against the schema:

{{{with script "en" "test empty schema"}}}
cue vet schema.cue example.yaml -d Schema
{{{end}}}

`cue vet` is silent when run successfully, and will only show output when
there's an error. Since your YAML file *must* be able to validate against a CUE
schema that's just been directly derived from the file's contents, this command
has to run successfully. If there's any output, FIXME figure out why.
{{< /step >}}

## Reduce your schema

{{< step stepNumber="4" >}}
Go through your YAML file and delete any repeated list elements or structs.
Leave one or two representative members in each list or struct to help you in
later steps.

Also delete any fields that your schema doesn't need to validate.

When we do this in our example `schema.cue`, we're left with the following:

{{{with _upload "en" "schema.cue: truncated"}}}
-- schema.cue --
package validate

Schema: {
	teamName:   "Data Integrity"
	teamNumber: 139
	leader:     "Charlie Cartwright"
	members: [{
		name:   "Rahim Cline"
		email:  "rahim@cue.example"
		office: "42-139"
	}]
	issueTrackers: {
		"New data sources": {
			url:           "https://issue.corp.example/data-sources"
			ticketPrefix:  "DATASRC"
			maxTicketLoad: 13.9
		}
	}
	rooms: [
		"12F",
	]
}
{{{end}}}
{{{with script "en" "schema.cue: truncated"}}}
cat schema.cue
{{{end}}}
{{< /step >}}

## Analyze your schema

{{< step stepNumber="5" >}}
Go through your `schema.cue` file and identify all the fields that:
- your schema *must* be able to validate and
- have *simple values*, or are *lists* of simple values.

So that you can identify the fields in later steps, mark each simple value with
a CUE comment of "required" if the field is required for the file to be valid,
or "optional" if it's allowed to be missing: `field: value // required`

"Simple" values are numbers like `42` and `6.3`; strings like `"DATAPRB"` and
`"Rahim Cline"`; and other *basic* CUE types. Fields that are lists or structs
might *contain* simple values, but they don't have simple values. You might
think of simple values as "leaf values" or "leaves" in other data languages. FIXME: lists.

If you have lists or structs with many members that have common
characteristics, only mark a couple of the members as placeholders, and delete
the rest of the list or struct. You don't need to exhaustively mark every
single member.

Following this process in our example `schema.cue` file leaves us with the following:

{{{with _upload "en" "schema.cue: commented"}}}
-- schema.cue --
package validate

Schema: {
	teamName:   "Data Integrity"     // required
	teamNumber: 139                  // required
	leader:     "Charlie Cartwright" // required
	members: [{
		name:   "Rahim Cline"       // required
		email:  "rahim@cue.example" // required
		office: "42-139"            // optional
	}]
	issueTrackers: {
		"New data sources": {
			url:           "https://issue.corp.example/data-sources" // required
			ticketPrefix:  "DATASRC"                                 // required
			maxTicketLoad: 13.9                                      // required
		}
	}
	rooms: [// required
		"12F",
	]
}
{{{end}}}

{{{with script "en" "schema.cue - commented"}}}
cat schema.cue
{{{end}}}

Notice that we haven't marked the **non**-simple values as "required" or
"optional". Only mark the simple values with these comments.

{{< /step >}}

{{< step stepNumber="5" >}}

Translate your "required" and "optional" comments into CUE **field
constraints**.

- For each *required* field, change the field's label to include an exclamation
  mark: `teamNumber!: 139`\
- For each *optional* field, change the field's label to include a question
  mark: `office?: "42-139"`\
- If a *required* field is nested inside a struct or a list, change the labels
  of the struct or list fields that contain it to include a question mark:

```cue
members?: [{
	name!:   "Rahim Cline" // required
...
issueTrackers?: {
	"New data sources"?: {
		url!: "https://issue.corp.example/data-sources" // required
...
```

- Lastly, mark every **non**-simple field as optional. This should be just the
  fields you *haven't* already marked as required or optional.

Doing this on our example `schema.cue` results in the following:

{{{with _upload "en" "schema.cue - field constraints"}}}
-- schema.cue --
package validate

Schema: {
	teamName!:   "Data Integrity"     // required
	teamNumber!: 139                  // required
	leader!:     "Charlie Cartwright" // required
	members?: [{
		name!:   "Rahim Cline"       // required
		email!:  "rahim@cue.example" // required
		office?: "42-139"            // optional
	}]
	issueTrackers?: {
		"New data sources"?: {
			url!:           "https://issue.corp.example/data-sources" // required
			ticketPrefix!:  "DATASRC"                                 // required
			maxTicketLoad!: 13.9                                      // required
		}
	}
	rooms!: [// required
		"12F",
	]
}
{{{end}}}
{{{with script "en" "schema.cue - field constraints"}}}
cat schema.cue
{{{end}}}

{{< /step >}}

{{< step stepNumber="6" >}}





{{< /step >}}

{{{with script "en" "initial vet"}}}
#norun
cue vet x.cue x.yaml
{{{end}}}


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
#norun
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
#norun
cue vet x.cue x.yaml
{{{end}}}

The `cue vet` command will show no output on success.

Well done! Any future data errors on names, ages, and addresses in your YAML
will be detected. This is especially helpful with YAML files
with 100s (and even 1000s) of lines.

#### Further reading/See Also

- [cmd/cue command line documentation](https://cue.googlesource.com/cue/+/refs/tags/v0.2.0/doc/cmd/cue.md)
