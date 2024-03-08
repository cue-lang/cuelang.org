---
title: Module Root
weight: 30
---

Package identifiers tell CUE where it should look in order to find the contents
of a user-defined package, and it starts by examining the module it is being
invoked inside.
A CUE module is a tree of directories rooted at its **module root**.

The module root can be recognized because it contains a `cue.mod` directory and,
inside there, a `module.cue` file that identifies the module.
This file can be created using
[`cue mod init`]({{< relref "docs/reference/cli/cue-mod-init" >}}).

CUE compares the module's identifier with the identifier of each package it's
trying to locate.
If the module matches the start of a package's identifier then CUE knows that
the package lives inside the current module.
The package identifier's path components are treated as directories inside the
module root, and the package's contents are loaded from the appropriate
directory as described in ["Packages"]({{< relref "../packages" >}}).

On the other hand, if the module's identifier does *not* match the start of a
package identifier then CUE knows it has to find the package's contents outside
the current module.

{{{with code "en" "tour"}}}
#location bottom-right top-right bottom-left top-left

exec cue export file.cue
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
