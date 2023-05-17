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

The binary {{{reference "comparators"}}} `!=`, `>`, `>=`, `<`, `<=`, `!`, `=~`, and
`!~` can also be used as a validator.  For instance, where `number` defines the
set of all whole numbers, `<10` defines the set of all numbers less than `10`.

{{{with sidetrack}}}
More specifically, for any concrete `x`, `x & ⊗y` is an error if not `x ⊗ y` and
`x` otherwise
{{{end}}}

```coq
{{{with sidebyside "en" "unary-comparator-ok"}}}
#check changed from single node
-- in.cue --
a: >10
a: 11

// Numeric bounds get simplified when possible.
b: >=10
b: <=10

s: =~#"^\p{Lu}"# // string must start with a capital letter.
s: "Cat"
-- out.cue --
a: 11
b: 10
s: "Cat"
{{{end}}}
```

A bound that fails results in an error.

```coq
{{{with sidebyside "en" "unary-comparator-err"}}}
-- in.cue --
e: =~"foo"
e: "bar"
-- out.err --
e: invalid value "bar" (out of bound =~"foo"):
    ./in.cue:1:4
    ./in.cue:2:4
{{{end}}}
```

## Validators

A function in the {{{reference "standard-library"}}}  that returns a single error
value is called a validator and validates that a value is valid.
In this case the first argument in the Go documentation is the type of the
validated value and must be omitted.

```coq
{{{with sidebyside "en" "stdlib-validator"}}}
-- in.cue --
import "list"

a: [1, 2, 3]
a: list.MinItems(4)
-- out.err --
a: invalid value [1,2,3] (does not satisfy list.MinItems(4)): len(list) < MinItems(4) (3 < 4):
    ./in.cue:4:4
    ./in.cue:3:4
    ./in.cue:4:18
{{{end}}}
```

## Timestamps

Time stamps are a common data type.
CUE does not support timestamps in the language, but its standard library
provides validators to interpret strings as such.

```coq
{{{with sidebyside "en" "stdlib-time"}}}
-- in.cue --
import "time"

valid: time.Time
valid: "2006-01-02T15:04:05Z"
-- out.cue --
valid: "2006-01-02T15:04:05Z"
{{{end}}}
```

Certain CUE adaptors may convert these validators to or from format-specific
types.

<!-- TODO: CUE OpenAPI generation seems to be broken wrt to this. Make this work.

```coq
{{{with sidebyside "en" "stdlib-time-jsonschema"}}}
#norun should ignore this block because it's in an HTML comment
-- in.cue --
import "time"

#Meetup: {
	time:  time.Time
	place: string
}
-- out.jsonschema --
{{{end}}}
```

-->
