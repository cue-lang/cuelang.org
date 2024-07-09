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

The default configuration evaluated is the single package found in the current directory.
The default expression whose value is emitted is the top-level of the configuration evaluated.
The value is emitted to the command's standard output stream encoded as JSON, by default.
To override these defaults:
- the configuration to be evaluated can be specified using positional parameters
- the expression to be emitted can be specified with the `--expression`/`-e` flag
- the encoding can be specified with the `--out` flag
- a file that should receive the data can be specified with the `--outfile`/`-o` flag

{{{with code "en" "cue export"}}}
exec cue export .:one --out yaml --expression 'data'
cmp stdout out
-- p1.cue --
package one

data: message: "This is package one"
-- p2.cue --
package two

message: "this is package two"
-- out --
message: This is package one
{{{end}}}

The rest of this guide shows you how to manage `cue export`'s inputs and
output, and the evaluation it performs:

1. [Inputs]({{< relref "inputs" >}}) -- learn how the inputs you provide are
   assembled and combined
1. [Evaluation]({{< relref "evaluation" >}}) -- find out about the aspects of
   the command's operation you can control
1. [Output]({{< relref "output" >}}) -- see how the command output's encoding
   can be selected, and directed into a specific file

{{<info>}}
Continue reading with the next page in this guide:
[Inputs]({{< relref "inputs" >}})
{{</info>}}

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
