---
title: Using the built-in function "matchN" as a field validator
authors: [jpluscplusm]
toc_hide: true
---

This guide demonstrates how to use the
[built-in]({{< relref "docs/reference/glossary#built-in-functions" >}})
function `matchN`.
It may only be used as a field validator and
can't be called as a function that returns a boolean value.

The current implementation of `matchN` is inspired by JSON Schema's
`oneOf`,
`anyOf`,
`allOf`, and
`not`
concepts.
This guide shows how those concepts can be encoded in CUE.

<!--more-->

## Basic use

The `matchN` function takes two arguments:

1. a **number constraint**;
2. a **list of constraints**.

The function validates a field's value by unifying the value with each item in
the **list of constraints** in turn, and keeping count of how many list items
the field's value is able to unify with. A field's value is valid if the count
unifies successfully with the **number constraint**:

{{< code-tabs >}}
{{< code-tab name="basic.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmJhc2lj" >}}
$ cue vet -c .:basic
B: invalid value 42 (does not satisfy matchN): 2 matched, expected 1:
    ./basic.cue:11:4
    ./basic.cue:9:4
    ./basic.cue:11:11
    ./basic.cue:12:4
B: invalid value 42 (does not satisfy matchN): 2 matched, expected 3:
    ./basic.cue:12:4
    ./basic.cue:9:4
    ./basic.cue:11:4
    ./basic.cue:12:11
B: invalid value 42 (out of bound >100):
    ./basic.cue:12:25
    ./basic.cue:9:4
{{< /code-tab >}}
{{< /code-tabs >}}

## "One of"

With its **number constraint** set to `1` the `matchN` function checks that a
field's value unifies successfully with just one of the **list of
constraints**:

{{< code-tabs >}}
{{< code-tab name="one-of.cue" language="cue" area="top" >}}
package oneOf

import "math"

A: 42
// A validates successfully.
A: matchN(1, [int])
A: matchN(1, [>10, >100, string])
A: matchN(1, [math.MultipleOf(3), math.MultipleOf(5)])

B: 42
// B fails to validate.
B: matchN(1, [int, >10])
B: matchN(1, [string, >100])

C: 15
// C fails to validate.
C: matchN(1, [math.MultipleOf(3), math.MultipleOf(5)])
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOm9uZU9m" >}}
$ cue vet -c .:oneOf
B: conflicting values 42 and string (mismatched types int and string):
    ./one-of.cue:11:4
    ./one-of.cue:14:15
B: invalid value 42 (does not satisfy matchN): 2 matched, expected 1:
    ./one-of.cue:13:4
    ./one-of.cue:11:4
    ./one-of.cue:13:11
    ./one-of.cue:14:4
B: invalid value 42 (does not satisfy matchN): 0 matched, expected 1:
    ./one-of.cue:14:4
    ./one-of.cue:11:4
    ./one-of.cue:13:4
    ./one-of.cue:14:11
B: invalid value 42 (out of bound >100):
    ./one-of.cue:14:23
    ./one-of.cue:11:4
C: invalid value 15 (does not satisfy matchN): 2 matched, expected 1:
    ./one-of.cue:18:4
    ./one-of.cue:16:4
    ./one-of.cue:18:11
{{< /code-tab >}}
{{< /code-tabs >}}

## "Any of"

If the **number constraint** is set to `>0`, the function checks that at least
one of the **list of constraints** unifies with the field's value:

{{< code-tabs >}}
{{< code-tab name="any-of.cue" language="cue" area="top" >}}
package anyOf

A: 42
// A validates successfully.
A: matchN(>0, [>10])
A: matchN(>0, [int, >0, >100, string])

B: 42
// B fails to validate.
B: matchN(>0, [string, >100])
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFueU9m" >}}
$ cue vet -c .:anyOf
B: conflicting values 42 and string (mismatched types int and string):
    ./any-of.cue:8:4
    ./any-of.cue:10:16
B: invalid value 42 (does not satisfy matchN): 0 matched, expected >0:
    ./any-of.cue:10:4
    ./any-of.cue:8:4
    ./any-of.cue:10:11
B: invalid value 42 (out of bound >100):
    ./any-of.cue:10:24
    ./any-of.cue:8:4
{{< /code-tab >}}
{{< /code-tabs >}}

## "All of"

To check that a field's value unifies successfully with all of the **list of
constraints**, set the **number constraint** to a value matching the number of
items in the list:

{{< code-tabs >}}
{{< code-tab name="all-of.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFsbE9m" >}}
$ cue vet -c .:allOf
B: invalid value 42 (does not satisfy matchN): 2 matched, expected 3:
    ./all-of.cue:13:4
    ./all-of.cue:11:4
    ./all-of.cue:13:11
    ./all-of.cue:14:4
B: invalid value 42 (does not satisfy matchN): 3 matched, expected 4:
    ./all-of.cue:14:4
    ./all-of.cue:11:4
    ./all-of.cue:13:4
    ./all-of.cue:14:11
B: invalid value 42 (does not satisfy math.MultipleOf(41)):
    ./all-of.cue:14:31
    ./all-of.cue:11:4
    ./all-of.cue:13:4
    ./all-of.cue:14:4
    ./all-of.cue:14:47
{{< /code-tab >}}
{{< /code-tabs >}}

## "Not"

If you set the **number constraint** to `0` then `matchN` checks that a
field's value doesn't unify successfully with any of the **list of
constraints**:

{{< code-tabs >}}
{{< code-tab name="not.cue" language="cue" area="top" >}}
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
B: matchN(0, [42, >100, strings.HasSuffix("4")])
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOm5vdA==" >}}
$ cue vet -c .:not
B: invalid value 42 (does not satisfy matchN): 1 matched, expected 0:
    ./not.cue:16:4
    ./not.cue:14:4
    ./not.cue:16:11
    ./not.cue:17:4
    ./not.cue:18:4
B: invalid value 42 (does not satisfy matchN): 1 matched, expected 0:
    ./not.cue:17:4
    ./not.cue:14:4
    ./not.cue:16:4
    ./not.cue:17:11
    ./not.cue:18:4
{{< /code-tab >}}
{{< /code-tabs >}}

## More complex uses

### References

Either argument to `matchN` can be resolved through a reference:

{{< code-tabs >}}
{{< code-tab name="all-but-one.cue" language="cue" area="top" >}}
package allButOne

// A validates successfully.
A: 42
A: matchN(len(#C)-1, #C)

// B fails to validate.
B: 42.0
B: matchN(len(#C)-1, #C)

#C: [number, int, >100]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmFsbEJ1dE9uZQ==" >}}
$ cue vet -c .:allButOne
B: conflicting values 42.0 and int (mismatched types float and int):
    ./all-but-one.cue:8:4
    ./all-but-one.cue:11:14
B: invalid value 42.0 (does not satisfy matchN): 1 matched, expected 2:
    ./all-but-one.cue:9:4
    ./all-but-one.cue:8:4
    ./all-but-one.cue:9:11
B: invalid value 42.0 (out of bound >100):
    ./all-but-one.cue:11:19
    ./all-but-one.cue:8:4
{{< /code-tab >}}
{{< /code-tabs >}}

### Composite data structures

The `matchN` function can validate composite data structures, not just
primitive values. Use it with both structs and lists:

{{< code-tabs >}}
{{< code-tab name="composite.cue" language="cue" area="top" >}}
package composite

// A validates successfully.
A: matchN(>0, [#C1, #C2]) & {
	x: 42
	y: 4.2
}
// B fails to validate.
B: matchN(>0, [#C1, #C2]) & {
	x: 4.2 // Not an int.
	y: 4.2 // Not a string.
	z: 4.2
}
#C1: {x!: int, ...}
#C2: {
	y!: string
	z?: float
	...
}

// D validates successfully.
D: [1, 2, 3] & matchN(1, [#F1, #F2, #F3])
// E fails to validate.
E: [11, 12, 13] & matchN(1, [#F1, #F2, #F3])
#F1: [...>0]
#F2: [...>10]
#F3: [...>100]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmNvbXBvc2l0ZQ==" >}}
$ cue vet -c .:composite
B.x: conflicting values 4.2 and int (mismatched types float and int):
    ./composite.cue:9:16
    ./composite.cue:10:5
    ./composite.cue:14:11
B.y: conflicting values 4.2 and string (mismatched types float and string):
    ./composite.cue:9:21
    ./composite.cue:11:5
    ./composite.cue:16:6
B: invalid value {x:4.2,y:4.2,z:4.2} (does not satisfy matchN): 0 matched, expected >0:
    ./composite.cue:9:4
    ./composite.cue:9:11
E: invalid value [11,12,13] (does not satisfy matchN): 2 matched, expected 1:
    ./composite.cue:24:19
    ./composite.cue:24:4
    ./composite.cue:24:26
E.0: invalid value 11 (out of bound >100):
    ./composite.cue:27:10
    ./composite.cue:24:5
{{< /code-tab >}}
{{< /code-tabs >}}

## Future enhancements

The current release of `matchN` does not consider hidden fields or definitions
when checking for a match:

{{< code-tabs >}}
{{< code-tab name="helper-fields.cue" language="cue" area="top" >}}
package helperFields

#A: {
	_aString: string
	#anInt:   int
}

A: matchN(1, [#A]) & {
	_aString: 42
	#anInt:   "not an int"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYyAuOmhlbHBlckZpZWxkcyAjIHRoaXMgY29tbWFuZCBzdWNjZWVkcw==" >}}
$ cue vet -c .:helperFields # this command succeeds
{{< /code-tab >}}
{{< /code-tabs >}}

This behaviour *may* change with future CUE releases.
If support for hidden fields or definitions is important to how you would like
to use `matchN`, please join [the CUE community]({{< relref "/community" >}})
and tell us about your use case.
