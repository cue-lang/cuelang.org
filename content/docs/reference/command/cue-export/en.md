---
title: The cue export command
weight: 100
authors: [jpluscplusm]
tags: [cue command]
hide_summary: true
---

The `cue export` command evaluates a configuration, and emits the value of an
expression if the value is concrete.
The command fails with an error message
if evaluation of the configuration is unsuccessful,
or if the value of the expression to be emitted is not concrete.

The default configuration evaluated is the single package found in the current directory.
The default expression whose value is emitted is the top-level of the configuration evaluated.
The value is emitted to the command's standard output stream encoded as JSON, by default:

{{{with code "en" "cue export"}}}
exec cue export
cmp stdout out
-- file.cue --
package example

message: "Z-axis coordinate == \(data.z)"
data: {
	x: 1.1
	y: 2 * 2
	z: x + y
}
data: [_]: #Coordinate
#Coordinate: number
-- out --
{
    "message": "Z-axis coordinate == 5.1",
    "data": {
        "x": 1.1,
        "y": 4,
        "z": 5.1
    }
}
{{{end}}}

The command's defaults can be overriden --
the inputs, operation, and output of `cue export` can be controlled by various flags.
To learn more please refer to:

- {{< linkto/related/concept "using-the-cue-export-command" >}} --
  an in-depth guide to `cue export`
- {{< linkto/related/reference "command/cue-help-export" >}} --
  the built-in help text for the `cue export` command
