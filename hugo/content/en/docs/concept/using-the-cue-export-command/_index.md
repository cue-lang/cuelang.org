---
title: Using the cue export command
tags: [cue command]
authors: [jpluscplusm]
toc_hide: true
index_hide: true
---

The `cue export` command takes a configuration and turns some of it (or all of
it) into validated, concrete data encoded in a format such as JSON or YAML.
The `cue export`
[reference page]({{< relref "/docs/reference/command/cue-export" >}}) explains
it more formally, like this:

> "The `cue export` command
> evaluates an expression in the context of a particular configuration
> and then
> emits the value of the expression encoded as concrete data.
> The command fails with an error message
> if evaluation is unsuccessful, or
> if the value of the evaluated expression is not concrete."

To validate a configuration *without* also emitting some or all of its value,
use the [`cue vet`]({{< relref "docs/reference/command/cue-help-vet" >}})
command instead.

## What's in this guide?

This guide shows you how to manage the inputs and output of `cue export`,
and how to vary some aspects of the evaluation that it performs.
Here's what you'll find:

{{< cards >}}
{{< card href="inputs/" title="Inputs" label=" " >}}
  **Start here** and learn how the inputs you provide are interpreted and combined.
{{< /card >}}

{{< card href="evaluation/" title="Evaluation" label=" " >}}
  Find out about the aspects of the command's operation that you can control.
{{< /card >}}

{{< card href="output/" title="Output" label=" " >}}
  See how the command output's encoding can be selected, and directed into a
  specific location.
{{< /card >}}
{{< /cards >}}
