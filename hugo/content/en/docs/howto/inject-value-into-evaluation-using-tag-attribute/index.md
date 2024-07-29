---
title: Injecting a value into an evaluation using a tag attribute
tags: [cue command]
authors: [jpluscplusm]
toc_hide: true
---

This guide demonstrates how to use tag attributes to inject arbitrary values
into CUE evaluations. A separate guide details
[how to inject system information]({{< relref "/docs/howto/inject-system-information-into-evaluation-using-tag-variable" >}}).

One of CUE's core concepts is that evaluations should be *repeatable:* given
the same input, the same output should be produced.
However, sometimes it can be necessary to introduce context or other information
into an evaluation that might cause the output to vary. As described in the
[`cue help injection`]({{< relref "/docs/reference/command/cue-help-injection" >}})
reference, CUE allows information to be introduced, or *injected*, by using tag
attributes and tag variables. This guide demonstrates tag attributes.
<!-- TODO(jcm): include a cue-cmd in the set of commands demonstrated on this page -->

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
{{< code-tab name="list.cue" language="cue" area="top-left" >}}
package example

import "encoding/json"

asString: string @tag(a)

// Using a disjunction with the empty list ensures
// that an evaluation can succeed even if no value
// is provided for the tag value.
asList: *json.Unmarshal(asString) | []

A: [
	for e in asList {"\(e)-with-suffix"},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgLXQgYT0nWyJmb28iLCAiYmFyIl0n" >}}
$ cue eval -t a='["foo", "bar"]'
asString: "[\"foo\", \"bar\"]"
asList: ["foo", "bar"]
A: ["foo-with-suffix", "bar-with-suffix"]
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/howto "inject-system-information-into-evaluation-using-tag-variable" >}}
- {{< linkto/related/reference "command/cue-help-injection" >}} -- the `cue` command's help
  text for value and file injection
- {{< linkto/related/howto "conditionally-include-cue-files-using-build-attributes" >}}
  -- shorthand tag attributes can also be used as build attributes, which
  affect which CUE files are included in an evaluation
