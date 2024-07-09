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

As described on [the previous page]({{< relref "inputs" >}}), each `cue export`
invocation first identifies and reads its inputs. If any of the inputs can't be
read, the command fails with an error message:

<!-- This example can't be a simple named file, as the current directory's name
     gets included in the error message, which looks odd. -->
{{{with code "en" "failure: missing input"}}}
! exec cue export .:two
cmp stderr out
-- 1.cue --
package one

data: true
-- out --
build constraints exclude all CUE files in .:
    1.cue: package is one, want two
{{{end}}}

If the inputs *can* be read successfully then the command evaluates a single
CUE expression. By default, this expression is the entirety of the
configuration that was specified as the command's input. If evaluation is
successful, the value of that same CUE expression is emitted, and is encoded as
described on [the next page]({{< relref "output" >}}).

If you want to evaluate a different expression from the default, specify it
with the `--expression`/`-e` flag:

{{{with code "en" "-e simple case"}}}
exec cue export .:one -e foo
cmp stdout out
-- 1.cue --
package one

foo: {
	A: 1
	B: 2
}
bar: C: 3
-- out --
{
    "A": 1,
    "B": 2
}
{{{end}}}

Constraints that aren't involved in the expression's value are *not* evaluated FIXME *iff* individual CUE files are mentioned.
In this example, notice that the struct `bar` contains two mutually
incompatible values for the field `C`: values that can't unify, and yet the
command still succeeds:

{{{with code "en" "-e uninvolved constraints aren't evaluated when inputs are .cue files"}}}
exec cue export 1.cue -e foo
cmp stdout out
-- 1.cue --
package one

foo: {
	A: 1
	B: 2
}
bar: {
	C: 3
	C: >100
}
-- out --
{
    "A": 1,
    "B": 2
}
{{{end}}}

FIXME However, the same example fails if the inputs provided are data files or CUE packages:

{{<info>}}
To validate an entire configuration before exporting part of it, use
[`cue vet`]({{< relref "/docs/reference/command/cue-help-vet" >}}) before you
run `cue export`.
{{</info>}}

A `cue export` invocation also fails if the value of the evaluated expression
isn't concrete -- in other words, if its value can't be represented in a
data-only format such as JSON. Examples of non-concrete values include types
such as `string` and constraints such as `>=100`:

{{{with code "en" "failure: non-concrete expression"}}}
! exec cue export data.cue
cmp stderr out
-- data.cue --
A: 1
B: number
C: <=99
-- out --
B: incomplete value number:
    ./data.cue:2:4
C: incomplete value <=99:
    ./data.cue:3:4
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
