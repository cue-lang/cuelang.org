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

The `cue export` command evaluates an expression in the context of a particular
configuration and then emits the value of the expression encoded as concrete
data. The command fails with an error message if evaluation is unsuccessful, or
if the value of the evaluated expression is not concrete.

The default behavior is to evaluate the single CUE package in the current
directory, and to emit its top-level configuration to the standard output
stream of the command, encoded as JSON:

<!-- The job of this example is to demonstrate the default of JSON being
exported to stdout, whilst also tacitly showing that non-data elements are
omitted: package clauses; import statements; hidden fields; definitions are all
invisible, except through their effect on the concrete data emitted. -->
{{{with code "en" "cue export"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

import "math"

info: "Vector magnitude is \(vector._m)"
vector: #Vector & {
	x:  1.1
	y:  2 * 2
	z:  x + y
	_m: math.Sqrt(x*x + y*y + z*z)
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

The default behaviours of `cue export` can be overriden using parameters to
control its inputs, output, and operation.

The command can read and process an arbitrary number of data and
data-constraint inputs provided as CUE and other encodings;
can format its output in JSON, YAML, CUE, or TOML;
and can place that output in a named file.

To learn more, refer to:

- {{< linkto/related/concept "using-the-cue-export-command" >}} --
  an in-depth guide to `cue export`
- {{< linkto/related/reference "command/cue-help-export" >}} --
  the built-in help text for the `cue export` command
