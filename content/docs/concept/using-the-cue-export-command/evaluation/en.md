---
title: Evaluation
weight: 20
authors: [jpluscplusm]
toc_hide: false
---

<!-- A warning block is used only to gain access to the yellow background site colour -->
{{<warning>}}
### In [this guide]({{< relref "." >}}):
1. [Inputs]({{< relref "inputs" >}}) --
   learn how the inputs you provide are interpreted and combined
1. **This page** --
   find out about the aspects of the command's operation that you can control
1. [Output]({{< relref "output" >}}) --
   see how the command output's encoding can be selected, and directed into a
   specific location
{{</warning>}}

The command fails with an error message:

- if evaluation of the configuration is unsuccessful
  - such as when concrete data values are unified with constraints that forbid
    those same values, or if the configuration to be evaluated can't be loaded
- if the value of the expression to be emitted isn't concrete
  - which is when the value *wouldn't* be able to be represented in a data-only
    format such as JSON. Examples of non-concrete values include types such as
    `string` and constraints such as `>=100`:

{{{with code "en" "export fail"}}}
#location left right
! exec cue export
cmp stderr out
-- failure.cue --
package d

Ad: 1
Bd: float
Cd: >=100
-- out --
Bd: incomplete value float:
    ./failure.cue:4:5
Cd: incomplete value >=100:
    ./failure.cue:5:5
{{{end}}}

<!-- A warning block is used only to gain access to the yellow background site colour -->
{{<warning>}}
### In [this guide]({{< relref "." >}}):
1. [Inputs]({{< relref "inputs" >}}) --
   learn how the inputs you provide are interpreted and combined
1. **This page** --
   find out about the aspects of the command's operation that you can control
1. [Output]({{< relref "output" >}}) --
   see how the command output's encoding can be selected, and directed into a
   specific location
{{</warning>}}

*Next page:* [Output]({{< relref "output" >}})
