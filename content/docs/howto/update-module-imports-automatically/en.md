---
title: Updating module imports automatically
authors: [jpluscplusm]
toc_hide: true
tags: [modules]
---

This guide demonstrates using the experimental
`cue refactor imports` <!-- TODO(jm): link to help text once it's present -->
command to update specific module imports inside a CUE module, automatically
rewriting the module's CUE code. This command can be useful when the upstream
source of an imported module changes.

## Command default behaviour FIXME:heading

In its default mode, the `cue refactor imports` command requires two
parameters: the *existing* import path prefix, and the prefix which will be its
*replacement*. Every CUE file in the current CUE module is examined, and any
imports that begin with the existing import path prefix are updated with the
replacement prefix taking its place.

Here's an example. Let's start with the following CUE code
