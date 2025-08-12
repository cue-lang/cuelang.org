---
title: Using the built-in function "error" to create custom errors
tags: [language]
authors: [jpluscplusm]
toc_hide: true
---
{{<sidenote text="Requires CUE v0.14.0 or later" >}}

The built-in function `error` can be used to create a custom error value with a
message that will be displayed when a field is in error.

<!--more-->

## In a disjunction

The [CUE language specification]({{<relref"docs/reference/spec/#error">}})
demonstrates
`error` being used in a
[disjunction]({{<relref"docs/tour/types/disjunctions">}}) like this:

{{{with code "en" "1"}}}
! exec cue vet file.cue
cmp stderr out
-- file.cue --
// A is in error without a custom error value.
A: 1 | 2
A: string

// B is the same as A with a custom error value.
B: 1 | 2 | error("Custom error B")
B: string

n: 0
// C is in error without a custom error value.
C: 42 / n
// D is the same as C with a custom error value.
D: 42/n | error("Custom error D")
-- out --
A: 2 errors in empty disjunction:
A: conflicting values string and 1 (mismatched types string and int):
    ./file.cue:2:4
    ./file.cue:3:4
A: conflicting values string and 2 (mismatched types string and int):
    ./file.cue:2:8
    ./file.cue:3:4
B: Custom error B:
    ./file.cue:6:12
C: failed arithmetic: division by zero:
    ./file.cue:11:4
D: Custom error D:
    ./file.cue:13:11
{{{end}}}

If at least one element of the disjunction is valid then any custom errors are ignored.
Otherwise all custom error messages are reported together.

## As an assertion

Here’s an example of `error` being used as an assertion:

{{{with code "en" "2"}}}
! exec cue vet file.cue
cmp stderr out
-- file.cue --
A: [1, 2, 3]
B: 10
if len(A) < B {
	A: error("must have at least \(B) elements")
}
-- out --
A: must have at least 10 elements:
    ./file.cue:4:5
{{{end}}}

While this is valid CUE, we’re not yet sure if it should be considered *idiomatic*.
At present, using `error` in this way is neither recommended nor discouraged.

## Feedback

Because `error` was only introduced recently
(in [CUE v0.14.0](/releases/v0.14.0))
best practices around its usage are still evolving.
We'd love to hear how you're using `error`, and if it behaves how you expect --
please do join
[the CUE community](/community/) and tell us about your experience on
[Slack](/s/slack),
[Discord](/s/discord), or in
[a GitHub discussion](/discussions/)!

## Related content

- Reference: The CUE Language Specification:
  [the built-in function `error`]({{<relref"docs/reference/spec/#error">}})
- {{<linkto/related/tour"types/disjunctions">}}
