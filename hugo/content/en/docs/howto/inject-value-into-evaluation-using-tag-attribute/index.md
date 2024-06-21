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

{{< code-tabs >}}
{{< code-tab name="strings.cue" language="cue" area="top-left" >}}
package example

// A tag's value is treated as a string unless
// an alternative type is specified (see below).
A: string @tag(a)

// A default provides a value if the related key
// is not specified for the cue command.
B: *"bar" | string @tag(b)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtdCBhPWZvbw==" >}}
$ cue export -t a=foo
{
    "A": "foo",
    "B": "bar"
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Injecting a numeric value

{{< code-tabs >}}
{{< code-tab name="numbers.cue" language="cue" area="top-left" >}}
package example

A: int    @tag(a,type=int)
B: number @tag(b,type=number)

// To treat an injected value as a float, use a tag
// with a number type and a field of type float.
C: float @tag(b,type=number)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLXQgYT00MiAtdCBiPTQuMg==" >}}
$ cue eval -t a=42 -t b=4.2
A: 42
B: 4.2
C: 4.2
{{< /code-tab >}}
{{< /code-tabs >}}

## Injecting a boolean value

{{< code-tabs >}}
{{< code-tab name="booleans.cue" language="cue" area="top-left" >}}
package example

A:  bool @tag(a,type=bool)
A!: false
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtdCBhPXRydWU=" >}}
$ cue vet -t a=true
A: conflicting values false and true:
    ./booleans.cue:4:5
{{< /code-tab >}}
{{< /code-tabs >}}

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
