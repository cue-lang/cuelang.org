---
title: Upgrading from evalv2 to evalv3
toc_hide: true
authors: [mvdan, jpluscplusm]
---

## What is `evalv3`?

`evalv3` is a new major version of the CUE evaluator which brings many enhancements,
such as:

- a new disjunction algorithm
- a new cycle detection algorithm
- a new closedness algorithm, and
- a new [`cue trim`]({{<relref"docs/reference/command/cue-help-trim">}}) algorithm.

Most importantly, the new version unlocks many performance improvements which
target larger CUE configurations.

The old evaluator, `evalv2`, is affected by dozens of bugs which would have
been very difficult to fix incrementally due to limitations in its design. Many
of these bugs are already
[fixed in `evalv3`](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20label%3Aevalv3-win),
with more improvements still to come.

## How can I switch to `evalv3`?

You can switch to `evalv3` by setting the `CUE_EXPERIMENT=evalv3=1` environment
variable. This variable affects invocations of the `cue` command (such as `cue
export`) as well as Go programs using CUE's Go API such as `cue/load`.

Users of the Go API can also directly specify the evaluator version with a
`cuecontext` option:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	"cuelang.org/go/cue/cuecontext"
	"fmt"
)

func main() {
	ctx := cuecontext.New(cuecontext.EvaluatorVersion(cuecontext.EvalV3))
	v := ctx.CompileString("42")
	fmt.Println(v)
}
{{< /code-tab >}}{{< /code-tabs >}}
## Which CUE version do I need to use `evalv3`?

We strongly recommend that you upgrade to
[the latest release]({{<relref"docs/introduction/installation">}})
of CUE before you try `evalv3` as the new evaluator is under active development
-- otherwise you may run into bugs or performance issues which have already
been fixed. The latest release is currently:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.12.0
...
```

If you encounter any unexpected issues, we would also encourage you to try `evalv3` on
[the development version]({{<relref"docs/introduction/installation">}}#install-from-source)
of CUE, as your issue may have already been fixed since the latest release.

## What might break when I switch to `evalv3`?

We expect the vast majority of users to be able to upgrade to `evalv3`
seamlessly, thanks to the continuous testing of third party projects
provided by [Unity](https://cuelabs.dev/unity/). Add your project to the
Unity corpus to ensure it is tested with future language and evaluator changes.

If you encounter a new bug which still happens with
[the development version]({{<relref"docs/introduction/installation">}}#install-from-source)
of CUE, and it's not already [tracked on GitHub](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20state%3Aopen%20label%3Aevalv3),
please {{<issue "new?template=bug_report.md">}}file a new bug report{{</issue>}}
with details.

The new evaluator also includes intentional changes in behaviour, some of which
are described below as they could lead to new errors when evaluating your existing CUE configurations.

### Why am I getting "field not allowed" errors?

The new closedness algorithm in `evalv3` follows the CUE language specification
much more closely than `evalv2`, and for most users this should only result in
bug fixes. However, we encountered a pattern where some CUE configurations were
relying on `evalv2` being too permissive.

In this example, field `B` should be disallowed when unifying with `#Schema`,
as `#Schema` is closed and only allows field `A`.
However, `evalv2` incorrectly allows the following export to succeed:

{{< code-tabs >}}
{{< code-tab name="input.cue" language="cue" area="top-left" >}}
#Schema: {
	A?: string
}
fieldB: (#Schema & {
	B: "should be disallowed by #Schema"
}).B
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBpbnB1dC5jdWUgIyBVc2luZyBldmFsdjI=" >}}
$ cue export input.cue # Using evalv2
{
    "fieldB": "should be disallowed by #Schema"
}
{{< /code-tab >}}
{{< /code-tabs >}}

Using `evalv3` to evaluate the same CUE results in the "field not allowed" error we expect:

<!--
Note that this assumes we have already switched to CUE_DEBUG=openinline=0 as a default.
-->

{{< code-tabs >}}
{{< code-tab name="input.cue" language="cue" area="top-left" >}}
#Schema: {
	A?: string
}
fieldB: (#Schema & {
	B: "should be disallowed by #Schema"
}).B
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBpbnB1dC5jdWUgIyBVc2luZyBldmFsdjM=" >}}
$ cue export input.cue # Using evalv3
B: field not allowed:
    ./input.cue:4:10
    ./input.cue:5:2
{{< /code-tab >}}
{{< /code-tabs >}}

While the "field not allowed" error is correct, adjusting your CUE
configuration to resolve the problem might not be straightforward.
As a temporary workaround, you can set the `CUE_DEBUG=openinline=1` environment
variable, causing `evalv3` to mimic `evalv2`'s permissive behavior in scenarios
like this one:

{{< code-tabs >}}
{{< code-tab name="input.cue" language="cue" area="top-left" >}}
#Schema: {
	A?: string
}
fieldB: (#Schema & {
	B: "should be disallowed by #Schema"
}).B
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBpbnB1dC5jdWUgIyBVc2luZyBldmFsdjMgKyBvcGVuaW5saW5l" >}}
$ cue export input.cue # Using evalv3 + openinline
{
    "fieldB": "should be disallowed by #Schema"
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{<linkto/related/reference"command/cue-help-environment">}} -- environment variables that affect CUE's operation
- `evalv2` [bugs fixed in `evalv3`](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20label%3Aevalv3-win)
- Known [`evalv3` regressions](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20state%3Aopen%20label%3Aevalv3)
- {{<linkto/related/reference"command/cue-help-trim">}} -- the built-in help text for the `cue trim` command
