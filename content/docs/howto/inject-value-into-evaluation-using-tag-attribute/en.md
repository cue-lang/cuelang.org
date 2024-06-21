---
title: Injecting a value into an evaluation using a tag attribute
toc_hide: true
authors: [jpluscplusm]
tags: [cue command]
---

This guide demonstrates how to use tag attributes to inject values into CUE
evaluations across various situations and different `cue` subcommands.
All the techniques demonstrated in this guide are supported by the following
commands, except where explicitly noted:

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

Both the `B` and `C` fields refer to the same tag attribute, `b`.
Injecting a single value can affect multiple fields.

## Injecting a boolean value

{{{with code "en" "boolean"}}}
! exec cue vet -t a=true
cmp stderr out
-- boolean.cue --
package example

A: bool @tag(a,type=bool)

// This constraint causes the evaluation to fail.
A: false
-- out --
A: conflicting values false and true:
    ./boolean.cue:6:4
{{{end}}}

## Injecting lists of values

{{{with code "en" "list"}}}
exec cue cmd -t a='["foo", "bar"]' printList
cmp stdout out
-- list_tool.cue --
package example

import (
	"encoding/json"
	"tool/cli"
)

A:     string @tag(a)
aList: json.Unmarshal(A)

command: printList: {
	for i, v in aList {
		"print-\(v)": cli.Print & {
			text: "List element #\(i) is \(v)"
		}
	}
}
-- out --
List element #1 is bar
List element #0 is foo
{{{end}}}

An alternative method can be used: splitting the injected string on a specific
separator with `strings.Split()`. Assembling the command line invocation using
this method may be easier in some situations, but can be less reliable against
unexpected or malicious input. Using a stringified JSON list as demonstrated
is the more robust choice.

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
