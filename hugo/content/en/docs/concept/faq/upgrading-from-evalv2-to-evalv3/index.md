---
title: Upgrading from evalv2 to evalv3
toc_hide: true
authors: [mvdan, jpluscplusm]
---

{{< warning >}}
`evalv3` is now **on** by default in
[`v0.13.0`](https://github.com/cue-lang/cue/releases/tag/v0.13.0)
and later versions!
{{< /warning >}}

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

<!--more-->

## How can I switch to `evalv3`?

The most reliable way to get started using `evalv3` is to install or use
the [`v0.13.0`]({{<relref"docs/introduction/installation">}})
release, where `evalv3` is on by default. Simply ensure that the environment
variable `CUE_EXPERIMENT` is empty to get the default behavior.

You can also explicitly enable `evalv3` by setting the `CUE_EXPERIMENT=evalv3=1`
environment variable. This variable affects invocations of the `cue` command
(such as `cue export`) as well as Go programs using CUE's Go API such as `cue/load`.

Users of the Go API can also directly specify the evaluator version with a
`cuecontext` option:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	"fmt"

	"cuelang.org/go/cue/cuecontext"
)

func main() {
	ctx := cuecontext.New(cuecontext.EvaluatorVersion(cuecontext.EvalV3))
	v := ctx.CompileString("42")
	fmt.Println(v)
}
{{< /code-tab >}}{{< /code-tabs >}}
## Which CUE version do I need to use `evalv3`?

Given that this new evaluator version is being actively developed,
we encourage you to upgrade to the latest CUE version to use it:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.14.1
...
```

If you encounter any unexpected issues, we would also encourage you to try `evalv3` on
[the development version]({{<relref"docs/introduction/installation#development-version">}})
of CUE, as your issue may have already been fixed since the latest release.

## What might break when I switch to `evalv3`?

We expect the vast majority of users to be able to upgrade to `evalv3`
seamlessly, thanks to the continuous testing of third party projects
provided by [Unity](https://cuelabs.dev/unity/). Add your project to the
Unity corpus to ensure it is tested with future language and evaluator changes.

If you encounter a new bug which still happens with
[the development version]({{<relref"docs/introduction/installation">}}#install-from-source)
of CUE, and it's not already
[tracked on GitHub](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20state%3Aopen%20label%3Aevalv3),
please [file a new bug report](https://github.com/cue-lang/cue/issues/new?template=bug_report.md)
with details.

## Related content

- {{<linkto/related/reference"command/cue-help-environment">}} -- environment variables that affect CUE's operation
- `evalv2` [bugs fixed in `evalv3`](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20label%3Aevalv3-win)
- Known [`evalv3` regressions](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20state%3Aopen%20label%3Aevalv3)
- {{<linkto/related/reference"command/cue-help-trim">}} -- the built-in help text for the `cue trim` command
