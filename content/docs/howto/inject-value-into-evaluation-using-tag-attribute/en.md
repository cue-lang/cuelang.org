---
title: Injecting a value into an evaluation using a tag attribute
toc_hide: true
authors: [jpluscplusm]
tags: [cue command]
---

One of CUE's core concepts is that evaluations should be *repeatable:* given
the same input, the same output should result.
However it can sometimes be necessary to introduce context or other information
into an evaluation. As described in the
[`cue injection`]({{< relref "/docs/reference/cli/cue-injection" >}})
reference page, CUE allows information to be introduced, or *injected*, by
using tag attributes and tag variables.

This guide demonstrates how to use tag attributes to inject values into CUE
evaluations.
All the techniques demonstrated in this guide are supported by the following
commands:

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

A: string @tag(a)

// Using a disjunction with the empty list as
// its default ensures that an evaluation can
// succeed even if no value is provided at the
// command line.
aList: *json.Unmarshal(A) | []

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

<!-- TODO: link to https://review.gerrithub.io/c/cue-lang/cuelang.org/+/1196270 when it's merged
Shorthand tag attributes can also be used as build attributes. Build attributes
affect which CUE files are included in an evaluation. Read TODO for more information.
-->

## Related content

- {{< linkto/related/reference "cli/cue-injection" >}} -- the `cue` command's help
  text for value and file injection
<!-- TODO: link to similar howto guide about -T system variables -->
<!-- TODO: link to guide about build attributes -->
