---
title: Trying the "explicitopen" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.15.0 or later">}}

CUE v0.15.0-alpha.1 introduced the `explicitopen`
[experiment]({{<relref "docs/reference/command/cue-help-experiments" >}}),
which greatly simplifies CUE's concept of closedness with a new `...` operator
and new behaviour when a closed struct is embedded.

The experiment needs to be enabled on a per-file basis, and has two main effects.
The trailing `...` operator explicitly opens the reference to the closed struct
that it follows:

{{{with code "en" "1"}}}
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
	A: "not"
	B: "closed"
}
-- schema.cue --
package example

#Schema: {
	A: string
}
-- out --
X:
  A: not
  B: closed
{{{end}}}

A closed struct now closes the struct in which it's embedded,
unless it's followed by the trailing `...` operator.
This means that a schema can now close the top-level of a package:

{{{with code "en" "2"}}}
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
A: "now"
B: "closed"
-- schema.cue --
package example

#Schema: {
	A: string
}
-- out --
B: field not allowed:
    ./file.cue:8:1
{{{end}}}

Because this experiment changes the current semantics of valid CUE code, the
`cue fix --exp=explicitopen` command should be used to introduce the
`@experiment` attribute to existing CUE files, because it also updates their
contents to take account of the experiment's changes.
See `{{< linkto/inline "reference/command/cue-help-fix" >}}` for more information.

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}}
