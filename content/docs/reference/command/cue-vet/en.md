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

The `cue vet` command checks that one or more evaluations are successful, or
identifies why they failed.
It it often used to validate data against constraints.

{{{with code "en" "cue vet"}}}
#location top-left top-right bottom
! exec cue vet constraint.cue data.yaml
cmp stderr out
-- constraint.cue --
area:   length * width
area:   <100
width:  >10
length: number
-- data.yaml --
width:  33.3
length: 5
-- out --
area: invalid value 166.5 (out of bound <100):
    ./constraint.cue:2:9
    ./constraint.cue:1:9
{{{end}}}

The default behaviours of `cue export` can be overriden using parameters to
control its inputs, output, and operation.

The command can ...

To learn more, refer to:

- {{< linkto/related/concept "using-the-cue-vet-command" >}} --
  an in-depth guide to `cue vet`
- {{< linkto/related/reference "command/cue-help-vet" >}} --
  the built-in help text for the `cue vet` command
