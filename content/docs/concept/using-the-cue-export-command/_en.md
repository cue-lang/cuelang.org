---
title: Using the cue export command
tags: [cue command]
authors: [jpluscplusm]
toc_hide: true
index_hide: true
---

The `cue export` command evaluates a configuration, and emits the value of an
expression if the value is concrete.
The command fails with an error message
if evaluation of the configuration is unsuccessful,
or if the value of the expression to be emitted is not concrete.

`cue export` is often used to validate and emit a configuration that contains
only data, encoded in JSON, YAML, or CUE. To validate a configuration *without*
also emitting its value, use the
[`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}})
command.

### What's in this guide?

This guide shows you how to manage the inputs and output of `cue export`,
and how to vary some aspects of the evaluation that it performs.
Here's what you'll find in this guide:

1. [Inputs]({{< relref "inputs" >}}) --
   learn how the inputs you provide are interpreted and combined
1. [Evaluation]({{< relref "evaluation" >}}) --
   find out about the aspects of the command's operation that you can control
1. [Output]({{< relref "output" >}}) --
   see how the command output's encoding can be selected, and directed into a
   specific location

*Next page:* [Inputs]({{< relref "inputs" >}})

<!--

### The Basics

By default, the `cue export` command:

- evaluates the configuration in the single package found in the current directory
- emits the value of the top-level of the configuration evaluated
- encodes the value as JSON and prints it to the command's standard output stream:

{{{with code "en" "export defaults"}}}
#location left right
exec cue export
cmp stdout out
-- data.cue --
package a

Aa: 1
Ba: 2.2
Ca: 3*Aa + Ba
-- out --
{
    "Aa": 1,
    "Ba": 2.2,
    "Ca": 5.2
}
{{{end}}}

You can override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag:

{{{with code "en" "export override defaults"}}}
#location left left right
exec cue export --expression data --out yaml .:c
cmp stdout out
-- package-b.cue --
package b

data: {
	Ab: 1
	Bb: 2.2
	Cb: 3*Ab + Bb
}
-- package-c.cue --
package c

data: {
	Ac: "some string"
	Bc: 42
	Cc: true
}
-- out --
Ac: some string
Bc: 42
Cc: true
{{{end}}}
-->
