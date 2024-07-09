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

{{<quote>}}
The <code>cue export</code> command
evaluates an expression in the context of a particular configuration
and then
emits the value of the expression encoded as concrete data.
The command fails with an error message
if evaluation is unsuccessful, or
if the value of the evaluated expression is not concrete.
{{</quote>}}

`cue export` is often used to validate a configuration and then emit the whole
configuration as JSON, YAML, CUE, or TOML.
To validate a configuration *without* also emitting some or all of its value,
use the
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
