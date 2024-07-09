---
title: The cue export command
weight: 100
authors: [jpluscplusm]
tags: [cue command]
# Hide this page from the *in-body* index at /docs/reference/command/ because
# that index is used to present the list of automated help-text texts.
# It *doesn't* remove it from the LHNav index presented by the same hierarchy.
# cf. https://cuelang.org/examples/basic/front-matter/
hide_summary: true
---

The `cue export` command evaluates a configuration, and emits the value of an
expression if the value is concrete.
The command fails with an error message
if evaluation of the configuration is unsuccessful,
or if the value of the expression to be emitted is not concrete.

The default configuration evaluated is the single package found in the current directory.
The default expression whose value is emitted is the top-level of the configuration evaluated.
By default, the value is emitted to the command's standard output stream encoded as JSON:

{{{with code "en" "cue export"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

import "math"

info: "Vector magnitude is \(vector.#M)"
vector: #Vector & {
	x:  1.1
	y:  2 * 2
	z:  x + y
	#M: math.Sqrt(x*x + y*y + z*z)
}
#Vector: ["x" | "y" | "z"]: number
-- out --
{
    "info": "Vector magnitude is 6.57419196555744",
    "vector": {
        "x": 1.1,
        "y": 4,
        "z": 5.1
    }
}
{{{end}}}

These defaults can be overriden by parameters and flags that control the
inputs, output, and operation of `cue export`.
To learn more, refer to:

- {{< linkto/related/concept "using-the-cue-export-command" >}} --
  an in-depth guide to `cue export`
- {{< linkto/related/reference "command/cue-help-export" >}} --
  the built-in help text for the `cue export` command
