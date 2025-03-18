---
title: Upgrading from evalv2 to evalv3
toc_hide: true
authors: [mvdan, jpluscplusm]
---

{{{with _script_ "en" "HIDDEN_ set up caches"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

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

{{{with upload "en" "main.go"}}}
-- main.go --
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
{{{end}}}

{{{with _upload_ "en" "HIDDEN: required output"}}}
-- output.want.txt --
42
{{{end}}}
{{{with _script_ "en" "HIDDEN: test main.go"}}}
#ellipsis 0
go mod init evalv3.example
#ellipsis 0
go mod tidy
go run main.go >output.got.txt
diff output.want.txt output.got.txt
{{{end}}}

## Which CUE version do I need to use `evalv3`?

We strongly recommend that you upgrade to
[the latest release]({{<relref"docs/introduction/installation">}})
of CUE before you try `evalv3` as the new evaluator is under active development
-- otherwise you may run into bugs or performance issues which have already
been fixed. The latest release is currently:

{{{with script "en" "cue version"}}}
#ellipsis 1
cue version
{{{end}}}

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
of CUE, and it's not already
[tracked on GitHub](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20state%3Aopen%20label%3Aevalv3),
please [file a new bug report](https://github.com/cue-lang/cue/issues/new?template=bug_report.md)
with details.

## Related content

- {{<linkto/related/reference"command/cue-help-environment">}} -- environment variables that affect CUE's operation
- `evalv2` [bugs fixed in `evalv3`](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20label%3Aevalv3-win)
- Known [`evalv3` regressions](https://github.com/cue-lang/cue/issues?q=is%3Aissue%20state%3Aopen%20label%3Aevalv3)
- {{<linkto/related/reference"command/cue-help-trim">}} -- the built-in help text for the `cue trim` command

{{{with _script_ "en" "https://github.com/cue-lang/docs-and-content/issues/186"}}}
go vet ./...
#ellipsis 0
go run honnef.co/go/tools/cmd/staticcheck@v0.6.0 ./...
{{{end}}}
