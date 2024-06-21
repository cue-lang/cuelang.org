---
title: Injecting a value into an evaluation using a tag attribute
toc_hide: true
authors: [jpluscplusm]
tags: [cue command]
---

FIXME: include a single, small example of `cue cmd` use.

This guide demonstrates how to use tag attributes to inject values into CUE
evaluations across various situations and different `cue` subcommands.  All the
techniques demonstrated in this guide are supported by the following commands,
except where explicitly noted:

{{< columns>}}
- `cue export`
- `cue eval` 
- `cue def`
{{< columns-separator >}}
- `cue vet`
- `cue cmd`
{{< /columns>}}

## Injecting a value

{{{with code "en" "string"}}}
exec cue export -t a=foo
cmp stdout out
-- string.cue --
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
-- number.cue --
package example

A: int @tag(a,type=int)

// The number field type is compatible with both
// integers and floating point numbers.
B: number @tag(b,type=number)

// To treat an injected value exclusively as a
// float, use a tag with a number type and a field
// of type float.
C: float @tag(b,type=number)
-- out --
A: 42
B: 4.2
C: 4.2
{{{end}}}

Notice that both the `B` and `C` fields refer to the same tag attribute, `b`.
Injecting a single value can affect multiple fields.

## Injecting a boolean value

{{{with code "en" "boolean"}}}
! exec cue vet -t a=true
cmp stderr out
-- boolean.cue --
package example

A: bool @tag(a,type=bool)

// This causes our cue vet to fail.
A!: false
-- out --
A: conflicting values false and true:
    ./boolean.cue:6:5
{{{end}}}

## Lists

{{{with code "en" "list"}}}
exec cue export -t a='["foo", "bar"]' -t b='baz,quux'
cmp stdout out
-- list.cue --
package example

import (
	"strings"
	"encoding/json"
)

_A: string @tag(a)
_B: string @tag(b)

// Using a stringified JSON list is the most
// robust way to inject a list.
listA: json.Unmarshal(_A)

// Splitting a string on a specific separator may
// be easier in certain situations but can be less
// robust against unexpected or hostile input.
listB: strings.Split(_B, ",")
-- out --
{
    "listA": [
        "foo",
        "bar"
    ],
    "listB": [
        "baz",
        "quux"
    ]
}
{{{end}}}

## Limiting values

{{{with code "en" "disjunction"}}}
! exec cue vet -t a=foo -t b=BAR
cmp stderr out
-- disjunction.cue --
package example

// Use disjunctions to limit the values that are
// permitted to be injected.
A: "foo" | "bar" | "baz" @tag(a)
B: "foo" | "bar" | "baz" @tag(b)
-- out --
B: 3 errors in empty disjunction:
B: conflicting values "bar" and "BAR":
    ./disjunction.cue:6:12
B: conflicting values "baz" and "BAR":
    ./disjunction.cue:6:20
B: conflicting values "foo" and "BAR":
    ./disjunction.cue:6:4
{{{end}}}

## Shorthand flags

{{{with code "en" "shorthand"}}}
exec cue eval -t foo 
cmp stdout out
-- shorthand.cue --
package example

// In this context, "-t foo" is the equivalent of
// "-t a=foo".
A: string @tag(a,short=foo|bar)

// A single shorthand value can inject a value
// into multiple fields simultaneously.
B: string @tag(b,short=foo|bar)
-- out --
A: "foo"
B: "foo"
{{{end}}}

<!-- TODO: link to https://review.gerrithub.io/c/cue-lang/cuelang.org/+/1196270 when it's merged
Shorthand tag attributes can also be used as build attributes. Build attributes
affect which CUE files are included in an evaluation. Read TODO for more information.
-->

## Related content

- {{< linkto/related/reference "cli/cue-injection" >}} -- the `cue` command's help
  text for value and file injection
<!-- TODO: link to similar howto guide about -T system variables -->
<!-- TODO: link to guide about build attributes -->
