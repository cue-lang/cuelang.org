---
title: The cue vet command
weight: 200
authors: [jpluscplusm]
tags: [cue command]
# Hide this page from the *in-body* index at /docs/reference/command/ because
# that index is used to present the list of automated help-text texts.
# It *doesn't* remove it from the LHNav index presented by the same hierarchy.
# cf. https://cuelang.org/examples/basic/front-matter/
hide_summary: true
---

The `cue vet` command validates CUE, and checks that data is compatible with
schemas, policies, and other constraints. It can handle constraints and data
encoded in any
[supported format]({{< relref "docs/reference/command/cue-help-filetypes" >}}).

The command is silent when it succeeds.
It fails with an error message if there is a problem with any CUE it's asked to
validate, or if any non-CUE data files aren't compatible with the constraints
being applied.

`cue vet` can be used to
[validate CUE]({{<relref "docs/concept/using-the-cue-vet-command/validate-cue">}})
and to
[validate data]({{<relref "docs/concept/using-the-cue-vet-command/validate-data">}}).
When invoked without any parameters the command validates the single CUE
package in the current directory:

{{{with code "en" "cue vet"}}}
#location top-left top-right bottom
! exec cue vet
cmp stderr out
-- x.cue --
package example

A: int & >100
B: 42
C: string & !~"^e" & !~"e$"
-- y.cue --
package example

A: 4.2
B: number & <10
C: "Example"
-- out --
A: conflicting values int and 4.2 (mismatched types int and float):
    ./x.cue:3:4
    ./y.cue:3:4
C: invalid value "Example" (out of bound !~"e$"):
    ./x.cue:5:22
    ./x.cue:5:4
    ./y.cue:5:4
B: invalid value 42 (out of bound <10):
    ./y.cue:4:13
    ./x.cue:4:4
{{{end}}}

The command supports a variety of encodings other than CUE,
including JSON, YAML, TOML, OpenAPI, JSON Schema, and Protocol Buffers.
The full list is detailed in
`{{< linkto/inline "reference/command/cue-help-filetypes" >}}`.

To learn more about `cue vet`, refer to:

- {{< linkto/related/concept "using-the-cue-vet-command" >}} --
  an in-depth guide to `cue vet` that includes:
  - {{< linkto/inline "concept/using-the-cue-vet-command/validate-cue" >}} --
    using `cue vet` to ensure your CUE code is consistent
  - {{< linkto/inline "concept/using-the-cue-vet-command/validate-data" >}} --
    validating your data files using CUE's powerful constraint language
- {{< linkto/related/reference "command/cue-help-vet" >}} --
  the built-in help text for the `cue vet` command
