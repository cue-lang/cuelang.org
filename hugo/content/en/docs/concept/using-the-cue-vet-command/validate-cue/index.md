---
title: Validating CUE
weight: 10
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

The `cue vet` command accepts an arbitrary number of input parameters and
checks that they're all consistent.
If any of the inputs contain non-CUE data (such as JSON, YAML, or TOML) then
the command operates in "data" mode but, by default, it operates in "CUE" mode.
This page describes "CUE" mode --
"data" mode is described on the next page of this guide.

## Default

Single package in current directory is checked for consistency.
Alias ".".
Mention final mode(?)
Mention -c. Tristate?

## One or more packages

Evaluated separately.

## Single package and CUE package-ful or package-less file(s)

Multiple packages + CUE files: not allowed.

Files must either be in the same package, or none.
Everything is unified.
-d has no effect.
So long as stdin doesn't have a non-CUE filetype qualifier, it's treated:
- as CUE, and
- in line with the above rules.
