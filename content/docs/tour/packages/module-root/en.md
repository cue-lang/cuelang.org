---
title: Module Root
weight: 30
---

To satisfy a file's `import` statements, CUE finds the contents of any
user-defined packages by first examining the current module, which is a tree of
directories rooted at its **module root**.
The module root contains a `cue.mod` directory and, inside there, a
`module.cue` file that identifies the module.
This file can be created using
[`cue mod init`]({{< relref "docs/reference/cli/cue-mod-init" >}}).

CUE compares the module's identifier with each imported package identifier.
If the module matches the start of a package's identifier then CUE knows it
must find the package's contents inside the current module.
The package identifier's path components are treated as directories inside the
module root, and the package's contents are loaded from the appropriate
directory as [described earlier]({{< relref "../packages" >}}).

Alternatively, if the start of an imported package identifier does *not* match
the module's identifier then CUE knows it has to find the package's contents
outside the current module.

{{{with code "en" "tour"}}}
#location top-right top-left bottom-left bottom-right

exec cue export
cmp stdout out
-- cue.mod/module.cue --
module: "cue.example/somePath"
-- file.cue --
package config

import "cue.example/somePath/data"

x: data.piSquared + 1
y: data.eSquared + 1
z: data["√2Squared"] + 1
-- data/someData.cue --
package data

import "math"

piSquared:   math.Pi * math.Pi
eSquared:    math.E * math.E
"√2Squared": math.Sqrt2 * math.Sqrt2
-- out --
{
    "x": 10.86960440108935861883449099987615,
    "y": 8.389056098930650227230427460575008,
    "z": 3.000000000000000000000000000000000
}
{{{end}}}
