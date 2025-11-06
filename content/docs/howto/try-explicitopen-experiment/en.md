---
title: Trying the "explicitopen" experiment
authors: [jpluscplusm]
toc_hide: true
tags: [language]
---
{{<sidenote text="Requires CUE v0.15.0 or later">}}

CUE v0.15.0-alpha.1 introduced the "explicitopen" experiment, which
greatly simplifies CUE's concept of closedness.

{{<warning>}}
This experiment changes the meaning of currently valid CUE code.
Once your module targets language version v0.15.0 or later, use
`cue fix --exp=explicitopen`
to update its code and enable the experiment on a per-file basis.
See
[`cue help fix`]({{<relref "docs/reference/command/cue-help-fix" >}})
and
[`cue help mod edit`]({{<relref "docs/reference/command/cue-help-mod-edit" >}})
for more information
{{</warning>}}

## The trailing `...` operator

Using the trailing `...` operator explicitly opens the reference to the closed
struct that it follows:

{{{with code "en" "... operator"}}}
#nofmt(file.cue) # Caused by https://github.com/cue-lang/cue/issues/4123
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

As a result, enabling the experiment means that embedding a value is now
*exactly* equivalent to unifying with that value -- and therefore these
two CUE snippets are now semantically identical:

{{{with upload "en" "equivalence"}}}
#nofmt(embed.cue) # Caused by https://github.com/cue-lang/cue/issues/4123
#nofmt(unify.cue) # Caused by https://github.com/cue-lang/cue/issues/4123
#location left right
-- embed.cue --
@experiment(explicitopen)
A: {
	B
	c: "foo"
}
-- unify.cue --
@experiment(explicitopen)
A: B & {
	c: "foo"
}
{{{end}}}

## Conclusion

The "explicitopen" experiment simplifies how CUE handles closedness, allowing for
more flexibility and control when closed structs are referenced. This
flexibility now permits the top-level of packages to be closed, allowing them
to be fully validated against schemas without permitting additional fields.
Use `cue fix --exp=explicitopen` to update existing CUE automatically.

As with all CUE language experiments, one of this experiment's aims is to
gather feedback from users. Please do join [the CUE community](/community/)
and tell us about your experience with the experiment!

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}} --
  a list of the language experiments that can be enabled or disabled
- {{< linkto/related/reference "command/cue-help-fix" >}} --
  update CUE code automatically, applying the latest fixes and language experiments
- {{< linkto/related/reference "command/cue-help-mod-edit" >}} --
  update the language version targeted by a module
