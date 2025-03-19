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

{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top" >}}
package matchn

// A and B have identical matchN constraints of
// "allow at most two of these named fields".

A: {
	matchN(<=2, [{alpha!: _}, {beta!: _}, {gamma!: _}])
	alpha: "foo"
	beta:  "bar"
}

B: matchN(<=2, [{alpha!: _}, {beta!: _}, {gamma!: _}])
B: {
	alpha: "foo"
	beta:  "bar"
	gamma: "baz"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
B: invalid value {alpha:"foo",beta:"bar",gamma:"baz"} (does not satisfy matchN): 3 matched, expected <=2:
    ./example.cue:12:4
    ./example.cue:12:11
    ./example.cue:13:4
{{< /code-tab >}}
{{< /code-tabs >}}

All `matchN` constraints require two parameters:

- The *second* parameter is a **list of constraints**. CUE counts how many of
  these constraints are able to unify successfully with the field that's being
  validated (`A` and `B`, in our example).
- The *first* parameter is a **number constraint**. For a field to be valid,
  this constraint must be able to unify successfully with the count produced
  when CUE tested the *list of constraints*.

This flexible logic means that a range of requirements can be expressed using
similar `matchN` validators. With a *list of constraints* similar to the
examples shown above, a different *number constraint* can enforce scenarios
such as:

- Require exactly one of these fields:
  `1`
- Allow up to two of these fields:
  `<=2` (also `<3`)
- Require at least one of these fields:
  `>=1` (also `>0`)
- Require between two and four of these fields:
  `>=2 & <=4` (also `2 | 3 | 4`)
- Require either one,
  or three of these fields:
  `1 | 3`
- Require either less than three,
  or exactly four,
  or more than five of these fields:
  `<3 | 4 | >5` (also `!=3 & !=5`)
- Allow any number of these fields, other than two:
  `!=2` (also `<2 | >2`)

The different encodings that CUE allows for individual number constraints gives
you flexibility -- you can choose the form that most clearly communicates your
intent, given your specific situation. For example, `>=2 & <=4` and `2 | 3 | 4` are
equivalent in a `matchN` context, but you may find one more appropriate
than the other.

The function's parameters can also be resolved via references, which helps
avoid the `matchN` duplication shown in the example CUE above. Learn more in
{{<linkto/inline"howto/use-the-built-in-function-matchn">}}

## Related content

- {{<linkto/related/howto"use-the-built-in-function-matchn">}}
- Standard library:
  [`struct.MinFields`](/go/pkg/struct#MinFields) &
  [`struct.MaxFields`](/go/pkg/struct#MaxFields)
  -- limit the total number of fields present in a struct
