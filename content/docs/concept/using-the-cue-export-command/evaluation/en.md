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
invocation first identifies and reads its inputs.

## Inputs must be readable

If any of the inputs can't be read, the command fails with an error message:

<!-- This example can't be a simple named file, as the current directory's name
     gets included in the error message, which looks odd. -->
{{{with code "en" "failure: missing inputs"}}}
! exec cue export .:two .:three
cmp stderr out
-- 1.cue --
package one

data: true
-- out --
build constraints exclude all CUE files in .:
    1.cue: package is one, want two
{{{end}}}

## Default expression

After the inputs are read successfully the command evaluates a single CUE
expression.
By default, this expression is the entirety of the configuration that was
specified as the command's input:

{{{with code "en" "default expression"}}}
exec cue export .:one
cmp stdout out
-- 1.cue --
package one

data: true
-- out --
{
    "data": true
}
{{{end}}}

If evaluation is successful then the value of that same CUE expression is
emitted in a manner that's controlled through the flags described on
[the next page]({{< relref "output" >}}).

## Modified expression

If you want to evaluate a different expression from the default,
specify it with the `--expression`/`-e` flag:

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

Constraints that aren't involved in the expression's value are *not* evaluated.
In this example, notice that the struct `bar` contains two values for the field
`C` that can't unify, and yet the command still succeeds:

{{{with code "en" "-e uninvolved constraints aren't evaluated"}}}
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
	C: 4
}
-- out --
{
    "A": 1,
    "B": 2
}
{{{end}}}

{{<info>}}
To validate an entire configuration before exporting part of it, use
[`cue vet`]({{< relref "/docs/reference/command/cue-help-vet" >}}) before you
run `cue export`.
{{</info>}}

{{<issue 3371>}}Issue #3371{{</issue>}} tracks a bug where the entirety of a
CUE package input must evaluate successfully, no matter what value is provided
for the `--expression`/`-e` flag.

## Flexible expressions

The `--expression`/`-e` flag takes an *expression*, which gives you flexibility
when formulating the value to be evaluated and emitted:

{{{with code "en" "complex expression"}}}
exec cue export .:one -e '{ onlyFoo: "foo": foo }'
cmp stdout out
-- 1.cue --
package one

foo: {
	A: 1
	B: 2
}
bar: {
	C: 3
	D: 4
}
-- out --
{
    "onlyFoo": {
        "foo": {
            "A": 1,
            "B": 2
        }
    }
}
{{{end}}}

Note the use of double quotes in the expression, around the `"foo"` label.
They allow CUE to distinguish the label from the underlying `foo` field.
They are required in this very specific case, where the emitted label needs to
match the field's name, but where the field's value would be shadowed if the
quotes weren't present.

## Non-concrete expressions

A `cue export` invocation fails if the value of the evaluated expression isn't
concrete -- in other words, if some part of its value can't be represented in a
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

## Evaluation insight

The CUE evaluator can emit statistics about each evaluation it performs.
For more details, read
{{< linkto/inline "howto/log-statistics-from-the-cue-evaluator" >}}.

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

## Related content

- {{< linkto/related/reference "command/cue-export" >}}
- {{< linkto/related/reference "command/cue-help-vet" >}}
- {{< linkto/related/howto     "log-statistics-from-the-cue-evaluator" >}}
