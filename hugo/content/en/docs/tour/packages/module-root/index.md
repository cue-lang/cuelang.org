---
title: Module Root
weight: 30
---

CUE finds the contents of a user-defined package import by first looking at the
current module.
Each CUE module is a tree of directories, rooted at its **module root**.

The module root is a directory that *contains* a `cue.mod` directory and,
inside there, a `module.cue` file that identifies the current module.
This file is set up by the
[`cue mod init`]({{< relref "docs/reference/cli/cue-mod-init" >}}) command.

If the start of a package import identifier matches the current module's
identifier then CUE knows to find the package's contents inside the current
module.
The package identifier's path components are treated as directories under the
module root, and the package's contents are loaded from the appropriate
directory as [described earlier]({{< relref "../packages" >}}).

If the start of a package import identifier does *not* match the current
module's identifier then CUE knows the package isn't part of the current
module, and it has to find the package's contents through some other route.

{{< code-tabs >}}
{{< code-tab name="cue.mod/module.cue" language="cue" area="top-right" >}}
module: "cue.example/somePath"
{{< /code-tab >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package config

import "cue.example/somePath/data"

x: data["pi^2"] + 1
y: data["e^2"] + 1
z: data["root2^2"] + 1
{{< /code-tab >}}
{{< code-tab name="data/someData.cue" language="cue" area="top-right" >}}
package data

import "math"

"pi^2":    math.Pi * math.Pi
"e^2":     math.E * math.E
"root2^2": math.Sqrt2 * math.Sqrt2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
{
    "x": 10.86960440108935861883449099987615,
    "y": 8.389056098930650227230427460575008,
    "z": 3.000000000000000000000000000000000
}
{{< /code-tab >}}
{{< /code-tabs >}}
