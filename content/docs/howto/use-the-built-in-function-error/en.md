---
title: Using the built-in function "error" to create custom errors
tags: [language]
authors: [jpluscplusm]
toc_hide: true
---
{{<sidenote text="Requires CUE v0.14.0 or later" >}}

The built-in function `error` can be used to create a custom error value with a
message that will be displayed when an evaluation fails.
When a custom error is included in a disjunction, and an evaluation eliminates
all non-error elements, the custom error is displayed instead of CUE's standard
errors for the associated field:

<!--more-->

{{{with code "en" "1"}}}
! exec cue vet file.cue
cmp stderr out
-- file.cue --
A: 1 | 2
A: string

B: 1 | 2 | error("Custom error B")
B: string

n: 0
C: 42 / n
D: 42/n | error("Custom error D")
-- out --
A: 2 errors in empty disjunction:
A: conflicting values string and 1 (mismatched types string and int):
    ./file.cue:1:4
    ./file.cue:2:4
A: conflicting values string and 2 (mismatched types string and int):
    ./file.cue:1:8
    ./file.cue:2:4
B: Custom error B:
    ./file.cue:4:12
C: failed arithmetic: division by zero:
    ./file.cue:8:4
D: Custom error D:
    ./file.cue:9:11
{{{end}}}

Because `error` was only introduced recently (in CUE v0.14.0), idiomatic use of
the function is still being explored and shaped through shared experience and
feedback. We'd love to hear how you're using `error`, and if it behaves how you
expect -- please do join [the CUE community](/community/) and tell us about
your experience on [Slack](/s/slack), [Discord](/s/discord), or in
[a GitHub discussion](/discussions/)!

{{<warning>}}
It's not yet clear to us if using `error` in a conditional or "assertion"
context should be treated as idiomatic CUE. The following is valid, but is
currently neither recommended nor discouraged:
{{</warning>}}

{{{with code "en" "2"}}}
! exec cue vet file.cue
cmp stderr out
-- file.cue --
A: [1, 2, 3]
B: 10
if len(A) < B {
	error("list A must have at least \(B) elements")
}
-- out --
list A must have at least 10 elements:
    ./file.cue:4:2
{{{end}}}

## Related content

- Reference: The CUE Language Specification defines
  [the built-in function `error`]({{<relref"docs/reference/spec/#error">}})
