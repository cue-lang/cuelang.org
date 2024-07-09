---
title: Using the cue export command
tags: [cue command]
authors: [jpluscplusm]
toc_hide: true
index_hide: true
---

The `cue export` command takes a configuration and turns some part of it into
validated, concrete data encoded in a format such as JSON or YAML.
The `cue export`
[reference page]({{< relref "/docs/reference/command/cue-export" >}}) explains
it more formally, like this:

> The `cue export` command evaluates a configuration, and emits the value of an
expression if the value is concrete.
The command fails with an error message
if evaluation of the configuration is unsuccessful,
or if the value of the expression to be emitted is not concrete.

`cue export` is often used to validate a configuration and then emit the whole
configuration as JSON, YAML or CUE. To validate a configuration *without* also
emitting some or all of its value, use the
[`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}}) command.

## What's in this guide?

This guide shows you how to manage the inputs and output of `cue export`,
and how to vary some aspects of the evaluation that it performs.
Here's what you'll find:

<!-- A warning block is used only to gain access to the yellow background site colour -->
{{<warning>}}
### In this guide:
1. [Inputs]({{< relref "inputs" >}}) --
   learn how the inputs you provide are interpreted and combined
1. [Evaluation]({{< relref "evaluation" >}}) --
   find out about the aspects of the command's operation that you can control
1. [Output]({{< relref "output" >}}) --
   see how the command output's encoding can be selected, and directed into a
   specific location
{{</warning>}}

*Next page:* [Inputs]({{< relref "inputs" >}})

<!--

### The Basics

By default, the `cue export` command:

- evaluates the configuration in the single package found in the current directory
- emits the value of the top-level of the configuration evaluated
- encodes the value as JSON and prints it to the command's standard output stream:

{{< code-tabs >}}
{{< code-tab name="data.cue" language="cue" area="left" >}}
package a

Aa: 1
Ba: 2.2
Ca: 3*Aa + Ba
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "Aa": 1,
    "Ba": 2.2,
    "Ca": 5.2
}
{{< /code-tab >}}
{{< /code-tabs >}}

You can override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag:

{{< code-tabs >}}
{{< code-tab name="package-b.cue" language="cue" area="left" >}}
package b

data: {
	Ab: 1
	Bb: 2.2
	Cb: 3*Ab + Bb
}
{{< /code-tab >}}
{{< code-tab name="package-c.cue" language="cue" area="left" >}}
package c

data: {
	Ac: "some string"
	Bc: 42
	Cc: true
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLWV4cHJlc3Npb24gZGF0YSAtLW91dCB5YW1sIC46Yw==" >}}
$ cue export --expression data --out yaml .:c
Ac: some string
Bc: 42
Cc: true
{{< /code-tab >}}
{{< /code-tabs >}}
-->
