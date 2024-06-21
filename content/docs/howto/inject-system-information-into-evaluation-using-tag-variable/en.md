---
title: Injecting system information into an evaluation using a tag variable
authors: [jpluscplusm]
tags: [cue command]
toc_hide: true
---

{{{with _script_ "en" "HIDDEN: set up bash strict mode"}}}
# We use pipes on this page; make sure that `true|false|true` would fail:
set -o pipefail
{{{end}}}

One of CUE's core concepts is that evaluations should be *repeatable:* given
the same input, the same output should be produced.
However, sometimes it can be necessary to introduce context or other information
into an evaluation that might cause the output to vary. As described in the
[`cue help injection`]({{< relref "/docs/reference/command/cue-help-injection" >}})
reference, CUE allows information to be introduced, or *injected*, by using tag
attributes and tag variables.

This guide demonstrates how to use tag variables to inject system information
into CUE evaluations. A separate guide details how to inject
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
randomnessA:     int    @tag(f,var=rand,type=int)
randomnessB:     int    @tag(g,var=rand,type=int)
currentTimeA:    string @tag(h,var=now)
currentTimeB:    string @tag(i,var=now)
{{{end}}}

Make system information available to an evaluation by including the `-T` flag
when invoking a supported `cue` command:

{{{with script "en" "cue export -T"}}}
cue export -T --out cue | sort
{{{end}}}

In the CUE source, notice that the `rand` and `now` tag variables were
repeated, and contributed to the values of more than one field. Any tag
variable may be repeated, and each repeated use injects the same value *inside
a single CUE evaluation*.

Some variables, such as `username` and `hostname`, can be expected to remain
stable across CUE evaluations by the same user on the same host. In contrast,
the `now` and `rand` variables are completely unstable, as demonstrated here by
their values being different to the values shown above:

{{{with _script_ "en" "HIDDEN: sleep to offset displayed time values clearly"}}}
sleep 1.666
{{{end}}}

{{{with script "en" "cue eval -T"}}}
cue eval -T | grep -e ^currentTime -e ^random
{{{end}}}

## Overridding system information

Tag variables are specified in combination with a tag key. For example, as
shown above, the `randomnessA` field is declared to have a relationship
with both the `rand` tag variable and the `f` tag key:

{{{with script "en" "grep ^random"}}}
grep ^random tag-variables.cue
{{{end}}}

If a tag key is specified for a `cue` command then it overrides the system
information for fields associated with the tag:

{{{with script "en" "cue eval -T -t"}}}
cue eval -Tt f=123456789 | grep ^random
{{{end}}}

<!-- TODO: link to https://review.gerrithub.io/c/cue-lang/cuelang.org/+/1196270 when it's merged
Shorthand tag attributes can also be used as build attributes. Build attributes
affect which CUE files are included in an evaluation. Read TODO for more information.
-->

## Related content

- {{< linkto/related/howto "inject-value-into-evaluation-using-tag-attribute" >}}
- {{< linkto/related/reference "command/cue-help-injection" >}} -- the `cue` command's help
  text for value and file injection
<!-- TODO: link to guide about build attributes? -->
