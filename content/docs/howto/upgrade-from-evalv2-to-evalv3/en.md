---
title: Upgrading from Evalv2 to Evalv3
toc_hide: true
authors: [mvdan, jpluscplusm]
---

## What is Evalv3?

Evalv3 is a new major version of the CUE evaluator which brings many enhancements,
such as:

- a new disjunction algorithm
- a new cycle detection algorithm
- a new closedness algorithm, and
- a new [`cue trim`]({{<relref"docs/reference/command/cue-help-trim">}}) algorithm.

Most importantly, the new version unlocks many performance improvements which
target larger CUE configurations.

The old evaluator, Evalv2, is affected by dozens of bugs which would have
been very difficult to fix incrementally due to limitations in its design. Many
of these bugs are already
[fixed in Evalv3](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20label%3Aevalv3-win),
with more improvements still to come.

## How to switch to Evalv3

You can switch to Evalv3 by setting the `CUE_EXPERIMENT=evalv3`
[environment variable]({{<relref"docs/reference/command/cue-help-environment">}}).
This variable affects invocations of the `cue` command (such as `cue export`)
as well as Go programs using CUE's Go API such as `cue/load`.

Users of the Go API can also directly specify the evaluator version as follows:

{{{with code "en" "ctx"}}}
-- example.go --
ctx := cuecontext.New(cuecontext.EvaluatorVersion(cuecontext.EvalV3))
{{{end}}}

## New breakages using Evalv3

While we expect the vast majority of users to be able to upgrade to Evalv3
seamlessly, some known bugs remain and are
[tracked on GitHub](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20state%3Aopen%20label%3Aevalv3).
The new evaluator also includes intentional changes in behaviour, some of which
are described below as they could lead to new errors when evaluating your existing CUE configurations.

### "Field not allowed" errors

Evalv3's new closedness algorithm follows the CUE language specification much more closely
than Evalv2, and for most users this should only result in bug fixes. However, we encountered
a pattern where some CUE configurations were relying on Evalv2 being too permissive.

In this example, field `B` should be disallowed when unifying with `#Schema`,
as `#Schema` is closed and only allows field `A`.
However, Evalv2 incorrectly allows the following export to succeed:

{{{with code "en" "openinline: evalv2"}}}
env CUE_EXPERIMENT=evalv3=0

exec cue export input.cue # Using Evalv2
cmp stdout out
-- input.cue --
#Schema: {
	A?: string
}
fieldB: (#Schema & {
	B: "should be disallowed by #Schema"
}).B
-- out --
{
    "fieldB": "should be disallowed by #Schema"
}
{{{end}}}

Using Evalv3 to evaluate the same CUE results in the "field not allowed" error we expect:

<!--
Note that this assumes we have already switched to CUE_DEBUG=openinline=0 as a default.
-->

{{{with code "en" "openinline: evalv3: broken"}}}
env CUE_EXPERIMENT=evalv3=1
env CUE_DEBUG=openinline=0

! exec cue export input.cue # Using Evalv3
cmp stderr out
-- input.cue --
#Schema: {
	A?: string
}
fieldB: (#Schema & {
	B: "should be disallowed by #Schema"
}).B
-- out --
B: field not allowed:
    ./input.cue:4:10
    ./input.cue:5:2
{{{end}}}

While the "field not allowed" error is correct, adjusting your CUE
configuration to resolve the problem might not be straightforward.
As a temporary workaround, you can set the `CUE_DEBUG=openinline`
[environment variable]({{<relref"docs/reference/command/cue-help-environment">}}),
causing Evalv3 to mimic Evalv2's permissive behavior in scenarios like this
one:

{{{with code "en" "openinline: evalv3: with openinline"}}}
env CUE_EXPERIMENT=evalv3=1
env CUE_DEBUG=openinline=1

exec cue export input.cue # Using Evalv3 + openinline
cmp stdout out
-- input.cue --
#Schema: {
	A?: string
}
fieldB: (#Schema & {
	B: "should be disallowed by #Schema"
}).B
-- out --
{
    "fieldB": "should be disallowed by #Schema"
}
{{{end}}}

