---
title: Limiting combinations of several fields
authors: [jpluscplusm, mvdan]
toc_hide: true
---

Data sometimes needs to include values for one of several mutually exclusive
fields, or combinations of those fields.
The built-in function `matchN` can be used to describe constraints such as
"require exactly one of these fields", or "permit up to two of these fields".

This guide demonstrates how to use `matchN` as a field validator to enforce
different scenarios where you need to limit the combinations of which fields
are allowed.

<!--more-->

In this example, notice how each of the `matchN` constraints differs only in
its first parameter. This parameter is a number constraint that represents the
number of elements from its *second* parameter (a list) that must unify with
the field that's being validated. As shown here, that constraint can be a
concrete number, an upper or lower bound, or a disjunction. Indeed, it can be
any value that's able to tested against the count of how many elements in the
list were successfully unified with the field being validated.
[Learn more about `matchN`'s parameters here]({{<relref"docs/howto/use-the-built-in-function-matchn">}}).

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top" >}}
package matchn

#Schema: {alpha?: string, beta?: string, gamma?: string}

#exactlyOneField:  matchN(1,     [{alpha!: _}, {beta!: _}, {gamma!: _}]) & #Schema
#atLeastOneField:  matchN(>=1,   [{alpha!: _}, {beta!: _}, {gamma!: _}]) & #Schema
#atMostTwoFields:  matchN(<=2,   [{alpha!: _}, {beta!: _}, {gamma!: _}]) & #Schema
#oneOrThreeFields: matchN(1 | 3, [{alpha!: _}, {beta!: _}, {gamma!: _}]) & #Schema

// A, B, C, and D are all valid: they meet their respective matchN requirements.
A: #exactlyOneField  & {alpha: "foo"}
B: #atLeastOneField  & {alpha: "foo", beta: "bar"}
C: #atMostTwoFields  & {alpha: "foo", beta: "bar"}
D: #oneOrThreeFields & {alpha: "foo", beta: "bar", gamma: "baz"}

// F, G, H, and I are all invalid: they don't meet their respective matchN requirements.
F: #exactlyOneField  & {alpha: "foo", beta: "bar"}
G: #atLeastOneField  & {}
H: #atMostTwoFields  & {alpha: "foo", beta: "bar", gamma: "baz"}
I: #oneOrThreeFields & {alpha: "foo", beta: "bar"}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
F: invalid value {alpha:"foo",beta:"bar",gamma?:string} (does not satisfy matchN): 2 matched, expected 1:
    ./example.cue:5:20
    ./example.cue:5:27
    ./example.cue:17:4
H: invalid value {alpha:"foo",beta:"bar",gamma:"baz"} (does not satisfy matchN): 3 matched, expected <=2:
    ./example.cue:7:20
    ./example.cue:7:27
    ./example.cue:19:4
{{< /code-tab >}}
{{< /code-tabs >}}

In this example output, the errors for the invalid fields `G` and `I` are
currently masked by the errors caused by `F` and `H`. This reporting
discrepancy is tracked in {{<issue 3358/>}}, but is purely cosmetic --
**evaluation will not succeed** until both `G` and `I` have been modified to
meet the `matchN` requirements placed on them.

## Related content

- {{<linkto/related/howto"use-the-built-in-function-matchn">}}
