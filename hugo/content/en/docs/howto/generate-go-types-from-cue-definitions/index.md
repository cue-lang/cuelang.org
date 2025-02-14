---
title: Generating Go types from CUE definitions
tags: [encodings]
authors: [jpluscplusm]
toc_hide: true
---

The `v0.12.0` release of the `cue` command introduced a new command:
[`gengotypes`]({{<relref"docs/reference/command/cue-help-exp-gengotypes">}}).
This command automatically generates Go types from the CUE definitions in a CUE
file or package, whilst allowing some control over the Go package and type
names that are produced. This guide shows you how to use the command.

{{<warning>}}
The `gengotypes` command is still in an experimental stage, which means that it
may be changed or removed at any time. The objective is for the CUE project to
gain experience through [your feedback]({{<relref"/community">}}) about this
experimental command, and then move the feature elsewhere.
{{</warning>}}
