---
title: 'Combining conditions using chained "if" clauses'
authors: [jpluscplusm]
toc_hide: true
---

The CUE language allows conditional tests to decide if certain fields are
included in data. It provides different ways to combine conditions, which
*usually* produce equivalent results.

However, in some situations a specific mechanism must be used to combine
conditions by chaining them together using multiple `if` clauses. This is
because the alternative (CUE's `&&` operator) doesn't prematurely stop (or
"short circuit") a failing compound condition that includes it.

This guide demonstrates some situations that require the use of chained `if`
clauses.

{{{with code "en" "cc"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

A: "foo"
B: 42

// Either of these 2 methods of combining
// conditions can be used if a type check
// is not required:
if A == "foo" && B < 100 {C: true}
if A == "foo" if B < 100 {C: true}

// When a type check is required, chained "if"
// clauses must be used:
if (B & int) != _|_ if B < 100 {D: true}

// This would fail if uncommented because the type
// check does not stop the inequality being tested:
// if (A & int) != _|_ && A < 100 {D: true}

#X: {
	a!: string
	b!: int
}
X: c: 4.2

// If this type check is required it must be
// combined with the inequality test using a
// chained "if" clause:
if (X & #X) != _|_ if X.b < 100 {E: true}

// This would cause an evaluation failure if
// uncommented because X.b does not exist:
// if (X & #X) != _|_ && X.b < 100 {E: true}
-- out --
{
    "A": "foo",
    "B": 42,
    "C": true,
    "D": true,
    "X": {
        "c": 4.2
    }
}
{{{end}}}

## Related content

- {{< linkto/related/tour "expressions/conditional" >}}
- {{< linkto/related/tour "expressions/listcomp" >}}
- {{< linkto/related/tour "expressions/fieldcomp" >}}
