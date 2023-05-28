---
title: Value Constraints
weight: 30
draft: false
---

Value constraints allow for more fine-grained validation than just type-based checks.
Although types often suffice for programming, it is too coarse for configuration.

<!--

<JSON schema as an example>

CUE allows defining separate restrictions on

By using references, CUE also allows defining detailed relations between fields.

-->

## Unary comparators

The binary {{{reference "comparators"}}}
 `!=`, `>`, `>=`, `<`, `<=`, `!`, `=~`, and
`!~` can also be used as a validator.  For instance, where `number` defines the
set of all whole numbers, `<10` defines the set of all numbers less than `10`.

{{{with sidetrack}}}
More specifically, for any concrete `x`, `x & ⊗y` is an error if not `x ⊗ y` and
`x` otherwise
{{{end}}}


{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: >10
a: 11

// Numeric bounds get simplified when possible.
b: >=10
b: <=10

s: =~#"^\p{Lu}"# // string must start with a capital letter.
s: "Cat"
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: 11
b: 10
s: "Cat"
{{< /code-tab >}}
{{< /code-tabs >}}

A bound that fails results in an error.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
e: =~"foo"
e: "bar"
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" type="terminal" area="top-right" >}}
e: invalid value "bar" (out of bound =~"foo"):
    ./in.cue:1:4
    ./in.cue:2:4
{{< /code-tab >}}
{{< /code-tabs >}}

## Validators

A function in the {{{reference "standard-library"}}}
  that returns a single error
value is called a validator and validates that a value is valid.
In this case the first argument in the Go documentation is the type of the
validated value and must be omitted.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
import "list"

a: [1, 2, 3]
a: list.MinItems(4)
{{< /code-tab >}}
{{< code-tab name="ERR" language="err" type="terminal" area="top-right" >}}
a: invalid value [1,2,3] (does not satisfy list.MinItems(4)): len(list) < MinItems(4) (3 < 4):
    ./in.cue:4:4
    ./in.cue:3:4
    ./in.cue:4:18
{{< /code-tab >}}
{{< /code-tabs >}}

## Timestamps

Time stamps are a common data type.
CUE does not support timestamps in the language, but its standard library
provides validators to interpret strings as such.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
import "time"

valid: time.Time
valid: "2006-01-02T15:04:05Z"
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
valid: "2006-01-02T15:04:05Z"
{{< /code-tab >}}
{{< /code-tabs >}}

Certain CUE adaptors may convert these validators to or from format-specific
types.

<!-- TODO: CUE OpenAPI generation seems to be broken wrt to this. Make this work.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
import "time"

#Meetup: {
	time:  time.Time
	place: string
}
{{< /code-tab >}}
{{< code-tab name="JSONSCHEMA" language="jsonschema" type="terminal" area="top-right" >}}
{{< /code-tab >}}
{{< /code-tabs >}}

-->
