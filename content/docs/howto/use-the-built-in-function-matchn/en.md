---
title: Using the built-in function "matchN" as a field validator
tags: [commented cue]
authors: [jpluscplusm]
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: access to cue tip"}}}
export PATH=/cues/$CUELANG_CUE_TIP:$PATH
{{{end}}}

{{<caution>}}
This guide demonstrates a CUE feature that isn't yet available in a release.
It is only available in the `cue` command and Go API when they are
[installed from source]({{< relref "/docs/introduction/installation" >}}#install-from-source)
using the `@master` version selector.
{{</caution>}}

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the
[built-in]({{< relref "docs/reference/glossary#built-in-functions" >}})
function `matchN()` as a field validator. This flexible function allows CUE
constraints to be bound together in a wide range of combinations, including
"one of", "any of", "all of", and "none of"/"not".

This guide uses the following unreleased version of CUE:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

## Basic use

The `matchN()` function takes two arguments:

1. a **number constraint**;
2. a **list of constraints**.

The function validates a field's value by unifying the value with each item in
the **list of constraints** in turn, and keeping count of how many list items
the field's value is able to unify with. A field's value is valid if the count
unifies successfully with the **number constraint**:

<!-- We use upload/script pairs because code blocks can't access non-default
versions of CUE cf. https://cuelang.org/issues/3265 -->
{{{with upload "en" "basic"}}}
-- basic.cue --
package basic

A: 42
// A validates successfully.
A: matchN(1, [int])
A: matchN(2, [int, >10])
A: matchN(2, [int, >10, >100])

B: 42
// B fails to validate.
B: matchN(1, [int, >10])
B: matchN(3, [int, >10, >100])
{{{end}}}
{{{with script "en" "basic"}}}
! cue vet .:basic
{{{end}}}

## "One of"

With its **number constraint** set to `1` the `matchN()` function checks that a
field's value unifies successfully with just one of the **list of
constraints**:

{{{with upload "en" "one of"}}}
-- one-of.cue --
package oneOf

A: 42
// A validates successfully.
A: matchN(1, [int])
A: matchN(1, [>10, >100, string])

B: 42
// B fails to validate.
B: matchN(1, [int, >10])
B: matchN(1, [string, >100])
{{{end}}}
{{{with script "en" "one of"}}}
! cue vet .:oneOf
{{{end}}}

## "Any of"

If the **number constraint** is set to `>0`, the function checks that at least
one of the **list of constraints** unifies with the field's value:

{{{with upload "en" "any of"}}}
-- any-of.cue --
package anyOf

A: 42
// A validates successfully.
A: matchN(>0, [>10])
A: matchN(>0, [int, >0, >100, string])

B: 42
// B fails to validate.
B: matchN(1, [int, >0])
B: matchN(>0, [string, >100])
{{{end}}}
{{{with script "en" "any of"}}}
! cue vet .:anyOf
{{{end}}}

## "All of"

To check that a field's value unifies successfully with all of the **list of
constraints**, set the **number constraint** to a value matching the number of
items in the list:

{{{with upload "en" "all of"}}}
-- all-of.cue --
package allOf

import "math"

A: 42
// A validates successfully.
A: matchN(1, [int])
A: matchN(2, [int, >10])
A: matchN(4, [int, >10, <100, math.MultipleOf(2)])

B: 42
// B fails to validate.
B: matchN(3, [int, >10, >100])
B: matchN(4, [int, >10, <100, math.MultipleOf(41)])
{{{end}}}
{{{with script "en" "all of"}}}
! cue vet .:allOf
{{{end}}}

## "Not"

If you set the **number constraint** to `0` then `matchN()` checks that a
field's value doesn't unify successfully with any of the **list of
constraints**:

{{{with upload "en" "not"}}}
-- not.cue --
package not

import (
	"strings"
	"struct"
)

A: 42
// A validates successfully.
A: matchN(0, [string])
A: matchN(0, [bytes, struct.MinFields(0)])
A: matchN(0, [>100, strings.HasPrefix("4")])

B: 42
// B fails to validate.
B: matchN(0, [int])
B: matchN(0, [string, number])
B: matchN(0, [42, >100, strings.HasSuffix(2)])
{{{end}}}
{{{with script "en" "not"}}}
! cue vet .:not
{{{end}}}

## More complex uses

### References

Either argument to `matchN()` can be resolved through a reference:

{{{with upload "en" "all but one"}}}
-- all-but-one.cue --
package allButOne

// A validates successfully.
A: 42
A: matchN(len(#C)-1, #C)

// B fails to validate.
B: 42.0
B: matchN(len(#C)-1, #C)

#C: [number, int, >100]
{{{end}}}
{{{with script "en" "all but one"}}}
! cue vet .:allButOne
{{{end}}}

### Composite data structures

The `matchN()` function can validate composite data structures, not just
primitive values. Use it with both structs and lists:

{{{with upload "en" "composite"}}}
-- composite.cue --
package composite

// A validates successfully.
A: matchN(>0, [#C1, #C2]) & {
	x: 42
	y: "42"
}
// B fails to validate.
B: matchN(>0, [#C1, #C2]) & {
	x: "4.2"
	y: "4.2"
	z: "4.2"
}
#C1: {x: int, ...}
#C2: {
	z: float
	y: string
	...
}

// D validates successfully.
D: [1, 2, 3] & matchN(1, [#F1, #F2, #F3])
// E fails to validate.
E: [11, 12, 13] & matchN(1, [#F1, #F2, #F3])
#F1: [...>0]
#F2: [...>10]
#F3: [...>100]
{{{end}}}
{{{with script "en" "composite"}}}
! cue vet .:composite
{{{end}}}

The sub-optimal error reporting for field `E` is tracked in {{<issue 3389/>}}.
