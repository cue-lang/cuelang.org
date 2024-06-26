---
title: Injecting system information into an evaluation using a tag variable
toc_hide: true
authors: [jpluscplusm]
tags: [cue command]
---

{{{with _script_ "en" "HIDDEN: set up bash strict mode"}}}
# We use pipes on this page; make sure that `true|false|true` would fail:
set -o pipefail
{{{end}}}

One of CUE's core concepts is that evaluations should be *repeatable:* given
the same input, the same output should be produced.
However, sometimes it can be necessary to introduce context or other information
into an evaluation. As described in the
[`cue injection`]({{< relref "/docs/reference/cli/cue-injection" >}})
reference, CUE allows information to be introduced, or *injected*, by using tag
attributes and tag variables.

This guide demonstrates how to use tag variables to inject system information
into CUE evaluations. A separate guide describes how to inject
[arbitrary information]({{< relref "/docs/howto/inject-value-into-evaluation-using-tag-attribute" >}}).
The techniques shown here are supported by the following commands:

{{< columns>}}
- `cue export`
- `cue eval`
- `cue def`
{{< columns-separator >}}
- `cue vet`
- `cue cmd`
{{< /columns>}}

## Injecting system information

Use system information in CUE by including one or more *tag variables*:

{{{with upload "en" "example"}}}
-- tag-variables.cue --
package example

directory:       string @tag(a,var=cwd)
operatingSystem: string @tag(b,var=os)
cpuArchitecture: string @tag(c,var=arch)
currentUsername: string @tag(d,var=username)
currentHostname: string @tag(e,var=hostname)
currentTime:     string @tag(f,var=now)
randomness:      int    @tag(g,var=rand,type=int)

currentTimeAgain: string @tag(h,var=now)
randomnessAgain:  int    @tag(i,var=rand,type=int)
{{{end}}}

Make system information available to an evaluation by including the `-T` flag
when invoking a supported `cue` command:

{{{with script "en" "cue export -T"}}}
cue export -T --out cue | sort
{{{end}}}

Notice that some tag variables were repeated - contributing to the values of
more than one field. Repeating any tag variable is permitted, and each repeated
use injects the same value *inside a single CUE evaluation*.

Some variables, such as `username` and `hostname`, can be expected to remain
stable across CUE evaluations by the same user on the same host. Be aware that `now`
and `rand` are completely unstable, as demonstrated here by their values being
different to the values shown above:

{{{with _script_ "en" "HIDDEN: sleep to offset time values clearly"}}}
sleep 2
{{{end}}}

{{{with script "en" "cue eval -T"}}}
cue eval -T | grep -e ^currentTime -e ^random
{{{end}}}

## Overridding system information

Tag variables are specified in combination with a tag key. For example, as
shown above, the `randomness` field is declared to have a relationship
with both the `rand` tag variable and the `g` tag key:

{{{with code "en" "reminder of field declaration"}}}
-- foo.cue --
randomness: int @tag(g,var=rand,type=int)
{{{end}}}

If a tag key is specified for a `cue` command then it overrides the system
information for that field:

{{{with script "en" "cue eval -T -t"}}}
cue eval -T -t g=101010101 | grep ^random
{{{end}}}

<!-- TODO: link to https://review.gerrithub.io/c/cue-lang/cuelang.org/+/1196270 when it's merged
Shorthand tag attributes can also be used as build attributes. Build attributes
affect which CUE files are included in an evaluation. Read TODO for more information.
-->

## Related content

- {{< linkto/related/howto "inject-value-into-evaluation-using-tag-attribute" >}}
- {{< linkto/related/reference "cli/cue-injection" >}} -- the `cue` command's help
  text for value and file injection
<!-- TODO: link to guide about build attributes? -->
