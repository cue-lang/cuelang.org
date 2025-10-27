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

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
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
  A: not
  B: closed
{{< /code-tab >}}
{{< /code-tabs >}}

A closed struct now closes the struct in which it's embedded,
unless it's followed by the trailing `...` operator.
This means that a schema can now close the top-level of a package:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
@experiment(explicitopen) // Enable the experiment.
package example

// Only regular fields mentioned in #Schema are
// now permitted at the top-level of this package.
#Schema
A: "now"
B: "closed"
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

Because this experiment changes the current semantics of valid CUE code, the
`cue fix --exp=explicitopen` command should be used to introduce the
`@experiment` attribute to existing CUE files, because it also updates their
contents to take account of the experiment's changes.
See `{{< linkto/inline "reference/command/cue-help-fix" >}}` for more information.

## Related content

- {{< linkto/related/reference "command/cue-help-experiments" >}}
