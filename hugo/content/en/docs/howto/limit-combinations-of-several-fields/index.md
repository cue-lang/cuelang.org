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

{{< code-tabs >}}
{{< code-tab name="exactlyOne.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
C: invalid value {alpha:"foo",beta?:string,gamma:"baz"} (does not satisfy matchN): 2 matched, expected 1:
    ./exactlyOne.cue:7:2
    ./exactlyOne.cue:7:9
    ./exactlyOne.cue:15:4
{{< /code-tab >}}
{{< /code-tabs >}}

Currently, an error mentioning the empty field `D` will only be reported once
the error for `C` has been resolved by changing the field's definition.
This reporting discrepancy is tracked in {{<issue 3358/>}}, but is purely
cosmetic -- evaluation will not succeed until `D` meets the `matchN`
requirements defined in `#Schema`.

## "Require at least one of these fields"

{{< code-tabs >}}
{{< code-tab name="atLeastOne.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
C: invalid value {alpha?:string,beta?:string,gamma?:string} (does not satisfy matchN): 0 matched, expected >=1:
    ./atLeastOne.cue:7:2
    ./atLeastOne.cue:7:9
    ./atLeastOne.cue:15:4
{{< /code-tab >}}
{{< /code-tabs >}}

## "Permit up to two of these fields"

{{< code-tabs >}}
{{< code-tab name="atMostTwo.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
D: invalid value {alpha:"foo",beta:"bar",gamma:"baz"} (does not satisfy matchN): 3 matched, expected <=2:
    ./atMostTwo.cue:7:2
    ./atMostTwo.cue:7:9
    ./atMostTwo.cue:16:4
{{< /code-tab >}}
{{< /code-tabs >}}

## "Require two or three of these fields"

{{< code-tabs >}}
{{< code-tab name="twoOrThree.cue" language="cue" area="top" >}}
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
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
C: invalid value {alpha:"foo",beta?:string,gamma?:string,delta?:string} (does not satisfy matchN): 1 matched, expected 2 | 3:
    ./twoOrThree.cue:8:2
    ./twoOrThree.cue:8:9
    ./twoOrThree.cue:16:4
D: invalid value {alpha:"foo",beta:"bar",gamma:"baz",delta:"quux"} (does not satisfy matchN): 4 matched, expected 2 | 3:
    ./twoOrThree.cue:8:2
    ./twoOrThree.cue:8:9
    ./twoOrThree.cue:17:4
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{<linkto/related/howto"use-the-built-in-function-matchn">}}
