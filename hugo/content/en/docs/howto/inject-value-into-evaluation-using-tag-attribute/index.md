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

{{< code-tabs >}}
{{< code-tab name="string.cue" language="cue" area="top-left" >}}
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
{{< code-tab name="number.cue" language="cue" area="top-left" >}}
package example

A: int @tag(a,type=int)

// The number field type is compatible with both
// integers and floating point numbers.
B: number @tag(b,type=number)

// To treat an injected value exclusively as a
// float, use a tag with a number type and a field
// of type float.
C: float @tag(b,type=number)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLXQgYT00MiAtdCBiPTQuMg==" >}}
$ cue eval -t a=42 -t b=4.2
A: 42
B: 4.2
C: 4.2
{{< /code-tab >}}
{{< /code-tabs >}}

Both the `B` and `C` fields refer to the same tag attribute, `b`.
Injecting a single value can affect multiple fields.

## Injecting a boolean value

{{< code-tabs >}}
{{< code-tab name="boolean.cue" language="cue" area="top-left" >}}
package example

A: bool @tag(a,type=bool)

// This constraint causes the evaluation to fail.
A: false
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtdCBhPXRydWU=" >}}
$ cue vet -t a=true
A: conflicting values false and true:
    ./boolean.cue:6:4
{{< /code-tab >}}
{{< /code-tabs >}}

## Injecting lists of values

{{< code-tabs >}}
{{< code-tab name="list_tool.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGNtZCAtdCBhPSdbImZvbyIsICJiYXIiXScgcHJpbnRMaXN0" >}}
$ cue cmd -t a='["foo", "bar"]' printList
List element #1 is bar
List element #0 is foo
{{< /code-tab >}}
{{< /code-tabs >}}

An alternative method can be used: splitting the injected string on a specific
separator with `strings.Split()`. Assembling the command line invocation using
this method may be easier in some situations, but can be less reliable against
unexpected or malicious input. Using a stringified JSON list as demonstrated
is the more robust choice.

## Limiting values

{{< code-tabs >}}
{{< code-tab name="disjunction.cue" language="cue" area="top-left" >}}
package example

// Use disjunctions to limit the values that are
// permitted to be injected.
A: "foo" | "bar" | "baz" @tag(a)
B: "foo" | "bar" | "baz" @tag(b)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtdCBhPWZvbyAtdCBiPUJBUg==" >}}
$ cue vet -t a=foo -t b=BAR
B: 3 errors in empty disjunction:
B: conflicting values "bar" and "BAR":
    ./disjunction.cue:6:12
B: conflicting values "baz" and "BAR":
    ./disjunction.cue:6:20
B: conflicting values "foo" and "BAR":
    ./disjunction.cue:6:4
{{< /code-tab >}}
{{< /code-tabs >}}

## Shorthand flags

{{< code-tabs >}}
{{< code-tab name="shorthand.cue" language="cue" area="top-left" >}}
package example

// In this context, "-t foo" is the equivalent of
// "-t a=foo".
A: string @tag(a,short=foo|bar)

// A single shorthand value can inject a value
// into multiple fields simultaneously.
B: string @tag(b,short=foo|bar)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLXQgZm9v" >}}
$ cue eval -t foo
A: "foo"
B: "foo"
{{< /code-tab >}}
{{< /code-tabs >}}

<!-- TODO: link to https://review.gerrithub.io/c/cue-lang/cuelang.org/+/1196270 when it's merged
Shorthand tag attributes can also be used as build attributes. Build attributes
affect which CUE files are included in an evaluation. Read TODO for more information.
-->

## Related content

- {{< linkto/related/reference "cli/cue-injection" >}} -- the `cue` command's help
  text for value and file injection
<!-- TODO: link to similar howto guide about -T system variables -->
<!-- TODO: link to guide about build attributes -->
