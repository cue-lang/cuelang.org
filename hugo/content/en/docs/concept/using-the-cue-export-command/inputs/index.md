---
title: Inputs
weight: 10
authors: [jpluscplusm]
toc_hide: false
---

The `cue export` command can be given any number of inputs to evaluate via the
command's positional parameters -- that is, parameters that aren't associated
with some preceding flag. This page explains how the command interprets,
assembles, and combines these inputs when handed different kinds and quantities
of input.

## No positional parameters 

When `cue export` is invoked with zero arguments
its input is the single package in the current directory:

{{< code-tabs >}}
{{< code-tab name="default-input.cue" language="cue" area="top-left" >}}
package example

A: 1
B: 2.2
C: A + B + 3.33
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "A": 1,
    "B": 2.2,
    "C": 6.53
}
{{< /code-tab >}}
{{< /code-tabs >}}

This package is loaded as a *package instance* -- a concept which is
explained later, on this page.

The command fails if more than one package exists in the current directory
and the input isn't explicitly specified:

{{< code-tabs >}}
{{< code-tab name="package-2.cue" language="cue" area="left" >}}
package two

message: "this is package two"
{{< /code-tab >}}
{{< code-tab name="package-1.cue" language="cue" area="left" >}}
package one

message: "this is package one"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
found packages "one" (package-1.cue) and "two" (package-2.cue) in "."
{{< /code-tab >}}
{{< /code-tabs >}}

## One positional parameter

If there is more than one package in the current directory, tell `cue export`
which package you want to process by providing its *import path* as a
positional parameter:

{{< code-tabs >}}
{{< code-tab name="package-2.cue" language="cue" area="left" >}}
package two

message: "this is package two"
{{< /code-tab >}}
{{< code-tab name="package-1.cue" language="cue" area="left" >}}
package one

message: "this is package one"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAuOm9uZQ==" >}}
$ cue export .:one
{
    "message": "this is package one"
}
{{< /code-tab >}}
{{< /code-tabs >}}

CUE *import paths* are described in
[`cue help inputs`]({{< relref "docs/reference/command/cue-help-inputs" >}}).

If the sole positional parameter is the path to a data file then the file's
contents are interpreted in the encoding implied by its filename suffix,
and the input processed by `cue export` is the resulting data:

{{< code-tabs >}}
{{< code-tab name="data.yaml" language="yaml" area="left" >}}
message: this is a YAML data file
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnlhbWw=" >}}
$ cue export data.yaml
{
    "message": "this is a YAML data file"
}
{{< /code-tab >}}
{{< /code-tabs >}}

Individual CUE files can be referred to in this way, instead of using them
through their import path at the package level. Import paths are the suggested
way to refer to CUE, as they automatically pick up new and renamed files.
Referring directly to CUE files requires you to keep `cue export` invocations
up to date, manually, as the set of files changes.

## Input file encodings

The filename suffixes that `cue export` understands are described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}),
including `.json`, `.yml`, `.yaml`, and `.cue`. If a filename suffix is
recognised, then `cue export` automatically interprets the file through the
related data encoding. If the encoding of a file doesn't match its filename
suffix, use a qualifier to specify the encoding:

{{< code-tabs >}}
{{< code-tab name="some.yaml.data" language="data" area="left" >}}
message: this YAML data file has a .data suffix
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCB5YW1sOiBzb21lLnlhbWwuZGF0YQ==" >}}
$ cue export yaml: some.yaml.data
{
    "message": "this YAML data file has a .data suffix"
}
{{< /code-tab >}}
{{< /code-tabs >}}

A qualifier dicates the encoding of every file that follows it, up to the
*next* qualifier. The qualifiers that `cue export` understands are described in
[`cue help filetypes`]({{< relref "docs/reference/command/cue-help-filetypes" >}}),
including `json:`, `yaml:`, and `cue:`.

## Multiple positional parameters

How to express "schema" versus "CUE"? I.e. include non-CUE schemata at the CLI,
but without exploding the example set unacceptably.

### CUE + data

unification & validation.

### .cue + data

unification & validation.

### .cue + data + data

unification & validation.

### .cue + .cue + data

package names must align, or be packageless.
unification & validation.

### .cue + .cue + data + data

package names must align, or be packageless.
unification & validation.

### CUE + CUE

oddness.

### CUE + CUE + data

not allowed.

### data + data

unification

## Still TODO

Leave a TODO for "how cue finds CUE" or similar; don't write it all here.
--path/-l
--with-context
Placing non-CUE somewhere other than the root.
Leave a TODO for linking to a future --with-context guide.
stdin

### Injecting values

Demo briefly; link to to other guides.

--name/-n

### Package instances
