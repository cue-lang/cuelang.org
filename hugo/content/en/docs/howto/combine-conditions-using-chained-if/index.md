---
title: Combining conditions using chained "if" guards
authors: [jpluscplusm]
tags: [language]
toc_hide: true
---

The CUE language allows `if` guards in
[field comprehensions]({{<relref"docs/tour/expressions/fieldcomp">}})
and
[list comprehensions]({{<relref"docs/tour/expressions/listcomp">}})
to declare fields or include list elements conditionally:

<!--more-->

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

A: 4

if A > 10 {B: true}
if A < 10 {
	C: true
}
D: [
	1, 2, 3,
	if A < 10 {A},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "C": true,
    "A": 4,
    "D": [
        1,
        2,
        3,
        4
    ]
}
{{< /code-tab >}}
{{< /code-tabs >}}

CUE provides two main ways to *combine* more than one condition.
You can either use the logical operators `&&` and `||`,
or you can chain multiple `if` guards together:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

A: 4
B: 42

// "&&" is the "and" logical operator:
if A < 10 && B < 100 {C: true}

// Chained if guards follow one after the other:
if A < 10 if B < 100 {D: true}

// Chained if guards can be separated from each
// other (and from their emitted value) with
// newlines:
if A < 10
if B < 100 {
	E: true
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "A": 4,
    "B": 42,
    "C": true,
    "D": true,
    "E": true
}
{{< /code-tab >}}
{{< /code-tabs >}}

Some situations *require* you to use chained `if` guards.
In this failing example we use a logical operator to combine
testing if the `A` field is a number with
a test of its value.
This results in an evaluation failure:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

A: "forty two"
// This CUE causes an evaluation failure.
if ((A & number) != _|_) && A < 100 {B: true}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
invalid operands "forty two" and 100 to '<' (type string and int):
    ./file.cue:5:29
    ./file.cue:3:4
    ./file.cue:5:33
{{< /code-tab >}}
{{< /code-tabs >}}

The evaluation failure occurs because our test's second condition (`A < 100`)
is always evaluated.
Rather than using a logical operator, this test must be written using two `if`
guards chained together:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

A: "forty two"
if (A & number) != _|_ if A < 100 {B: true}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "A": "forty two"
}
{{< /code-tab >}}
{{< /code-tabs >}}


The evaluation failure of the previous command happened
because CUE's logical operators don't short circuit,
unlike many other languages.
When CUE evaluates "`X && Y`" or "`X || Y`"
it always evaluates `Y` -- no matter the value of `X`.
As a general rule,
if a subsequent condition might result in an evaluation failure
then you should use a chained `if` guard
instead of a logical operator.

Here are some more examples of tests that should be written using chained `if` guards:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

// Use chained if guards when checking the value
// of an optional field ...
A: {x!: string, o?: string} & {x: "foo"}
if A.o != _|_ if A.o == "bar" {
	B: true
}

// ... or when checking the value of a regular
// field that might not be present.
C: x: "foo"
if C.o != _|_ if C.o == "bar" {
	D: true
}

// Use chained if guards when checking a value's
// type before testing its value.
E: 42
if (E & string) != _|_ if E == "foo" {
	F: true
}
if (E & number) != _|_ if E < 100 {G: true}

// Chained if guards can be used anywhere a single
// if guard would be valid by itself.
H: [
	"foo", "bar",
	if (E & string) != _|_
	if E != "baz" {E},
]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "G": true,
    "A": {
        "x": "foo"
    },
    "C": {
        "x": "foo"
    },
    "E": 42,
    "H": [
        "foo",
        "bar"
    ]
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/tour "expressions/conditional" >}}
- {{< linkto/related/tour "expressions/listcomp" >}}
- {{< linkto/related/tour "expressions/fieldcomp" >}}
