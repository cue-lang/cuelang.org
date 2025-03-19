---
title: Limiting combinations of several fields
authors: [jpluscplusm, mvdan]
toc_hide: true
---

Data sometimes needs to include values for one of several mutually exclusive
fields, or combinations of those fields.
The built-in function `matchN` can be used to describe constraints such as
"require exactly one of these fields", or "permit up to two of these fields".

This guide demonstrates how to use `matchN` to enforce different scenarios
where you need to limit the combinations of fields that are allowed.

## "Require exactly one of these fields"

{{{with code "en" "1"}}}
#location top bottom
! exec cue vet -c
cmp stderr out
-- exactlyOne.cue --
package exactlyOne

#Schema: {
	alpha?: string
	beta?:  string
	gamma?: string
	matchN(1, [{alpha!: _}, {beta!: _}, {gamma!: _}])
}

// Valid structs:
A: #Schema & {alpha: "foo"}
B: #Schema & {beta: "bar"}

// Invalid structs:
C: #Schema & {alpha: "foo", gamma: "baz"} // Too many fields.
D: #Schema & {}                           // Not enough fields.
-- out --
C: invalid value {alpha:"foo",gamma:"baz",beta?:string} (does not satisfy matchN): 2 matched, expected 1:
    ./exactlyOne.cue:7:2
    ./exactlyOne.cue:7:9
    ./exactlyOne.cue:15:4
{{{end}}}

Currently, an error mentioning the empty field `D` will only be reported once
the error for `C` has been resolved by changing the field's definition.
This reporting discrepancy is tracked in {{<issue 3358/>}}, but is purely
cosmetic -- evaluation will not succeed until `D` meets the `matchN`
requirements defined in `#Schema`.

## "Require at least one of these fields"

{{{with code "en" "2"}}}
#location top bottom
! exec cue vet -c
cmp stderr out
-- atLeastOne.cue --
package atLeastOne

#Schema: {
	alpha?: string
	beta?:  string
	gamma?: string
	matchN(>=1, [{alpha!: _}, {beta!: _}, {gamma!: _}])
}

// Valid structs:
A: #Schema & {alpha: "foo"}
B: #Schema & {alpha: "foo", beta: "bar"}

// Invalid structs:
C: #Schema & {} // Not enough fields.
-- out --
C: invalid value {alpha?:string,beta?:string,gamma?:string} (does not satisfy matchN): 0 matched, expected >=1:
    ./atLeastOne.cue:7:2
    ./atLeastOne.cue:7:9
    ./atLeastOne.cue:15:4
C.alpha: field is required but not present:
    ./atLeastOne.cue:7:2
    ./atLeastOne.cue:7:16
C.beta: field is required but not present:
    ./atLeastOne.cue:7:2
    ./atLeastOne.cue:7:29
C.gamma: field is required but not present:
    ./atLeastOne.cue:7:2
    ./atLeastOne.cue:7:41
{{{end}}}

## "Permit up to two of these fields"

{{{with code "en" "3"}}}
#location top bottom
! exec cue vet -c
cmp stderr out
-- atMostTwo.cue --
package atMostTwo

#Schema: {
	alpha?: string
	beta?:  string
	gamma?: string
	matchN(<=2, [{alpha!: _}, {beta!: _}, {gamma!: _}])
}

// Valid structs:
A: #Schema & {}
B: #Schema & {alpha: "foo"}
C: #Schema & {alpha: "foo", beta: "bar"}

// Invalid structs:
D: #Schema & {alpha: "foo", beta: "bar", gamma: "baz"} // Too many fields.
-- out --
D: invalid value {alpha:"foo",beta:"bar",gamma:"baz"} (does not satisfy matchN): 3 matched, expected <=2:
    ./atMostTwo.cue:7:2
    ./atMostTwo.cue:7:9
    ./atMostTwo.cue:16:4
{{{end}}}

## "Require two or three of these fields"

{{{with code "en" "4"}}}
#location top bottom
! exec cue vet -c
cmp stderr out
-- twoOrThree.cue --
package twoOrThree

#Schema: {
	alpha?: string
	beta?:  string
	gamma?: string
	delta?: string
	matchN(2 | 3, [{alpha!: _}, {beta!: _}, {gamma!: _}, {delta!: _}])
}

// Valid structs:
A: #Schema & {alpha: "foo", beta: "bar"}
B: #Schema & {alpha: "foo", beta: "bar", gamma: "baz"}

// Invalid structs:
C: #Schema & {alpha: "foo"}                                           // Not enough fields.
D: #Schema & {alpha: "foo", beta: "bar", gamma: "baz", delta: "quux"} // Too many fields.
-- out --
C: invalid value {alpha:"foo",beta?:string,gamma?:string,delta?:string} (does not satisfy matchN): 1 matched, expected 2 | 3:
    ./twoOrThree.cue:8:2
    ./twoOrThree.cue:8:9
    ./twoOrThree.cue:16:4
C.beta: field is required but not present:
    ./twoOrThree.cue:8:2
    ./twoOrThree.cue:8:31
C.delta: field is required but not present:
    ./twoOrThree.cue:8:2
    ./twoOrThree.cue:8:56
C.gamma: field is required but not present:
    ./twoOrThree.cue:8:2
    ./twoOrThree.cue:8:43
D: invalid value {alpha:"foo",beta:"bar",gamma:"baz",delta:"quux"} (does not satisfy matchN): 4 matched, expected 2 | 3:
    ./twoOrThree.cue:8:2
    ./twoOrThree.cue:8:9
    ./twoOrThree.cue:17:4
{{{end}}}

## Related content

- {{<linkto/related/howto"use-the-built-in-function-matchn">}}
