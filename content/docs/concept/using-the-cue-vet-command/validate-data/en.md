---
title: Validating Data
weight: 20
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

As you saw on [the previous page](FIXME), the `cue vet` command accepts an
arbitrary number of input parameters and validates those inputs.
Specific combinations of inputs active `cue vet`'s two different modes:
"CUE" mode and "data" mode.
This page describes "data" mode --
"CUE" mode is described on the previous page of this guide.

## Data mode FIXME: heading

To activate "data" mode you mention one or more inputs that contain
constraints, alongside one or more inputs that contain data.

Constraints are found inside CUE package, CUE files, and non-CUE encodings like
JSON Schema and Protocol Buffers. Data is contained in non-CUE encodings such
as YAML, JSON, and TOML.
See `{{<linkto/inline "reference/command/cue-help-filetypes">}}` for the full
list of supported types.


