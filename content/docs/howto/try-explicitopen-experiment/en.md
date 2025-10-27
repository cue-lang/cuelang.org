---
title: Trying the "explicitopen" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.15.0 or later">}}

CUE v0.15.0-alpha.1 introduced the "explicitopen" experiment, which
greatly simplifies CUE's concept of closedness.

Enable the experiment on a per-file basis using the
`@experiment(explicitopen)`
attribute.

{{<info>}}
Because this experiment changes the meaning of currently valid CUE code, the
command `cue fix --exp=explicitopen` should be used to update existing CUE
files *before* adding the `@experiment` attribute.

See [`cue help fix`]({{<relref "docs/reference/command/cue-help-fix" >}})
for more information.
{{</info>}}

## The trailing `...` operator

Using the trailing `...` operator explicitly opens the reference to the closed
struct that it follows:

{{{with code "en" "... operator"}}}
#nofmt(file.cue)
#location top-left top-right bottom
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

exec cue export --out yaml
cmp stdout out
-- file.cue --
@experiment(explicitopen) // Enable the experiment.
package example

// The trailing ... operator prevents #Schema's
// closedness being "inherited" by X, and permits
// more fields to be added to X.
X: #Schema...
X: {
	A: "closed?"
	B: "no!"
}
-- schema.cue --
package example

#Schema: {
	A: string
}
-- out --
X:
  A: closed?
  B: no!
{{{end}}}

## Closedness when embedding

A closed struct now closes the struct in which it's embedded --
*unless* it's followed by the trailing `...` operator.
This means that a schema can now close the top-level of a package:

{{{with code "en" "embedding"}}}
#nofmt(file.cue)
#location top-left top-right bottom
env PATH=/cues/$CUELANG_CUE_PRERELEASE:$PATH

! exec cue vet -c
cmp stderr out
-- file.cue --
@experiment(explicitopen) // Enable the experiment.
package example

// Only regular fields mentioned in #Schema are
// now permitted at the top-level of this package.
#Schema
A: "closed?"
B: "yes!"
-- schema.cue --
package example

#Schema: {
	A: string
}
-- out --
B: field not allowed:
    ./file.cue:8:1
{{{end}}}

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}} --
  a list of the language experiments that can be enabled or disabled
- {{< linkto/related/reference "command/cue-help-fix" >}} --
  update CUE code automatically, applying the latest fixes and language experiments
