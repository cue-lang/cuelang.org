---
title: Module Root
weight: 50
draft: true
---

{{< caution >}}
This page is an unfinished draft, and is not part of the published site.
{{< /caution >}}

Package identifiers tell CUE where it should look in order to find the contents
of a user-defined package, and it starts by examining the module it is being
invoked inside.
A CUE module is a tree of directories rooted at its **module root**.

The module root can be recognized because it contains a `cue.mod` directory and,
inside there, a `module.cue` file that identifies the module.
This file can be created using
[`cue mod init`]({{< relref "docs/reference/cli/cue-mod-init" >}}).

CUE compares the module's identifier with the identifier of each package it's
trying to locate.\
If the module matches the start of a package's identifier then CUE knows that
the package lives inside the current module.
Any path components in the package identifier are treated as directories inside
the module root, and the package's contents are loaded from the appropriate
directory as described in ["Packages"]({{< relref "../packages" >}}).

On the other hand, if the module's identifier does *not* match the start of a
package identifier then CUE knows it has to find the package's contents outside
the current module. CUE
[currently]({{< relref "docs/concept/modules-packages-instances" >}})
needs these packages to be vendored inside the `cue.mod` directory, but a new,
[experimental feature]({{< relref "docs/reference/modules" >}})
is available which greatly simplifies dealing with modules.

{{< code-tabs >}}
{{< code-tab name="cue.mod/module.cue" language="cue" area="bottom-right" >}}
module: "cue.example/somePath"
{{< /code-tab >}}
{{< code-tab name="file.cue" language="cue" area="top-right" >}}
package config

import "cue.example/somePath/data"

x: data.piSquared + 1
y: data.eSquared + 1
z: data["√2Squared"] + 1
{{< /code-tab >}}
{{< code-tab name="data/someData.cue" language="cue" area="bottom-left" >}}
package data

import "math"

piSquared:   math.Pi * math.Pi
eSquared:    math.E * math.E
"√2Squared": math.Sqrt2 * math.Sqrt2
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-left" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "x": 10.86960440108935861883449099987615,
    "y": 8.389056098930650227230427460575008,
    "z": 3.000000000000000000000000000000000
}
{{< /code-tab >}}
{{< /code-tabs >}}
