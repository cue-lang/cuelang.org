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

<!--more-->

## Injecting a value

{{{with code "en" "string"}}}
env USER=robin

exec cue export -t a=foo -t name=$USER
cmp stdout out
-- string.cue --
package example

// A tag's value is treated as a string unless
// an alternative type is specified (see below).
A: string @tag(a)

// A default provides a value if the related key
// is not specified for the cue command.
B: *"bar" | string @tag(b)

C: string @tag(name)
-- out --
{
    "A": "foo",
    "B": "bar",
    "C": "robin"
}
{{{end}}}
Environment variables can be injected explicitly by the shell, as shown here
with the value of the `name` tag being set by the `USER` variable.
{{<issue 3811>}}Issue #3811{{</issue>}} tracks a proposal to simplify the
injection of multiple environment variables -- please do provide your feedback
on that issue.

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
! exec cue vet -c -t a=true
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
exec cue eval -t a='["foo", "bar"]'
cmp stdout out
-- list.cue --
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
-- out --
asString: "[\"foo\", \"bar\"]"
asList: ["foo", "bar"]
A: ["foo-with-suffix", "bar-with-suffix"]
{{{end}}}

## Related content

- {{< linkto/related/howto "inject-system-information-into-evaluation-using-tag-variable" >}}
- {{< linkto/related/reference "command/cue-help-injection" >}} -- the `cue` command's help
  text for value and file injection
- {{< linkto/related/howto "conditionally-include-cue-files-using-build-attributes" >}}
  -- shorthand tag attributes can also be used as build attributes, which
  affect which CUE files are included in an evaluation
- {{<issue 3811>}}Issue #3811{{</issue>}} tracks a proposal to simplify the
  injection of multiple environment variables
