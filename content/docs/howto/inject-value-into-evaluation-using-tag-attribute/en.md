---
title: Injecting a value into an evaluation using a tag attribute
toc_hide: true
authors: [jpluscplusm]
tags: [cue command]
---

This guide demonstrates how to use tag attributes to inject values into CUE
evaluations across various situations and different `cue` subcommands.  All the
techniques demonstrated in this guide are supported by each of the
following commands, except where explicitly noted:

{{< columns>}}
- `cue export`
- `cue eval` 
- `cue def`
{{< columns-separator >}}
- `cue vet`
- `cue cmd`
{{< /columns>}}

## Injecting a string value

{{{with code "en" "string"}}}
exec cue export -t a=foo
cmp stdout out
-- strings.cue --
package example

// A tag's value is treated as a string unless
// an alternative type is specified (see below).
A: string @tag(a)

// A default provides a value if the related key
// is not specified for the cue command.
B: *"bar" | string @tag(b)
-- out --
{
    "A": "foo",
    "B": "bar"
}
{{{end}}}

## Injecting a numeric value

{{{with code "en" "number"}}}
exec cue eval -t a=42 -t b=4.2
cmp stdout out
-- numbers.cue --
package example

A: int    @tag(a,type=int)
B: number @tag(b,type=number)

// To treat an injected value as a float, use a tag
// with a number type and a field of type float.
C: float @tag(b,type=number)
-- out --
A: 42
B: 4.2
C: 4.2
{{{end}}}

## Injecting a boolean value

{{{with code "en" "boolean"}}}
! exec cue vet -t a=true
cmp stderr out
-- booleans.cue --
package example

A:  bool @tag(a,type=bool)
A!: false
-- out --
A: conflicting values false and true:
    ./booleans.cue:4:5
{{{end}}}

## Lists

FIXME: words

## Limiting values

FIXME: words

## Shorthand flags

FIXME: words

## Related content

- {{< linkto/related/reference "cli/cue-injection" >}} -- the `cue` command's help
  text for value and file injection
<!-- TODO: link to similar howto guide about -T system variables -->
