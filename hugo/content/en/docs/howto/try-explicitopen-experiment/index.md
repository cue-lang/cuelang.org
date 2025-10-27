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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
{{< /code-tab >}}
{{< code-tab name="schema.cue" language="cue" area="top-right" >}}
package example

#Schema: {
	A: string
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtLW91dCB5YW1s" >}}
$ cue export --out yaml
X:
  A: closed?
  B: no!
{{< /code-tab >}}
{{< /code-tabs >}}

## Closedness when embedding

A closed struct now closes the struct in which it's embedded --
*unless* it's followed by the trailing `...` operator.
This means that a schema can now close the top-level of a package:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
@experiment(explicitopen) // Enable the experiment.
package example

// Only regular fields mentioned in #Schema are
// now permitted at the top-level of this package.
#Schema
A: "closed?"
B: "yes!"
{{< /code-tab >}}
{{< code-tab name="schema.cue" language="cue" area="top-right" >}}
package example

#Schema: {
	A: string
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
B: field not allowed:
    ./file.cue:8:1
{{< /code-tab >}}
{{< /code-tabs >}}

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
